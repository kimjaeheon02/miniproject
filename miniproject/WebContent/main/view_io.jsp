<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="favicon.png">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<style type="text/css">
body {
		font-family: 'Nanum Gothic Coding', monospace;
		font-size: 20px;]
}
</style>
</head>
<body>
<a href="view_io.jsp"><strong>[간편보기]</strong></a>
<a href="deposit_details.jsp"><strong>[입출내역]</strong></a>
<a href="statistic.jsp"><strong>[지출분석]</strong></a>
<hr/>
간편보기 <br/>
<table>
<tr>
	<th>날짜</th>
	<td><input type="date" name="regdate" /></td>
</tr>
<tr>
	<th>카테고리</th>
	<td><select name="category">
			<option value="1">교통비</option>
			<option value="2">식비</option>
		</select></td>
</tr>
<tr>
	<th>수입/지출</th>
	<td><select name="io">
			<option value="1">수입</option>
			<option value="2">지출</option>
		</select></td>
</tr>
<tr>
	<th>금액</th>
	<td><input type="number" name="money" /></td>
</tr>
<tr>
	<th>내역</th>
	<td><input type="text" name="comment" /></td>
</tr>

</table>
</body>
</html>