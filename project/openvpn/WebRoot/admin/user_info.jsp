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
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800'
	rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<script>
	var logined = 0
	
	$(function(){
		$(".url_token").val(window.location.href);	
		$("#cancel").click(function(){
			$("#reset_form").css("display","none");
		});
		
	});
	function resetPassword(){
		$("#reset_form").css("display","block");
	}
	
</script>
<title>管理中心</title>
</head>
<body>
	<script>
		var now_page = 1, search_value = '';
	</script>

	<div id="menu">
		<ul>
			<li class="nav_index menu_cur"><a href="user_list.html"
				target="main_c"><i></i><span>首页</span><b></b>
					<div class="clear"></div></a></li>
			<li class="nav_site"><a href="add_user.jsp" target="main_c"><i></i><span>添加用户</span><b></b>
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
				<a href="user_list.html" title="免流">
				<img style="width: 80px;height: 40px;margin: auto;padding-left: 20px;padding-top: 4px;" src="<%=basePath%>/images/logo.png" />
				</a>
			</div>
			<i class="search_open"></i>
		</div>
		<div class="logo_msk"></div>
	</div>
	<div id="container">
		<div id="content">
			
				<div class="login-inner">
				${message}
					<form id="add_form" action="add_user.html" method="post">
						<input type="hidden" class="url_token" name="url_token" value="" />
						<input type="text" name="username" value="${user.username}" class="text" placeholder="用户名"/> 
						<input type="text" name="name" value="${user.name}" class="text" placeholder="姓名" /> 
						<input type="text" name="email" value="${user.email}" placeholder="邮箱" class="text" />
						<input type="text" name="note" value="${user.note}" placeholder="备注" class="text" />
						<input type="text" name="quota" value="${user.quota_bytes}" placeholder="流量" class="text" />
						<input  type="hidden" name="con_status" value="update"/>
						<br/>
						
							是否可用：
						<input type="radio"  name="enabled"  class="radio" value="1" <c:if test="${user.enabled==1}"> checked="checked" </c:if> />启用 
						<input type="radio" name="enabled" class="radio" value="0" <c:if test="${user.enabled==0}"> checked="checked" </c:if> />禁用
						<br/>
						<br/>
						<div class="submit">
							<input type="submit"  value="更新" />
							<input type="button" class="button" onclick="resetPassword()" value="重置密码" />
						</div>
					</form>
					
					<form id="reset_form"  style="display:none" action="add_user.html" method="post">
						<input type="text" name="password" value="" placeholder="新密码" class="text" />						
						<input type="hidden" class="url_token" name="url_token" value="" />
						<input type="hidden" name="con_status" value="repwd" />
						<input type="hidden" name="username" value="${user.username}" />
						<br/>
						<div class="submit">
							<input type="submit"  value="重置" />
							<input type="button" id="cancel" class="button"  value="取消" />
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