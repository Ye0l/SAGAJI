<%@page import="sagaji.LoginDAO"%>
<%@page import="sagaji.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	LoginDTO dto = new LoginDTO(request.getParameter("id"), "name", request.getParameter("pwd"));
	LoginDAO dao = new LoginDAO();
	if(dao.login(dto)) {
		out.print("로그인 성공");
		dto = dao.getUserProfile(dto);
		session.setAttribute("id", dto.getId());
		session.setAttribute("name", dto.getName());
		response.sendRedirect("index.jsp");
	}
	else {
		out.println("<script>alert('아이디나 비밀번호를 확인해주세요.')</script>");
		out.println("<script>location.href='./login.jsp'</script>");
	}
%>
</head>
<body>

</body>
</html>