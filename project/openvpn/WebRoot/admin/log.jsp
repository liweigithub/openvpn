<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'log.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/back/css/style.css" />
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">

</head>

<body>
	<div id="content">
		<div id="list">
			<ul>
				<c:forEach items="${userListInfo}" var="list">
					<li>
						<div class="wrap">
							<a class="alist" vhref="zhengwen.html">
								<div class="list_litpic fl">
									<img src="images/1421841277109.jpg" />
								</div>
								<div class="list_info">
									<h4>${list.user.username}</h4>
									<h5>
										by<span>${list.user.name}</span><em>(其他)</em>
									</h5>
									<div class="list_info_i">
										<dl class="list_info_views">
											<dt></dt>
											<dd>${list.bytesReceived}</dd>
											<div class="clear"></div>
										</dl>
										<dl class="list_info_comment">
											<dt></dt>
											<dd>${list.bytesSent}</dd>
											<div class="clear"></div>
										</dl>
										<dl class="list_info_like">
											<dt></dt>
											<dd>8</dd>
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
</body>
</html>
