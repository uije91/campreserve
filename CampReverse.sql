drop table member;
CREATE TABLE MEMBER(
    idx number primary key,
    id varchar2(20) unique,
    pwd varchar2(20),
    name nvarchar2(10),
    tel char(13),
    email varchar2(40),
    regDate DATE default SYSDATE,
    role number(1) default 0
);
DROP SEQUENCE  member_idx;
CREATE SEQUENCE member_idx increment by 1 start with 1;
SELECT * FROM MEMBER;

-- Member 테스트용 데이터 추가
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'admin', 1234, '관리자', '010-2332-2322','a@a.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user1', 1234, '유저1', '010-2332-2322','user1@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user2', 1234, '유저2', '010-2332-2322','user2@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user3', 1234, '유저3', '010-2332-2322','user3@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user4', 1234, '유저4', '010-2332-2322','user4@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user5', 1234, '유저5', '010-2332-2322','user5@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user6', 1234, '유저6', '010-2332-2322','user6@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user7', 1234, '유저7', '010-2332-2322','user7@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user8', 1234, '유저8', '010-2332-2322','user8@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user9', 1234, '유저9', '010-2332-2322','user9@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user10', 1234, '유저10', '010-2332-2322','user10@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user11', 1234, '유저11', '010-2332-2322','user11@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user12', 1234, '유저12', '010-2332-2322','user12@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user13', 1234, '유저13', '010-2332-2322','user13@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user14', 1234, '유저14', '010-2332-2322','user14@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user15', 1234, '유저15', '010-2332-2322','user15@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user16', 1234, '유저16', '010-2332-2322','user16@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user17', 1234, '유저17', '010-2332-2322','user17@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user18', 1234, '유저18', '010-2332-2322','user18@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user19', 1234, '유저19', '010-2332-2322','user19@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user20', 1234, '유저20', '010-2332-2322','user20@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user21', 1234, '유저21', '010-2332-2322','user21@gmail.com');
INSERT INTO member(idx, id, pwd, name, tel, email) VALUES(member_idx.NEXTVAL, 'user22', 1234, '유저22', '010-2332-2322','user22@gmail.com');


--관리자 계정 추가
UPDATE MEMBER SET role=1 where idx =1;

--캠핑데이터 추가(공공데이터활용)
DROP TABLE CAMP;
CREATE TABLE CAMP(
    campNum number(5) primary key,
    camp_name nvarchar2(100),
    camp_div nvarchar2(100),
    latitude nvarchar2(20),
    longitude nvarchar2(20),
    camp_address nvarchar2(100),
    common_camp number(4) default 0,
    car_camp number(4) default 0,
    glamping number(4) default 0,
    caravan number(4) default 0,
    toilet  number(4) default 0,
    shower_room number(4) default 0,
    sink    number(4) default 0,
    additional_1 nvarchar2(150),
    additional_2 nvarchar2(150),
    approve_date nvarchar2(10)
);
DROP SEQUENCE campNum_seq;
CREATE SEQUENCE campNum_seq increment by 1 start with 1;

SELECT * FROM CAMP order by campNum desc;

--캠핑이미지
DROP TABLE CAMP_IMG;
CREATE TABLE CAMP_IMG(
    imgNum number PRIMARY KEY,
    campNUm number(5),
    saveFolder varchar2(45),
    saveFile nvarchar2(45),
    originFile nvarchar2(45),
    foreign key (campNUm) references CAMP(campNum) on delete cascade
);
DROP SEQUENCE CAMP_IMG_SEQ;
CREATE SEQUENCE CAMP_IMG_SEQ increment by 1 start with 1;

select*from CAMP_IMG;

--예약 테이블
DROP table RESERVATION;
CREATE TABLE RESERVATION(
    idx number primary key ,
    id varchar2(20),
    name nvarchar2(10),
    tel char(13),
    camp_name nvarchar2(100),
    camp_div nvarchar2(100),
    start_date Date default sysdate,
    end_date Date default sysdate,
    write_review char(1) default 'N',
    foreign key (id) references MEMBER(id) on delete cascade
);

DROP SEQUENCE reservationIdx_seq;
create sequence reservationIdx_seq increment by 1 start with 1;

select*from RESERVATION;


--리뷰 테이블
DROP TABLE REVIEW;
CREATE TABLE REVIEW(
    r_idx number primary key ,
    id varchar2(20),
    name nvarchar2(10),
    camp_name nvarchar2(100),
    review nvarchar2(100),
    review_date date default sysdate,
    foreign key (id) references MEMBER(id) on delete cascade
);

DROP SEQUENCE r_idx_seq;
CREATE SEQUENCE r_idx_seq increment by 1 start with 1;

select*from REVIEW;