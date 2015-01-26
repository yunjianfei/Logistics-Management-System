<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<%
  String path = request.getContextPath();
 %>
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---添加新用户</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
		<script language="javascript" src="<%=path %>/js/baobiao.js"></script>
		<script language="javascript" src="<%=path %>/js/calendar.js"></script>
		
		
	</head>
	<script type="text/javascript">
	   function test(){
		   DeliverySpotDaoJS.queryAllDeliverySpotOfAddUser(callback);
		}
		function callback(list){
		  dwr.util.removeAllOptions("dsid");
		  dwr.util.addOptions("dsid",["---请选择---"]);
		  dwr.util.addOptions("dsid",list,"deliveryspotid","name");
		}
	   function getEmp(){
       var id = document.getElementById("dsid").value;
               if(id == "---请选择---")
              {
                 id = "0";
              }
				EmpDaoJS.queryEmployeeByDeliverySpotID3(id,
					function(set){
						dwr.util.removeAllOptions("empNO");
						dwr.util.addOptions("empNO",set,"empid","empno");
					}
				 );
			}
			
		function getEmp2(){
       var id = document.getElementById("ds").value;
       
        if(id == "---请选择---")
              {
                 id = "0";
              }
				EmpDaoJS.queryNotManagerEmployeeByDeliverySpotID(id,
				
					function(set){
						
						dwr.util.removeAllOptions("empNO");
						dwr.util.addOptions("empNO",set,"empid","empno");
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
		
		function checkUserName()
		{   
		    var username = document.forms[0].username.value;
			var url="<%=path%>/check/user.do?methodName=checkName&username="+username;
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
			 		document.getElementById("name").innerHTML=msg;	
			       if(msg == "<font color=red>用户名存在！</font>")
			 		{
			 		return false;
			 	   }
			     else{
			 	    return true;
			    }
			  }
		  }
		}


	   function ckeckPsw(){
       var psw = document.forms[0].passowrd.value;
        if(psw==""){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("pw").innerHTML=msgTel;
          return false;
       }
        else if(!(/^\S{3,19}$/.test(psw))){
	          var msgTel ="<font color=red><b>×</b></font>";
		      document.getElementById("pw").innerHTML=msgTel;
              return false;
	         }
        else{
		    var msgTel ="<font color=green><b>√</b></font>";
		     document.getElementById("pw").innerHTML=msgTel;
		    return true;
		 } 
       }
       
		function checkEmpNO(){
		  var empNO = document.getElementById("empNO").value;
		  if(empNO == ""){
		    var msgc ="<font color=red><b>×</b></font>";
		    document.getElementById("e").innerHTML=msgc;
		    return false;
		 }
		 else{
		    return true;
		 }
		}
		
        function checkName(){
		  var username = document.forms[0].username.value;
		  if(username == ""){
		   var msgn ="<font color=red><b>×</b></font>";
		   document.getElementById("name").innerHTML=msgn;	
		    return false;
		 }
		  else if(!(/^\S{3,19}$/.test(username))){
		   var msgn ="<font color=red><b>×</b></font>";
		   document.getElementById("name").innerHTML=msgn;	
		   return false;
		   }
		 else{
		    return true;
		 }
		}
       
       	function submitForm(){
        r1 = ckeckPsw();
	    r2 = checkName();
	    r4 = checkEmpNO();
        
        if(r1&&r2&&r4){
          return true;
         }
        else{
		  return false;
		}
		}
	</script>
	    <script src='/wuliu_project/dwr/interface/EmpDaoJS.js'></script>
        <script src='/wuliu_project/dwr/interface/DeliverySpotDaoJS.js'></script>
		<script src='/wuliu_project/dwr/engine.js'></script>
		<script src='/wuliu_project/dwr/util.js'></script>
	<body onload="test()">
		<c:if test="${UserSession.power.powerid != 3}">
		<center>
			<h1>
				添加用户
			</h1>
			<c:if test="${UserSession.power.powerid == 1}">
			注：在为配送点管理员分配用户帐户之前，请先添加该员工！
			</c:if>
			<c:if test="${UserSession.power.powerid == 2}">
			注：在为配送点操作员分配用户帐户之前，请先添加该员工！
			</c:if>
			<html:form action="/check/user?methodName=save" onsubmit="return submitForm()">

				<table class="t1" border="1" width="500">
					<tr>
						<td>
							用户登录名：
						</td>
						<td>
							<html:text property="username" onblur="checkUserName()" size="23"/>
							<html:errors property="username" />
							（3~19非空格字符）
							<span id="name"></span>${msg }
						</td>
					</tr>
					<tr>
						<td>
							密码：
						</td>
						<td>
							<html:password property="passowrd"  onblur="ckeckPsw()"  size="25"/>
							<html:errors property="passowrd" />
							（3~19非空格字符）
							<span id="pw"></span>
						</td>
					</tr>
					<tr>
						<td>
							权限：
					   </td>
					 <td>
					
					   <c:if test="${UserSession.power.powerid==1}">
					      <html:hidden property="powerID" value="2"></html:hidden>配送点管理员
						  <html:errors property="powerID" />
					   </c:if>
					   <c:if test="${UserSession.power.powerid==2}">
					   	  <html:hidden property="powerID" value="3"></html:hidden>配送点操作员
						  <html:errors property="powerID" />
					   </c:if>
					   </td>
					</tr>
					<tr>
						<td>
							所在配送点：
							
						</td>
						<td>
						<c:if test="${UserSession.power.powerid==1}">
							<select name="dsid" id="dsid"  onchange="getEmp();">
							</select><span id="d"></span>
						</c:if>
						<c:if test="${UserSession.power.powerid==2}">
						  <select name="ds" id="ds"  onchange="getEmp2();">
						    <option value="---请选择---">---请选择---</option>
						    <option value="${UserSession.deliveryspot.deliveryspotid}">${UserSession.deliveryspot.name}</option>
							</select><span id="d"></span>
						</c:if>
						</td>
					</tr>
					<tr>
						
						<td>
							员工编号
                        </td>
						<td>
                            <select name="empNO" id="empNO">
                           </select><span id="e"></span>
                        </td>
					</tr>
					<tr>
					<td>
					&nbsp;
					</td>
						<td >
							<html:submit>保存</html:submit>
							&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" value="重置">
						</td>
					</tr>
				</table>
			</html:form>
		</center>
		</c:if>
		<c:if test="${UserSession.power.powerid==3}">
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

