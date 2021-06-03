<%@page import="sagaji.LoginDAO"%>
<%@page import="sagaji.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LoginDTO dto = new LoginDTO(request.getParameter("id"), request.getParameter("name"), request.getParameter("pwd"));
	LoginDAO dao = new LoginDAO();
	dao.insertUser(dto);

	response.sendRedirect("index.jsp");
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