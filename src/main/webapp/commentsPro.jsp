<%@page import="sagaji.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contents = request.getParameter("contents");
	String reviewid = request.getParameter("reviewid");
	out.println(contents);
	out.println(reviewid);
	out.println(session.getAttribute("id"));
	new CommentsDAO().sendComment(session.getAttribute("id").toString(), reviewid, contents);
	
	response.sendRedirect("./detail.jsp?bookid=" + request.getParameter("bookid"));
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