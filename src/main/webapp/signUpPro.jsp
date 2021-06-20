<%@page import="sagaji.LoginDAO"%>
<%@page import="sagaji.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	LoginDTO dto = new LoginDTO(request.getParameter("id"), request.getParameter("name"), request.getParameter("pwd"));
	LoginDAO dao = new LoginDAO();
	dao.insertUser(dto);
	
	out.println("<script>alert('회원가입이 완료되었습니다.')</script>");
	out.println("<script>location.href='./index.jsp'</script>");
	// response.sendRedirect("index.jsp");
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