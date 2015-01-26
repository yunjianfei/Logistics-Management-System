<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---交接单</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
	</head>
	<body>
	<c:if test="${UserSession.power.powerid==3}">
		<center>
			<h1>
				交接单信息
			</h1>
			<form name="f1" id="f1" action="" method="post">
				<table border="1" class="t1">
					<tr>
						<td>
							交接单号
						</td>
						<td>
								<a href="<%=path%>/check/order.do?methodName=getReceiptDetaile&ReceiptID=${Receipt.receiptid}&receiptno=${Receipt.receiptno}">${Receipt.receiptno}</a>
						</td>


						<td>
							车辆编号
						</td>
						<td>
							${Receipt.carno }
						</td>

					</tr>
					<tr>
						<td>
							发货时间
						</td>
						<td>
							${Receipt.createtime }
						</td>

						<td>
							交接配送点
						</td>
						<td>
							${Receipt.deliveryspot.name }
						</td>
					</tr>
					<tr>
						<td>
							接受人姓名
						</td>
						<td colspan="3">
							${Receipt.employee.name }
						</td>
						

					</tr>
					<tr>
						<td>
							备注
						</td>
						<td colspan="3" align="center">
							${Receipt.remark }
						</td>
					</tr>
					
				</table>
			</form>
		</center>
		
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