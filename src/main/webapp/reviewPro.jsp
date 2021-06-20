<%@page import="sagaji.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contents = request.getParameter("contents");
	String bookid = request.getParameter("bookid");
	String userid = session.getAttribute("id").toString();
	
	new ReviewDAO().sendReview(contents, bookid, userid);
	
	response.sendRedirect("detail.jsp?bookid=" + bookid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>