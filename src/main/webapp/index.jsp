<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

.topNavBtn {
	display: inline-block;
	font-size: small;
	font-family: 'NotoSansKR';
	padding-left: 1em;
	padding-right: 1em;
	color: white;
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

a:link {
	color: white;
}

a:visited {
	color: white;
}

a:hover {
	color: white;
}

a:active {
	color: white;
}
</style>
</head>
<body>
	<div class="row">
		<div id="box">
			<img src="./resource/logo_box.png" style="margin: auto;">
		</div>
		<div id="nav-bar">
			<div id="nav-top">
				<div class="topNavBtn">
					<a href="./login.jsp">로그인</a>
				</div>
				<div class="topNavBtn">
					<a href="sign-up.jsp">회원가입</a>
				</div>
			</div>
		</div>
		<div class="col" style="height: 20em;">
			<div id="banner"></div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="도서명 검색"
						aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button"
						id="button-addon2">Button</button>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="right">
					<img src="./resource/book1.jpg">
					<img src="./resource/desc.png">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="footer"></div>
	</div>
</body>
</html>