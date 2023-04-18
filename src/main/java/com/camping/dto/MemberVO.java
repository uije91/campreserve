package com.camping.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class MemberVO {
    private int idx;
    private String id;
    private String pwd;
    private String name;
    private String tel;
    private String email;
    private Date regDate;
    private int role;   //등급 0:일반사용자, 1:관리자
}
