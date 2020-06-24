<%@page import="donWorry.MembersDTO"%>
<%@page import="donWorry.InputOutputDTO"%>
<%@page import="donWorry.donWorryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name 	= request.getParameter("name");
	String password = request.getParameter("password");
	String id 		= request.getParameter("id");
	String email 	= request.getParameter("email");
	
	MembersDTO membersDTO = new MembersDTO();
	membersDTO.setName(name);
	membersDTO.setPassword(password);
	membersDTO.setId(id);
	membersDTO.setEmail(email);
	
	donWorryDAO donworryDAO = donWorryDAO.getInstance();
	boolean result = donworryDAO.insertdonWorry(membersDTO);
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
	alert('<%=membersDTO.getName() %>님 회원가입 되었습니다.')
	location.href='../login.jsp';
</script>
<%}else{ %>
<script>
	alert('회원가입 실패');
	location.href='javascript:history.back()';
</script>
<% } %>
</body>
</html>