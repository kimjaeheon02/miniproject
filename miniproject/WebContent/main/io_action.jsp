<%@page import="donWorry.donWorryDAO"%>
<%@page import="donWorry.InputOutputDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String regdate = request.getParameter("regdate");
	int category = Integer.parseInt(request.getParameter("category"));
	int io = Integer.parseInt(request.getParameter("io"));
	int money = Integer.parseInt(request.getParameter("money"));
	String memo = request.getParameter("memo");
	String id = (String) session.getAttribute("id");
	
	InputOutputDTO inputoutputDTO = new InputOutputDTO();
	inputoutputDTO.setId(id);
	inputoutputDTO.setRegdate(regdate);
	inputoutputDTO.setCategory(category);
	inputoutputDTO.setIo(io);
	inputoutputDTO.setMoney(money);
	inputoutputDTO.setMemo(memo);
	
	donWorryDAO donworryDAO = donWorryDAO.getInstance();
	boolean result = donworryDAO.insertMoney(inputoutputDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="favicon.png">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<style type="text/css">
body {
		font-family: 'Nanum Gothic Coding', monospace;
		font-size: 20px;
}
</style>
</head>
<body>
<%if(result) {%>
	regdate:<%=regdate %><br/>
	category: <%=category %><br/>
	io: <%=io %><br/>
	money: <%=money %><br/>
	memo: <%=memo %><br/>
<%}else { %>
<script>
	alert("오류")
	location.href='javascript:history.back()';
</script>
<%} %>
</body>
</html>