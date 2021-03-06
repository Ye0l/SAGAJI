<%@page import="sagaji.CommentsDAO"%>
<%@page import="sagaji.CommentsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sagaji.ReviewDAO"%>
<%@page import="sagaji.ReviewDTO"%>
<%@page import="sagaji.BookDTO"%>
<%@page import="sagaji.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bookid = request.getParameter("bookid");
	BookDAO dao = new BookDAO();
	BookDTO dto = dao.getBook(bookid); 
	ArrayList<ReviewDTO> rDtos = new ArrayList<ReviewDTO>();
	ReviewDAO reviewDAO = new ReviewDAO();

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
	<div class="container" style="font-family: 'NotoSansKR'">
		<div class="row">
			<div class="col-12" style="text-align: center;">
				<h1 style="font-weight: bold;"><%=dto.getBookname() %></h1><br>
				<h4 style="font-weight: bold;"><%=dto.getAuthor() %> 지음</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-12" style="text-align: center;">
				<img src="./books/<%=dto.getBookid()%>.png" style="border: solid 1px black;">
			</div>
		</div>
		<div class="row">
			<div class="col-8" style="margin: 0px auto">
				<div><%=dto.getStory() %></div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<h5>Reviews</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<ul class="list-group">
					<% rDtos = reviewDAO.getReviewList(bookid);
					for(ReviewDTO item : rDtos) { %>
					<div class="list-group">
					  <a class="list-group-item list-group-item-action">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1"><%=item.getUserid() %></h5>
					      <small class="text-muted">SCORE: <%=item.getRating() %>.0/5</small>
					    </div>
					    <p class="mb-1"><%=item.getContents() %></p><hr>
					    <%if(Integer.parseInt(item.getComments()) > 0) { %>
						    	<% ArrayList<CommentsDTO> cDtos = new CommentsDAO().getComments(item.getReviewid()); 
						    	for(CommentsDTO comment : cDtos) {%>
								    <span class="badge rounded-pill bg-light text-dark"><%=comment.getUserid() %></span>
								    <span class="badge rounded-pill bg-light text-dark"><%=comment.getWritetime() %></span><br>
						    	<h6 style="font-size: 14px; margin-left: 1em">
								    <%=comment.getContents() %>
							    </h6>
						    	<% } %>
					    <% } %>
					    <hr>
					    <div class="col-12">
					    <div class="input-group">
							<% if(session.getAttribute("id") != null) { %>
					    	<form action="./commentsPro.jsp" method="post" style="width: 100%">
					    		<div class="input-group mb-12">
									  <input type="text" class="form-control" placeholder="WRITE COMMENTS" aria-describedby="button-addon2" name="contents">
									  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">SEND</button>
									  <input type="hidden" name="reviewid" value="<%=item.getReviewid()%>">
									  <input type="hidden" name="bookid" value="<%=bookid %>">
									</div>
					    	</form>
					    <% } %>
				    	</div>
				    	</div>
					  </a>
					</div>
				  <% } %>
				  <div class="list-group">
							<% if(session.getAttribute("id") == null) { %>
					  <a class="list-group-item list-group-item-action" href="./login.jsp">
							<div class="col-auto" style="text-align: center;">
								로그인 후 리뷰 작성이 가능합니다.
							</div>
							<% } else { %>
					  <a class="list-group-item list-group-item-action" href="./writeReview.jsp?bookid=<%=bookid %>">
					  	<div class="d-grid gap-2">
					  	<button class="btn btn-outline-primary" type="button">WRITE NEW REVIEW</button>
					  	</div>
					  	<% } %>
					  </a>
				  </div>
				</ul>
			</div>
		</div>
	</div>
	<div class="row" style="z-index: 2">
		<div id="footer" style="z-index: 3"></div>
	</div>
</body>
</html>