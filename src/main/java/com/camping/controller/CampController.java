package com.camping.controller;


import com.camping.dto.CampVO;
import com.camping.service.CampService;
import com.camping.common.Pagination;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@SessionAttributes("loginUser")
public class CampController {

    private final CampService campService;
    public CampController(CampService campService) {
        this.campService = campService;
    }


    /******************
     * Management Camp
     ******************/
    //캠핑장 관리페이지
    @RequestMapping(value = "/campManagementPage")
    public String getCampingList(Model model,
                                 @RequestParam(value = "searchType", defaultValue = "") String searchType,
                                 @RequestParam(value = "keyword", defaultValue = "") String keyword,
                                 @RequestParam(value = "page", required = false, defaultValue = "1") String tmpPage,
                                 @RequestParam(value = "range", required = false, defaultValue = "1") String tmpRange) {
        int page = 0;
        int range = 0;

        //Get 방식이기 때문에 URI 에 장난치는걸 방지하기 위해 예외처리
        try{
            page = Integer.parseInt(tmpPage);
            range = Integer.parseInt(tmpRange);
        }catch (NumberFormatException e){
            page=0;
            range=0;
        }

        if(!"camp_name".equals(searchType) && !"camp_div".equals(searchType) && !"camp_address".equals(searchType)) {
            searchType = "";
        }
        if(keyword == null || "".equals(keyword) || keyword.trim().isEmpty() ) {
            keyword = "";
        }

        Map<String, String> paraMap = new HashMap<>();
        paraMap.put("searchType", searchType);
        paraMap.put("keyword", keyword);

        Pagination pg = new Pagination();
        pg.setSearchType(searchType);
        pg.setKeyword(keyword);

        int totalCnt = campService.totalCampCnt(pg);
        pg.pageInfo(page, range, totalCnt);
        List<CampVO> campingList = campService.getCampList(pg);

        if(!"".equals(searchType) && !"".equals(keyword)) {
            model.addAttribute("paraMap",paraMap);
        }

        model.addAttribute("pagination",pg);
        model.addAttribute("campingList",campingList);
        return "admin/camp/campManagementPage";
    }

    //캠핑장 등록
    @RequestMapping(value = "/insertCampPage")
    public String insertCampingPage(){
        return "admin/camp/insertCampPage";
    }

    //캠핑장 등록
    @PostMapping(value = "/insertCamp")
    public String insertCamp(CampVO vo,
                                @RequestParam(value = "camp_div",required = false) String[] camp_div,
                                @RequestParam(value = "postcode") String postcode,
                                @RequestParam(value = "roadAddress") String roadAddress,
                                @RequestParam(value = "detailAddress") String detailAddress) {

        //체크박스 배열로 받기
        StringBuilder sb = new StringBuilder();
        if (camp_div != null && camp_div.length > 0) {
            for (int i = 0; i < camp_div.length; i++) {
                sb.append(camp_div[i]);
                if (i < camp_div.length - 1) {
                    sb.append(", ");
                }
            }
        }else{
        }

        //주소 합치기
        String address;
        if(postcode.equals("")||roadAddress.equals("")){
            address = "";
        } else{
            address = "("+postcode+")"+roadAddress+" "+detailAddress;
        }
        vo.setCamp_address(address);

        //common_camp,car_camp,glamping,caravan,toilet,shower_room,sink 는 숫자형이기때문에 null입력시 0으로 입력
        if(vo.getCommon_camp().equals("")){vo.setCommon_camp("0");}
        if(vo.getCar_camp().equals("")){vo.setCar_camp("0");}
        if(vo.getGlamping().equals("")){vo.setGlamping("0");}
        if(vo.getCaravan().equals("")){vo.setCaravan("0");}
        if(vo.getToilet().equals("")){vo.setToilet("0");}
        if(vo.getShower_room().equals("")){vo.setShower_room("0");}
        if(vo.getSink().equals("")){vo.setSink("0");}
        campService.insertCamp(vo);
        return "redirect:campManagementPage";
    }

    //캠핑장 상세페이지 이동
    @RequestMapping(value = "/campInfo")
    public String campInfo(CampVO vo, Model model){
        CampVO camp = campService.selectCamp(vo);
        model.addAttribute("camp",camp);
        return "admin/camp/campInfo";
    }

