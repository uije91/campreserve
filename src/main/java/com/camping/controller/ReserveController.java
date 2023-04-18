package com.camping.controller;

import com.camping.common.Pagination;
import com.camping.dto.CampVO;
import com.camping.dto.MemberVO;
import com.camping.dto.ReserveVO;
import com.camping.service.CampService;
import com.camping.service.ReserveService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes("loginUser")
public class ReserveController {
    private final ReserveService reserveService;
    private final CampService campService;
    public ReserveController(ReserveService reserveService, CampService campService) {
        this.reserveService = reserveService;
        this.campService = campService;
    }

    /******************
     * Camp Reservation
     ******************/
    //예약 페이지 이동
    @RequestMapping(value = "/reservePage")
    public String adminCampingInfo(CampVO cvo, ReserveVO rvo, Model model){
        //캠프이미지리스트
        List<CampVO> list = campService.getCampImgList(cvo);
        if(list.size()==0){
            cvo.setSaveFile("no_image.png");
            list.add(cvo);
        }
        model.addAttribute("img",list);
        model.addAttribute("vo",campService.selectCamp(cvo));
        model.addAttribute("review",reserveService.getReviewList(rvo));
        //지도 관련 셋팅
        model.addAttribute("key","");
        return "reserve/reservePage";
    }

    //예약하기
    @PostMapping(value = "/insertReserve")
    public String insertCampReservation(ReserveVO vo){
        reserveService.insertCampReservation(vo);
        return "redirect:reserveView";
    }

    //예약취소
    @RequestMapping(value = "/deleteCampReservation")
    public String deleteCampReservation(ReserveVO vo){
        reserveService.deleteCampReservation(vo);
        return "redirect:reserveView";
    }

    //예약확인 페이지 이동
    @RequestMapping(value = "/reserveView")
    public String reserveView(Model model,
                              @ModelAttribute("loginUser") MemberVO vo,
                              @RequestParam(value = "page", required = false, defaultValue = "1") String tmpPage,
                              @RequestParam(value = "range", required = false, defaultValue = "1") String tmpRange){

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

        Pagination pg = new Pagination();
        pg.setId(vo.getId());
        int totalCnt = reserveService.totalRevCount(pg);
        pg.pageInfo(page, range, totalCnt);
        List<ReserveVO> list = reserveService.getReserveCheckList(pg);

        model.addAttribute("pagination",pg);
        model.addAttribute("rev",list);

        return "reserve/reserveCheckPage";
    }


    /*********
     * Review
     *********/
    //리뷰작성페이지이동
    @RequestMapping("reviewPage")
    public String insertReviewPage(ReserveVO vo,Model model){
        model.addAttribute("vo",reserveService.getReserveCheck(vo));
        return "reserve/reviewPage";
    }

    //리뷰작성
    @PostMapping(value = "/insertReview")
    public String insertReview(ReserveVO vo){
        reserveService.updateReviewCheck(vo);
        reserveService.insertReview(vo);
        return "redirect:reserveView";
    }

}
