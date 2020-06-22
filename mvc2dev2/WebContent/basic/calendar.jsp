<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>Insert title here</title>
</head>
<body>
<%
int year = 2020;
int month = 6;
Calendar c = Calendar.getInstance();
c.set(year, month - 1, 1);

int week = c.get(Calendar.DAY_OF_WEEK);
int endday = c.getActualMaximum(Calendar.DATE);
%>
<table>
	<caption><%=year + "년" + month + "월 달력" %></caption>
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