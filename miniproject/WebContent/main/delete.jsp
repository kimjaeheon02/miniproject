<%@page import="donWorry.CashBookDAO"%>
<%@page import="donWorry.InputOutputDTO"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
   int no = Integer.parseInt(request.getParameter("no"));
   InputOutputDTO inputoutputDTO = new InputOutputDTO();
   inputoutputDTO.setNo(no);
   inputoutputDTO.setId(id);
   
   
   CashBookDAO cashBookDAO = CashBookDAO.getInstance();
   boolean result = cashBookDAO.deleteInputOutput(inputoutputDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>게시물 삭제 액션</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
body {
      font-family: 'Nanum Pen Script', cursive;
      font-size:25px;
     }
</style>
</head>
<body>
<script type="text/javascript">
<%   if(result) { %>
   location.href='deposit_details.jsp';
<%  } else     { %>
   alert('삭제 오류');
   location.href='javascript:history.back();';
<%  }            %>
</script>
</body>
</html>