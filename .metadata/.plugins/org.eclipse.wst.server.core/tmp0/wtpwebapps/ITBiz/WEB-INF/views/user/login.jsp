<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<c:set var='roots' value='${pageContext.request.contextPath }/' />
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>IT Biz Scheduler</title>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/vendor/bootstrap/css/bootstrap.min.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/vendor/animate/animate.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/vendor/css-hamburgers/hamburgers.min.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/vendor/animsition/css/animsition.min.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/vendor/select2/select2.min.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/vendor/daterangepicker/daterangepicker.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/css/util.css'>
	<link rel="stylesheet" type="text/css" href='${roots}static/login/css/main.css'>
</head>
<body>	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form:form class="login100-form validate-form" action='${root }user/trylogin' method='POST' enctype="multipart/form-data" modelAttribute="tempLoginUserBean">
					<span class="login100-form-title p-b-33">
						IT Biz Scheduler
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<form:input class="input100" type="text" path="userid" placeholder="ID"/>
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<form:password class="input100" path="userpw" placeholder="Password" />
						
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
						
					</div>
					<form:errors path="userpw" style='color:red; margin-left:20px'></form:errors>
					
					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn">
							Sign in
						</button>
					</div>

					<div class="text-center p-t-45 p-b-4">
						<span class="txt1">
							Forgot
						</span>

						<a href="#" class="txt2 hov1">
							Username / Password?
						</a>
					</div>

					<div class="text-center">
						<span class="txt1">
							Create an account?
						</span>

						<a href="#" class="txt2 hov1">
							Sign up
						</a>
					</div>
				</form:form>


			</div>
		</div>
	</div>
</body>
</html>