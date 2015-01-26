<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>GLOBAL物流管理系统后台管理---修改用户的信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
			
    <script type="text/javascript">
        function ckeckPsw(){
        var psw = document.f1.password.value;
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
       
       	function submitForm(){
        r1 = ckeckPsw();
        
        if(r1){
          return true;
         }
        else{
		  return false;
		}
		}
    </script>
	</head>
  
  <body>
  <c:if test="${UserSession.power.powerid == 1}">
  <center>
  <h1>修改用户信息</h1>
    <form name="f1" id="f1" action="<%=path %>/check/user.do?methodName=update&userid=${userlist.userid}" method="post" onsubmit="return submitForm()">
   <table  class="t1" border="1" width="350">
  <tr>
          <td>用户名：</td>
          <td><input type="text" name="username" id="login" value="${userlist.username }" readonly="true" ></td>
        </tr>
        <tr>
          <td>密码：</td>
          <td><input type="text" name="password" id="password" value="${userlist.passowrd }"  onblur="ckeckPsw()"><span id="pw"></span></td>
        </tr>
        <tr>
          <td>权限：</td>
          <td>
           <input type="text" value="${userlist.power.name }" readonly="true"/> <input type="hidden" name="powerID" value="${userlist.power.powerid }"/>
            </td> 
        </tr>
         <tr><td>&nbsp;</td><td>
           <input type="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" value="重置"></td>
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
