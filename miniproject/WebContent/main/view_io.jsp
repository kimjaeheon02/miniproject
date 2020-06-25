<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="donWorry.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="donWorry.CashBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	CashBookDAO cashBookDAO = CashBookDAO.getInstance();
	List<CategoryDTO> cate_list = cashBookDAO.getCateList(id);
	
%>
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
<script type="text/javascript">
function add_category() {
	console.log('add_category');
	document.getElementById('insert_category').style.display = 'block';
}

function cancel_category() {
	console.log('cancel_category');
	document.getElementById('insert_category').style.display = 'none';
}

function go_logout() {
	if(confirm('정말로 로그아웃 하시겠습니까')) {
		location.href='../logout.jsp';
		
	}
}

function enter_category(){
	
	$.ajax({
		url : "enter_category.jsp",
		type : "POST",
		data : $("#go_category").serialize(),
		success : function(data) {
			if (data.trim() == "false") {
				alert("false");
			} else {
				alert("good");
			}
		},
		error : function() {
			alert("error");
		}
	});
}
</script>
</head>
<body>
<a href="view_io.jsp"><button type="button" class="btn btn-primary">간편보기</button></a>
<a href="deposit_details.jsp?id=<%=id %>"><button type="button" class="btn btn-danger">입출내역</button></a>
<a href="statistic.jsp"><button type="button" class="btn btn-success">지출분석</button></a>
<hr/>
<%=name %>
(<%=id %>) 
<button type="button" onclick="go_logout()">Logout</button>
<br/>
<form action="io_action.jsp" id="submit" method="post">
<table>
<tr>
	<th>날짜</th>
	<td><input type="date" name="regdate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"/></td>
</tr>
<tr>
	<th>카테고리</th>
	<td><select name="category">
		<% for(CategoryDTO categoryDTO : cate_list) {%>
			<option value="<%=categoryDTO.getNo()%>"><%=categoryDTO.getCate_name()%></option>
		<% } %>
		</select>
		<button type="button" id="btnAdd" onclick="del_category()">삭제</button>
		<button type="button" id="btnAdd" onclick="add_category()">추가</button>
		<div id="insert_category" style="display: none;">

			<input type="text" name="cate_name" />
			<button type="button" id="go_category" onclick="enter_category();">확인</button>
			<button type="button" onclick="cancel_category();">취소</button>

		</div>
	</td>
</tr>
<tr>
	<th>금액</th>
	<td><select name="io">
			<option value="1">수입</option>
			<option value="2">지출</option>
		</select>
		<input type="number" name="money" required="required"/></td>
</tr>
<tr>
	<th>내역</th>
	<td><input type="text" name="memo" /></td>
</tr>

</table>
<button type="submit" id="submit">입력</button>
</form>
</body>
</html>