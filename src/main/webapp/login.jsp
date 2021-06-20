<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
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

body {
	text-align: center;
	background-color: #d2d2d2;
}

#loginForm {
	display: inline-block;
	margin-top: 10em;
	width: 25em;
	padding-left: 2em;
	padding-right: 2em;
	padding-bottom: 5em;
	background-color: ;
}

#logo {
	text-align: center;
	margin-bottom: 5em;
}

.form-group > input {
	padding: 1.3em;
}

#btnLogin {
	padding-left: 5em;
	padding-right: 5em;
	padding-top: 0.4em;
	padding-bottom: 0.4em;
	background-color: #38e4c2;
	border-radius: 1em;
	border: solid 0px;
	font-weight: bold;
	font-size: 1.2em;
	margin-bottom: 2em;
}

.form-control {
	font-family: NotoSansKR;
	border-radius: 0.5em;
}

#none-id {
	text-align: center;
	color: #818181;
	font-family: NotoSansKR;
}

#sign-up {
	text-align: center;
	font-weight: bold;
	color: #3b9c89;
	font-family: NotoSansKR-Bold;
}

a {
	text-decoration: none;
}

a:link {
	color: #3b9c89;
}

a:visited {
	color: #3b9c89;
}

a:hover {
	color: #3b9c89;
}

a:active {
	color: #3b9c89;
}
</style>
</head>
<body>
	<div id="loginForm">
		<div id="logo">
			<a href="./index.jsp"><img src="./resource/logo_login.png" style="margin-top: 2em;"></a>
		</div>
		<form action="loginPro.jsp" method="post">
			<div class="form-group">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="pwd" name="pwd"
					placeholder="비밀번호">
			</div>
			<br>
			<div class="text-center">
				<button type="submit" id="btnLogin">로그인</button>
			</div>
			<hr>
			<div id="none-id">아이디가 없으신가요?</div>
			<div id="sign-up">
				<a href="sign-up.jsp">회원가입하기</a>
			</div>
		</form>
	</div>
</body>
</html>