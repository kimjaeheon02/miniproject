<%@page import="donWorry.CashBookDAO"%>
<%@page import="donWorry.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SimpleDateFormat date_format = new SimpleDateFormat ("yyyy");
Date date = new Date ();
int year = Integer.parseInt(date_format.format (date));

//String id = (String)session.getAttribute("test");

MemberDTO memberDTO = new MemberDTO();
memberDTO.setId("test");

CashBookDAO cashbookDAO = CashBookDAO.getInstance();
int reg_date = cashbookDAO.CalDate(memberDTO);

Calendar c = Calendar.getInstance();
c.set(2020, 6 - 1, 1);

int week = c.get(Calendar.DAY_OF_WEEK);
int endday = c.getActualMaximum(Calendar.DATE);
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
<%out.println("가입 년도 : "+ reg_date); %>
<%out.println("현재 년도 : "+ year); %>
<select name="year">
			<%for(int i=reg_date; i<=year; i++) {%>
			<option value="year"><%=i %></option>
			<%} %>
</select>
<select name="month">
			<%for(int i=1; i<13; i++) {%>
			<option value="month"><%=i %></option>
			<%} %>
</select>
<table>
	<caption><%=2020 %>	년
			 <%=6 %> 월<br></caption>
<tr>
	<th> 일 </th>
	<th> 월 </th>
	<th> 화 </th>
	<th> 수 </th>
	<th> 목 </th>
	<th> 금 </th>
	<th> 토 </th>
</tr>
<tr align="right">
<%

for(int d=1; d < week; d++) {
	out.print("<td></td>");
}
%>

<%

for(int d=1, w = week; d <=endday; d++, w++) {%>
	<td><%=d %></td>
<%	if (w % 7 == 0) out.println("<tr><tr align='right'>");%>
<%
}
%>
</tr>
</table>
</body>
</html>