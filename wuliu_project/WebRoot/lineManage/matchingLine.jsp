<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>GLOBAL物流管理系统后台管理---为线路配车</title>
   <link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
			function test(){
				LineDaoJS.queryAllLineMatchingLine(callback);
			}
		
			function callback(list){
				dwr.util.removeAllOptions("lineID");
				dwr.util.addOptions("lineID",list,"lineid","linename");
				
			}	
		</script> 
		
	<script src='/wuliu_project/dwr/interface/LineDaoJS.js'></script>
	<script src='/wuliu_project/dwr/engine.js'></script>
	<script src='/wuliu_project/dwr/util.js'></script>

  </head>
  
  <body onLoad="test()">
  <c:if test="${UserSession.power.powerid==1}">
   <center>
			<h1>
				线路配车
			</h1>
			<form action="<%=path %>/check/line.do?methodName=matchingLine" method="post">
				<table border="1" class="t1">
					<tr>
						<td>
							路线选择
						</td>
						<td>
							<select name="lineID" id="lineID">	
							</select>
							<font><span id="L"></span>
						</td>
					</tr>
					<tr>
						<td>
							车辆选择
						</td>
						<td>
						<select name="carID" id="cID">
						<c:forEach var="ncl" items="${newCarList}">
						 <option value="${ncl.carid }">${ncl.carno }</option>
						 </c:forEach>
						</select>
						<font><span id="c"></span>
						</td>
					</tr>
					<tr>
						<td>
							发车时间
						</td>
						<td>
							<select name="leaveTime" id="time">
								<option value="10:00:00">
									10:00:00
								</option>
								<option value="14:00:00">
									14:00:00
								</option>
								<option value="16:00:00">
									16:00:00
								</option>
							</select>
							<font><span id="t"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确定"/>						</td>
				  </tr>
				</table>
			</form>
			<hr/>
			<table cellpadding="0" cellspacing="0" class="t2" align="center">
			<tr>
			<th>&nbsp;</th><th>车牌号</th><th>发车时间</th><th>所属线路名称</th>
			</tr>
			 <tbody>
				 <pg:pager items="${count}" isOffset="true"
			   url="${path}/check/line.do" maxPageItems="8" export="currentPageNumber=pageNumber">
			   <pg:param name="methodName" value="intiMatchingLine"/>  
			<c:forEach var="call" items="${carAndLineList}" varStatus="s">
			  <pg:item>
			   <tr> 
			        <td><b>${s.count }</b></td>
					<td> <a href="<%=path%>/check/car.do?methodName=carDetail&&carid=${call.carid }">${call.carno }</a> </td>
					<td> ${call.leavetime } </td>
					<td> <a href="<%=path %>/check/line.do?methodName=viewLineInfo&id=${call.line.lineid }">${call.line.linename}</a> </td>
					</tr>
					</pg:item>
               </c:forEach>
               			<div id="p">
                    <font color="red" size="3">${count}条记录</font>
                 <pg:index>

				      <pg:first><a href="<%=path%><%=pageUrl %>">首页</a></pg:first>
				      <pg:prev><a href="<%=path%><%=pageUrl %>">上一页</a></pg:prev>
				      <pg:pages>
				      <% 
				     if (pageNumber.intValue() < 8) { 
				      %>&nbsp;<%
				      }
				      if (pageNumber == currentPageNumber) { 
				        %><b>&nbsp;<%= pageNumber %></b><%
				      } else { 
				        %> &nbsp;<a href="<%=path%><%=pageUrl %>"><%=pageNumber%></a><%
				      }
				      %>
				      </pg:pages>
				      <pg:next><a href="<%=path%><%=pageUrl %>">下一页</a></pg:next>
				      <pg:last><a href="<%=path%><%=pageUrl %>">末页</a></pg:last>

			  </pg:index>
				</div>
				</pg:pager>
				  </tbody>
				</table>
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
