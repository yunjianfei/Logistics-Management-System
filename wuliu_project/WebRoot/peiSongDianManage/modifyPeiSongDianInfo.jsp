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

		<title>GLOBAL物流管理系统后台管理---修改配送点信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
		<script type="text/javascript">
		function checkTel(){
		  var tel = document.forms[0].tel.value;
		  if(tel == ""){
		    var msgTel ="<font color=red><b>×</b></font>";
		    document.getElementById("checktel").innerHTML=msgTel;
		     return false;
		 } else if(!(/^((\d{3}-\d{8})|(\d{4}-\d{7})|(\d{11}))$/.test(tel))){
		   var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("checktel").innerHTML=msgTel;
		   return false;
		 }
		 else{
		    var msgTel ="<font color=green><b>√</b></font>";
		    document.getElementById("checktel").innerHTML=msgTel;
		    return true;
		 }
		}
		
		function checkSS(){
		  var ss = document.forms[0].startScope.value;
		  if(ss == ""){
		    var msgSS ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartScope").innerHTML=msgSS;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(ss))){
		   var msgSS ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartScope").innerHTML=msgSS;
		    return false;
		 }
		 else if(ss<=0 || ss>9999){
		    var msgSS ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartScope").innerHTML=msgSS;
		    return false;
		 }
		 else{
		    var msgSS ="<font color=green><b>√</b></font>";
		    document.getElementById("checkstartScope").innerHTML=msgSS;
		    return true;
		 }
		}
		
       function checkstartScope(){
		  var sp1 = document.forms[0].startPrice.value;
		  if(sp1 == ""){
		     var msgSp1 ="<font color=red><b>×</b></font>";
		     document.getElementById("checkstartPrice").innerHTML=msgSp1;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(sp1))){
		    var msgSp1 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartPrice").innerHTML=msgSp1;
		    return false;
		 }
		 else if(sp1<=0 || sp1>9999){
		    var msgSp1 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartPrice").innerHTML=msgSp1;
		    return false;
		  }
		 else{
		    var msgSp1 ="<font color=green><b>√</b></font>";
		    document.getElementById("checkstartPrice").innerHTML=msgSp1;
		    return true;
		 }
		}
		
		 function checksecondPrice(){
		  var sp2 = document.forms[0].secondPrice.value;
		  if(sp2 == ""){
		     var msgSp2 ="<font color=red><b>×</b></font>";
		     document.getElementById("checksecondPrice").innerHTML=msgSp2;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(sp2))){
		    var msgSp2 ="<font color=red><b>×</b></font>";
		    document.getElementById("checksecondPrice").innerHTML=msgSp2;
		    return false;
		 }
		 else if(sp2<=0 || sp2>9999){
		   var msgSp2 ="<font color=red><b>×</b></font>";
		    document.getElementById("checksecondPrice").innerHTML=msgSp2;
		    return false;
		  }
		 else{
		     var msgSp1 ="<font color=green><b>√</b></font>";
		     document.getElementById("checksecondPrice").innerHTML=msgSp1;
		     return true;
		 }
		}
		
		 function checkstartvolumescope(){
		  var sp2 = document.forms[0].startvolumescope.value;
		  if(sp2 == ""){
		     var msgSp2 ="<font color=red><b>×</b></font>";
		     document.getElementById("checkstartvolumescope").innerHTML=msgSp2;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(sp2))){
		    var msgSp2 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartvolumescope").innerHTML=msgSp2;
		    return false;
		 }
		 else if(sp2<=0 || sp2>9999){
		   var msgSp2 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartvolumescope").innerHTML=msgSp2;
		    return false;
		  }
		 else{
		     var msgSp1 ="<font color=green><b>√</b></font>";
		     document.getElementById("checkstartvolumescope").innerHTML=msgSp1;
		     return true;
		 }
		}
		
		 function checkstartvolumeprice(){
		  var sp2 = document.forms[0].startvolumescope.value;
		  if(sp2 == ""){
		     var msgSp2 ="<font color=red><b>×</b></font>";
		     document.getElementById("checkstartvolumeprice").innerHTML=msgSp2;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(sp2))){
		    var msgSp2 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartvolumeprice").innerHTML=msgSp2;
		    return false;
		 }
		 else if(sp2<=0 || sp2>9999){
		   var msgSp2 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartvolumeprice").innerHTML=msgSp2;
		    return false;
		  }
		 else{
		     var msgSp1 ="<font color=green><b>√</b></font>";
		     document.getElementById("checkstartvolumeprice").innerHTML=msgSp1;
		     return true;
		 }
		}
		
		function checksecondvolumeprice(){
		  var sp2 = document.forms[0].secondvolumeprice.value;
		  if(sp2 == ""){
		     var msgSp2 ="<font color=red><b>×</b></font>";
		     document.getElementById("checksecondvolumeprice").innerHTML=msgSp2;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(sp2))){
		    var msgSp2 ="<font color=red><b>×</b></font>";
		    document.getElementById("checksecondvolumeprice").innerHTML=msgSp2;
		    return false;
		 }
		 else if(sp2<=0 || sp2>9999){
		   var msgSp2 ="<font color=red><b>×</b></font>";
		    document.getElementById("checksecondvolumeprice").innerHTML=msgSp2;
		    return false;
		  }
		 else{
		     var msgSp1 ="<font color=green><b>√</b></font>";
		     document.getElementById("checksecondvolumeprice").innerHTML=msgSp1;
		     return true;
		 }
		}

	   function ckeckForm(){
	      result2 =checkTel();
	      result3 =checkSS();
	      result4 =checkstartScope();
	      result5 =checksecondPrice();
	      result6 =checkstartvolumescope();
	      result7 =checkstartvolumeprice();
	      result8 =checksecondvolumeprice();
	      
	      if(result2&&result3&&result4&&result5&&result6&&result7&&result8){
	        return true;
	      }
	      else{
		    return false;
		  }
		}
	</script>
	</head>

	<body>
	<c:if test="${UserSession.power.powerid==1}">
		<center>
		<h1>修改配送点信息</h1>
			<form
				action="<%=path%>/check/deliverySpot.do?methodName=updatePeiSongDian&id=${Deliveryspot.deliveryspotid }"
				method="post" onsubmit="return ckeckForm()">
				<table border="1" class="t1" width="400">
					<tr>
						<td>
							站点名称：
						</td>
						<td>
							<input type="text" name="name" value="${Deliveryspot.name }" readonly="true" />
						</td>
					</tr>
					<tr>
						<td>
							TEL：
						</td>
						<td>
							<input type="text" name="tel" value="${Deliveryspot.tel }" onblur="checkTel()"/>
							<span id="checktel"></span>
						</td>
					</tr>
					<tr>
						<td>
							站点地址：
						</td>
						<td>
							<input type="text"
								value="${Deliveryspot.province.name }--${Deliveryspot.city.name }"
								readonly="true" />
						</td>
					</tr>
					<tr>
						<td>
							首公斤范围：
						</td>
						<td>
							<input type="text" name="startScope"
								value="${Deliveryspot.startscope }"  onblur="checkSS()"/>
							公斤
							<span id="checkstartScope"></span>
						</td>
					</tr>
					<tr>
						<td>
							首公斤价格：
						</td>
						<td>
							<input type="text" name="startPrice"
								value="${Deliveryspot.startprice }" onblur="checkstartScope()"/>元
							
							<span id="checkstartPrice"></span>
						</td>
					</tr>
					<tr>
						<td>
							次公斤价格：
						</td>
						<td>
							<input type="text" name="secondPrice"
								value="${Deliveryspot.secondprice }" onblur="checksecondPrice()"/>
							元/公斤
							<span id="checksecondPrice"></span>
						</td>
					</tr>
					
					<tr>
						<td>
							首体积范围：
						</td>
						<td>
							<input type="text" name="startvolumescope"
								value="${Deliveryspot.startvolumescope }"  onblur="checkstartvolumescope()"/>
							立方米
							<span id="checkstartvolumescope"></span>
						</td>
					</tr>
					<tr>
						<td>
							首体积价格：
						</td>
						<td>
							<input type="text" name="startvolumeprice"
								value="${Deliveryspot.startvolumeprice }" onblur="checkstartvolumeprice()"/>元
							
							<span id="checkstartvolumeprice"></span>
						</td>
					</tr>
					<tr>
						<td>
							次体积价格：
						</td>
						<td>
							<input type="text" name="secondvolumeprice"
								value="${Deliveryspot.secondvolumeprice }" onblur="checksecondvolumeprice()"/>
							元/立方米
							<span id="checksecondvolumeprice"></span>
						</td>
					</tr>
					<tr>
					  <td>
					&nbsp;
					</td>
						<td>
							<input type="submit" value="修改" />
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="重置" />
						</td>
					</tr>
				</table>
			</form>
		</center>
		
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
