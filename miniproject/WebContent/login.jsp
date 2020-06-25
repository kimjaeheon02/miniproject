<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- Meta, title, CSS, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>돈 Worry Be Happy</title>

<!-- Bootstrap -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="resources/vendor/nprogress/nprogress.css" rel="stylesheet">
<!-- Animate.css -->
<link href="resources/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<!-- BootStrap DatePicker CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap-datepicker.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/css/custom.css" rel="stylesheet">

</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a> <a class="hiddenanchor" id="forget"></a>

		<div class="login_wrapper">
			<!-- 로그인 페이지 Start -->
			<div class="animate form login_form">
				<section class="login_content">
					<form id="login-register" action="login_action.jsp" method="post">
						<h1>
							<a href="main.do"><img src="resources/img/logo/돈.png"></a>
						</h1>
						<div>
							<input type="text" class="form-control" placeholder="아이디"
								id="User_id_forget" name="id" />
						</div>
						<div>
							<input type="password" class="form-control"
								placeholder="비밀번호" id="User_pw_forget" name="password" />
						</div>
						<div>
							<input type="button" class="rectangle-btn-login" value="Log in"
								onclick="Login();"> <a class="signup_text" href="#signup">Don’t
								have an account? <span class="sign-up-link">Sign up</span>
							</a>
						</div>

						<div class="clearfix">
							<div class="under-bar-left"></div>
							<div class="under-bar-center"></div>
							<div class="under-bar-right"></div>
						</div>

						<div class="social-form"></div>

						<div class="separator">
							<div>
							
							</div>
						</div>
					</form>
				</section>
			</div>
			<!-- 로그인 페이지 End -->


			<!-- 회원가입 페이지 Start -->
			<div id="register" class="animate form registration_form">
				<section class="login_content">
					<form id="signup-register" method="post" action="donWorry_test/regist_action.jsp" >
						<p class="Create-Account">회원가입
						<p>
						<div>
							<input type="text" class="form-control"
								placeholder="아이디" id="id" name="id" />
						</div>
						<div>
							<input type="password" class="form-control"
								placeholder="비밀번호" id="password" name="password" />
						</div>
						<div>
							<input type="password" class="form-control"
								placeholder="비밀번호 확인" id="Confirm_Password" name="Confirm_Password" />
						</div>
						<div>
							<input type="text" class="form-control" placeholder="이름"
								id="name" name="name" />
						</div>
						<div>
							<input type="email" class="form-control" placeholder="이메일"
								id="email" name="email" />
						</div>
						<div>
							<input type="button" class="btn btn-default Rectangle-Signup-Copy" 
							value="Sign up" onclick="signup_check();">
						</div>

						<div class="separator">
							<p class="change_link">
								<a class="Already-a-member-Lo" href="#signin">Already a
									member ? <span class="sign-up-link">Log in </span>
								</a>
							</p>

							<div>
								
							</div>
						</div>
					</form>
				</section>
			</div>
			<!-- 회원가입 페이지 End -->
		</div>
	</div>

	<!-- 모달 영역 -->
	<!-- 비밀번호가 같지 않을 경우 Modal -->
	<div class="modal fade" id="PasswordModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Please Check</h4>
				</div>
				<div class="modal-body">Please Check Password</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Server Error  Modal -->
	<div class="modal fade" id="ServiceEModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Server Error</h4>
				</div>
				<div class="modal-body">We are currently checking the server.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- jQuery Smart Wizard -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap-datepicker.min.js"></script>

<!-- Ajax -->
<script>
	function Login() {
		$.ajax({
			url : "login_action.jsp",
			type : "POST",
			data : $("#login-register").serialize(),
			success : function(data) {
				if (data.trim() == "false") {
					$('#PasswordModal').modal();
				} else {
					window.location.href = "main/main.jsp";
				}
			},
			error : function() {
				$('#PolicyModal').modal();
			}
		});
	}

	function findpw_bt() {
		$.ajax({
			url : "mailSending.do",
			type : "POST",
			data : $("#forget-register").serialize(),
			success : function(data) {
				if (data == "false") {
					$('#ServiceEModal').modal();
				} else if (data == "-1") {
					$('#ForgetFModal').modal();
				} else {
					$('#ForgetModal').modal();
				}
			},
			error : function() {
				$('#ServiceEModal').modal();
			}
		});
	}

	function LocationLogin() {
		window.location.href = "login.do";
	}
</script>

<!-- 로그인 시 비밀번호 값 확인 예외처리 -->
<script>
function signup_check(){
    var password_1 = document.getElementById("password").value;
    var password_2 = document.getElementById("Confirm_Password").value;
	
    if(password_1 == password_2){
    	document.getElementById("signup-register").submit();
    }else{
    	$('#PasswordModal').modal();
    }
}
</script>

</html>