    //캠핑장 정보 수정
    @PostMapping(value = "updateCamp")
    public String updateCamping(CampVO vo,
                                @RequestParam(value = "camp_div") String[] camp_div,
                                @RequestParam(value = "postcode") String postcode,
                                @RequestParam(value = "roadAddress") String roadAddress,
                                @RequestParam(value = "detailAddress") String detailAddress){

        //체크박스 배열로 받기
        StringBuilder sb = new StringBuilder();
        if (camp_div != null && camp_div.length > 0) {
            for (int i = 0; i < camp_div.length; i++) {
                sb.append(camp_div[i]);
                if (i < camp_div.length - 1) {
                    sb.append(", ");
                }
            }
        }else{
        }

        //주소 합치기
        String address = vo.getCamp_address();
        if(!postcode.equals("") && !roadAddress.equals("")){
            address = "("+postcode+")"+roadAddress+" "+detailAddress;
        }
        vo.setCamp_address(address);

        //common_camp,car_camp,glamping,caravan,toilet,shower_room,sink 는 숫자형이기때문에 null입력시 0으로 등록
        if(vo.getCommon_camp().equals("")){vo.setCommon_camp("0");}
        if(vo.getCar_camp().equals("")){vo.setCar_camp("0");}
        if(vo.getGlamping().equals("")){vo.setGlamping("0");}
        if(vo.getCaravan().equals("")){vo.setCaravan("0");}
        if(vo.getToilet().equals("")){vo.setToilet("0");}
        if(vo.getShower_room().equals("")){vo.setShower_room("0");}
        if(vo.getSink().equals("")){vo.setSink("0");}
        campService.updateCamp(vo);
        return "redirect:campManagementPage";
    }

    //캠핑장 삭제
    @PostMapping(value = "/deleteCamp")
    public String deleteCamp(CampVO vo){
        //사진삭제
        String path = "/Users/uije/workspace/spring/Project/CampReserve/web/WEB-INF/resources/images/files";
        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = path+File.separator+today;

        List<CampVO> list = campService.getCampImgList(vo);
        for(int i=0; i<list.size(); i++){
             vo = list.get(i);
            String delFile = vo.getSaveFile();
            File f = new File(saveFolder+File.separator+delFile);
            if (f.exists() && !delFile.equals("no_image.png")) {
                f.delete();
            }
            campService.deleteCampImg(vo);
        }
        campService.deleteCamp(vo.getCampNum());
        return "redirect:campManagementPage";
    }

    //사진등록 페이지 이동
    @RequestMapping(value = "/campImg")
    public String campImg(CampVO vo,Model model){
        List<CampVO> list = campService.getCampImgList(vo);
        CampVO camp = campService.selectCamp(vo);
        model.addAttribute("list",list);
        model.addAttribute("camp",camp);
        return "admin/camp/campImage";
    }

