<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="loading">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="viewport"
	content="width=device-width, initial-scale=0.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<meta name="author" content="liwei" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/back/css/style.css" />
<link href="<%=basePath%>css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<title>用户注册</title>
</head>
<body>
	<div id="content">
		<div class="login-inner">
			${message}
			<form id="test_form" action="<%=basePath%>add_user.html" method="post">
				<input  type="hidden" name="con_status" value="test"/>
				<input type="text" name="username" class="text" placeholder="用户名" />
				<input type="text" name="password" class="text" placeholder="密码" />
				<input type="text" name="name" class="text" placeholder="姓名" /> <input
					type="text" name="email" placeholder="邮箱" class="text" />
				<div class="submit">
					<input type="submit" value="试用" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>