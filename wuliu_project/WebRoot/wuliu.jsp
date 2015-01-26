<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%String path = request.getContextPath(); %>
<html>
	<head>
		<title>GLOBAL物流--公司首页</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu.css" />
		<style type="text/css">
			<!--
			.STYLE1 {color: #CC0000}
			.STYLE4 {color: #0062C4}
			-->
		</style>
		<script type="text/javascript">
		    function searchOrderState(){
			 var k = document.f1;
			 k.action = "<%=path %>/company.do?methodName=queryOrderSatateByOrderNO";
			 k.submit();
			}
		</script>
			<SCRIPT type=text/javascript src="<%=path %>/js/company.js"></SCRIPT>
			<script language="javascript"> defaultStatus = "欢迎来到GLOBAL物流---公司首页！";</script>
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
				<div id="title1">
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<%=path %>/global/News.jsp"><img src="<%=path %>/global_images/more.gif" align="right"
							border="0" />
					</a>
				</div>
				<div id="dongtai">
					<ul>
						<li>
							<a href="#">抓紧时间 认真贯彻 规范市场 科学发展<img
									src="<%=path %>/global_images/new.gif" border="0" />
							</a>
						</li>
						<li>
							<a href="#">省管局辛局长深入会员单位GLOBAL物流司调研检查工作<img
									src="<%=path %>/global_images/new.gif" border="0" />
							</a>
						</li>
						<li>
							<a href="#">公司在杭州召开2008年GLOBAL物流快递网络工作会议</a>
						</li>
						<li>
							<a href="#">《GLOBAL人简报》第39期全文</a>
						</li>
						<li>
							<a href="#">GLOBAL物流公司律师郑重声明</a>
						</li>
						<li>
							<a href="#">国家邮政局市场监管司安全监督处处长王永利来我公司检</a>
						</li>
						<li>
							<a href="#">《GLOBAL人简报》第38期全文</a>
						</li>
					</ul>
				</div>
				<div id="title2">
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<%=path %>/global/News.jsp"> <img src="<%=path %>/global_images/more.gif" align="right"
							border="0" />
					</a>
				</div>
				<div id="news">
					<ul>
						<li>
							<a href="#">上海市部分快递企业代表学习《邮政法》（修订草案）<img
									src="<%=path %>/global_images/new.gif" border="0" />
							</a>
						</li>
						<li>
							<a href="#">两岸&ldquo;大三通&rdquo;将迎来快递无限商机<img
									src="<%=path %>/global_images/new.gif" border="0" />
							</a>
						</li>
						<li>
							<a href="#">上海邮政业迎世博600天行动动员大会召开</a>
						</li>
						<li>
							<a href="#">国家邮政局启动《快递服务》标准达标工作</a>
						</li>
						<li>
							<a href="#">快递业等级评定制度将出台</a>
						</li>
						<li>
							<a href="#">上半年我国主要城市网购市场规模达162亿元</a>
						</li>
						<li>
							<a href="#">奥运圣火上海传递圆满结束 结束现场进行募捐赈灾</a>
						</li>
					</ul>
				</div>
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
