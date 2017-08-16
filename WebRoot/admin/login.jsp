<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>免流系统用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="免流云平台管理中心" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="<%=basePath%>css/style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript">
	function myFunction() {
		var username = document.getElementById("username");
		var password = document.getElementById("password");
		if (username == "E-mail/账户名" || password == "Password") {
			alert("请输入");
		} else {
			document.getElementById("login_form").submit();
		}
	}
</script>
</head>
<body>
	<!--main-->
	<div class="main effect2">
		<div class="login-text">
			<h1>免流云平台管理中心
			</h1>
			<p>免流云平台管理中心后台</p>
		</div>
		<div class="login-form">
			<div class="login-inner">
				<h2>
					${message}
				</h2>
				<form id="login_form" action="admin.html" method="post">
					<input type="text" id="username" name="username" class="text"
						value="${admin.username}" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'E-mail address';}">
					<input type="password" name="password" id="password"
						value="Password" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Password';}">
					<div class="submit">
						<input type="submit" onclick="myFunction()" value="登陆">
					</div>
					
					
				</form>
			</div>
		</div>
		<div class="copy-right">
			<p>
				Copyright &copy; <a href="102.201.11.123">wstv</a>
			</p>
		</div>
	</div>
</body>
</html>