package com.camping.service;


import com.camping.dto.CampVO;
import com.camping.common.Pagination;

import java.util.List;

public interface CampService {
    void insertCampData(CampVO vo);

    //캠핑장 리스트 조회(페이지네이션적용)
    List<CampVO> getCampList(Pagination pg);

    //캠핑장의 수 조회
    int totalCampCnt(Pagination pg);

    //campNum 으로 캠핑장 정보 조회
    CampVO selectCamp(CampVO vo);

    //campNum 으로 캠핑장 정보 삭제
    int deleteCamp(int campNUm);

    //캠핑장 등록
    void insertCamp(CampVO vo);

    //캠핑장 정보 수정
    void updateCamp(CampVO vo);

    //캠핑 이미지 추가
    void insertCampImg(CampVO vo);

    //캠핑 이미지 삭제
    void deleteCampImg(CampVO vo);

    //캠핑 이미지 조회
    CampVO getCampImg(CampVO vo);

    //캠핑 이미지 리스트 조회
    List<CampVO> getCampImgList(CampVO vo);
}
