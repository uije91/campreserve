package com.camping.service;


import com.camping.dao.CampDAO;
import com.camping.dto.CampVO;
import com.camping.common.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("campService")
public class CampServiceImpl implements CampService {
    private final CampDAO camp;
    public CampServiceImpl(CampDAO camp) {
        this.camp = camp;
    }

    @Override
    public void insertCampData(CampVO vo) {
        camp.insertCampData(vo);
    }

    @Override
    public List<CampVO> getCampList(Pagination pg) {
        return camp.getCampList(pg);
    }

    @Override
    public int totalCampCnt(Pagination pg) {
        return camp.totalCampCnt(pg);
    }

    @Override
    public CampVO selectCamp(CampVO vo) {
        return camp.selectCamp(vo);
    }

    @Override
    public int deleteCamp(int campNUm) {
        return camp.deleteCamp(campNUm);
    }

    @Override
    public void insertCamp(CampVO vo) {
        camp.insertCamp(vo);
    }

    @Override
    public void updateCamp(CampVO vo) {
        camp.updateCamp(vo);
    }

    @Override
    public void insertCampImg(CampVO vo) {
        camp.insertCampImg(vo);
    }

    @Override
    public void deleteCampImg(CampVO vo) {
        camp.deleteCampImg(vo);
    }

    @Override
    public CampVO getCampImg(CampVO vo) {
        return camp.getCampImg(vo);
    }

    @Override
    public List<CampVO> getCampImgList(CampVO vo) {
        return camp.getCampImgList(vo);
    }
}
