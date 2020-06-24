<%@page import="donWorry.MemberDTO"%>
<%@page import="donWorry.CashBookDAO"%>
<%@page import="donWorry.InputOutputDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id 		= request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(id);
	memberDTO.setPassword(password);
	
	CashBookDAO cashBookDAO = CashBookDAO.getInstance();
	//List<donWorryDTO> list = donworryDAO.checkdonWorry();
	String result = cashBookDAO.checkdonWorry(memberDTO);
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
<%if(result!=""){ 
	session.setAttribute("id", id);	
	session.setAttribute("name", result);
%>
<script>
	location.href="main_insert.jsp";
</script>
<%}else{ %>
<script>
	alert('아이디 혹은 비밀번호가 틀립니다');
	location.href='javascript:history.back()';
</script>
<%} %>
</body>
</html>