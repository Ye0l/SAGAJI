<%@page import="sagaji.ReportDAO"%>
<%@page import="sagaji.ReportDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String reportid = request.getParameter("reportid");
	ReportDAO dao = new ReportDAO();
	ReportDTO dto = dao.getReport(reportid);
%>
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
	font-family: 'NotoSansKR';
	
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

.menu > li {
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
				<li><h5><a href="./classification.jsp?p=1&auth=&comp=&genre=">분류별 도서</a></h5></li>
				<li><h5><a href="./report.jsp?p=1">독후감상문</a></h5></li>
			</ul>
		</div>
		<div class="col" style="height: 20em;">
			<div id="banner"></div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-auto">
				<h2>독후감상문</h2><hr>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="card" style="width: 100%;">
				  <div class="card-body">
				  	<a href="detail.jsp?bookid=<%=dto.getBookid()%>">
					  	<div style="max-height: 600px; overflow: hidden;">
					  		<img src="./books/<%=dto.getBookid() %>.png" class="card-img-top" style="width: 100%; margin-top: -10%; filter: blur(10px); -webkit-filter: blur(10px);">
					  	</div>
				  	</a>
				    <h5 class="card-title"><%=dto.getBookname() %></h5>
				    <h6 class="card-subtitle mb-2 text-muted"><%=dto.getUserid() %></h6>
				    <h6 class="card-subtitle mb-2 text-muted"><%=dto.getDate() %></h6>
				    <p class="card-text"><%=dto.getContents() %></p>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" style="z-index: 2">
		<div id="footer" style="z-index: 3"></div>
	</div>
</body>
</html>