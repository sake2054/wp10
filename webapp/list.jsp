<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.UUID" import="java.nio.file.Files" import="java.io.File" import="java.nio.file.Paths"
    import="java.io.IOException" import="org.json.simple.JSONObject" import="org.json.simple.parser.JSONParser"
    import="org.json.simple.parser.ParseException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Jongkil Kim">

<title>List</title>
<link href="asset/style.css" rel="stylesheet">

</head>
<body class="list">
<div class="box_wrap">

	<table class="mb30">
	<thead>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Number</th>
			<th>Until</th>
			<th>isUsed</th>
		</tr>
	</thead>
	<tbody>
<%
	File dir = new File("items/");
	String[] filenames = dir.list();
	for (String filename : filenames) {
		String str = Files.readString(Paths.get("items/"+filename));
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(str);
		out.println("<tr>");
		out.println("<td><a href=\"add.jsp?id="+jsonObject.get("id")+"\">"+jsonObject.get("id").toString().substring(0, 8)+"</a></td>");
		out.println("<td>"+jsonObject.get("name")+"</td>");
		out.println("<td>"+jsonObject.get("number")+"</td>");
		out.println("<td>"+jsonObject.get("until")+"</td>");
		if (Boolean.valueOf(jsonObject.get("isused").toString()) == false) {
			out.println("<td><input type=\"checkbox\" disabled></td>");
		} else {
			out.println("<td><input type=\"checkbox\" checked disabled></td>");
		}
		
		out.println("</tr>");
	}
	%>
	</tbody>
	</table>
	<div class="btn_wrap">
		<button type="button" onclick="location.href='add.jsp';">추가하기</button>
		<button type="button" class="red" onclick="location.href='logout.jsp';">로그아웃</button>
	</div>
</div>

</body>
</html>