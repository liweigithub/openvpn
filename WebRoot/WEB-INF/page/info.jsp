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
<title>流量信息查看</title>
<link href="<%=basePath%>css/webinfo.css" rel='stylesheet'
	type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<style type="text/css">
.tips {
	color: gray;
	font-size: 14px;
	float: right;
	margin-right: 4px;
}
</style>
</head>
<body>
	<script src="<%=basePath%>js/jquery.magnific-popup.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/modernizr.custom.53451.js"></script>
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
	<div class="wrap">
		<h1>当前流量使用情况</h1>
		<div class="pricing-grids">
			<div class="pricing-grid">
				<div class="price-value">
					<h2>${userInfo.user.name}</h2>
					<h5>账户名称:${userInfo.user.username}</h5>
				</div>
				<div class="price-bg">
					<p class="price-label-1">
						<span style="font-size:30px;margin-top:5px;diplay:block">${userInfo.user.quota_bytes-userInfo.user_send}</span>M
					</p>
					<ul class="buy-now">
						<li class="view"><a href="#">查看更多</a></li>
						<li class="tag-now-1"><a class="popup-with-zoom-anim"
							href="http://wpa.qq.com/msgrd?v=3&uin=1099532501&site=qq&menu=yes">购买</a></li>
						<div class="clear"></div>
					</ul>
					<ul class="count">
						<li><img src="<%=basePath%>images/1.png">${userInfo.user.createDate}<span
							class="tips">创建时间</span></li>
						<li><img src="<%=basePath%>images/2.png">${userInfo.user_send}M
						<span
							class="tips">已使用</span>
						</li>
						<li><img src="<%=basePath%>images/3.png">${userInfo.user.quota_bytes}M
						<span
							class="tips">总额</span>
						</li>
						<li><img src="<%=basePath%>images/4.png">3GB
						<span
							class="tips">最大限额</span>
						</li>
					</ul>
					<p class="bottom">您的邮箱地址：${userInfo.user.email}
						当剩余流量不足时我们会以邮件通知您！</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
