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
int t_year = Integer.parseInt(date_format.format(date));

//String id = (String)session.getAttribute("test");

MemberDTO memberDTO = new MemberDTO();
memberDTO.setId("test");

CashBookDAO cashbookDAO = CashBookDAO.getInstance();
int reg_date = cashbookDAO.CalDate(memberDTO);

Calendar c = Calendar.getInstance();
int this_year;
int this_month;
try {
	this_year = Integer.parseInt(request.getParameter("year"));
	this_month= Integer.parseInt(request.getParameter("month"));
	c.set(this_year, this_month-1, 1);
} catch(NumberFormatException e) {}

this_year = c.get(Calendar.YEAR);
this_month= c.get(Calendar.MONTH) + 1;
c.set(this_year, this_month-1, 1);

out.println(this_year + "/" + this_month);

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
<script type="text/javascript">
function change_calendar() {
	let f = document.cal_form;
	f.year.value = f.vyear.options[f.vyear.selectedIndex].value;
	f.month.value= f.vmonth.options[f.vmonth.selectedIndex].value;
	f.submit();
}

function add_month(num) {
	console.log('test')
	let f = document.cal_form;
	f.year.value = f.vyear.options[f.vyear.selectedIndex].value;
	f.month.value= parseInt(f.vmonth.options[f.vmonth.selectedIndex].value) + num;
	f.submit();
}
</script>
</head>
<body>
<%out.println("가입 년도 : "+ reg_date); %>

<form method="post" name="cal_form">
<table>
	<caption>
	<button type="button" onclick="add_month(-12)">≪</button>
	<button type="button" onclick="add_month(-1)">＜</button>
	<select id="vyear" name="vyear" onchange="change_calendar()">
			<%for(int i=this_year - 5; i<=this_year + 5; i++) { %>
			<option value="<%=i%>" <%=i == this_year ? " selected ":"" %>><%=i %></option>
			<%} %>
	</select>년
	<select id="vmonth" name="vmonth" onchange="change_calendar()">
			<%for(int i=1; i<=12; i++) {%>
			<option value="<%=i%>" <%=i == this_month? " selected ":"" %>><%=i %></option>
			<%} %>
	</select> 월
	<input type="hidden" name="year" />
	<input type="hidden" name="month" />
	
	<button type="button" onclick="add_month(1)">＞</button>
	<button type="button" onclick="add_month(12)">≫</button>
	<br></caption>
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
</form>
</body>
</html>