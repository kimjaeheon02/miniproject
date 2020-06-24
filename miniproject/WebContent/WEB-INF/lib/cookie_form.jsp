<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="../css/site.css">


<link rel="icon" type="image/png" sizes="16x16" href="/webdev/kitty.png">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="cookie_action.jsp">
<table border="1">
	<caption>쿠키 생성 폼</caption>
<tr>
	<th>이름</th>
	<td><input type="text" name="name" /></td>
</tr>
<tr>
	<th>아이디</th>
	<td><input type="text" name="id" /></td>
</tr>
<tr>
	<th>유저레벨</th>
	<td><select name="level">
			<option>1</option>
			<option>2</option>
			<option>3</option>
		</select></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="확인" />
	</td>
</tr>
</table>
</form>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>