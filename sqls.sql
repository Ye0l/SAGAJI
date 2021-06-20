create table users(
    userid varchar2(50) primary key,
    password varchar2(50),
    name varchar2(50)
);

select count(*) as "RESULT" from users where userid = 'TESTID' and password = 'name';
SELECT * FROM USERS;
delete from users;
commit;

insert into users(userid, password, name) values('testest', 'asdasdsa', '한글이름');

create table books(
    bookid number(10) primary key,
    bookname varchar2(50),
    author varchar2(50),
    company varchar2(50),
    story varchar2(3000),
    genre varchar2(50),
    rating number(5)
);
create sequence book_id_seq start with 10000 increment by 1 maxvalue 9999999 cycle nocache;
drop sequence book_id_seq;
delete from books;

select * from books;
SELECT * FROM (SELECT ROWNUM NUM, RS.* FROM(SELECT * FROM BOOKS WHERE BOOKNAME LIKE '%a%' OR AUTHOR LIKE '%a%') "RS") WHERE NUM BETWEEN 11 AND 20;
SELECT * FROM (SELECT ROWNUM NUM, RS.* FROM(SELECT * FROM BOOKS WHERE BOOKNAME LIKE '%a%' OR AUTHOR LIKE '%a%') "RS") WHERE NUM BETWEEN 11 AND 20;
SELECT count(*) "COUNT" FROM BOOKS WHERE BOOKNAME LIKE '%a%' OR AUTHOR LIKE '%a%';
select * from books order by dbms_random.value;

create table reports(
    reportid number(10) primary key,
    contents varchar(1000),
    writedate timestamp default sysdate,
    books_bookid references books(bookid),
    users_userid references users(userid)
);
delete from reports;
drop sequence reports_id_seq;
create sequence reports_id_seq start with 10000 increment by 1 maxvalue 9999999 cycle nocache;
SELECT * FROM REPORTS;

create table review(
    reviewid number(10) primary key,
    contents varchar2(200),
    rating number(5),
    books_bookid references books(bookid),
    users_userid references users(userid)
);
delete from review;
SELECT * FROM REVIEW;
SELECT R.* ,(SELECT COUNT(*) FROM COMMENTS C WHERE C.REVIEW_REVIEWID = R.REVIEWID) COMMENTS FROM REVIEW R WHERE BOOKS_BOOKID = 1777;

drop sequence review_id_seq;
create sequence review_id_seq start with 10000 increment by 1 maxvalue 9999999 cycle nocache;

create table comments(
    commentid number(10) primary key,
    contents varchar2(300),
    rating number(5),
    writetime timestamp default sysdate,
    users_userid references users(userid),
    review_reviewid references review(reviewid)
);
delete from comments;
INSERT INTO COMMENTS(COMMENTID, CONTENTS, USERS_USERID, REVIEW_REVIEWID)
VALUES(comments_id_seq, 'TEST', 'ADMIN', 4852);

create sequence comments_id_seq start with 10000 increment by 1 maxvalue 9999999 cycle nocache;
drop sequence comments_id_seq;

SELECT * FROM COMMENTS;
SELECT * FROM COMMENTS WHERE REVIEW_REVIEWID = 4852;

