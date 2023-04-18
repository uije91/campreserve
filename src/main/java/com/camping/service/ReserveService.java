package com.camping.service;


import com.camping.dto.ReserveVO;
import com.camping.common.Pagination;

import java.util.List;

public interface ReserveService {
    //예약 등록
    void insertCampReservation(ReserveVO vo);
    //예약삭제
    void deleteCampReservation(ReserveVO vo);
    //예약수정
    void updateWriteReview(ReserveVO vo);
    //예약확인(idx)
    ReserveVO getReserveCheck(ReserveVO vo);
    //사용자의 예약정보 확인
    List<ReserveVO> getReserveCheckList(Pagination pg);
    //전체 예약 확인
    int totalRevCount(Pagination pg);


    //리뷰등록
    void insertReview(ReserveVO vo);
    //리뷰삭제
    void deleteReview(ReserveVO vo);
    //리뷰출력
    List<ReserveVO> getReviewList(ReserveVO vo);
    //리뷰페이지관련 총 리뷰 수
    int totalCountReview(ReserveVO vo);
    //리뷰 등록시 등록완료로 체크
    void updateReviewCheck(ReserveVO vo);
}
