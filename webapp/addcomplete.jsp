<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.UUID" import="java.io.BufferedWriter" import="java.io.File" import="java.io.FileWriter"
    import="java.io.IOException" import="org.json.simple.JSONObject" %>
<%
	String name = request.getParameter("itemNameInput");
	String number = request.getParameter("itemNumberInput");
	String until = request.getParameter("itemUntilInput");
	String isUsed = request.getParameter("itemIsUsed");
	Boolean Used = false;
	if (isUsed == null) {
		Used = false;
	} else {
		Used = true;
	}
	String id = request.getParameter("itemId");
	if (id == null || id.equals("")) {
		id = UUID.randomUUID().toString();
	}
	id = id.replaceAll("(\r\n|\r|\n|\n\r)", " ");
	id = id.replaceAll("\\s", "");
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
<body class="add">
<div class="box_wrap">

<%
	JSONObject item = new JSONObject();
	item.put("id", id);
	item.put("name", name);
	item.put("number", number);
	item.put("until", until);
	item.put("isused", Used);
	String jsonstring = item.toString();
	
	try {
		File file = new File("items/"+id+".json");
		
		if (!file.getParentFile().exists())
		    file.getParentFile().mkdirs();
		if (!file.exists()) {
			file.createNewFile();
		}
		FileWriter fw = new FileWriter(file);
		BufferedWriter writer = new BufferedWriter(fw);
		writer.write(jsonstring);
		writer.close();
		out.println("<pre>"+file.getAbsolutePath()+"</pre><h1>저장을 완료하였습니다.</h1>");
		
	} catch (IOException e) {
		e.printStackTrace();
	}
	
%>
	<div class="btn_wrap">
		<button type="button" class="b_line" onclick="location.href='add.jsp';">더 추가하기</button>
		<button type="button" onclick="location.href='list.jsp';">목록 보기</button>
	</div>

</div>
</body>
</html>