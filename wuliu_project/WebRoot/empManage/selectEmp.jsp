<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>GLOBAL物流管理系统后台管理---查看员工</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
		<script type="text/javascript">
			function getAllDeliveryspot(){
				EmpDaoJS.listDeliverySpot(callback);
			}
		
			function callback(list){
			
				dwr.util.removeAllOptions("dsID");
				 dwr.util.addOptions("dsID",["---请选择---"]);
				dwr.util.addOptions("dsID",list,"deliveryspotid","name");
				
			}
	    function search(){
		  var f = document.forms[0];
		  if(f.dsID.value != "---请选择---"){
		  f.action = "<%=path %>/check/selectEmployee.do?method=queryByEmpNO";
		  f.submit();
		  }
		  else{
		  return;
		  }
	   }			
 
   </script>
  <script src='/wuliu_project/dwr/interface/EmpDaoJS.js'></script>
   <script src='/wuliu_project/dwr/engine.js'></script>
   <script src='/wuliu_project/dwr/util.js'></script>
     
  </head>
  
  <body onload="getAllDeliveryspot()">
  
  	<c:if test="${UserSession.power.powerid!=3}">
  <h1>
 
  <c:if test="${UserSession.power.powerid==2}">
	 ${UserSession.deliveryspot.name}
 </c:if>
   员工查询
  </h1>
	<center>
	<c:if test="${UserSession.power.powerid==1}">
   <form action="" method="post">
    <table border="0" class="t1">
    <tr>
    <td>
     配送点：
     <select name="dsID" id="dsID" >
      </select>
      <input type="button" value="查询" onclick="search()">
     </tr>
     </table>
    </form>
     </c:if>
    <c:if test="${employeeList != null}">
			<form name = "form1" action="" method="post">
				<table cellpadding="0" cellspacing="0" class="t2" align="center">
					<tr>
						<th>
							员工编号
						</th>
						<th>
							姓名
						</th>
						<th>
							性别
						</th>
						<th>
							电话号码
						</th>
						<th>
							地址
						</th>
						<th>
						职位	
						</th>
						<th>
						所属配送点	
						</th>
						<th>
							修改
						</th>
						<th>
							删除
						</th>
					</tr>
					<tbody>
						<pg:pager items="${count}" isOffset="true"
							url="${path}/check/selectEmployee.do" maxPageItems="12"
							export="currentPageNumber=pageNumber">
							<pg:param name="method" value="queryByEmpNO" />
							<pg:param name="dsID" value="${dsID}" />
					<c:forEach var="employeeList" items="${employeeList}">
					<pg:item>
					<tr>
						<td>
							<a href="<%=path %>/check/selectEmployee.do?method=listEmp&empNO=${ employeeList.empno}">${employeeList.empno }</a>
						</td>
						<td>
						 ${employeeList.name }	
						</td>
						<td>
						<c:if test="${employeeList.gender == '1' }">
						男
						</c:if>
							<c:if test="${employeeList.gender == '0' }">
						女
						</c:if>
						</td>
						<td>
						${employeeList.tel }	
						</td>
						<td>
						${employeeList.address }	
						</td>
						<td>
						${employeeList.position.name }	
						</td>
						<td>
						${employeeList.deliveryspot.name }	
						</td>
					  <c:if test="${UserSession.power.powerid==2}">
						<c:if test="${employeeList.position.positionid != 1}">
						<td>
							<a href="<%=path %>/check/selectEmployee.do?method=updataEmp&empNO=${employeeList.empno}">修改</a>
							</td>
							<td>
							<a href="<%=path %>/check/selectEmployee.do?method=delEmployee&empID=${employeeList.empid}&dsid=${employeeList.deliveryspot.deliveryspotid}" onclick="return confirm('确定要删除该记录吗?')">删除</a>
							</td>
					    </c:if>
					    <c:if test="${employeeList.position.positionid == 1}">
					      <td></td> <td></td>
					    </c:if>
					  </c:if>
					   <c:if test="${UserSession.power.powerid==1}">
					   <td>
							<a href="<%=path %>/check/selectEmployee.do?method=updataEmp&empNO=${employeeList.empno}">修改</a>
							</td>
							<td>
							<a href="<%=path %>/check/selectEmployee.do?method=delEmployee&empID=${employeeList.empid}&dsid=${employeeList.deliveryspot.deliveryspotid}" onclick="return confirm('确定要删除该记录吗?')">删除</a>
							</td>
					   </c:if>
						</tr>
						</pg:item>
				</c:forEach>
			<div id="p">
								<font color="red" size="3">${count}条记录</font>
								<pg:index>

									<pg:first>
										<a href="<%=path%><%=pageUrl%>">首页</a>
									</pg:first>
									<pg:prev>
										<a href="<%=path%><%=pageUrl%>">上一页</a>
									</pg:prev>
									<pg:pages>
										<%
										if (pageNumber.intValue() < 12) {
										%>&nbsp;<%
												}
												if (pageNumber == currentPageNumber) {
										%>
										<b>&nbsp;<%=pageNumber%>
										</b>
										<%
										} else {
										%> &nbsp;<a href="<%=path%><%=pageUrl%>"><%=pageNumber%>
										</a>
										<%
										}
										%>
									</pg:pages>
									<pg:next>
										<a href="<%=path%><%=pageUrl%>">下一页</a>
									</pg:next>
									<pg:last>
										<a href="<%=path%><%=pageUrl%>">末页</a>
									</pg:last>

								</pg:index>
							</div>
						</pg:pager>
					</tbody>		
    </table>
   </form>
     </c:if>
   </center>
 		<script language="javascript">
			var rows = document.getElementsByTagName('tr');
				for (var i=0;i<rows.length;i++){
					rows[i].onmouseover = function(){		
						this.className = 'hover';
					}
					rows[i].onmouseout = function(){		
						this.className = '';
					}
			}
	 	</script>
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
