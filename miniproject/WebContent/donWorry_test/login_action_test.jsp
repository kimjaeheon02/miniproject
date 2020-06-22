<%@page import="donWorry.donWorryDAO"%>
<%@page import="donWorry.donWorryDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id 		= request.getParameter("id");
	String password = request.getParameter("password");
	
	donWorryDTO donworryDTO = new donWorryDTO();
	donworryDTO.setId(id);
	donworryDTO.setPassword(password);
	
	donWorryDAO donworryDAO = donWorryDAO.getInstance();
	//List<donWorryDTO> list = donworryDAO.checkdonWorry();
	String result = donworryDAO.checkdonWorry(donworryDTO);
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
<%if(result!=""){ %>
이름 : <%=result %>
<%}else{ %>
	오류
<%} %>
</body>
</html>