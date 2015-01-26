<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---新购车辆登记</title>
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
		
		function checkCarNO()
		{   var carNO = document.getElementById("carno").childNodes[0].value;
			var url="<%=path%>/check/car.do?methodName=checkCarNO&carNO="+carNO;
			createXMLHttpRequest();
			//alert(xmlhttp);
			xmlhttp.onreadystatechange=callback;
			xmlhttp.open("GET",url,true);
			xmlhttp.send(null);
			
			
		}
		
		function checkWorkNO()
		{   var workNO = document.getElementById("workno").childNodes[0].value;
			var url="<%=path%>/check/car.do?methodName=checkWorkNO&workNO="+workNO;
			createXMLHttpRequest();
			//alert(xmlhttp);
			xmlhttp.onreadystatechange=callback2;
			xmlhttp.open("GET",url,true);
			xmlhttp.send(null);
				
		}
		
		function callback()
		{   
			if(xmlhttp.readyState==4)
			{
			 	if(xmlhttp.status==200)
			 	{
			 		var msg = xmlhttp.responseText;
			 		document.getElementById("checkCarNO").innerHTML=msg;
			 		if(msg=="<font color=red>车牌号已重复</font>"){
			 		     return false;
			 		}else{
			 		     return true;
			 		}
			 		
			 	}
			}
		}
		
		function callback2()
		{
			if(xmlhttp.readyState==4)
			{
			 	if(xmlhttp.status==200)
			 	{
			
			 		var msg = xmlhttp.responseText;
			 		document.getElementById("checkWorkNO").innerHTML=msg;
			 		if(msg=="<font color=red>运营证号已重复</font>"){
			 		     return false;
			 		}else{
			 		     return true;
			 		}
			 	}
			}
		}
			
		
		 function checkCarNO2(){
		  var carNO = document.getElementById("carno").childNodes[0].value;
		  if(carNO == ""){
		    var msgn ="<font color=red><b>×</b></font>";
		    document.getElementById("checkCarNO").innerHTML=msgn;
		    return false;
		 }
		 else if(!(/^\S{1,19}$/.test(carNO))){
		   var msgn ="<font color=red><b>×</b></font>";
		   document.getElementById("checkCarNO").innerHTML=msgn;
		   return false;
		   }
		 else{
		    return true;
		 }
		}	
		
		 function checkWorkNO2(){
		 var workNO = document.getElementById("workno").childNodes[0].value;
		  if(workNO == ""){
		    var msgn ="<font color=red><b>×</b></font>";
		    document.getElementById("checkWorkNO").innerHTML=msgn;
		    return false;
		 }
		 else if(!(/^\S{1,19}$/.test(workNO))){
		   var msgn ="<font color=red><b>×</b></font>";
		   document.getElementById("checkWorkNO").innerHTML=msgn;
		   return false;
		   }
		 else{
		    return true;
		 }
		}	
			
	   function checkCarSize(){
	      var carSize = document.getElementById("size").childNodes[0].value;
	      if(carSize!=""&&(carSize>0&&carSize<=9999999)){
	         var msgs = "<font color=green><b>√</b></font>";
	         document.getElementById("s").innerHTML=msgs;
	         return true;
	      }
	      else{
	        var msgs= "<font color=red><b>×</b></font>";
	        document.getElementById("s").innerHTML=msgs;
	        return false;
	      }
	   }
	   function checkTonnage(){
	      var weight = document.getElementById("weight").childNodes[0].value;
	      if(weight!=""&&(weight>0&&weight<=9999999)){
	         var msgs = "<font color=green><b>√</b></font>";
	        document.getElementById("t").innerHTML=msgs;
	         return true;
	      }else{
	        var msgs= "<font color=red><b>×</b></font>";
	        document.getElementById("t").innerHTML=msgs;
	        return false;
	      }
	   }
	   
	   
	   function checkDate(){
	      var date = document.forms[0].txtDate.value;
	      if(date==""){
	          var msgs= "<font color=red><b>×</b></font>";
	         document.getElementById("d").innerHTML=msgs;
	         return false;
	      }
	      else{
	        return true;
	      }
	   }
	   
	   function checkRemark(){
	    var remark = document.forms[0].remark.value;
	    if(remark != "" && remark.length >200){
	         var msgs= "<font color=red><b>×</b></font>";
	         document.getElementById("r").innerHTML=msgs;
	         return false;
	      }else{
	         var msgs= "<font color=green><b>√</b></font>";
	         document.getElementById("r").innerHTML=msgs;
	        return true;
	      }
	     }
	   
	   function check(){
	   r1 = checkTonnage();
	   r2=checkCarSize();
	   r3=checkCarNO2();
	   r4=checkWorkNO2();
	   r5=checkRemark();
	   if(r1&&r2&&r3&&r4&&r5){
	       if(checkDate()){
	        var f = document.forms[0];
	        f.action = "<%=path%>/check/car.do?methodName=saveCar";
	        f.submit();
	        }else{
	         var msgs= "<font color=red><b>×</b></font>";
	         document.getElementById("d").innerHTML=msgs;
	        }	        
	   }else{
	      return;
	   }
	   }
	
	</script>
	</head>
	<SCRIPT language="javascript" src="<%=path%>/js/calendar.js"></SCRIPT>
	<body>
	<c:if test="${UserSession.power.powerid==1}">
		<center>
			<h1>
				新购车辆登记
			</h1>
			<html:form action="/check/car?methodName=saveCar">
				<table border="1" class="t1" width="450">
					<tr>
						<td>
							车牌号：
						</td>
						<td id="carno">
							<html:text property="carNO" onblur="checkCarNO()" />
							<html:errors property="carNO" />
							<span id="checkCarNO"></span>
						</td>
					</tr>
					<tr>
						<td>
							营运证号：
						</td>
						<td id="workno">
							<html:text property="workNO" onblur="checkWorkNO()"/>
							<html:errors property="workNO" />
							<span id="checkWorkNO"></span>
						</td>
					</tr>
					<tr>
						<td>
							车型：
						</td>
						<td>
							<select name="carTypeID">
								<option value="1">
									大型
								</option>
								<option value="2">
									中型
								</option>
								<option value="3">
									小型
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							容积(m3)：
						</td>
						<td id="size">
							<html:text property="carSize" onblur="checkCarSize()" />
							<html:errors property="carSize" />
							<span id="s"></span>
						</td>
					</tr>
					<tr>
						<td>
							吨位：
						</td>
						<td id="weight">
							<html:text property="tonnage" onblur="checkTonnage()" />
							<html:errors property="tonnage" />
							(吨)
							<span id="t"></span>
						</td>
					</tr>
					<tr>
						<td>
							购买日期：
						</td>
						<td>
  			       <input name="txtDate" class="textborder" type="text"
								readonly="true" size="12" />
							<a title=选择日期
								href="javascript:fPopCalendar(document.all.img1,document.forms[0].txtDate,330);"
								style="text-decoration:none"> <img id=img1
									src="<%=path%>/images/img_date.gif" width="22" align=absMiddle
									border=0></img> </a><span id="d"></span>
						</td>
					</tr>
					<tr>
						<td>
							司机：
						</td>
						<td>
							<select name="empID">
								<c:forEach items="${driverList}" var="c">
									<option value="${c.empid }">
										${c.empno }-${c.deliveryspot.name }
									</option>
								</c:forEach>
							</select>

						</td>
					</tr>
					<tr>
						<td>
							备注：
						</td>
						<td>
							<html:textarea property="remark"  onblur="checkRemark()" cols="30" rows="4"/>
							<html:errors property="remark" />(选填|200)<span id="r"></span>
						</td>
					</tr>
					<tr>
						 <td>
					&nbsp;
					</td>
						<td>
							<input type="button" value="保存" onclick="check()" />
							 &nbsp;&nbsp;&nbsp;&nbsp;
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
