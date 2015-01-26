<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
 <%String path = request.getContextPath(); %>
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---首页</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
		<script language="javascript"> defaultStatus = "欢迎来到GLOBAL物流管理系统后台管理！";</script>
	</head>
	<body>
	<center>
		<div id="container2">
			<div id="index">
				<div id="globallink2">
					<ul>
						<li>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</li>
						<li>
							<a href="index.jsp">办公首页</a>
						</li>
						<li>
							<a href="<%=path %>/company.do?methodName=initAllDeliverySpot">公司首页</a>
						</li>
					</ul>
				</div>
				<div id="login2">

					<html:form action="/login?methodName=login">
						<table class="t4">
						<tr>
						<td colspan="2">${Login_Error }${Error_Msg }</td>
						</tr>
							<tr>
								<td>
									用户名：
								</td>
								<td>
									<html:text property="username" size="14" />
								</td>
							</tr>
							<tr>
								<td>
									密码：
								</td>
								<td>
									<html:password property="password" size="14" />
								</td>
							</tr>
							<tr>
								<td>
									权限：
								</td>
								<td>
									<select name="powerID" id="powerID">
										<option value="3">配送点操作员</option>
										<option value="2">配送点管理员</option>
										<option value="1">超级管理员</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="登录" />
								</td>
							</tr>
						</table>
					</html:form>
				</div>
				<div id="foot2">
					<center>
						<pre>
               版权所有GLOBAL物流公司 备案序号:晋ICP备05039742号
              业务资询电话：0351-2720833 2720836 13805390912 服务监督电话：13791568668 传真：0351-2720899
             总公司地址：山西省太原市万柏林区186号（太原理工大学向北走100米）
</pre>
					</center>
				</div>
			</div>
		</div>
		</center>
	</body>
</html>
