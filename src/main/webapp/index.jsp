<%@page import="sagaji.BookDTO"%>
<%@page import="sagaji.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="overflow-y: scroll;">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	integrity="undefined" crossorigin="anonymous">
<title>index</title>
<style>
@font-face {
	font-family: 'NotoSansKR'; /*글꼴*/
	src: local('NotoSansKR'), url('./fonts/NotoSansKR-Regular.otf')
		format('opentype');
}

@font-face {
	font-family: 'NotoSansKR-Bold'; /*글꼴*/
	src: local('NotoSansKR-Bold'), url('./fonts/NotoSansKR-Bold.otf')
		format('opentype');
}

* {
	/* border: solid 1px blue; */
	
}

.container {
	width: inherit;
	margin-bottom: 5em;
}

.row {
	margin-bottom: 10px;
}

#nav-top {
	background-color: #151515;
	text-align: right;
	padding-right: 10em;
}

#nav-bar {
	background-color: #2e2e2e;
	height: 6em;
}

#box {
	position: absolute;
	left: 6em;
	height: 6em;
	width: 12em;
	background-color: #3b9c89;
	text-align: center;
}

#box>img {
	position: absolute;
	max-width: 100%;
	max-height: 100%;
	width: auto;
	height: auto;
	margin: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

#banner {
	width: 100%;
	height: 100%;
	background-image: url("./resource/banner-t.jpg");
	background-position: center bottom;
	/* background-repeat: no-repeat; */
}

#footer {
	position: fixed;
	height: 5em;
	background-color: #3b9c89;
	bottom: 0;
}

.right{
	text-align: right;
}
.right > img {
	display: inline-block;
}

body {
	overflow: hidden;
}

a {
	text-decoration: none;
}

#nav-bar a:link {
	color: white;
}

#nav-bar a:visited {
	color: white;
}

#nav-bar a:hover {
	color: white;
}

#nav-bar a:active {
	color: white;
}

.menu {
	float:right;
	list-style: none;
	margin-right: 9em;
}

.menu h5 {
	font-weight: bold;
	font-family: 'NotoSansKR';
}

.menu li {
	color:white;
	float:left;
	padding:20px 40px;
	color: #a0a0a0;
}

.topNavBtn {
	list-style: none;
	font-size: small;
	font-family: 'NotoSansKR';
	margin-right: 1em;
	color: white;
}

.topNavBtn > li {
	float:right;
	padding: 0 1em;
}
</style>
</head>
<body>
	<div class="row">
		
		<a href="./index.jsp">
			<div id="box">
				<img src="./resource/logo_box.png" style="margin: auto;">
			</div>
		</a>
		<div id="nav-bar">
			<div id="nav-top">
				<div style="display: inline-block;">
					<ul class="topNavBtn">
						<% if(session.getAttribute("id") == null) { %>
						<li><a href="./login.jsp">로그인</a></li>
						<li><a href="./sign-up.jsp">회원가입</a></li>
						<% } else { %>
						<li><a href="./logoutPro.jsp">Logout</a></li>
						<li>환영합니다, <a href="./profile.jsp"><%= session.getAttribute("name")%></a> 님!</li>
						<% } %>
					</ul>
				</div>
			</div>
			<ul class="menu">
				<li><h5><a href="./index.jsp">메인</a></h5></li>
				<li><h5><a href="./recommend.jsp">추천 도서</a></h5></li>
				<li><h5><a href="./classification.jsp">분류별 도서</a></h5></li>
				<li><h5><a href="./report.jsp">독후감상문</a></h5></li>
			</ul>
		</div>
		<div class="col" style="height: 20em;">
			<div id="banner"></div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<% BookDTO todayBook = new BookDAO().getTodayRecommend(); %>
				<div><h5 style="font-weight: bold; font-family: 'NotoSansKR'">오늘의 책 ></h5></div>
				<div class="row">
					<div class="col-2" style="text-align: center;">
						<a href="detail.jsp?bookid=<%=todayBook.getBookid() %>">
							<img src="./books/<%=todayBook.getBookid() %>.png" width="200px" height="300px">
						</a>
					</div>
					<div class="col-4" style="font-family: 'NotoSansKR'">
						<div><h4 style="font-weight: bold; font-family: 'NotoSansKR'; color: #1f5ec0"><%=todayBook.getBookname() %></h4></div>
						<div><h5 style="font-weight: bold; font-family: 'NotoSansKR';"><%=todayBook.getAuthor() %></h5></div>
						<%=todayBook.getStory().length() > 500 ? todayBook.getStory().substring(0, 500) + " ..." : todayBook.getStory() %>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form action="./search.jsp" method="get">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="도서명 검색"
							aria-describedby="button-addon2" id="search" name="search">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">Search</button>
						<input type="hidden" name="p" value="1">
					</div>
					<div style="font-family: 'NotoSansKR'">
						<input type="radio" name="searchType" value="0" checked="checked">&nbsp;전체&nbsp;&nbsp;
						<input type="radio" name="searchType" value="1">&nbsp;제목&nbsp;&nbsp;
						<input type="radio" name="searchType" value="2">&nbsp;저자
					</div>
				</form>
			</div>	
		</div>
	</div>
	<div class="row">
		<div id="footer"></div>
	</div>
</body>
</html>