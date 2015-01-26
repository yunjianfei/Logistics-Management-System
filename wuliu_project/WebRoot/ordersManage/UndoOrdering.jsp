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
		<title>GLOBAL物流管理系统后台管理---未处理订单</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
		<script language="javascript">
			var xmlHttp;	
			function createXmlHttpRequest(){
				if(window.ActiveXObject){
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} else if(window.XMLHttpRequest){
					xmlHttp = new XMLHttpRequest();
				} else{
					alert("error!");
				}
			}
	
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
	        if (theform.select_orders.options[i].text ==""){
	        theform.select_orders.options.remove(i);
	        i--;
	        }
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
				var theform = document.forms[0];
				var i;   
				var carNo = document.getElementById("carNo").value;
				if(theform.select_orders.length > 0){
				    if(carNo == ""){
				    	var msg = "车号不能为空，请输入！";
						document.getElementById("sp").innerHTML = msg;
						return;
				    }
				    else if(!checkRemark()){
				      return;
				    }
				     else{
				    	createXmlHttpRequest();
				
						var url = "<%=path%>/check/order.do?methodName=checkCarNo&carNo=" + carNo;
						xmlHttp.onreadystatechange = handleStateChange;
						xmlHttp.open("GET",url,true);
						xmlHttp.send(null);
				    }
				} else{
					document.getElementById("sp").innerHTML = "没有交接的订单！";
					return;
				}
			}
			
			function handleStateChange(){
				if(xmlHttp.readyState == 4){
					if(xmlHttp.status == 200){
						var msg2 = xmlHttp.responseText;
						if(msg2 == ""){
							var msg = "";
							document.getElementById("sp").innerHTML = msg;
							var theform = document.forms[0];
							var i;   
							for (i=0;i<theform.select_orders.length;i++){
						     	if (theform.select_orders.options[i].text !=""){
						      		theform.select_orders.options[i].selected = true;
						      	}
						    }
							document.forms[0].submit();
						}else{
							document.getElementById("sp").innerHTML = msg2;
						}
					}
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
				xmlHttp.onreadystatechange = handleStateChange2;
				xmlHttp.open("GET",url,true);
				
				xmlHttp.send(null);
			}
			
			function handleStateChange2(){
				if(xmlHttp.readyState == 4){
					if(xmlHttp.status == 200){
						var msg1 = xmlHttp.responseText;
						if(msg1 == ""){
							var msg = "";
							document.getElementById("sp").innerHTML = msg;
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
				货物交接
			</h1>
		 <table border="0" class="t1" width="350" higth="50">
           <tr>
			<td>&nbsp;<font color="red"> <span id="sp"></span></font></td>
			</tr>
		</table>
			
			<form name="f1" action="<%=path%>/check/order.do?methodName=handleOrders"
				method="post">
				<table border="1" class="t1" width="420">
					<tr>
						<td valign="top">
							条形码：
						</td>
						<td valign="top">
						    <input type="text" name="vid" id="vid" size="20" />
							<input type="button" value="添加" onclick="checkOrderNo()" />
							<input name="btn_select_dltany" type="button" title="delete any" onclick="fun_select_dltany()" value="删除" />
						</td>
				  </tr>
					  <tr>
						<td>&nbsp;
						</td>
						<td valign="top">
						<select multiple="multiple" style="width:150px; height:170px"
								name="select_orders"></select>
						</td>
					</tr>
					<tr>
						<td>
							接收人姓名：
							
						</td>
						<td>
							<select name="emp">
								<c:forEach var="jl" items="${JiaoJieYuanList}">
									<option value="${jl.empid }">
										${jl.name }
									</option>
								</c:forEach>

							</select>
							&nbsp;&nbsp;&nbsp;接收种类：
							<select name="outOrIn">
							    <option value="zhuangChe">装车</option>
								<option value="xieChe">卸车</option>
							</select>
							
						</td>
					</tr>

					<tr>
						<td>
							车号：
						</td>
						<td>
							<input type="text" name="carNo" id="carNo" size="20" />
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
							<input type="button" value="生成交接单" onclick="checkAll()">
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