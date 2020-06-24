<%@page import="donWorry.donWorryDTO"%>
<%@page import="donWorry.donWorryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name 	= request.getParameter("name");
	String password = request.getParameter("password");
	String id 		= request.getParameter("id");
	String email = request.getParameter("email");
	
	donWorryDTO donworryDTO = new donWorryDTO();
	donworryDTO.setName(name);
	donworryDTO.setPassword(password);
	donworryDTO.setId(id);
	donworryDTO.setEmail(email);
	
	donWorryDAO donworryDAO = donWorryDAO.getInstance();
	boolean result = donworryDAO.insertdonWorry(donworryDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
body {
		font-family: 'Nanum Pen Script', cursive;
		font-size:25px;
     }
</style>
</head>
<body>
<% if(result){  %>
<script>
	location.href='login.jsp';
</script>
<%}else{ %>
<script>
	alert('글쓰기 실패');
	location.href='javascript:history.back()';
</script>
<% } %>
</body>
</html>