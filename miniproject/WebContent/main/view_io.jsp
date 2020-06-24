<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DonWorry</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="favicon.png">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
</style>
</head>
<body>
<a href="view_io.jsp"><button type="button" class="btn btn-primary">간편보기</button></a>
<a href="deposit_details.jsp"><button type="button" class="btn btn-danger">입출내역</button></a>
<a href="statistic.jsp"><button type="button" class="btn btn-success">지출분석</button></a>
<hr/>
<form action="io_action.jsp" method="post">
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
	<th>금액</th>
	<td><select name="io">
			<option value="1">수입</option>
			<option value="2">지출</option>
		</select>
		<input type="number" name="money" /></td>
</tr>
<tr>
	<th>내역</th>
	<td><input type="text" name="memo" /></td>
</tr>

</table>
<button type="submit" >입력</button>
</form>
</body>
</html>