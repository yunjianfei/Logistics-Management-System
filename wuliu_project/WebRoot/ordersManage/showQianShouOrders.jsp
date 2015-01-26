<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		<title>GLOBAL物流管理系统后台管理---签收的订单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />

	</head>

	<body>
	<c:if test="${UserSession.power.powerid==3}">
		<table border="1" class="t1">
			<tr>
				<td>
					订单编号
				</td>
				<td>
					收件地
				</td>
				<td>
					寄件地
				</td>
				<td>
					收件人姓名
				</td>
				<td>
					寄件人姓名
				</td>
				<td>
					配送点
				</td>
				<td>
					订单状态
				</td>
				<td>
					创建时间
				</td>
			</tr>

			<c:forEach var="list" items="${OrderList}">
				<tr>
					<td>
						<a
							href="<%=path%>/check/order.do?methodName=queryOrderByOrderID&id=${list.orderid }&orderno=${list.orderno}">${list.orderno
							}</a>
					</td>
					<td>
						${list.receiveaddress }
					</td>
					<td>
						${list.sendaddress }
					</td>
					<td>
						${list.receivename }
					</td>
					<td>
						${list.sendname }
					</td>
					<td>
						${list.deliveryspot.name }
					</td>
					<td>

						${list.orderstate.name}
					</td>
					<td>
						${list.createtime }
					</td>
				</tr>
			</c:forEach>
			
			</c:if>
	 	<c:if test="${UserSession.power.powerid!=3}">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<h1>
				您无权访问此页面！！！
			</h1>
		</c:if>
	</body>
</html>
