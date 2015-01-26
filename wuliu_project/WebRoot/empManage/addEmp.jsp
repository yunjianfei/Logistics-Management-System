<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html> 
	<head>
	<title>GLOBAL物流管理系统后台管理---新曾员工</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css"/>
	
    <SCRIPT language=javascript src="<%=path %>/js/calendar.js"></SCRIPT>
        <script type="text/javascript">
      function ckeckName(){
       var name = document.forms[0].name.value;
        if(name==""){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("n").innerHTML=msgTel;
          return false;
       }
       else if(!(/^\S{1,19}$/.test(name))){
            var msgTel ="<font color=red><b>×</b></font>";
		    document.getElementById("n").innerHTML=msgTel;
           return false;
       }
        else{
		    var msgTel ="<font color=green><b>√</b></font>";
		     document.getElementById("n").innerHTML=msgTel;
		    return true;
		 }
       }
       
       function ckeckBirthday(){
       var birthday = document.forms[0].birthday.value;
        if(birthday == ""){
          
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("b").innerHTML=msgTel;
		  
          return false;
       }
         else{
		    var msgTel ="<font color=green><b>√</b></font>";
		    document.getElementById("b").innerHTML=msgTel;
		    return true;
		 }
       }
       
       function ckeckStartWordTime(){
        var startWordTime = document.forms[0].startWordTime.value;
        if(startWordTime==""){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("st").innerHTML=msgTel;
          return false;
       }
        else{
		    var msgTel ="<font color=green><b>√</b></font>";
		   document.getElementById("st").innerHTML=msgTel;
		    return true;
		 }
       }
       
       function ckeckCardID(){
       var cardID = document.forms[0].cardID.value;
       if(!(/^\d{15}((\d{2}[\dXx])|([\dXx]))$/.test(cardID))){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("card").innerHTML=msgTel;
          return false;
       }
        else{
		    var msgTel ="<font color=green><b>√</b></font>";
		     document.getElementById("card").innerHTML=msgTel;
		    return true;
		 }
       }
       
         
       function ckeckTel(){
       var tel = document.forms[0].tel.value;
       if(!(/^((\d{3}-\d{8})|(\d{4}-\d{7})|(\d{11}))$/.test(tel))){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("te").innerHTML=msgTel;
          return false;
       }
        else{
		    var msgTel ="<font color=green><b>√</b></font>";
		     document.getElementById("te").innerHTML=msgTel;
		    return true;
		 }
       }
    
     function ckeckSalary(){
       var salary = document.forms[0].salary.value;
       if(!(/^\d+(\.\d+)?$/.test(salary))){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("sy").innerHTML=msgTel;
          return false;
       }
       else if(salary<=0 || salary>9999999){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("sy").innerHTML=msgTel;
          return false;
         }
        else{
		    var msgTel ="<font color=green><b>√</b></font>";
		     document.getElementById("sy").innerHTML=msgTel;
		    return true;
		 }
       }
       
      function ckeckAddress(){
      var address = document.forms[0].address.value;
       if(address == ""){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("ad").innerHTML=msgTel;
          return false;
       } 
      else if(address.length >200){
         var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("ad").innerHTML=msgTel;
          return false;
       }
        else{
		    var msgTel ="<font color=green><b>√</b></font>";
		     document.getElementById("ad").innerHTML=msgTel;
		    return true;
		 }
       }
       
        function ckeckEmail(){
        var email = document.forms[0].email.value;
         if(!(/^[a-zA-Z0-9_\.]+@[a-zA-Z0-9-]+[\.a-zA-Z]+$/.test(email))){
           var msgTel ="<font color=red><b>×</b></font>";
		   document.getElementById("em").innerHTML=msgTel;
           return false;
       }
        else{
		    var msgTel ="<font color=green><b>√</b></font>";
		     document.getElementById("em").innerHTML=msgTel;
		    return true;
		 }
       }

     function submitForm() {
	      result2 =ckeckName();
	      result3 =ckeckBirthday();
	      result4 =ckeckStartWordTime();
	      result5 =ckeckCardID();
	      result6 =ckeckTel();
	     
	      result7 =ckeckSalary();
	      result8 =ckeckAddress();
	      result9 =ckeckEmail();
        if(result2&&result3&&result4&&result5&&result6&&result7&&result8&&result9){
	        document.forms[0].action ="<%=path %>/check/employee.do?method=addEmployee";
            document.forms[0].submit();    
	       }
	      else{
		    return false;
		  }
		}
    </script>
  </head>
  
  <body>
   <c:if test="${UserSession.power.powerid!=3}">
  <center>
  　<h1>新员工入职</h1>
  
   <html:form action="/check/employee?method=addEmployee">
    <table  class="t1" border="1" width="450">

    <tr><td> 姓名：</td><td><html:text property="name"  onblur="ckeckName()"/><html:errors property="name"/>（1~19非空格字符）<span id="n"></span></td></tr>
     <tr><td>性别：</td><td>
     <html:select property="gender">
           <html:option value="1">男</html:option>
           <html:option value="0">女</html:option>
     </html:select><html:errors property="gender"/></td></tr>
     <tr><td>出生日期：</td><td><input name="birthday" class="textborder" type="text" readonly="true" size="12"/>
                                  <a title=选择日期 href="javascript:fPopCalendar(document.all.img1,document.forms[0].birthday,350);"  style="text-decoration:none">
                    <img id=img1 src="<%=path %>/images/img_date.gif" width="22" align="absMiddle" border=0></img></a><span id="b"></span></td></tr>
     <tr><td>入职日期：</td><td>
    
            <input name="startWordTime" class="textborder" type="text" readonly="true" size="12"/>
                                  <a title=选择日期 href="javascript:fPopCalendar(document.all.img2,document.forms[0].startWordTime,350);"  style="text-decoration:none">
                    <img id=img2 src="<%=path %>/images/img_date.gif" width="22" align="absMiddle" border=0></img></a><span id="st"></span></td></tr>
     <tr><td>身份证号：</td><td><html:text property="cardID"  onblur="ckeckCardID()"/><html:errors property="cardID"/>（16/18位）<span id="card"></span></td></tr>
     <tr><td>电话号码：</td><td><html:text property="tel"  onblur="ckeckTel()"/><html:errors property="tel"/>（手机|固话）<span id="te"></span></td></tr>
     <tr>
     <td> 职位：</td><td><html:select property="positionID">         
                          <c:forEach var="pl" items="${positionList}">
                            <c:if test="${UserSession.power.powerid ==2}">
                            <c:if test="${pl.positionid != 1 }">
                            <html:option value="${pl.positionid}">${pl.name}</html:option> 
                            </c:if>
                           </c:if>
                            <c:if test="${UserSession.power.powerid ==1}">
                            <c:if test="${pl.positionid == 1 }">
                            <html:option value="${pl.positionid}">${pl.name}</html:option> 
                            </c:if>
                           </c:if>
                           </c:forEach>
                         
                            
                  </html:select>
          <html:errors property="positionID"/></td></tr>
     <tr><td>薪水：</td><td><html:text property="salary" onblur="ckeckSalary()"/><html:errors property="salary"/><span id="sy"></span></td></tr>
     <tr><td>地址：</td><td><html:textarea property="address" onblur="ckeckAddress()" cols="30" rows="4"/><html:errors property="address"/>(200字之内)<span id="ad"></span></td></tr>
     <tr><td>邮箱：</td><td><html:text property="email" onblur="ckeckEmail()"/><html:errors property="email"/><span id="em"></span></td></tr>
     <tr><td>所属配送点：</td><td><br><html:select property="deliverySpotID">
             <c:forEach var="dl" items="${deliverySpotList}">
                 <c:if test="${UserSession.power.powerid ==1}">    
                    <html:option value="${dl.deliveryspotid}">${dl.name}</html:option>
                 </c:if>
                  <c:if test="${UserSession.power.powerid ==2}">
                    <c:if test="${dl.deliveryspotid == UserSession.deliveryspot.deliveryspotid}">
                      <html:option value="${dl.deliveryspotid}">${dl.name}</html:option>
                    </c:if>
                  </c:if>
           </c:forEach>
           </html:select><html:errors property="deliverySpotID"/><br></td></tr>
    
     
     <tr>
     <td>
					&nbsp;
					</td>
     <td>
     <input type="button" value="保存" onclick="submitForm()"/>
     &nbsp;&nbsp;&nbsp;&nbsp;
    <html:reset>重置</html:reset></td></tr>
     
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

