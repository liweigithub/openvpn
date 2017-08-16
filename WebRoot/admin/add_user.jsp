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
<script>
	var logined = 0
$(function(){
		$("#url_token").val(window.location.href);	
		
	});
</script>
<title>管理中心</title>
</head>
<body>
	<script>
		var now_page = 1, search_value = '';
	</script>

	<div id="menu">
		<ul>
			<li class="nav_index"><a href="index.jsp"
				target="main_c"><i></i><span>首页</span><b></b>
					<div class="clear"></div></a></li>
			<li class="menu_cur"><a href="add_user.jsp" target="main_c"><i></i><span>添加用户</span><b></b>
					<div class="clear"></div></a></li>
		</ul>
	</div>
	<div id="user">
		<div class="pd10">
			${admin.username} <a class="login_submit">登录</a>
		</div>
	</div>
	<div id="header">
		<div class="wrap">
			<i class="menu_open"></i>
			<div class="logo">
				<img style="width: 80px;height: 40px;margin: auto;padding-left: 20px;padding-top: 4px;" src="<%=basePath%>/images/logo.png" />
			</div>
			<i class="search_open"></i>
		</div>
		<div class="logo_msk"></div>
	</div>
	<div id="container">
		<div id="sort">
			<table width="100%" border="0" cellspacing="0">
				<tr>
					<td class="sort_left">
						<div class="sort_cate">
							<div class="sort_b">
								<a href="#" onclick="return false;"><div
										class="sort_b_inner">
										<i class="cate_default"></i><span>全部</span>
										<div class="clear"></div>
									</div></a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="content">
				<div class="login-inner">
				${message}
					<form id="add_form" action="add_user.html" method="post">
						<input type="hidden" id="url_token" name="url_token" value="" />
						<input type="text" name="username" class="text" placeholder="用户名"/> 
						<input type="text" name="password" class="text" placeholder="密码"/>
						<input type="text" name="name" class="text" placeholder="姓名" /> 
						<input type="text" name="email" placeholder="邮箱" class="text" />
						<input type="text" name="note" placeholder="备注" class="text" />
						<input type="text" name="quota" placeholder="流量" class="text" />
						<input  type="hidden" name="con_status" value="add"/>
						<br/>
						是否可用：
						<input type="radio" name="enabled" class="radio" value="1" />启用
						<input type="radio" name="enabled" class="radio" value="0"/>禁用
						<br/>
						<br/>
						<div class="submit">
							<input type="submit" onclick="myFunction()" value="添加" />
						</div>
					</form>
				</div>
		</div>
	</div>
	<div class="push_msk"></div>

	<div id="newwrap_t" class="newwrap">
		<div class="newwrap_msk"></div>
		<iframe id="newwrap" frameborder="0" width="100%" height="100%"></iframe>
	</div>
	<div class="loading_dark"></div>
	<div id="loading_mask">
		<div class="loading_mask">
			<ul class="anm">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<script language="javascript" src="<%=basePath%>/back/js/zepto.min.js"></script>
	<script language="javascript" src="<%=basePath%>/back/js/fx.js"></script>
	<script language="javascript" src="<%=basePath%>/back/js/script.js"></script>

</body>
</html>