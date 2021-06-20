<%@page import="sagaji.ReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String bookid = request.getParameter("bookid");
	String contents = request.getParameter("contents");
	String userid = request.getParameter("userid");

	ReportDAO dao = new ReportDAO();
	dao.sendReport(bookid, userid, contents);
	
	response.sendRedirect("./report.jsp?p=1");
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