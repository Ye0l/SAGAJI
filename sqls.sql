create table users(
    userid varchar2(50) primary key,
    password varchar2(50),
    name varchar2(50)
);

select count(*) as "RESULT" from users where userid = 'TESTID' and password = 'name';
SELECT * FROM USERS ORDER BY USERID;
delete from users;
commit;

create table books(
    bookid number(10) primary key,
    bookname varchar2(50),
    author varchar2(50),
    company varchar2(50),
    story varchar2(1000),
    genre varchar2(50),
    rating number(5)
);
SELECT * FROM BOOKS;

select * from books;
SELECT * FROM (SELECT ROWNUM NUM, RS.* FROM(SELECT * FROM BOOKS WHERE BOOKNAME LIKE '%a%' OR AUTHOR LIKE '%a%') "RS") WHERE NUM BETWEEN 11 AND 20;
SELECT * FROM (SELECT ROWNUM NUM, RS.* FROM(SELECT * FROM BOOKS WHERE BOOKNAME LIKE '%a%' OR AUTHOR LIKE '%a%') "RS") WHERE NUM BETWEEN 11 AND 20;
SELECT count(*) "COUNT" FROM BOOKS WHERE BOOKNAME LIKE '%a%' OR AUTHOR LIKE '%a%';
select * from books order by dbms_random.value;

create table reports(
    reportid number(10) primary key,
    contents varchar(1000),
    writedate timestamp,
    books_bookid references books(bookid),
    users_userid references users(userid)
);

SELECT * FROM REPORTS;

create table review(
    reviewid number(10) primary key,
    contents varchar2(200),
    rating number(5),
    books_bookid references books(bookid),
    users_userid references users(userid)
);

SELECT * FROM REVIEW;

create table comments(
    commentid number(10) primary key,
    contents varchar2(300),
    rating number(5),
    writetime timestamp,
    users_userid references users(userid),
    review_reviewid references review(reviewid)
);

SELECT * FROM COMMENTS;

