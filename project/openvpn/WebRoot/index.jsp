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
<meta name="keywords" content="免流云平台账户中心" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/style.css" rel='stylesheet' type='text/css' />
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
			<h1>免流云平台账户中心
			</h1>
			<p>免流云平台，版本不断持续更新中，希望越来越多的用户加入我们，通过我们云平台能享受到更多你意向不到的优惠，详情   <a style="color:#EF717A" href="index.html">点击查看</a>！</p>
		</div>
		<div class="login-form">
			<div class="login-inner">
				<h2>用户登录</h2>
				<c:if test="${error!=null}">
				<br/>
				<span >
					${error}
				</span>
			</c:if>
				<form id="login_form" action="user.html" method="post">
					<input type="text" id="username" name="username" class="text"
						value="E-mail/账户名" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'E-mail address';}">
					<input type="password" name="password" id="password"
						value="Password" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Password';}">
					<div class="submit">
						<input type="submit" onclick="myFunction()" value="登陆">
					</div>
					<div class="clear"></div>
					<div class="new">
						<p>
							<a href="http://wpa.qq.com/msgrd?v=3&uin=1099532501&site=qq&menu=yes">忘记密码?</a>
						</p>
						<p class="sign">
							注册账户：<a href="http://wpa.qq.com/msgrd?v=3&uin=1099532501&site=qq&menu=yes">点击</a>
						</p>
						<div class="clear"></div>
					</div>
				</form>
			</div>
		</div>
		<div class="copy-right">
			<p>
				Copyright &copy; <a href="http://wpa.qq.com/msgrd?v=3&uin=1099532501&site=qq&menu=yes">wstv</a>
			</p>
		</div>
	</div>
</body>
</html>