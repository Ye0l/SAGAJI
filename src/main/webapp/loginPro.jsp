<%@page import="sagaji.LoginDAO"%>
<%@page import="sagaji.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	LoginDTO dto = new LoginDTO(request.getParameter("id"), "name", request.getParameter("pwd"));
	LoginDAO dao = new LoginDAO();
	dao.insertLogin(dto);
%>
</head>
<body>

</body>
</html>