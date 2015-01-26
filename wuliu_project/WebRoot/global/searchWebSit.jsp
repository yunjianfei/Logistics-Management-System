<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%String path = request.getContextPath(); %>
<html>
	<head>
		<title>GLOBAL物流---站点查询</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu.css" />
		<style type="text/css">
			<!--
			.STYLE1 {color: #CC0000}
			.STYLE4 {color: #0062C4}
			-->
		</style>
		<SCRIPT type=text/javascript src="<%=path %>/js/company.js"></SCRIPT>
		<script type="text/javascript">
		    function searchOrderState(){
			 var k = document.f1;
			 k.action = "<%=path %>/company.do?methodName=queryOrderSatateByOrderNO";
			 k.submit();
			}
			
		</script>
		<script type="text/javascript">
			function test(){
				DeliverySpotDaoJS.queryProvinceFromProvince(callback);
			}
			function callback(list){
				dwr.util.removeAllOptions("r");
				dwr.util.addOptions("r",["---请选择---"]);
				dwr.util.addOptions("r",list,"provinceid","name");
				
			}
			
			function change(){
			
				var id = document.getElementById("r").value;
				if(id == "---请选择---")
                 {  
                    id = "0";
                  }
				DeliverySpotDaoJS.queryCityByProvinceIDFromCity(id,
					function(list){
						
						dwr.util.removeAllOptions("c");
						dwr.util.addOptions("c",list,"cityid","name");
					}
				);
			}
			
		function check() {
	    var id = document.getElementById("c").value;
	     if(id==""){
	      var msg ="<font color=red>请选择要查询的站点地址...</font>";
	      document.getElementById("city").innerHTML=msg;
	      return false;
	    }else {
	      return true;
	    }
	 
	}	
		</script>
		<script src='/wuliu_project/dwr/interface/DeliverySpotDaoJS.js'></script>
		<script src='/wuliu_project/dwr/engine.js'></script>
		<script src='/wuliu_project/dwr/util.js'></script>
		<script language="javascript"> defaultStatus = "欢迎来到GLOBAL物流---站点查询！";</script>
</head>
	<body onload="test();load();">
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
					<form action="<%=path %>/company.do?methodName=queryDeliverySpotByProvinceIDAndCityID" method="post" name="fweb" onsubmit="return check()">
					<table border="0" class="t" width="300" align="center">
						<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<select name="r" id="r" onChange="change()">
							</select>
							<select name="c" id="c">
							</select>
							<input type="submit" value="查询"/> 
						 </td>
					   </tr>
					   <tr>
					     <td colspan="2"><span id="city"></span></td>
					   </tr>
						</table>
					</form>
			</center>
			   <c:if test="${msg != null }">
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			     <img src="<%=path %>/global_images/sorry.gif" border="0"/>
			     <font style="font-size: 18px; font-family: sans-serif;">${msg }</font>
			   </c:if>
				<c:if test="${deliveryspot != null}">
				<div id="tb2">
					
					<table border="0" class="t" width="442">
					    <tr>
					      <td>站点名称： ${deliveryspot.name } </td>
					      <td align="right">TEL： ${deliveryspot.tel } </td>
					    </tr>
					    <tr>
					      <td   colspan="2"><hr></td>
					    </tr>
					    <tr>
					      <td colspan="2">站点地址： ${deliveryspot.province.name }--${deliveryspot.city.name } </td>
					    </tr>
					     <tr>
					      <td colspan="2"><hr></td>
					    </tr>
					    <tr>
					      <td>首公斤范围：${deliveryspot.startscope }&nbsp;公斤 </td>
					      <td >首公斤价格：￥${deliveryspot.startprice }&nbsp; 元</td>
					    </tr>
					    <tr>
					      <td></td>
					      <td>次公斤价格：￥${deliveryspot.secondprice }&nbsp;元/公斤 </td>
					    </tr>
					    
					    <tr>
						      <td colspan="2"><hr></td>
						    </tr>
						    
						    <tr>
						      <td>首体积范围：${deliveryspot.startvolumescope }&nbsp;立方米 </td>
						      <td >首体积价格：￥${deliveryspot.startvolumeprice }&nbsp;元</td>
						    </tr>
						    <tr>
						      <td></td>
						      <td>次体积价格：￥${deliveryspot.secondvolumeprice }&nbsp;元/立方米 </td>
						    </tr>
						</table>
						</div>
					</c:if>
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
