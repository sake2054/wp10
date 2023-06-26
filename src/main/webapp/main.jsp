<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.security.MessageDigest" import="java.io.UnsupportedEncodingException"
    import="java.security.NoSuchAlgorithmException" %>
<%
	String id = request.getParameter("idInput");
	String pw = request.getParameter("pwInput");
	String hash = "";
	if (id == null || pw == null ) {
		id = "";
		pw = "";
	}
	try {
		MessageDigest mdSHA256 = MessageDigest.getInstance("SHA-256");
		mdSHA256.update(pw.getBytes("UTF-8"));
		byte[] sha256Hash = mdSHA256.digest();
		StringBuffer hexSHA256hash = new StringBuffer();
		for(byte b : sha256Hash) {
			String hexString = String.format("%02x", b);
			hexSHA256hash.append(hexString);
		}
		hash = hexSHA256hash.toString();
	} catch (NoSuchAlgorithmException e) {
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	
	if (id.equals("sake") && hash.equals("0404a5f21dbaaa4d18d8710f78430c307263f1216b6bf98aaf9534c66d083669")) {
		session.setAttribute("login", "sake");
	}
	Object sessionTemp = session.getAttribute("login");
	Boolean isLogin = false;
	if (sessionTemp == null) {
		isLogin = false;
	} else if (sessionTemp.toString() == "sake") {
		isLogin = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Jongkil Kim">

<title>Welcome</title>
<link href="asset/style.css" rel="stylesheet">

</head>
<body class="main">

<div class="box_wrap">
<% 

if (isLogin == true) { %> 
	<h1>로그인에 성공하였습니다.</h1>
	<div class="btn_wrap">
		<button type="button" class="orange" onclick="location.href='add.jsp';">추가하기</button>
		<button type="button" onclick="location.href='list.jsp';">목록보기</button>
		<button type="button" class="red" onclick="location.href='logout.jsp';">로그아웃</button>
	</div>

<% } else { %>
	<h1>로그인에 실패하였습니다. ID와 비밀번호를 확인해 주세요.</h1>
	<div class="btn_wrap">
		<button type="button" class="red" onclick="location.href='default.jsp';">뒤로가기</button>
	</div>

<% } %>

</div>
</body>
</html>