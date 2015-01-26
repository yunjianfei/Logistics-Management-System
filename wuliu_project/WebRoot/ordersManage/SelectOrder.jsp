<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>

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

		<title>GLOBAL物流管理系统后台管理---订单信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
	</head>

	<body>
<c:if test="${UserSession.power.powerid==3}">
		<form name="f1" id="f1" action="" method="post">
			<center>
				<h1>
					订单信息
				</h1>
				订单号：${orderno }
				<table border="1" class="t1">

					<tr>
						<td colspan="2" align="center">
							收件人详细信息
						</td>
						<td colspan="2" align="center">
							寄件人详细信息
						</td>
					</tr>
					<tr>
						<td>
							姓名
						</td>
						<td>
							<bean:write name="order" property="receivename" />
						</td>
						<td>
							姓名
						</td>
						<td>
							<bean:write name="order" property="sendname" />
						</td>
					</tr>
					<tr>
						<td>
							地址
						</td>
						<td>
							<bean:write name="order" property="receiveaddress" />
						</td>
						<td>
							地址
						</td>
						<td>
							<bean:write name="order" property="sendaddress" />
						</td>
					</tr>
					<tr>
						<td>
							固定电话
						</td>
						<td>
							<bean:write name="order" property="receivetel" />
						</td>
						<td>
							固定电话
						</td>
						<td>
							<bean:write name="order" property="sendtel" />
						</td>
					</tr>
					<tr>
						<td>
							电话
						</td>
						<td>
							<bean:write name="order" property="receivemobile" />
						</td>
						<td>
							电话
						</td>
						<td>
							<bean:write name="order" property="sendmobile" />
						</td>
					</tr>
					<tr>
						<td>
							邮编
						</td>
						<td>
							<bean:write name="order" property="receivepostcode" />
						</td>
						<td>
							邮编
						</td>
						<td>
							<bean:write name="order" property="sendpostcode" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							货物信息
						</td>
						<td colspan="2" align="center">
							支付信息
						</td>
					</tr>
					<tr>
						<td>
							重量（kg）
						</td>
						<td>
							<bean:write name="order" property="weight" />
						</td>
						<td>
							物品估价（￥元）
						</td>
						<td>
							<bean:write name="order" property="goodsprice" />
						</td>
					</tr>
					<tr>
						<td>
							体积（m3）
						</td>
						<td>
							<bean:write name="order" property="volume" />
						</td>
						<td>
							保价费用（￥元）
						</td>
						<td>
							<bean:write name="order" property="insureprice" />
						</td>
					</tr>
					<tr>
						<td>
							订单创建时间
						</td>
						<td>
							<bean:write name="order" property="createtime" />
						</td>
						<td>
							总费用（￥元）
						</td>
						<td>
							<bean:write name="order" property="totalprice" />
						</td>
					</tr>
					<tr>
						<td>
							备注（注明货物明细）

						</td>
						<td colspan="3">
							<bean:write name="order" property="remark" />
						</td>
					</tr>
					<tfoot>
						<font color="red">订单状态：${order.orderstate.name }</font>
					</tfoot>
				</table>
			</center>
		</form>
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
