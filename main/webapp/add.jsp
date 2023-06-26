<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.UUID" import="java.nio.file.Files" import="java.io.File" import="java.nio.file.Paths"
    import="java.io.IOException" import="org.json.simple.JSONObject" import="org.json.simple.parser.JSONParser"
    import="org.json.simple.parser.ParseException"%>
<%
	String id = request.getParameter("id");
	String name = "";
	String number = "";
	String until = "";
	Boolean isused = false;
	if (id != null) {
		String str = Files.readString(Paths.get("items/"+id+".json"));
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(str);
		name = jsonObject.get("name").toString();
		number = jsonObject.get("number").toString();
		until = jsonObject.get("until").toString();
		isused = Boolean.valueOf(jsonObject.get("isused").toString());
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Jongkil Kim">

<title>Add</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="asset/jquery-barcode.js"></script>
<script type="text/javascript">
function bargen() {
	$("#barcode").barcode(document.getElementById("itemNumberInput").value, "code128",{barWidth:2, barHeight:70, fontSize: 20});
}

</script>
<link href="asset/style.css" rel="stylesheet">

</head>
<body onload="bargen()" class="add">

<div class="box_wrap">

<form action="addcomplete.jsp" method="post" name="addForm">
		<h1>Add / Modify Item</h1>
		<ul>
			<li>
				<label for="itemNameInput">쿠폰이름</label>
				<input type="text" name="itemNameInput" id="itemNameInput" value="<%=name %>" required >
			</li>
			<li>
				<label for="itemNumberInput">쿠폰번호</label>
				<input type="text" name="itemNumberInput" id="itemNumberInput" oninput="bargen()" value="<%=number %>" required>
			</li>
			<li>
				<label for="itemUntilInput">유효기간</label>
				<input type="date" name="itemUntilInput" id="itemUntilInput" value="<%=until %>" min="1900-01-01" max="2999-12-31" required>
			</li>
			<li>
				<label for="itemIsUsed">사용 완료하기</label>
				<input type="checkbox" name="itemIsUsed" id="itemIsUsed" <%if(isused) {out.println("checked");}%>>
			</li>
		</ul>
		<div class="btn_wrap">
			<button type="submit" class="orange">전송</button>
			<button type="button" class="black" onclick="location.href='list.jsp';">목록보기</button>
			<button type="button" class="red" onclick="location.href='delete.jsp?id=<%=id %>';">삭제</button>
		</div>
		<input type="hidden" name="itemId" id="itemId" value="<%if(id != null) {out.println(id);}%>">
	</form>

<br />

<div id="barcode"></div>

</div>


</body>
</html>