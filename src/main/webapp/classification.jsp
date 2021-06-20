<%@page import="sagaji.classifyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sagaji.BookDTO"%>
<%@page import="sagaji.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	classifyDAO cDAO = new classifyDAO();
	request.setCharacterEncoding("utf-8");
	
	String auth = request.getParameter("auth");
	String comp = request.getParameter("comp");
	String genre = request.getParameter("genre");
	
	String search = ""; 
	int p = 1;
	
	try {
		p = Integer.parseInt(request.getParameter("p"));
	} catch (Exception e) {
		log("", e);
	}
	
	ArrayList<BookDTO> dtos = cDAO.getClassifyBook(auth, comp, genre);
	int searchCount = cDAO.getClassifyCount(auth, comp, genre);
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

#nav-bar a {
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

.container .row {
	margin: 1em;
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
				<li><h5><a href="./classification.jsp?auth=&comp=&genre=">분류별 도서</a></h5></li>
				<li><h5><a href="./report.jsp">독후감상문</a></h5></li>
			</ul>
		</div>
		<div class="col" style="height: 20em;">
			<div id="banner"></div>
		</div>
	</div>
	<div class="container" style="z-index: 1">
		<div class="row">
			<div class="col-12">
				<form action="classification.jsp" method="get">
					<select name="auth" class="form-select" aria-label="Default select example">
						<option value="">작가별 분류</option>
						<%for(String item : cDAO.getAuthClassify()) { %>
						<option value="<%=item%>" <%=item.equals(auth) ? "selected" : "" %>><%=item%></option>
						<% } %>
					</select>
					<select name="comp" class="form-select" aria-label="Default select example">
						<option value="">출판사별 분류</option>
						<%for(String item : cDAO.getCompClassify()) { %>
						<option value="<%=item%>" <%=item.equals(comp) ? "selected" : "" %>><%=item%></option>
						<% } %>
					</select>
					<select name="genre" class="form-select" aria-label="Default select example">
						<option value="">장르별 분류</option>
						<%for(String item : cDAO.getGenreClassify()) { %>
						<option value="<%=item%>" <%=item.equals(genre) ? "selected" : "" %>><%=item%></option>
						<% } %>
					</select>
					<div class="d-grid gap-2">
						<button class="btn btn-outline-primary" type="submit">SEARCH</button>
					</div>
				</form>
			</div>
			<!-- 검색결과부 -->
			<% for(BookDTO dto : dtos) { %>
			<div class="row">
				<div class="col-4" style="text-align: center;">
					<a href="detail.jsp?bookid=<%=dto.getBookid() %>">
						<img src="books/<%=dto.getBookid() %>.png" width="200px" height="300px">
					</a>
				</div>
				<div class="col-8" style="font-family: 'NotoSansKR'">
					<div class="row" style="font-size: 20px; font-weight: bold;"><%=dto.getBookname() %></div>
					<hr>
					<div class="row"><div style="padding: 0">저자: <b><%=dto.getAuthor() %></b></div></div>
					<div class="row"><div style="padding: 0">출판: <b><%=dto.getCompany() %></b></div></div>
					<div class="row"><%=dto.getStory() %></div>
				</div>
			</div>
			<hr>
			<% } %>
			<!-- 검색결과부 끝 -->
			<!-- 페이지네이션 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  <% if(p==1) { %>
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">Previous</a>
			    </li>
			  <% } else { %>
			    <li class="page-item">
			      <a class="page-link" href="./classification.jsp?p=<%=p-1 %>&auth=<%=auth %>&comp=<%=comp %>&genre=<%=genre %>" tabindex="-1">Previous</a>
			    </li>
			  <% } 
			  for(int i = 0; i <= (int)searchCount/5; i++) { 
			  	if(p==(i+1)) {%>
			  	<li class="page-item active"><a class="page-link" href="./search.jsp?p=<%=i+1 %>&auth=<%=auth %>&comp=<%=comp %>&genre=<%=genre %>"><%=i+1 %></a></li>
			  	<%} else {%>
			  	<li class="page-item"><a class="page-link" href="./search.jsp?search=p=<%=i+1 %>&auth=<%=auth %>&comp=<%=comp %>&genre=<%=genre %>"><%=i+1 %></a></li>
			  <% }} %>
			  <% if(p==((int)searchCount/5+1)) { %>
			    <li class="page-item disabled">
			      <a class="page-link" href="#">Next</a>
			    </li>
			  <% } else {%>
			    <li class="page-item">
			      <a class="page-link" href="./search.jsp?p=<%=p+1 %>&auth=<%=auth %>&comp=<%=comp %>&genre=<%=genre %>">Next</a>
			    </li>
			  <% }%>
			  </ul>
			</nav>
			<!-- 페이지네이션 끝 -->
		</div>
	</div>
	<div class="row" style="z-index: 2">
		<div id="footer" style="z-index: 3"></div>
	</div>
</body>
</html>