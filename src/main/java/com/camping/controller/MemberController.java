package com.camping.controller;


import com.camping.common.Pagination;
import com.camping.dto.MemberVO;
import com.camping.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
    private final MemberService memberService;
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }


    /*****************
     * Login & Logout
     *****************/
    //로그인페이지 이동
    @RequestMapping(value = "/loginPage")
    public String loginPage(){
        return "member/loginPage";
    }

    //로그인
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(MemberVO vo, Model model){
        int result = memberService.loginID(vo); //회원존재 여부확인
        if (result==1) {
            model.addAttribute("loginUser",memberService.getMember(vo));
            return "redirect:index";
        }else {
            return "member/alert/loginFail";
        }
    }

    //로그아웃
    @RequestMapping(value = "/logout")
    public String logout(SessionStatus status){
        status.setComplete();
        return "redirect:index";
    }

    /******************
     * Join the Member
     ******************/
    //회원가입 페이지 이동
    @RequestMapping(value = "/joinPage")
    public String joinPage(){return "member/joinPage";}


    //아이디 중복체크(Ajax 사용)
    @PostMapping(value = "/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("id") String id) {
        int cnt = memberService.idCheck(id);
        return cnt;
    }

    //이메일 중복체크(Ajax 사용)
    @PostMapping(value = "/emailCheck")
    @ResponseBody
    public int emailCheck(@RequestParam("email") String email) {
        int cnt = memberService.emailCheck(email);
        return cnt;
    }

    //회원가입
    @PostMapping(value = "/join")
    public String join(MemberVO vo){
        memberService.insertMember(vo);
        return "member/loginPage";
    }

    /*********************
     * Find id & password
     *********************/
    //아이디 비밀번호 찾기 페이지로 이동
    @RequestMapping(value = "/findPage")
    public String findPage(){ return "member/findPage"; }

    //이름,이메일로 아이디찾기
    @PostMapping(value = "/findId")
    public String findId(MemberVO vo, Model model) {
        String id = memberService.selectIdByNameEmail(vo);
        if (id != null) {
            vo.setId(id);
            model.addAttribute("message", 1);
            model.addAttribute("id",vo.getId());
            model.addAttribute("name", vo.getName());
            model.addAttribute("email", vo.getEmail());
        } else {
            model.addAttribute("message", -1);
        }
        return "member/findIdResult";
    }

    //비밀번호변경 정보 체크
    @PostMapping("/findPassword")
    public String findPassword(MemberVO vo, Model model) {
        String pwd = memberService.selectPwdByIdNameEmail(vo);
        if (pwd != null) {
            model.addAttribute("message", 1);
            model.addAttribute("id", vo.getId());
            model.addAttribute("name", vo.getName());
            model.addAttribute("email", vo.getEmail());

        } else {
            model.addAttribute("message", -1);
        }
        return "member/findPwdResult";
    }

    //findPwdAction 메소드에서 정보가 있다면 비밀번호 변경 진행
    @RequestMapping("/updatePassword")
    public String updatePassword(MemberVO vo){
        memberService.updatePwd(vo);
        return "member/alert/updatePassword";
    }

    /******************************************
     * Edit MemberInformation(Update & Delete)
     ******************************************/
    //정보수정(마이페이지) 이동
    @RequestMapping("/myPage")
    public String myPage(@ModelAttribute("loginUser") MemberVO vo, Model model){
        model.addAttribute("vo",memberService.getMember(vo));
        return "member/myPage";
    }

    //회원정보수정
    @PostMapping("/updateMember")
    public String updateMember(MemberVO vo){
        memberService.updateMember(vo);
        return "member/alert/updateMember";
    }

    //회원탈퇴
    @PostMapping("/deleteMember")
    public String deleteMember(MemberVO vo,SessionStatus status){
        memberService.deleteMember(vo);
        status.setComplete();
        return "member/alert/deleteMember";
    }





    /********************
     * Management Member
     ********************/
    //멤버관리페이지
    @RequestMapping(value = "/memberManagementPage")
    public String getMemberList(Model model,
                                @RequestParam(value = "searchType", defaultValue = "") String searchType,
                                @RequestParam(value = "keyword", defaultValue = "") String keyword,
                                @RequestParam(value = "page", required = false, defaultValue = "1") String tmpPage,
                                @RequestParam(value = "range", required = false, defaultValue = "1") String tmpRange) {
        int page = 0;
        int range = 0;

        //Get 방식이기 때문에 URI 에 장난치는걸 방지하기 위해 예외처리
        try{
            page = Integer.parseInt(tmpPage);
            range = Integer.parseInt(tmpRange);
        }catch (NumberFormatException e){
            page=0;
            range=0;
        }

        if(!"id".equals(searchType) && !"name".equals(searchType)) {
            searchType = "";
        }
        if(keyword == null || "".equals(keyword) || keyword.trim().isEmpty() ) {
            keyword = "";
        }

        Map<String, String> paraMap = new HashMap<>();
        paraMap.put("searchType", searchType);
        paraMap.put("keyword", keyword);

        Pagination pg = new Pagination();
        pg.setSearchType(searchType);
        pg.setKeyword(keyword);

        int totalCnt = memberService.totalMemberCnt(pg);
        pg.pageInfo(page, range, totalCnt);
        List<MemberVO> memberList = memberService.getMemberList(pg);

        if(!"".equals(searchType) && !"".equals(keyword)) {
            model.addAttribute("paraMap",paraMap);
        }

        model.addAttribute("pagination",pg);
        model.addAttribute("memberList",memberList);
        return "admin/member/memberManagementPage";
    }

    //회원정보상세보기(Admin)
    @RequestMapping(value = "/memberInfo")
    public String memberInfo(MemberVO vo,Model model){
        model.addAttribute("member",memberService.selectMemberAdmin(vo));
        return "admin/member/memberInfo";
    }

    //회원권한변경(Admin)
    @PostMapping(value = "/updateMemberAdmin")
    public String updateMemberAdmin(MemberVO vo){
        memberService.updateMemberAdmin(vo);
        return "redirect:memberManagementPage";
    }


    //회원탈퇴(Admin)
    @PostMapping("/deleteMemberAdmin")
    public String deleteMember(MemberVO vo){
        memberService.deleteMember(vo);
        return "redirect:memberManagementPage";
    }


}

