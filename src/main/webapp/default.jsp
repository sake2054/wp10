<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object sessionTemp = session.getAttribute("login");
	Boolean isLogin = false;
	if (sessionTemp == null) {
		isLogin = false;
	} else if (sessionTemp.toString() == "sake") {
		isLogin = true;
	}
	if (isLogin) {
		response.sendRedirect("main.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Jongkil Kim">

<title>Login</title>

<script type="text/javascript">

function idStore() {
	if (document.getElementById("isIdStore").checked) {
		localStorage.setItem("storedId", document.getElementById("idInput").value);
	} else {
		localStorage.removeItem("storedId");
	}
}
function idLoad() {
	if (localStorage.getItem("storedId") == null) {
		document.getElementById("isIdStore").checked = false;
	} else {
		document.getElementById("idInput").value = localStorage.getItem("storedId");
		document.getElementById("isIdStore").checked = true;
	}
	
}

window.onload = function() {
	idLoad();
}

</script>
<link href="asset/style.css" rel="stylesheet">
</head>

<body class="login">
<div class="box_wrap">
	<form action="main.jsp" method="post" name="loginForm">
		<h1>Please sign in</h1>
		<ul>
			<li>
				<label for="idInput">ID</label>
				<input type="text" name="idInput" id="idInput" required >
			</li>
			<li>
				<label for="pwInput">비밀번호</label>
				<input type="password" name="pwInput" id="pwInput" required >
			</li>
			<li>
				<label for="isIdStore">ID 저장하기</label>
				<input type="checkbox" name="isIdStore" id="isIdStore">
			</li>
		</ul>
		<div class="btn_wrap">
			<button type="submit" class="orange" onclick="idStore()">전송</button>
		</div>
	</form>
	<p>
	로그인 기능 구현 예제입니다.<br>
	로그인 가능한 ID는 <code>sake</code>, 비밀번호는 <code>sakeisbest</code>입니다.
	</p>
</div>

</body>
</html>