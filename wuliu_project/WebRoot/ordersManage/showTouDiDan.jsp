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
		<title>GLOBAL物流管理系统后台管理---投递单</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
	</head>
	<body>
		<center>
			<h1>
				投递单信息
			</h1>
			<form name="f1" id="f1" action="" method="post">
				<table border="1" class="t1">
					<tr>
						<td>
							投递单号
						</td>
						<td>
							<a
								href="<%=path%>/check/order.do?methodName=getTouDiDanDetaile&ReceiptID=${Receipt.receiptid}&receiptno=${Receipt.receiptno}">${Receipt.receiptno}</a>
						</td>

					</tr>
					<tr>
						<td>
							投递时间
						</td>
						<td>
							${Receipt.createtime }
						</td>
					</tr>
					<tr>

						<td>
							所在配送点
						</td>
						<td>
							${Receipt.deliveryspot.name }
						</td>
					</tr>
					<tr>
						<td>
							投递人姓名
						</td>
						<td>
							${Receipt.employee.name }
						</td>


					</tr>
					<tr>
						<td>
							备注
						</td>
						<td>
							${Receipt.remark }
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>
