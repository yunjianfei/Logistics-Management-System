<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%String path = request.getContextPath(); %>
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---添加线路</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
		<SCRIPT language="javascript" src="../js/line.js"></SCRIPT>
		<script type="text/javascript">
			function test(){
				DeliverySpotDaoJS.queryAllDeliverySpotOfAddLine(callback);
			}
		
			function callback(list){
				dwr.util.removeAllOptions("left_select");
				dwr.util.addOptions("left_select",list,"deliveryspotid","name");
			}	
		</script> 
		<script type="text/javascript">
		   function checkLength(){
			var length = document.getElementById("length").value;
			if(length == ""){
				  var msglength ="<font color=red><b>×</b></font>";
				  document.getElementById("checklength").innerHTML=msglength;
				  return false;
		   }
		   else if(!(/^\d+(\.\d+)?$/.test(length))){
			     var msglength ="<font color=red><b>×</b></font>";
			     document.getElementById("checklength").innerHTML=msglength;
			     return false;
		   }
		   else if(length<=0||length>9999999){
		         var msglength ="<font color=red><b>×</b></font>";
			     document.getElementById("checklength").innerHTML=msglength;
			     return false;
		   }
		   else{
			     var msglength ="<font color=green><b>√</b></font>";
			     document.getElementById("checklength").innerHTML=msglength;
			     return true;
		     }
		  }
		  
		    function checkSelect(){
			var f = document.forms[0];
			if(f.right_select.length <= 1){
				  var msglength ="<font color=red><b>×</b></font>";
				  document.getElementById("r").innerHTML=msglength;
				  return false;
		   }
		   else{
			     var msglength ="<font color=green><b>√</b></font>";
			     document.getElementById("r").innerHTML=msglength;
			     return true;
		     }
		  }
		  
		
		
			function checkAll(theform){
			   if(checkLength()&&checkSelect()){
			
				var i;   
			    for (i=0;i<theform.right_select.length;i++){
			     if (theform.right_select.options[i].text !=""){
			      theform.right_select.options[i].selected = true;
			      }
			    }
			    theform.action="<%=path%>/check/line.do?methodName=saveLine";
			    theform.submit();
			   }
			   else{
			   return;
			   }
			}
		</script>
		<script src='/wuliu_project/dwr/interface/DeliverySpotDaoJS.js'></script>
		<script src='/wuliu_project/dwr/engine.js'></script>
		<script src='/wuliu_project/dwr/util.js'></script>
	</head>

	<body onload="test()">
	<c:if test="${UserSession.power.powerid==1}">
		<center>
			<h1>
				添加线路
			</h1>
			<hr>
			注意：请按照线路上配送点的顺序来选择
			<form action="<%=path %>/check/line.do?methodName=saveLine" method="post" name="form1">
				<table class="t1">
					<tr>
						<td>
							<select name="left_select" id="left_select" style="HEIGHT: 220px; WIDTH: 100px"
								multiple>
							</select>
						</td>

						<td>
							<table>
								<tr>
									<td>
										<input name="btn_select_addany" type="button" title="Add any"
											onclick="fun_select_addany(form1)" value="添加"
											language="javascript" />
									</td>
									<td>
										<input name="btn_select_dltany" type="button"
											title="delete any" onclick="fun_select_dltany(form1)"
											value="删除" />
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<input name="btn_select_addall" type="button" title="Add all"
											onclick="fun_select_addall(form1)" value="全选">
									</td>
									<td>
										<input name="btn_select_dltall" type="button"
											title="delete all" onclick="fun_select_dltall(form1)"
											value="全删">
									</td>
								</tr>
							</table>
						</td>

						<td>
							<select name="right_select" id="right" style="HEIGHT: 220px; WIDTH: 100px"
								multiple="multiple">
							</select><span id="r"></span>
						</td>
					</tr>
				</table>
				<br />
	            线路里程：<input type=text name="length" id="length" onblur="checkLength()"/>（公里）<font>
	            <span id="checklength"></span>
				<br />
				<input  type="button"  onclick="checkAll(form1)"
											value="保存线路">
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

