<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%String path = request.getContextPath(); %>
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---添加配送点信息</title>

		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />

		<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />

		<script type="text/javascript">
			function test(){
				//RegionDemo.getList(callback);
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
		</script>
	      <script type="text/javascript">
		var xmlhttp;
		function createXMLHttpRequest()
		{
			if(window.ActiveXObject)
			{
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}else if(window.XMLHttpRequest)
			{
				xmlhttp = new XMLHttpRequest();
			}else{
				alert("error");
			}
		}
		
		function checkName()
		{   
		    var name = document.getElementById("n").childNodes[0].value;

			var url="<%=path%>/check/deliverySpot.do?methodName=checkDSName&name="+name;
			createXMLHttpRequest();
			xmlhttp.onreadystatechange=callback2;
			xmlhttp.open("GET",url,true);
			xmlhttp.send(null);
		}
		
		function callback2()
		{
			if(xmlhttp.readyState==4)
			{
			 	if(xmlhttp.status==200)
			 	{
			 		var msg = xmlhttp.responseText;
			 		document.getElementById("dsname").innerHTML=msg;	
			 	}
			}
		}
		
	  function checkN(){
		  var name = document.getElementById("n").childNodes[0].value;
		  if(name == ""){
		    var msgn ="<font color=red><b>×</b></font>";
		    document.getElementById("dsname").innerHTML=msgn;
		     return false;
		 }
		 else if(!(/^\S{1,19}$/.test(name))){
		    var msgn ="<font color=red><b>×</b></font>";
		    document.getElementById("dsname").innerHTML=msgn;
		     return false;
		 }
		 else{
		    return true;
		 }
		}
		function checkTel(){
		  var tel = document.getElementById("t").childNodes[0].value;
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
		  var ss = document.getElementById("s").childNodes[0].value;
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
		  var sp1 = document.getElementById("sp1").childNodes[0].value;
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
		  var sp2 = document.getElementById("sp2").childNodes[0].value;
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
		  var sp1 = document.getElementById("sp3").childNodes[0].value;
		  if(sp1 == ""){
		     var msgSp1 ="<font color=red><b>×</b></font>";
		     document.getElementById("checkstartvolumescope").innerHTML=msgSp1;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(sp1))){
		    var msgSp1 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartvolumescope").innerHTML=msgSp1;
		    return false;
		 }
		 else if(sp1<=0 || sp1>9999){
		  var msgSp1 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartvolumescope").innerHTML=msgSp1;
		    return false;
		  }
		 else{
		    var msgSp1 ="<font color=green><b>√</b></font>";
		    document.getElementById("checkstartvolumescope").innerHTML=msgSp1;
		    return true;
		 }
		}
		
		function checkstartvolumeprice(){
		  var sp1 = document.getElementById("sp4").childNodes[0].value;
		  if(sp1 == ""){
		     var msgSp1 ="<font color=red><b>×</b></font>";
		     document.getElementById("checkstartvolumeprice").innerHTML=msgSp1;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(sp1))){
		    var msgSp1 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartvolumeprice").innerHTML=msgSp1;
		    return false;
		 }
		 else if(sp1<=0 || sp1>9999){
		  var msgSp1 ="<font color=red><b>×</b></font>";
		    document.getElementById("checkstartvolumeprice").innerHTML=msgSp1;
		    return false;
		  }
		 else{
		    var msgSp1 ="<font color=green><b>√</b></font>";
		    document.getElementById("checkstartvolumeprice").innerHTML=msgSp1;
		    return true;
		 }
		}
		
		function checksecondvolumeprice(){
		  var sp1 = document.getElementById("sp5").childNodes[0].value;
		  if(sp1 == ""){
		     var msgSp1 ="<font color=red><b>×</b></font>";
		     document.getElementById("checksecondvolumeprice").innerHTML=msgSp1;
		     return false;
		 }
		  else if(!(/^\d+(\.\d+)?$/.test(sp1))){
		    var msgSp1 ="<font color=red><b>×</b></font>";
		    document.getElementById("checksecondvolumeprice").innerHTML=msgSp1;
		    return false;
		 }
		 else if(sp1<=0 || sp1>9999){
		  var msgSp1 ="<font color=red><b>×</b></font>";
		    document.getElementById("checksecondvolumeprice").innerHTML=msgSp1;
		    return false;
		  }
		 else{
		    var msgSp1 ="<font color=green><b>√</b></font>";
		    document.getElementById("checksecondvolumeprice").innerHTML=msgSp1;
		    return true;
		 }
		}

		
		 function checkC(){
		  var c = document.getElementById("c").value;
		  if(c == ""){
		    var msgc ="<font color=red><b>×</b></font>";
		    document.getElementById("city").innerHTML=msgc;
		    return false;
		 }
		 else{
		    return true;
		 }
		}
		
	   function ckeckForm(){
	      result1 = checkN();
	      result2 =checkTel();
	      result3 =checkSS();
	      result4 =checkstartScope();
	      result5 =checksecondPrice();
	      result7 =checkC();
	      result8 =checkstartvolumescope();
	      result9 =checkstartvolumeprice();
	      result10 =checkstartvolumeprice();
	      
	      if(result1&&result2&&result3&&result4&&result5&&result7&&result8&&result9&&result10){
	        return true;
	      }
	      else{
		    return false;
		  }
		}
	</script>
		<script src='/wuliu_project/dwr/interface/DeliverySpotDaoJS.js'></script>
		<script src='/wuliu_project/dwr/engine.js'></script>
		<script src='/wuliu_project/dwr/util.js'></script>
	</head>

	<body onLoad="test()">
	<c:if test="${UserSession.power.powerid==1}">
		<center>
			<h1>
				新增配送点
			</h1>
			<html:form action="/check/deliverySpot?methodName=save" onsubmit="return ckeckForm()">
				<table border="1" class="t1" width="500">
					<tr>
						<td>
							站点名称：
						</td>
						<td id="n">
							<html:text property="name" onblur="checkName()"/>
							<html:errors property="name" />（1~19非空格字符）
							<span id="dsname"></span>${msg }
						</td>	
						
					</tr>
					<tr>
						<td>
							站点地址：
						</td>
						<td>
							<select name="r" id="r" onChange="change()">
							</select><font><span id="p"></span>
							<select name="c" id="c">
							</select><span id="city"></span>
						</td>
					</tr>

					<tr>
						<td>
							联系电话：
						</td>
						<td id="t">
							<html:text property="tel"  onblur="checkTel()"/>
							<html:errors property="tel" />（手机|固话）
							<span id="checktel"></span>
						</td>
					</tr>

					<tr>
						<td>
							首公斤范围（Kg）
						</td>
						<td id="s">
							<html:text property="startScope" onblur="checkSS()"/>
							<html:errors property="startScope" />（0~9999）	
							<span id="checkstartScope"></span>
						</td>
					</tr>


					<tr>
						<td>
							首公斤价格（￥）
						</td>
						<td id="sp1">
							<html:text property="startPrice" onblur="checkstartScope()"/>
							<html:errors property="startPrice" />（0~9999）	
							<span id="checkstartPrice"></span>
						</td>
					</tr>

					<tr>
						<td >
							次公斤价格系数（￥）
						</td>
						<td id="sp2"><html:text property="secondPrice" onblur="checksecondPrice()"/>
							<html:errors property="secondPrice" />	（0~9999）	
							<span id="checksecondPrice"></span>
						</td>
					</tr>
					
					<tr>
						<td>
							首体积范围（立方米）
						</td>
						<td id="sp3">
							<html:text property="startvolumescope" onblur="checkstartvolumescope()"/>
							<html:errors property="startvolumescope" />（0~9999）	
							<span id="checkstartvolumescope"></span>
						</td>
					</tr>


					<tr>
						<td>
							首体积价格（￥）
						</td>
						<td id="sp4">
							<html:text property="startvolumeprice" onblur="checkstartvolumeprice()"/>
							<html:errors property="startvolumeprice" />（0~9999）	
							<span id="checkstartvolumeprice"></span>
						</td>
					</tr>

					<tr>
						<td >
							次体积价格系数（￥）
						</td>
						<td id="sp5"><html:text property="secondvolumeprice" onblur="checksecondvolumeprice()"/>
							<html:errors property="secondvolumeprice" />	（0~9999）	
							<span id="checksecondvolumeprice"></span>
						</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
				  <td>
				    <html:submit>提交</html:submit>	&nbsp;&nbsp;&nbsp;&nbsp;
							<html:reset>重置</html:reset>
						</td>
					</tr>
				</table>
			</html:form>
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

