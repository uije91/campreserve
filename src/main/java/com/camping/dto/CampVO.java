package com.camping.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@Setter
@ToString
public class CampVO {
    private int campNum;            //캠핑장번호
    private String camp_name;       //캠핑(야영)장명
    private String camp_div;        //캠핑(야영)장구분
    private String latitude;        //위도
    private String longitude;       //경도
    private String camp_address;    //주소
    private String common_camp;     //일반야영장수
    private String car_camp;        //자동차야영장
    private String glamping;        //글램핑
    private String caravan;         //카라반
    private String toilet;          //화장실
    private String shower_room;     //샤워실
    private String sink;            //개수대
    private String additional_1;    //기타부대시설1
    private String additional_2;    //기타부대시설2
    private String approve_date;    //인허가일자

    //파일업로드
    private int imgNum;
    private String saveFolder;
    private String originFile;
    private String saveFile;
}