    //사진등록
    @PostMapping(value = "/insertCampImg")
    public String insertCampImg(@RequestParam("file") MultipartFile[] files,
                          CampVO vo, RedirectAttributes reAttr, HttpSession session) {

        //String realpath = session.getServletContext().getRealPath("/resources/upload");
        String path = "/Users/uije/workspace/spring/Project/CampReserve/web/WEB-INF/resources/images/files";
        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = path+File.separator+today;
        File folder = new File(saveFolder);
        if(!folder.exists()){
            folder.mkdirs();
        }

        List<CampVO> list = new ArrayList<>();
        try {
            for (MultipartFile file : files) {
                String originalFileName = file.getOriginalFilename();
                if (!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf('.'));
                    vo.setSaveFolder(today);
                    vo.setOriginFile(originalFileName);
                    vo.setSaveFile(saveFileName);
                    file.transferTo(new File(folder,saveFileName));
                }
                list.add(vo);
            }
            campService.insertCampImg(vo);
            reAttr.addAttribute("campNum", vo.getCampNum());
            reAttr.addAttribute("camp_name", vo.getCamp_name());
        }catch (IOException e){
            e.printStackTrace();
        }
        return "redirect:campImg";
    }

    //파일 삭제
    @RequestMapping(value="/deleteCampImg")
    public String deleteCampImg(CampVO vo) {
        String path = "/Users/uije/workspace/spring/Project/CampReserve/web/WEB-INF/resources/images/files";
        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = path+File.separator+today;

        vo = campService.getCampImg(vo);
        String delFile = vo.getSaveFile();
        File f = new File(saveFolder+File.separator+delFile);
        if (f.exists() && !delFile.equals("no_image.png")) {
            f.delete();
        }
        campService.deleteCampImg(vo);
        return "redirect:campImg";
    }









    /***************
     * find CampList
     ***************/
    //캠핑장 찾기 페이지
    @RequestMapping(value = "/campPage")
    public String getCampList(Model model,
                                 @RequestParam(value = "searchType", defaultValue = "") String searchType,
                                 @RequestParam(value = "keyword", defaultValue = "") String keyword,
                                 @RequestParam(value = "page", required = false, defaultValue = "1") String tmpPage,
                                 @RequestParam(value = "range", required = false, defaultValue = "1") String tmpRange) {
        int page = 0;
        int range = 0;

        //Get 방식이기 때문에 URI 에 장난치는걸 방지하기 위해 예외처리
        try{
            page = Integer.parseInt(tmpPage);
            range = Integer.parseInt(tmpRange);
        }catch (NumberFormatException e){
            page=0;
            range=0;
        }

        if(!"camp_name".equals(searchType) && !"camp_div".equals(searchType) && !"camp_address".equals(searchType)) {
            searchType = "";
        }
        if(keyword == null || "".equals(keyword) || keyword.trim().isEmpty() ) {
            keyword = "";
        }

        Map<String, String> paraMap = new HashMap<>();
        paraMap.put("searchType", searchType);
        paraMap.put("keyword", keyword);

        Pagination pg = new Pagination();
        pg.setSearchType(searchType);
        pg.setKeyword(keyword);

        int totalCnt = campService.totalCampCnt(pg);
        pg.pageInfo(page, range, totalCnt);
        List<CampVO> campList = campService.getCampList(pg);

        if(!"".equals(searchType) && !"".equals(keyword)) {
            model.addAttribute("paraMap",paraMap);
        }

        model.addAttribute("pagination",pg);
        model.addAttribute("campList",campList);
        return "camp/campPage";
    }

    /****************************
     * 공공데이터를 활용한 캠핑장 최초등록
     ****************************/
    //공공데이터를 활용한 데이터 다운로드 페이지 이동
    @RequestMapping(value = "/campDataPage")
    public String adminCampInsertPage() {
        return "admin/publicData/insertCampData";
    }

    //캠핑장 공공데이터를 DB에 다운받는 작업
    @RequestMapping(value = "/insertCampData")
    public String insertCampData(CampVO vo) throws Exception {
        /*URL*/
        String urlBuilder = "http://api.odcloud.kr/api/15037499/v1/uddi:1fe51f51-e956-425b-a9e3-e4555cb57880" + "?" + URLEncoder.encode("page", StandardCharsets.UTF_8) + "=" + URLEncoder.encode("1", StandardCharsets.UTF_8) + /*페이지번호*/
                "&" + URLEncoder.encode("perPage", StandardCharsets.UTF_8) + "=" + URLEncoder.encode("2500", StandardCharsets.UTF_8) + /*한 페이지 당 데이터 수*/
                "&" + URLEncoder.encode("returnType", StandardCharsets.UTF_8) + "=" + URLEncoder.encode("JSON", StandardCharsets.UTF_8) + /*JSON DATA*/
                "&" + URLEncoder.encode("serviceKey", StandardCharsets.UTF_8) + "= "; /*Service Key*/


        URL url = new URL(urlBuilder);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        System.out.println(sb);

        try {
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString());
            JSONArray data = (JSONArray) jsonObject.get("data");
            for(int i=0; i< data.size(); i++){
                //데이터 오브젝트를 가져와서
                JSONObject object = (JSONObject) data.get(i);
                //컬럼에 담는다.
                vo.setCamp_name((String) object.get("캠핑(야영)장명"));
                vo.setCamp_div((String) object.get("캠핑(야영)장구분"));
                vo.setLatitude((String) object.get("위도"));
                vo.setLongitude((String) object.get("경도"));
                vo.setCamp_address((String) object.get("주소"));
                vo.setCommon_camp((String) object.get("일반야영장수"));
                vo.setCar_camp((String) object.get("자동차야영장"));
                vo.setGlamping((String) object.get("글램핑"));
                vo.setCaravan((String) object.get("카라반"));
                vo.setToilet((String) object.get("화장실"));
                vo.setShower_room((String) object.get("샤워실"));
                vo.setSink((String) object.get("개수대"));
                vo.setAdditional_1((String) object.get("기타부대시설 1"));
                vo.setAdditional_2((String) object.get("기타부대시설 2"));
                vo.setApprove_date((String) object.get("인허가일자"));
                campService.insertCampData(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "include/index";
    }
}
