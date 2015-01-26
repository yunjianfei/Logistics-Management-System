<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>GLOBAL物流管理系统后台管理---查看用户信息</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
   
   <script type="text/javascript">
		function test(){
		   DeliverySpotDaoJS.queryAllDeliverySpotOfAddLine(callback);
		}
		function callback(list){
		  dwr.util.removeAllOptions("dsid");
		  dwr.util.addOptions("dsid",["---请选择---"]);
		  dwr.util.addOptions("dsid",list,"deliveryspotid","name");
		}
 
		function look(){
		  var f = document.forms[0];
		  if(f.dsid.value != "---请选择---"){
            f.action="<%=path %>/check/user.do?methodName=list";
            f.submit();
            }
             else{
		  return;
		  }
		}

		</script>
		<script src='/wuliu_project/dwr/interface/DeliverySpotDaoJS.js'></script>
		<script src='/wuliu_project/dwr/interface/UserDaoJS.js'></script>
		<script src='/wuliu_project/dwr/engine.js'></script>
		<script src='/wuliu_project/dwr/util.js'></script>
	</head>

	<body onload="test()">
	<c:if test="${UserSession.power.powerid != 3}">
		<center>
			<h1>
				
					<c:if test="${UserSession.power.powerid==2}">
					 ${UserSession.deliveryspot.name}
					</c:if>
				用户查询
			</h1>
			<c:if test="${UserSession.power.powerid==1}">
			<form name="f1" id="f1" action="<%=path%>/check/user.do?methodName=list" method="post">
				<table border="0" class="t1">
					<tr>
						<td>
							配送点：
						</td>
						<td>
							<select name="dsid" id="dsid">
							</select> <input type="button" value="查询" onclick="look()">
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		    <c:if test="${userList != null}">
			<form action="" method="post">
				 <table cellpadding="0" cellspacing="0" class="t2" align="center">
					<tr>
						<th>
							员工编号
						</th>
						<th>
							用户名
						</th>
						<th>
							权限
						</th>
						<th>
							配送点
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
							url="${path}/check/user.do" maxPageItems="12"
							export="currentPageNumber=pageNumber">
							<pg:param name="methodName" value="list" />
							<pg:param name="dsid" value="${dsid}" />
		   <c:forEach var="user" items="${userList}">
		   <pg:item>
    		<tr>
    			<td><a href="<%=path %>/check/user.do?methodName=particular&userid=${user.userid}">${user.employee.empno }</a></td>
    			<td>
    			${user.username }</td>
    			<td>${user.power.name }</td>
    			<td>${user.deliveryspot.name }</td>
    			<c:if test="${user.power.powerid !=UserSession.power.powerid}">
    			<td><a href="<%=path %>/check/user.do?methodName=modification&userid=${user.userid}">修改</a></td>
    			<td align="center">
					<a href="<%=path %>/check/user.do?methodName=del&userid=${user.userid}&dsid=${user.deliveryspot.deliveryspotid }" onclick="return confirm('确定要删除该记录吗?')">删除</a>
				</td>
			   </c:if>
			   <c:if test="${user.power.powerid ==UserSession.power.powerid}">
			    <td></td><td></td>
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
