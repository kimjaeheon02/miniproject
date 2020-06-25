<%@page import="java.util.List"%>
<%@page import="donWorry.CashBookDAO"%>
<%@page import="donWorry.InputOutputDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	InputOutputDTO inputoutputDTO = new InputOutputDTO();
	
	CashBookDAO cashbookDAO = CashBookDAO.getInstance();
	List<InputOutputDTO> io_list = cashbookDAO.getInputOutput(id);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
<script type="text/javascript">
function reply_click(no)
{
	if(confirm('정말로 삭제하시겠습니꺄?')) {
		location.href='delete.jsp?no=' + no;
	}
}
</script>
</head>
<body>
<a href="view_io.jsp"><button type="button" class="btn btn-primary">간편보기</button></a>
<a href="deposit_details.jsp"><button type="button" class="btn btn-danger">입출내역</button></a>
<a href="statistic.jsp"><button type="button" class="btn btn-success">지출분석</button></a>
<hr/>
입출내역
<form action="main/delete_action/jsp">
<table border="1">
<% for(InputOutputDTO dto :io_list){ %>
<tr>
	<td><%=dto.getRegdate() %></td>
	<td><%=dto.getIo() == 1 ? "수입" : "지출" %></td>
	<td><%=dto.getMoney() %></td>
	<td><%=dto.getCate_name() %></td>
	<td><%=dto.getMemo() %></td>
	<td><button type="button" onclick="reply_click(<%=dto.getNo()%>)">-</button></td>
</tr>

<% } %>
</table>
</form>
</body>
</html>