package com.camping.dao;


import com.camping.dto.MemberVO;
import com.camping.common.Pagination;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDAO {
    private final SqlSessionTemplate mybatis;
    public MemberDAO(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }

    //회원 존재여부 확인
    public int loginID(MemberVO vo){
        int result;
        String pwd = mybatis.selectOne("MEMBER.confirmID",vo);
        if(pwd==null){
            result = -1;
        }else if(pwd.equals(vo.getPwd())){
            result = 1;
        }else{
            result = 0;
        }
        return result;
    }

    //로그인
    public MemberVO getMember(MemberVO vo) {
        return mybatis.selectOne("MEMBER.getMember", vo);
    }

    //멤버 추가
    public void insertMember(MemberVO vo) {
        mybatis.insert("MEMBER.insertMember", vo);
    }

    //멤버 삭제
    public void deleteMember(MemberVO vo) {
        mybatis.delete("MEMBER.deleteMember", vo);
    }

    //멤버 수정
    public void updateMember(MemberVO vo) {
        mybatis.update("MEMBER.updateMember", vo);
    }

    //페이지별 멤버 조회
    public List<MemberVO> getMemberList(Pagination pg){
        return mybatis.selectList("MEMBER.getMemberList",pg);
    }

    //전체회원의 수 조회
    public int totalMemberCnt(Pagination pg){
        return mybatis.selectOne("MEMBER.totalMemberCnt",pg);
    }

    //아이디 체크
    public int idCheck(String id){
        return mybatis.selectOne("MEMBER.idCheck",id);
    }
    //아이디 체크
    public int emailCheck(String email){
        return mybatis.selectOne("MEMBER.emailCheck",email);
    }

    // 이름과 이메일로 아이디 찾기
    public String selectIdByNameEmail(MemberVO vo) {
        return mybatis.selectOne("MEMBER.selectIdByNameEmail", vo);
    }

    // 아이디, 이름, 이메일로 비밀번호 찾기
    public String selectPwdByIdNameEmail(MemberVO vo) {
        return mybatis.selectOne("MEMBER.selectPwdByIdNameEmail", vo);
    }

    //아이디, 이름, 이메일로 비밀번호 변경
    public void updatePwd(MemberVO vo){
        mybatis.update("MEMBER.updatePwd",vo);
    }



    //멤버 조회(관리자전용)
    public MemberVO selectMemberAdmin(MemberVO vo){
        return mybatis.selectOne("MEMBER.selectMemberAdmin",vo);
    }

    //멤버 수정(관리자전용)
    public void updateMemberAdmin(MemberVO vo) {
        mybatis.update("MEMBER.updateMemberAdmin", vo);
    }

}
