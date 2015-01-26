<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%String path = request.getContextPath(); %>
<html>
	<head>
		<title>GLOBAL物流---关于我们</title>
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
		<script language="javascript"> defaultStatus = "欢迎来到GLOBAL物流---关于我们！";</script>
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
			<div id="tb3">
		      <pre>
   
   
    GLOBAL物流集团成立于1993年，注册于松江区小昆山秦安街18号小昆山
 经济区是一家以经营快递为主的国内合资（民营）企业。

　　目前公司的主要经营地处于上海市青浦区北青公路6186号。      

　　公司分别在全国各省会城市（除台湾）以及其它大中城市建立起了800多
个分公司，吸收1100余家加盟网点，全网络有员工2万多人。

　　公司注册商标为“STO＋申通”，注册编号为1379930。主要承接非信函、
样品、大小物件的速递业务。2004年3月公司通过ISO9001:2000国际质量管理体
系认证。

     公司奉行“团结、务实、开拓、创新”的企业精神，已深得广大客户的信
任和支持。

     公司在全国范围内形成了流畅的速递网络，并与港澳地区和国外大城市建
立了业务联系。
    
    公司自1993年成立以来，在董事长陈德军的正确领导下，在广大客户的支持
和关怀下，在全 体员工的艰苦奋斗和顽强拼搏下，已经成为国内速递领域最具影
响力的民营企业之一，先后荣获上海市松江区民营企业2000至2005年度的《信得
过企业》、《先进企业》荣誉称号；2005年，公司荣获《中国物流十大影响力品
牌》称号，公司董事长陈德军先生个人荣获《中国品牌建设十大杰出企业家》荣
誉称号。

    公司在全国范围内形成了流畅的速递网络，并与港澳地区和国外大城市建立
了业务联系。
     </pre>
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
