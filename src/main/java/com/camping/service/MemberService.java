package com.camping.service;


import com.camping.dto.MemberVO;
import com.camping.common.Pagination;

import java.util.List;

public interface MemberService {
    //로그인
    int loginID(MemberVO vo);
    MemberVO getMember(MemberVO vo);

    //멤버 추가
    void insertMember(MemberVO vo);

    //멤버 삭제
    void deleteMember(MemberVO vo);

    //멤버 조회(관리자전용)
    MemberVO selectMemberAdmin(MemberVO vo);

    //멤버 수정(관리자전용)
    void updateMemberAdmin(MemberVO vo);

    //멤버 수정
    void updateMember(MemberVO vo);

    //페이지별 멤버 조회
    List<MemberVO> getMemberList(Pagination pg);

    //전체회원의 수 조회
    int totalMemberCnt(Pagination pg);

    //아이디 중복체크
    int idCheck(String id);

    int emailCheck(String email);

    //이메일로 아이디 찾기
    String selectIdByNameEmail(MemberVO vo);

    // 아이디, 이름, 이메일로 비밀번호 찾기
    String selectPwdByIdNameEmail(MemberVO vo);

    //아이디,이름,이메일로 비밀번호 변경
    void updatePwd(MemberVO vo);
}
