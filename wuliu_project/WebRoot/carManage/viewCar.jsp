<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<title>GLOBAL物流管理系统后台管理---查看车辆详细信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />

	</head>

	<body>
		<h1> 
			${car.carno }车辆信息 
		</h1>
		<center>
			<table border="0" class="t1" width="550">
				<tr>
					<td>
						车牌号：
					</td>
					<td>
						${car.carno }
						<br>
					</td>
					<td>
						营运证号：
					</td>
					<td>
						${car.workno }
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<hr />
					</td>
				</tr>
				<tr>
					<td>
						容积
					</td>
					<td>
						${car.carsize }（立方米）
					</td>
					<td>
						车型：
					</td>
					<td>
						${car.cartype.name }
					</td>
				</tr>
				<tr>
					<td>
						吨位：
					</td>
					<td>
						${car.tonnage }（吨）
					</td>

					<td>
						车辆状态：
					</td>
					<td>
						<font color="red">${car.carstate.name}</font>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<hr />
					</td>
				</tr>
				<tr>
					<td>
						购买日期：
					</td>
					<td>
						${car.buytime }
					</td>
				</tr>
				<tr>
					<td>
						司机：
					</td>
					<td>
						<a href="<%=path %>/check/selectEmployee.do?method=listEmp&empNO=${car.employee.empno }">${car.employee.empno }</a>
					</td>
				</tr>
				<tr>
					<td>
						备注：
					</td>
					<td>
						${car.remark }
					</td>
				</tr>
					
			</table>
		</center>
	</body>
</html>
