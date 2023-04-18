package com.camping.service;


import com.camping.dao.MemberDAO;
import com.camping.dto.MemberVO;
import com.camping.common.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
    private final MemberDAO member;
    public MemberServiceImpl(MemberDAO member) {
        this.member = member;
    }

    @Override
    public int loginID(MemberVO vo) {
        return member.loginID(vo);
    }

    @Override
    public MemberVO getMember(MemberVO vo) {
        return member.getMember(vo);
    }

    @Override
    public void insertMember(MemberVO vo) {
        member.insertMember(vo);
    }

    @Override
    public void deleteMember(MemberVO vo) {
        member.deleteMember(vo);
    }

    @Override
    public MemberVO selectMemberAdmin(MemberVO vo) {
        return member.selectMemberAdmin(vo);
    }

    @Override
    public void updateMemberAdmin(MemberVO vo) {
        member.updateMemberAdmin(vo);
    }


    @Override
    public void updateMember(MemberVO vo) {
        member.updateMember(vo);
    }

    @Override
    public List<MemberVO> getMemberList(Pagination pg) {
        return member.getMemberList(pg);
    }

    @Override
    public int totalMemberCnt(Pagination pg) {
        return member.totalMemberCnt(pg);
    }

    @Override
    public int idCheck(String id) {
        return member.idCheck(id);
    }

    @Override
    public int emailCheck(String email) {
        return member.emailCheck(email);
    }

    @Override
    public String selectIdByNameEmail(MemberVO vo) {
        return member.selectIdByNameEmail(vo);
    }

    @Override
    public String selectPwdByIdNameEmail(MemberVO vo) {
        return member.selectPwdByIdNameEmail(vo);
    }

    @Override
    public void updatePwd(MemberVO vo) {
        member.updatePwd(vo);
    }
}
