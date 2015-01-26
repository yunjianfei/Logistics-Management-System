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

		<title>GLOBAL物流管理系统后台管理---总部</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
		<script language="javascript" src="<%=path %>/js/wuliu_office.js"></script>
		<script language="javascript"> defaultStatus = "欢迎来到GLOBAL物流---总部！";</script>
	</head>
	<body>
		<c:if test="${UserSession.power.powerid==1}">
		<div id="container">
			<div id="banner">
				<div id="globallink">
					<ul>
						<li>
							<a href="index.jsp">办公首页</a>
						</li>
						<li>
							<a href="<%=path %>/company.do?methodName=initAllDeliverySpot">公司首页</a>
						</li>
						<li>
							<a href="<%=path %>/login.do?methodName=loginOut">退出</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="left">
			<div id="menu">
					<a onClick="test(6)">配送点管理</a>
				</div>

				<div id="menu_down6" class="menu_down" style="display:block">
					<ul>
						<li>
							<a href="peiSongDianManage/addPeiSongDian.jsp" target="main">新增配送点</a>
						</li>
						<li>
							<a href="<%=path %>/check/deliverySpot.do?methodName=listAllDeliveryspot" target="main">查看配送点</a>
						</li>
					</ul>
				</div>
			<div id="menu">
					<a onClick="test(2)">员工管理</a>
				</div>
				<div id="menu_down2" class="menu_down" style="display:block">
					<ul>
						<li>
							<a href="<%=path %>/check/employee.do?method=listDeliverySpot" target="main">新员工入职</a>
						</li>

						<li>
							<a href="<%=path %>/empManage/selectEmp.jsp" target="main">查看员工信息</a>
						</li>
					</ul>
				</div>
				<div id="menu">
					<a onClick="test(1)">用户管理</a>
				</div>
				<div id="menu_down1" class="menu_down" style="display:block">
					<ul>
						<li>
							<a href="<%=path %>/userManage/addUser.jsp" target="main">添加用户</a>
						</li>

						<li>
							<a href="<%=path %>/userManage/selectUser.jsp" target="main">查看用户</a>
						</li>
					</ul>
				</div>
				<div id="menu">
				<a onClick="test(5)">线路管理</a>
				</div>
				<div id="menu_down5" class="menu_down" style="display:block">

					<ul>
						<li>
							<a href="lineManage/addLine.jsp" target="main">新增线路</a>
						</li>
						<li>
							<a href="<%=path%>/check/line.do?methodName=listAllLine" target="main">查看线路</a>
						</li>
					</ul>
				</div>
				
				<div id="menu">
					<a onClick="test(3)">车辆管理</a>
				</div>
				<div id="menu_down3" class="menu_down" style="display:block">
					<ul>
						<li>
							<a href="<%=path %>/check/car.do?methodName=display" target="main">新购车辆登记</a>
						</li>

						<li>
							<a href="<%=path %>/carManage/searchCar.jsp" target="main">查看车辆</a>
						</li>
						<li>
							<a href="<%=path %>/check/car.do?methodName=listAllCarNO" target="main">车辆状态维护</a>
						</li>
						<li>
							<a href="<%=path %>/check/line.do?methodName=intiMatchingLine" target="main">线路配车</a>
						</li>
					</ul>
				</div>
				
				
				<div id="menu">
					<a onClick="test(7)">报表管理</a>
				</div>
				<div id="menu_down7" class="menu_down" style="display:block">
					<ul>
						<li>
							<a href="baoBiaoManage/viewBaoBiao.jsp" target="main">生成报表</a>
						</li>
					</ul>
				</div>

			</div>
			<div id="main">
				<iframe name="main" id="main" frameborder="0" src="<%=path %>/check/employee.do?method=listDeliverySpot">
				</iframe>
			</div>
			<div id="foot">
				<center>
					<pre>
               版权所有GLOBAL物流公司 备案序号:晋ICP备05039742号
              业务资询电话：0351-2720833 2720836 13805390912 服务监督电话：13791568668 传真：0351-2720899
             总公司地址：山西省太原市万柏林区186号（太原理工大学向北走100米）
</pre>
				</center>
			</div>
		</div>
		
		</c:if>
	 	<c:if test="${UserSession.power.powerid!=1}">
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
