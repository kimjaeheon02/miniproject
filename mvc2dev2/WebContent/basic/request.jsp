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
요청한 IP : <%=request.getRemoteAddr() %>
요청정보길이 : <%=request.getContentLength() %>
요청정보 인코딩 : <%=request.getCharacterEncoding() %>
요청정보 컨텐츠타입 : <%=request.getContentType() %>
요청정보 프로토콜 : <%=request.getProtocol() %>
요청정보 전송방식 : <%=request.getMethod() %>
요청 URL : <%=request.getRequestURL() %>
컨텍스트 경로 : <%=request.getContextPath() %>
컨텍스트 경로 : <%=request.getServerName() %>
</body>
</html>