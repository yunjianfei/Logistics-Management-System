<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---员工详细信息</title>
		<base href="<%=basePath%>">

		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />

	</head>

	<body>
	<center>
		<table class="t1" width="550" border="0">
			<tr>
				<td>
					员工编号：
				</td>
				<td>
					${employeeList.empno }
				</td>
				<td>
					所属配送点：
				</td>
				<td>
					${employeeList.deliveryspot.name }
				</td>
			</tr>
			<tr>
				<td>
					姓名：
				</td>
				<td>
					${employeeList.name }
				</td>
				<td>
					性别：
				</td>
				<td>
					<c:if test="${employeeList.gender == '1' }">
						男
						</c:if>
					<c:if test="${employeeList.gender == '0' }">
						女
						</c:if>
				</td>
			</tr>
			<tr>
			<td colspan="4"><hr/></td>
			</tr>
			<tr>
				<td>
					职位：
				</td>
				<td>
					<font color="red">${employeeList.position.name }</font>
				</td>
				<td>
					薪水：
				</td>
				<td>
					${employeeList.salary }
				</td>
			</tr>
			<tr>
				<td>
					入职日期：
				</td>
				<td>
					${employeeList.startwordtime }
				</td>
				<td>
					出生日期：
				</td>
				<td>
					${employeeList.birthday }
				</td>
			</tr>
			<tr>
				<td>
					身份证号：
				</td>
				<td>
					${employeeList.cardid }
				</td>
				<td>
					电话号码：
				</td>
				<td>
					${employeeList.tel }
				</td>
			</tr>
			<tr>
				<td>
					地址：
				</td>
				<td>
					${employeeList.address }
				</td>
				<td>
					电子邮箱：
				</td>
				<td>
					${employeeList.email }
				</td>
			</tr>
			</table>
		</center>
	</body>
</html>
