<%@page import="donWorry.CategoryDTO"%>
<%@page import="donWorry.CashBookDAO"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
   int no = Integer.parseInt(request.getParameter("no"));
   CategoryDTO categoryDTO = new CategoryDTO();
   categoryDTO.setNo(no);
   categoryDTO.setId(id);
   
   
   CashBookDAO cashBookDAO = CashBookDAO.getInstance();
   boolean result = cashBookDAO.deleteCategory(categoryDTO);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>카테고리 삭제</title>
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
   location.href='view_io.jsp';
<%  } else     { %>
   alert('삭제 오류');
   location.href='javascript:history.back();';
<%  }            %>
</script>
</body>
</html>