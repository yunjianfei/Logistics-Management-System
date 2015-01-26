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

		<title>GLOBAL物流管理系统后台管理---显示用户的详细信息及它的员工身份的信息</title>

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
		<center>
			<table border="0" class="t1" width="550">
				<tr>
					<td>
						员工编号：
					</td>
					<td>
						${UserList.employee.empno}
					</td>
					<td>
						配送点：
					</td>
					<td>
						${UserList.deliveryspot.name }
					</td>

				</tr>
				<tr>
					<td>
						用户名：
					</td>
					<td>
						${UserList.username }
					</td>
					<td>
						权限：
					</td>
					<td>
						<font color="red">${UserList.power.name }</font>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<hr />
					</td>
				</tr>
				<tr>
					<td>
						姓名：
					</td>
					<td>
						${EmployeeList.name }
					</td>
					<td>
						性别：
					</td>
					<td>
						<c:if test="${EmployeeList.gender == '1'}">
						  男
						</c:if>
						<c:if test="${EmployeeList.gender == '0'}">
						  女
				</c:if>
					</td>
				</tr>
				<tr>
					<td>
						所属配送点：
					</td>
					<td>
						${EmployeeList.deliveryspot.name }
					</td>
					<td>
						职位 ：
					</td>
					<td>
						${EmployeeList.position.name }
					</td>
				</tr>
				<tr>
					<td>
						入职日期：
					</td>
					<td>
						${EmployeeList.startwordtime }
					</td>
					<td>
						薪水：
					</td>
					<td>
						${EmployeeList.salary }
					</td>
				</tr>
				<tr>
					<td>
						出生日期：
					</td>
					<td>
						${EmployeeList.birthday }
					</td>
					<td>
						身份证号：
					</td>
					<td>
						${EmployeeList.cardid }
					</td>
				</tr>
				<tr>
					<td>
						地址：
					</td>
					<td>
						${EmployeeList.address }
					</td>
					<td>
						电话号码：
					</td>
					<td>
						${EmployeeList.tel }
					</td>
				</tr>
				<tr>
					<td>
						电子邮箱：
					</td>
					<td>
						${EmployeeList.email }
					</td>
				</tr>

			</table>
		</center>
	</body>
</html>
