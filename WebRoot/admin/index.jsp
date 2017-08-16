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
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link href="<%=basePath%>/back/css/jquery.circliful.css" rel="stylesheet" type="text/css" />
	<script src="<%=basePath%>/js/jquery.min.js"></script>
	<script src="<%=basePath%>/back/js/jquery.circliful.min.js"></script>
<script>
	var logined = 0
	$(function(){
		$('.myStat').circliful();
		$("#search_btn").click(function(){
			var username = $("#username").val();
			if(username==""){
				alert("请输入");
				return;
			}
			$("#search_form").submit();
		});
	});
</script>
<title>管理中心</title>
</head>
<body>
	<div id="menu">
		<div class="search_wrap">
			<form id="search_form" action="user_list.html" method="get">
				<input type="text" name="username" id="username" class="search_input"
					placeholder="关键字查找" /> 
			<input type="button" id="search_btn" value="确定" style="float:right;margin-top:-35px;height:35px;margin-right:15px;background:url(images/search_bg.jpg);border:0px;color:blue" />
			</form>
		</div>
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

			<!-- 	<a href="http://www.17sucai.com/oauth/weibo/login" id="weibo_app"><span><i></i>微博帐号登录</span></a>
				<a href="http://www.17sucai.com/oauth/qq/login" id="qq_connect"><span><i></i>QQ&nbsp;&nbsp;帐号登录</span></a>
		 -->
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
		<div id="sort">
			<table width="100%" border="0" cellspacing="0">
				<tr>
					<td class="sort_left">
						<div class="sort_cate">
							<div class="sort_b">
								<a style="color:white;margin-top:3px;" href="#" onclick="return false;"><div
										class="sort_b_inner">
										<i class="cate_default"></i><span>筛选</span>
										<div class="clear"></div>
									</div></a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="content">

			<div id="list">
				<ul>
					<c:forEach items="${userListInfo}" var="list">
						<li>
							<div class="wrap">
								<a class="alist"
									href="<%=basePath%>admin/user_info.html?username=${list.user.username}">
									<div class="list_litpic fl">
										<div class="myStat" data-dimension="100" data-text="${list.user.quota_bytes}M" data-info="" data-width="10" data-fontsize="18" data-percent="100" data-fgcolor="#61a9dc" data-bgcolor="#eee" data-fill="#ddd"></div>
									</div>
									<div class="list_info">
										<h4>${list.user.username}</h4>
										<h5>
											<c:choose>
												<c:when test="${list.user.quota_bytes-list.bytesSent<100}">
												<span style="color:red">${list.user.name}<em>(
												<c:choose>
													<c:when test="${list.user.active==1}">
													在线
													</c:when>
													<c:otherwise>
													离线
													</c:otherwise>												
													
												</c:choose>
												)</em></span>
												</c:when>
												<c:otherwise>
												<span>${list.user.name}</span><em>(
												<c:choose>
													<c:when test="${list.user.active==1}">
													在线
													</c:when>
													<c:otherwise>
													离线
													</c:otherwise>												
													
												</c:choose>
												)</em>
												</c:otherwise>
											</c:choose>
										</h5>
										<div class="list_info_i">
											<dl class="list_info_views">
												<dt></dt>
												<!-- 已经使用的 -->
												<dd>${list.bytesSent}</dd>
												<div class="clear"></div>
											</dl>
											<dl class="list_info_comment">
												<dt></dt>
												<!-- 剩余多少 -->
												<c:choose>
												<c:when test="${list.user.quota_bytes-list.bytesSent<100}">
												<dd style="color:red">${list.user.quota_bytes-list.bytesSent}</dd>
												</c:when>
												<c:otherwise>
												<dd>${list.user.quota_bytes-list.bytesSent}</dd>
												</c:otherwise>
											</c:choose>
												
												
												<div class="clear"></div>
											</dl>
											<dl class="list_info_like">
												<dt></dt>
												<!-- 总的 -->
												<dd>${list.user.quota_bytes}</dd>
												<div class="clear"></div>
											</dl>
											<div class="clear"></div>
										</div>
									</div>
									<div class="clear"></div>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="list_loading">
					<i></i><span>努力加载中...</span>
				</div>
			</div>
		</div>
		<div class="push_msk"></div>
	</div>
	<div id="sort_content">
		<div class="asort">
			<div class="hd">
				<div class="wrap">
					<div class="fl">
						<span>操作</span>
						<div class="clear"></div>
					</div>
					<div class="fr"></div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="ct">
				<div class="wrap">
					<ul class="choose_sort">
						<a href=""><li class="e" s_data="like"><i class="s"></i><span>一键提醒快过期用户</span><i
							class="e"></i></li></a>
						<a href=""><li s_data="like"><i class="s"></i><span>禁用流量超额用户</span><i
								class="e"></i></li></a>
						<a href=""><li s_data="like"><i class="s"></i><span>流量临近</span><i
								class="e"></i></li></a>
					</ul>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="newwrap_t" class="newwrap">
		<div class="newwrap_msk"></div>
		<iframe id="newwrap" frameborder="0" width="100%" height="100%"></iframe>
	</div>
	<div id="reg_index">
		<div class="reg_bar">
			<div class="wrap">
				<span class="fl"><i></i>注册帐号</span> <i class="reg_bar_close fr"></i>
				<div class="clear"></div>
			</div>
		</div>
		<div class="wrap reg_ct">
			<p>
				您可以选择以下第三方帐号直接登录uehtml<br />一分钟完成注册
			</p>
			<a href="http://www.17sucai.com/oauth/weibo/login" id="weibo_app"><span><i></i>微博帐号登录</span></a>
			<a href="http://www.17sucai.com/oauth/qq/login" id="qq_connect"><span><i></i>QQ&nbsp;&nbsp;帐号登录</span></a>
		</div>
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