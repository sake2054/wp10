<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.File" import="java.io.IOException" %>
<%
	String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Jongkil Kim">

<title>Add</title>
<link href="asset/style.css" rel="stylesheet">

</head>
<body class="delete">
<div class="box_wrap">
<h1>
<%
	try {
		File file = new File("items/"+id+".json");
		
		if( file.exists() ){
    		if(file.delete()){
    			out.println("파일삭제 성공");
    		} else {
    			out.println("파일삭제 실패");
    		}
    	} else {
    		out.println("파일이 존재하지 않습니다.");
    	}
	} catch (IOException e) {
		e.printStackTrace();
	}
%>
</h1>

	<div class="btn_wrap">
		<button type="button" class="orange" onclick="location.href='add.jsp';">추가하기</button>
		<button type="button" onclick="location.href='list.jsp';">목록보기</button>
	</div>

</div>
</body>
</html>