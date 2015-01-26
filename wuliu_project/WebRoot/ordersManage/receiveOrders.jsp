<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---货物投递</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
<script language="javascript">
	var xmlHttp;
	
	function addOption(){
		var theform = document.forms[0];
		var s = document.forms[0].vid.value;
		var i; 
	    for (i=0;i<theform.select_orders.length;i++){
	           if (theform.select_orders.options[i].text == s){
	              	document.getElementById("sp").innerHTML = "该订单已经通过扫码！！";
					return;
	           }
	    }
		
		 theform.select_orders.options[theform.select_orders.length]=new Option(s,s);
	}
	
	function fun_select_dltany(){
	   var theform = document.forms[0];
	   var i; 
	    for (i=0;i<theform.select_orders.length;i++){
	        if (theform.select_orders.options[i].selected == true){
	           if (theform.select_orders.options[i].text !=""){
	              	theform.select_orders.options[i] =new Option("");
	           }
	       } 
	    }
	    for (i=0;i<theform.select_orders.length;i++){
	        if (theform.select_orders.options[i].text ==""){theform.select_orders.options.remove(i);i--;}
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
	
	
			function checkAll(){
				document.getElementById("sp").innerHTML = "";
				var theform = document.forms[0];
				var i;   
				if(theform.select_orders.length > 0){
				     if(checkRemark()){
					for (i=0;i<theform.select_orders.length;i++){
				     	if (theform.select_orders.options[i].text !=""){
				      		theform.select_orders.options[i].selected = true;
				      	}
				    }
				    theform.submit();
				    }
				} else{
					document.getElementById("sp").innerHTML = "没有投递的订单！";
					return;
				}
			}

			function createXmlHttpRequest(){
				if(window.ActiveXObject){
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} else if(window.XMLHttpRequest){
					xmlHttp = new XMLHttpRequest();
				} else{
					alert("error!");
				}
			}
			
			
			function checkOrderNo(){
				var orderNo = document.getElementById("vid").value;
				if(orderNo == ""){
					var msg = "订单号不能为空，请输入！";
					document.getElementById("sp").innerHTML = msg;
					return;
				}
				
				createXmlHttpRequest();
				
				var url = "<%=path%>/check/order.do?methodName=checkOrderNo&orderNo=" + orderNo;
				xmlHttp.onreadystatechange = handleStateChange;
				xmlHttp.open("GET",url,true);
				
				xmlHttp.send(null);
			}
			
			function handleStateChange(){
				if(xmlHttp.readyState == 4){
					if(xmlHttp.status == 200){
						var msg1 = xmlHttp.responseText;
						if(msg1 == ""){
							document.getElementById("sp").innerHTML = "";
							addOption();
						}else{
							document.getElementById("sp").innerHTML = msg1;
						}
					}
				}
			}
		</script>

	</head>
	<body>
	<c:if test="${UserSession.power.powerid==3}">
		<center>
		    <h1> 
				交接投递
			</h1>
            <table border="0" class="t1" width="250" higth="50">
           <tr>
			<td>&nbsp;<font color="red"> <span id="sp"></span> </font></td>
			</tr>
		</table>
			<form name="f1" action="<%=path%>/check/order.do?methodName=handleTouDiDan" method="post">
				<table border="1" class="t1" width="420">
					<tr>
						<td valign="top">
							条形码：
						</td>
						<td>
						 <input type="text" name="vid"  size="20" />
						 <input type="button" value="添加" onclick="checkOrderNo()" />
						 <input name="btn_select_dltany" type="button" title="delete any" onclick="fun_select_dltany()" value="删除" />
						</td>
					</tr>
					<tr>
					<td>&nbsp;</td>
					<td valign="top">
							<select multiple="multiple" style="width:150px; height:170px"
								name="select_orders"></select>		
						</td>
					</tr>
					<tr>
					<td>
							投递人姓名：
						</td>
						<td>
							<select name="emp">
								<c:forEach var="tl" items="${TouDiYuanList}">
									<option value="${tl.empid }">${tl.name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							备注：
						</td>
						<td>
							<textarea name="remark"  onblur="checkRemark()"  cols="30" rows="4"></textarea>
							(选填|200)<span id="r"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="生成投递单" onclick="checkAll()">
						</td>

					</tr>
				</table>
			</form>

		</center>
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
