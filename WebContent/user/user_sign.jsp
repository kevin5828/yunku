<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://www.baocloud.com/javaee/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户中心-每日签到</title>
<link type="text/css" href="${applicationScope.basePath }css/yunku.css"
	rel="stylesheet" />
<link type="text/css" href="${applicationScope.basePath }css/user.css"
	rel="stylesheet" />
</head>
<body>
	<div class="base">
		<div class="head">
			<div class="logo"></div>
			<div>
				<span class="span_index"><a
					href="${applicationScope.basePath }">云酷首页</a></span>
				<c:choose>
					<c:when test="${ not empty sessionScope.user }">
						<span class="span_sys">欢迎回来!${sessionScope.user.nickname }&nbsp;&nbsp;<a
							href="${applicationScope.basePath }user/exit">退出系统</a></span>
					</c:when>
					<c:otherwise>
						<span class="span_sys">未登录</span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div style="height: 25px;"></div>
		<div>
			<div class="user_logo">
				<span class="user_center">用户中心 </span>
			</div>
			<div>
				<ul class="user_navi" id="user_navi">
					<li class="tag"
						data-url="${applicationScope.basePath }user/user_base_info.jsp">基本信息</li>
					<li class="tag_select" data-url="#">每日签到</li>
					<li class="tag"
						data-url="${applicationScope.basePath }user/query_inte">我的积分</li>
					<li class="tag"
						data-url="${applicationScope.basePath }user/user_set_name.jsp">云酷帐号</li>
					<li class="tag"
						data-url="${applicationScope.basePath }user/user_update_pwd.jsp">修改密码</li>
					<li class="tag"
						data-url="${applicationScope.basePath }user/user_update_head.jsp">修改头像</li>
					<li class="tag" data-url="${applicationScope.basePath }user/user_set_mobile.jsp">绑定手机</li>
					<li class="tag" data-url="${applicationScope.basePath }user/user_videos.jsp">我的视频</li>
					<li class="tag" data-url="#">视频收藏</li>
					<li class="tag" data-url="#">观看记录</li>
					<li class="tag" data-url="#">我的评论</li>
				</ul>
			</div>
		</div>
		<div class="middle">
			<c:choose>
				<c:when test="${ empty requestScope.state}">
      获取用户签到信息失败
     </c:when>
				<c:when test="${requestScope.state>0 }">
     今日已签到,你已连续签到<span style="color: #FF0000">${requestScope.state }</span>天
     </c:when>
				<c:otherwise>
					<form action="${applicationScope.basePath }user/day_sign" method="post">
						<input type="submit" value="每日签到" class="qian" />
					</form>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="bottom">
			Copyright<span class="copy">&copy;</span>2016 baocloud
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			var user_navi_ul = document.getElementById("user_navi");
			var user_navi_lis = user_navi_ul.getElementsByTagName("LI");
			var len = user_navi_lis.length;
			for (var index = 0; index < len; index++) {
				var user_navi_li = user_navi_lis[index];
				var url = user_navi_li.dataset.url;
				if ("#" != url) {
					user_navi_li.onclick = function() {
						window.location.href = this.dataset.url;
					};
				}

			}
		}
	</script>
</body>
</body>
</html>