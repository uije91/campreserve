package com.camping.dao;


import com.camping.dto.ReserveVO;
import com.camping.common.Pagination;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReserveDAO {
    private SqlSessionTemplate mybatis;
    public ReserveDAO(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }

    //예약 등록
    public void insertCampReservation(ReserveVO vo){
        mybatis.insert("REV.insertCampReservation",vo);
    }
    //예약삭제
    public void deleteCampReservation(ReserveVO vo){
        mybatis.delete("REV.deleteCampReservation",vo);
    }
    //예약수정
    public void updateWriteReview(ReserveVO vo){
        mybatis.update("REV.updateWriteReview",vo);
    }
    //예약확인(idx)
    public ReserveVO getReserveCheck(ReserveVO vo){
        return mybatis.selectOne("REV.getReserveCheck",vo);
    }
    //사용자의 예약정보 확인
    public List<ReserveVO> getReserveCheckList(Pagination pg){
        return mybatis.selectList("REV.getReserveCheckList",pg);
    }
    //전체 예약 확인
    public int totalRevCount(Pagination pg){
        return mybatis.selectOne("REV.totalRevCount",pg);
    }


    //리뷰등록
    public void insertReview(ReserveVO vo){
        mybatis.insert("REV.insertReview",vo);
    }
    //리뷰삭제
    public void deleteReview(ReserveVO vo){
        mybatis.delete("REV.deleteReview",vo);
    }
    //리뷰출력
    public List<ReserveVO> getReviewList(ReserveVO vo){
        return mybatis.selectList("REV.getReviewList",vo);
    }
    //리뷰페이지관련 총 리뷰 수
    public int totalCountReview(ReserveVO vo){
        return mybatis.selectOne("REV.totalCountReview",vo);
    }
    //리뷰 등록시 등록완료로 체크
    public void updateReviewCheck(ReserveVO vo){
        mybatis.update("REV.updateReviewCheck",vo);
    }
}
