<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h3>로그인</h3>
<form action="login_action_test.jsp" metod="post">
<input type="text" name="id" placeholder="아이디" /><br>
<input type="text" name="password" placeholder="비밀번호" /><br>

<button type="submit">입력</button>
</body>
</html>