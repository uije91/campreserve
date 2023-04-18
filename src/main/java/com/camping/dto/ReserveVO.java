package com.camping.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class ReserveVO {
    //예약관련
    private int idx;
    private String id;
    private String name;
    private String tel;
    private String camp_name;
    private String camp_div;
    private Date start_date;
    private Date end_date;
    private String write_review;

    //리뷰작성관련
    private int r_idx;
    private String review;
    private Date review_date;
}
