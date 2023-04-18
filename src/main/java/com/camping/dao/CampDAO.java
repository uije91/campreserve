package com.camping.dao;

import com.camping.dto.CampVO;
import com.camping.common.Pagination;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CampDAO {
    private final SqlSessionTemplate mybatis;
    public CampDAO(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }




    public void insertCampData(CampVO vo){
        mybatis.insert("CAMP.insertCampData",vo);
    }

    //캠핑장 리스트 조회(페이지네이션적용)
    public List<CampVO> getCampList(Pagination pg){
        return mybatis.selectList("CAMP.getCampList",pg);
    }

    //캠핑장의 수 조회
    public int totalCampCnt(Pagination pg){
        return mybatis.selectOne("CAMP.totalCampCnt",pg);
    }

    //campNum 으로 캠핑장 정보 조회
    public CampVO selectCamp(CampVO vo){
        return mybatis.selectOne("CAMP.selectCamp",vo);
    }

    //campNum 으로 캠핑장 정보 삭제
    public int deleteCamp(int campNUm){
        return mybatis.delete("CAMP.deleteCamp",campNUm);
    }

    //캠핑장 등록
    public void insertCamp(CampVO vo){
        mybatis.insert("CAMP.insertCamp",vo);
    }

    //campNum 으로 캠핑장 정보 변경
    public void updateCamp(CampVO vo){
        mybatis.update("CAMP.updateCamp",vo);
    }

    /***************
     * 이미지 등록 관련
     ***************/
    //캠핑 이미지 추가
    public void insertCampImg(CampVO vo){
        mybatis.insert("CAMP.insertCampImg",vo);
    }

    //캠핑 이미지 삭제
    public void deleteCampImg(CampVO vo){
        mybatis.delete("CAMP.deleteCampImg",vo);
    }

    //캠핑 이미지 리스트 조회
    public CampVO getCampImg(CampVO vo){
        return mybatis.selectOne("CAMP.getCampImg",vo);
    }

    public List<CampVO> getCampImgList(CampVO vo){
        return mybatis.selectList("CAMP.getCampImgList",vo);
    }

}
