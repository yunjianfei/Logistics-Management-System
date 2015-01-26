<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---查看订单</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<SCRIPT language=javascript src="<%=path%>/js/calendar.js"></SCRIPT>
		<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />

	</head>
	<%--
	DWR
	--%>
	<script type="text/javascript">
			function test(){
				OrderDaoJS.queryOrderStateFromOrderState(callback);
			    DeliverySpotDaoJS.queryAllDeliverySpotOfAddLine(callback1);
			}
		
			function callback(list){
				dwr.util.removeAllOptions("orderstate");
				dwr.util.addOptions("orderstate",list,"orderstateid","name");
				
			}	
			
			function callback1(list){
				dwr.util.removeAllOptions("deliveryspot");
				dwr.util.addOptions("deliveryspot",list,"deliveryspotid","name");
			}	
			
		</script>
	<script type="text/javascript">
          
          
          <%-- 通过订单号查询--%>
          function queryOrderByOrderNo() {
             var orderno = document.f1.orderno.value;
   			f1.action = "<%=path%>/check/order.do?methodName=queryOrderByOrderNO&orderno=" + orderno;
   			f1.submit();
   		}
   		
   		
   		 <%--通过订单状态查询 --%>
   		function queryOrderByOrderState(){
   			var stateid = document.f1.orderstate.value;
   			f1.action = "<%=path%>/check/order.do?methodName=queryOrderByOrderStateID&stateid=" + stateid;
   			f1.submit();
          }
          
           <%--通过配送点查询 --%>
          function queryOrderByDeliverySpot(){
   			var deliveryspotid = document.f1.deliveryspot.value;
   			f1.action = "<%=path%>/check/order.do?methodName=queryOrderByDeliverySpotID&deliveryspotid=" + deliveryspotid;
   			
   			f1.submit();
          }
          
          
          <%--日期验证--%>
           function compareDate()
		{ 
		var DateOne = document.getElementById("t1").value;
		var DateTwo = document.getElementById("t2").value;
		
		var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ("-"));
		var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ("-")+1);
		var OneYear = DateOne.substring(0,DateOne.indexOf ("-"));
		
		var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ("-"));
		var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ("-")+1);
		var TwoYear = DateTwo.substring(0,DateTwo.indexOf ("-"));
		if (DateOne == ""){
		   var msg ="<font color=red><b>×</b></font>";
		   document.getElementById("time").innerHTML=msg;
		  return false;
		}
		else if(DateTwo == ""){
		   var msg ="<font color=red><b>×</b></font>";
		   document.getElementById("time").innerHTML=msg;
		  return false;
		}
		else{
		if (Date.parse(OneMonth+"/"+OneDay+"/"+OneYear) >
		Date.parse(TwoMonth+"/"+TwoDay+"/"+TwoYear))
		{
		   var msg ="<font color=red><b>×</b></font>";
		   document.getElementById("time").innerHTML=msg;
		  return false;
		}
		else
		{
		  return true;
		}
		}
       }   
          
          
           <%-- 通过时间查询--%>
          function queryHQ(){
   			var txtDate1 = document.f1.txtDate1.value;
   			var txtDate2 = document.f1.txtDate2.value;
   			if(compareDate()) {
   			   f1.action = "<%=path%>/check/order.do?methodName=queryHQ&txtDate1=" + txtDate1 + "&txtDate2" + txtDate2;
   			f1.submit();
   			}else {
   			  return;
   			}
          }
          
          
          
          
   </script>
	<script src='/wuliu_project/dwr/interface/DeliverySpotDaoJS.js'></script>
	<script src='/wuliu_project/dwr/interface/OrderDaoJS.js'></script>
	<script src='/wuliu_project/dwr/engine.js'></script>
	<script src='/wuliu_project/dwr/util.js'></script>
	<body onload="test()">
	<c:if test="${UserSession.power.powerid==3}">
		<center>
			<h1>
				订单查询
			</h1>
			<form name="f1" method="post">
				<table border="1" class="t1">
					<tr>
						<td>
							订单号：
						</td>
						<td align="center">
							<input type="text" name="orderno" />
						</td>
						<td align="center">
							<input type="button" value=" 查  询 "
								onclick="queryOrderByOrderNo()" />
						</td>
					</tr>

					<tr>
						<td>
							日期查询:
						</td>
						<td>
							从
							<input name="txtDate1" class="textborder" type="text" id="t1"
								readonly="true" size="12" />
							<a title=选择日期
								href="javascript:fPopCalendar(document.all.img1,document.f1.txtDate1,250);"
								style="text-decoration:none"> <img id=img1
									src="<%=path%>/images/img_date.gif" width="22" align=absMiddle
									border=0></img> </a> 至
							<input name="txtDate2" class="textborder" type="text" id="t2"
								readonly="true" size="12" />
							<a title=选择日期
								href="javascript:fPopCalendar(document.all.img2,document.f1.txtDate2,400);"
								style="text-decoration:none"> <img id=img2
									src="<%=path%>/images/img_date.gif" width="22" align=absMiddle
									border=0></img> </a>
						</td>
						<td align="center">
							<input type="button" value=" 查  询 " onclick="queryHQ()" />
							<span id="time"></span>
					</tr>
					<tr>
						<td>
							订单状态
						</td>
						<td align="center">
							<select name="orderstate" id="orderstate">
							</select>
						</td>
						<td align="center">
							<input type="button" value=" 查  询 "
								onclick="queryOrderByOrderState()" />
					</tr>
					<tr>
						<td>
							配送点：
						</td>
						<td align="center">
							<select name="deliveryspot">
							</select>
						</td>
						<td align="center">
							<input type="button" value=" 查  询 "
								onclick="queryOrderByDeliverySpot()" />
					</tr>
				</table>
			</form>
			<hr>
			<form name="f2" action="" method="post">
				<table cellpadding="0" cellspacing="0" class="t3" align="center">
					<tr>
						<th>
							订单编号
						</th>
						<th>
							收件地
						</th>
						<th>
							寄件地
						</th>
						<th>
							收件人姓名
						</th>
						<th>
							寄件人姓名
						</th>
						<th>
							配送点
						</th>
						<th>
							订单状态
						</th>
						<th>
							创建时间
						</th>
					</tr>
					<tbody>
						<%--
					通过订单编号查询结果
					--%>
						<c:if test="${Flag=='1'}">
							<tr>
								<td>
									<a
										href="<%=path%>/check/order.do?methodName=queryOrderByOrderID&id=${order.orderid }&orderno=${order.orderno}">${order.orderno}</a>
								</td>
								<td>
									${order.receiveaddress }

								</td>
								<td>
									${order.sendaddress }
								</td>
								<td>
									${order.receivename }
								</td>
								<td>
									${order.sendname }
								</td>
								<td>
									${order.deliveryspot.name}
								</td>
								<td>
									${order.orderstate.name}
								</td>
								<td>
									${order.createtime }
								</td>
							</tr>
						</c:if>



						<%--通过订单状态查询结果--%>
						<c:if test="${Flag=='2'}">

						<pg:pager items="${count}" isOffset="true" url="${path}/check/order.do"
							maxPageItems="8" index="center" maxIndexPages="5">
							<pg:param name="methodName" value="queryOrderByOrderStateID" />
							<pg:param name="orderstate" value="${orderstate}" />
							  
								<c:forEach var="list" items="${OrderstateList}">
									<pg:item>
										<tr>
											<td>
												<a
													href="<%=path%>/check/order.do?methodName=queryOrderByOrderID&id=${list.orderid }&orderno=${list.orderno}">${list.orderno}</a>
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
									</pg:item>
								</c:forEach>
							
							<div id="p">
								<font color="red" size="3">${count}条记录</font>
								<pg:index>

									<pg:first>
										<a href="<%=path%><%=pageUrl%>">首页</a>
									</pg:first>
									<pg:prev>
										<a href="<%=path%><%=pageUrl%>">上一页</a>
									</pg:prev>
									<%--<pg:pages>
										<%
										if (pageNumber.intValue() < 8) {
										%>&nbsp;<%
												}
												if (pageNumber == currentPageNumber) {
										%>
										<b>&nbsp;<%=pageNumber%> </b>
										<%
										} else {
										%> &nbsp;<a href="<%=path%><%=pageUrl%>"><%=pageNumber%> </a>
										<%
										}
										%>
									</pg:pages>
									--%>
									<pg:pages><a href="<%=path%><%=pageUrl %>">
										<b>&nbsp;<%=pageNumber%> </b></a>
									</pg:pages>
									<pg:next>
										<a href="<%=path%><%=pageUrl%>">下一页</a>
									</pg:next>
									<pg:last>
										<a href="<%=path%><%=pageUrl%>">末页</a>
									</pg:last>

								</pg:index>
							</div>
						</pg:pager>
