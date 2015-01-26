<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%String path = request.getContextPath(); %>
<html>
	<head>
		<title>GLOBAL物流--订单查询---${orderNO }</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu.css" />
		<style type="text/css">
			<!--
			.STYLE1 {color: #CC0000}
			.STYLE4 {color: #0062C4}
			-->
		</style>
		<script type="text/javascript">
		    function searchOrderState(){
			 var k = document.forms[0];
			 k.action = "<%=path %>/company.do?methodName=queryOrderSatateByOrderNO";
			 k.submit();
			}
		</script>
		<SCRIPT type=text/javascript src="<%=path %>/js/company.js"></SCRIPT>
		<script language="javascript"> defaultStatus = "欢迎来到GLOBAL物流---${orderNO }订单！";</script>
</head>
	<body onload="load();">
		<div id="container">
			<div id="banner">
			</div>
			<div id="globallink">
				<ul>
						<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li>
						<a href="<%=path %>/wuliu.jsp">首页</a>
					</li>
					<li>
						<a href="<%=path %>/global/About.jsp">关于我们</a>
					</li>
					<li>
						<a href="<%=path %>/global/News.jsp">公司新闻</a>
					</li>
					<li>
						<a href="<%=path %>/global/UserServer.jsp">客户服务</a>
					</li>
					<li>
						<a href="<%=path %>/global/ZhaoPin.jsp">招聘信息</a>
					</li>
				</ul>
			</div>
			<div id="left">
				<div id="search">
					<img src="<%=path %>/global_images/search.gif" />
					<br />
					
					<br />
					<form action="<%=path %>/company.do?methodName=queryOrderSatateByOrderNO" method="post" name="f1">
						<input type="text" name="orderNO" class=search-normal 
                                onblur="toggleColorSearch(this); blurSearch();" 
                                  onfocus="toggleColorSearch(this); focusSearch();" 
                                   value="请输入您要查询的订单号"/>
						<br />
					 <img src="<%=path %>/global_images/search.jpg" border="0"  onclick="searchOrderState()"/>
						
					</form>
				</div>
				<div id="photo">
					<img src="<%=path %>/global_images/left.JPG" />
				</div>
				<div id="contact">
					<div id="lianxi">
						&nbsp;
						<br />
						&nbsp;
						<br />
						&nbsp;
						<span class="STYLE1">客服TEL</span>：
						<span class="STYLE4">0351-14125365</span>
						<br />
						&nbsp;
						<span class="STYLE1">公司邮箱</span>：
						<span class="STYLE4">global@gmail.com </span>
					</div>
				</div>
			</div>
			<div id="main">
         <center>
         	<c:if test="${ErrorMsg == null}">
					<form name="f1" id="f1" action="" method="post">
						<h2>
							${orderNO }订单:
						</h2>
						<div id="tb">
							<table border="0" class="t" width="380">
								<c:forEach var="os" items="${orderStateList}">
									<c:if test="${os.flag == 'xieChe'}">
									<tr>

											<td>
											${os.createtime }---到达---&nbsp;【
											<a href="<%=path %>/company.do?methodName=queryDeliverySpotByDeliverySpotID&deliverySpotID=${os.deliveryspotid }">${os.deliveryspotName }</a>】
											</td>
									</tr>
									<tr>
										<td>
											<hr/>
										</td>
									</tr>		
									</c:if>
									<c:if test="${os.flag == 'zhuangChe'}">
								    <tr>
											<td>
											${os.createtime }---从---&nbsp;【
											<a href="<%=path %>/company.do?methodName=queryDeliverySpotByDeliverySpotID&deliverySpotID=${os.deliveryspotid }">${os.deliveryspotName }</a>】
											发货
											</td>
									</tr>
									<tr>
										<td>
											<hr/>
										</td>
									</tr>
									</c:if>
									<c:if test="${os.flag == null}">
								    <tr>
											<td>
											${os.createtime }---在---&nbsp;【
											<a href="<%=path %>/company.do?methodName=queryDeliverySpotByDeliverySpotID&deliverySpotID=${os.deliveryspotid }">${os.deliveryspotName }</a>】
											<c:if test="${order.orderstate.orderstateid == 3}">
											投递中
											</c:if>
											<c:if test="${order.orderstate.orderstateid == 4}">
											完成投递
											</c:if>
											
											</td>
									</tr>
									<tr>
										<td>
											<hr/>
										</td>
									</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</form>
					</c:if>
					<c:if test="${ErrorMsg != null}">
						<br style="display: block;"/>
						<br style="display: block;"/>
						<br style="display: block;"/>
						<img src="<%=path %>/global_images/sorry.gif" border="0"/><font style="font-size: 18px; font-family: sans-serif;" color="red">
							${ErrorMsg }
						</font>
					</c:if>
				</center>
			</div>
			<div id="right">
			<div id="price">
					&nbsp;
					<br />
					<img src="<%=path %>/global_images/4.gif" />
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<%=path %>/global/searchWebSit.jsp"><img src="<%=path %>/global_images/in.jpg"
							border="0"/>
					</a>
				</div>
			<div id="price">
					&nbsp;
					<br />
					<img src="<%=path %>/global_images/3.gif" />
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<%=path %>/company.do?methodName=queryAllPriceFromDeliverySpot"><img src="<%=path %>/global_images/in.jpg"
							border="0"/>
					</a>
				</div>
				<div id="notice">
					&nbsp;
					<br />
					<marquee direction="up" behavior="scroll" loop="-1"
						scrollamount="3" height="220" width="138">
						<a href="#">上海市部分快递企业代表学习</a>
						<br/>
						&nbsp;<br/>
						<a href="#">上海邮政业迎世博600天行动动员大会召开</a>
						<br />
						&nbsp;<br/>
						<a href="#">快递业等级评定制度将</a>
						<br />
						&nbsp;<br/>
						<a href="#">上海市部分快递企业代表学习</a>
						<br />
						&nbsp;<br/>
						<a href="#">上海邮政业迎世博600天行动动员大会召开</a>
						<br />
						&nbsp;<br/>
						<a href="#">快递业等级评定制度将</a>
						<br />
						&nbsp;<br/>
						<a href="#">上海市部分快递企业代表学习</a>
						<br />
						&nbsp;<br/>
						<a href="#">上海邮政业迎世博600天行动动员大会召开</a>
						<br />
						&nbsp;<br/>
						<a href="#">快递业等级评定制度将</a>
						<br />
					</marquee>
				</div>
				
			</div>
			<div id="foot">
				<div id="map">
					<img src="<%=path %>/global_images/map.gif" width="180" height="140" />
				</div>
				<div id="map_right">
<div id="website">
						<ul>
				    <c:forEach var="p" items="${provinceList}" varStatus="s">
				      <c:if test ="${s.index<5}">
				        <li><a href="<%=path %>/company.do?methodName=queryAllDeliverySpotByProvinceIDFromDeliverySpot&provinceID=${p.province.provinceid }">${p.province.name }网点</a></li>
				      </c:if>
				    </c:forEach>
						</ul>
					</div>
                   <div id="website">
						<ul>
				    <c:forEach var="p" items="${provinceList}" varStatus="s">
				      <c:if test ="${s.index>=5 && s.index<10}">
				         <li><a href="<%=path %>/company.do?methodName=queryAllDeliverySpotByProvinceIDFromDeliverySpot&provinceID=${p.province.provinceid }">${p.province.name }网点</a></li>
				      </c:if>
				    </c:forEach>
						</ul>
					</div>
				  <div id="website">
						<ul>
				    <c:forEach var="p" items="${provinceList}" varStatus="s">
				      <c:if test ="${s.index>=10 && s.index<15}">
				        <li><a href="<%=path %>/company.do?methodName=queryAllDeliverySpotByProvinceIDFromDeliverySpot&provinceID=${p.province.provinceid }">${p.province.name }网点</a></li>
				      </c:if>
				    </c:forEach>
						</ul>
					</div>
					 <div id="website">
						<ul>
				    <c:forEach var="p" items="${provinceList}" varStatus="s">
				      <c:if test ="${s.index>=15 && s.index<20}">
				         <li><a href="<%=path %>/company.do?methodName=queryAllDeliverySpotByProvinceIDFromDeliverySpot&provinceID=${p.province.provinceid }">${p.province.name }网点</a></li>
				      </c:if>
				    </c:forEach>
						</ul>
					</div>
						 <div id="website">
						<ul>
				    <c:forEach var="p" items="${provinceList}" varStatus="s">
				      <c:if test ="${s.index>=20 && s.index<24}">
				         <li><a href="<%=path %>/company.do?methodName=queryAllDeliverySpotByProvinceIDFromDeliverySpot&provinceID=${p.province.provinceid }">${p.province.name }网点</a></li>
				      </c:if>
				    </c:forEach>
				     <li><a href="<%=path %>/global/searchWebSit.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;更多>></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
