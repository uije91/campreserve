package com.camping.service;


import com.camping.dao.ReserveDAO;
import com.camping.dto.ReserveVO;
import com.camping.common.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {
    private final ReserveDAO rev;
    public ReserveServiceImpl(ReserveDAO rev) {
        this.rev = rev;
    }

    @Override
    public void insertCampReservation(ReserveVO vo) {
        rev.insertCampReservation(vo);
    }

    @Override
    public void deleteCampReservation(ReserveVO vo) {
        rev.deleteCampReservation(vo);
    }

    @Override
    public void updateWriteReview(ReserveVO vo) {
        rev.updateWriteReview(vo);
    }

    @Override
    public ReserveVO getReserveCheck(ReserveVO vo) {
        return rev.getReserveCheck(vo);
    }

    @Override
    public List<ReserveVO> getReserveCheckList(Pagination pg) {
        return rev.getReserveCheckList(pg);
    }

    @Override
    public int totalRevCount(Pagination pg) {
        return rev.totalRevCount(pg);
    }

    @Override
    public void insertReview(ReserveVO vo) {
        rev.insertReview(vo);
    }

    @Override
    public void deleteReview(ReserveVO vo) {
        rev.deleteReview(vo);
    }

    @Override
    public List<ReserveVO> getReviewList(ReserveVO vo) {
        return rev.getReviewList(vo);
    }

    @Override
    public int totalCountReview(ReserveVO vo) {
        return rev.totalCountReview(vo);
    }

    @Override
    public void updateReviewCheck(ReserveVO vo) {
        rev.updateReviewCheck(vo);
    }
}