</c:if>
						<%--
					通过配送点查询结果
					--%>
						
							<c:if test="${Flag=='3'}">
							<pg:pager items="${count}" isOffset="true" url="${path}/check/order.do"
							maxPageItems="8" export="currentPageNumber=pageNumber">
							<pg:param name="methodName" value="queryOrderByDeliverySpotID" />
							<pg:param name="deliveryspot" value="${deliveryspot}" />
								<c:forEach var="list" items="${DeliveryspotList}">
								<pg:item>
									<tr>
										<td>
											<a
												href="<%=path%>/check/order.do?methodName=queryOrderByOrderID&id=${list.orderid }&orderno=${list.orderno}">${list.orderno}</a>
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
									</pg:item>
								</c:forEach>
								<div id="p">
								<font color="red" size="3">${count}条记录</font>
								<pg:index>
									<pg:first>
										<a href="<%=path%><%=pageUrl%>">首页</a>
									</pg:first>
									<pg:prev>
										<a href="<%=path%><%=pageUrl%>">上一页</a>
									</pg:prev>
									<pg:pages>
										<%
										if (pageNumber.intValue() < 8) {
										%>&nbsp;<%
												}
												if (pageNumber == currentPageNumber) {
										%>
										<b>&nbsp;<%=pageNumber%> </b>
										<%
										} else {
										%> &nbsp;<a href="<%=path%><%=pageUrl%>"><%=pageNumber%> </a>
										<%
										}
										%>
									</pg:pages>
									<pg:next>
										<a href="<%=path%><%=pageUrl%>">下一页</a>
									</pg:next>
									<pg:last>
										<a href="<%=path%><%=pageUrl%>">末页</a>
									</pg:last>

								</pg:index>
							</div>
						</pg:pager>
							</c:if>
							




						<%--  通过时间查询订单 --%>
                     	
						<c:if test="${Flag=='4'}">
						<pg:pager items="${count}" isOffset="true" url="${path}/check/order.do"
							maxPageItems="8" export="currentPageNumber=pageNumber">
							<pg:param name="methodName" value="queryHQ" />
							<pg:param name="txtDate1" value="${txtDate1}" />
							<pg:param name="txtDate2" value="${txtDate2}" />
							<c:forEach var="list" items="${TimeList}">
							<pg:item>
								<tr>
									<td>
										<a
											href="<%=path%>/check/order.do?methodName=queryOrderByOrderID&id=${list.orderid }&orderno=${list.orderno}">${list.orderno}</a>
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
								</pg:item>
							</c:forEach>
											<div id="p">
								<font color="red" size="3">${count}条记录</font>
								<pg:index>
									<pg:first>
										<a href="<%=path%><%=pageUrl%>">首页</a>
									</pg:first>
									<pg:prev>
										<a href="<%=path%><%=pageUrl%>">上一页</a>
									</pg:prev>
									<pg:pages>
										<%
										if (pageNumber.intValue() < 8) {
										%>&nbsp;<%
												}
												if (pageNumber == currentPageNumber) {
										%>
										<b>&nbsp;<%=pageNumber%> </b>
										<%
										} else {
										%> &nbsp;<a href="<%=path%><%=pageUrl%>"><%=pageNumber%> </a>
										<%
										}
										%>
									</pg:pages>
									<pg:next>
										<a href="<%=path%><%=pageUrl%>">下一页</a>
									</pg:next>
									<pg:last>
										<a href="<%=path%><%=pageUrl%>">末页</a>
									</pg:last>

								</pg:index>
							</div>
						</pg:pager>
					 </c:if>
					 </tbody>
				</table>
			</form>
		</center>
			<script language="javascript">
			var rows = document.getElementsByTagName('tr');
				for (var i=0;i<rows.length;i++){
					rows[i].onmouseover = function(){		
						this.className = 'hover';
					}
					rows[i].onmouseout = function(){		
						this.className = '';
					}
			}
	 	</script>
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
