<%@page import="java.net.URLDecoder"%>
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
<%
	String name = null;
	String id = null;
	String level = null;

	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for(int i=0; i<cookies.length; i++) {
			
			if (cookies[i].getName().equals("name")) {
				name = URLDecoder.decode(cookies[i].getValue(), "UTF-8"); 
			} else if (cookies[i].getName().equals("id")) {
				id = URLDecoder.decode(cookies[i].getValue(), "UTF-8"); 
			} else if (cookies[i].getName().equals("level")) {
				level = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
			}
				
		}
	}
	if (name != null) {
		out.println("name : " + name + "<a href='delete_cookie.jsp?key=name'>삭제</a><br/>");
	} else {
		out.println("name : 쿠키값은 존재하지 않습니다.<br/>");
	}

	if (id != null) {
		out.println("id : " + id + "<a href='delete_cookie.jsp?key=id'>삭제</a><br/>");
	} else {
		out.println("id : 쿠키값은 존재하지 않습니다.<br/>");
	}
	
	if (level != null) {
		out.println("level : " + level + "<a href='delete_cookie.jsp?key=level'>삭제</a><br/>");
	} else {
		out.println("level : 쿠키값은 존재하지 않습니다.<br/>");
	}
%><br/>
<a href="cookie_form.jsp">쿠키 생성 폼</a>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>