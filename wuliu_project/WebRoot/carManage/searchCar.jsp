<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>GLOBAL物流管理系统后台管理---查看车辆</title>
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
		<!--<scrpit language="javascript" src="../js/searchCar_delete.js"></scrpit>
	-->
		<script>
     function selectAll() {
	            var f=document.forms[1];
	            if(f.d.value == "全选")
	            {
	            for( i=0 ; i<f.elements.length ; i++) {
		          if (f.elements[i].name=="carIDs") {
		          f.elements[i].checked=true;
		         }
	            }
	            f.d.value="反选";
	          }
	          
	          else if(f.d.value == "反选")
	            {
	            for( i=0 ; i<f.elements.length ; i++) {
		          if (f.elements[i].name=="carIDs") {
		          f.elements[i].checked=false;
		         }
	            }
	            f.d.value="全选";
	          }
           }
           
           
          function del(){
            var f=document.forms[1];
            var r = false;
            for( i=0 ; i<f.elements.length ; i++) {
		          if (f.elements[i].name=="carIDs") {
		          if(f.elements[i].checked){
                      r = true;
                      break;
		          }
		         }
               }
              if(r){
                 if(confirm("确定要删除记录吗？")){
                    f.action="<%=path%>/check/car.do?methodName=dels";
                    f.submit();
                 }
                 else{
                 return ;
                 }
              }
              else{
               alert("请选择要删除的记录！");
                return ;
              }
          }      
          
	  function searchByCarNO(){
	    var f = document.forms[0];
	    var carno = f.carNO.value;
	    if(carno!=""){
	    f.action="<%=path%>/check/car.do?methodName=searchByCarNO&carno="+carno;
	    f.submit();
	    }else{
	        var msgs= "<font color=red><b>×</b></font>";
	        document.getElementById("1").innerHTML=msgs;
	      return;
	    }
	  }
	  
	   function searchByWorkNO(){
	    var f = document.forms[0];
	    var workno = f.workNO.value;
	    if(workno!=""){
	    f.action="<%=path%>/check/car.do?methodName=searchByWorkNO&workno="+workno;
	    f.submit();
	    }else{
	        var msgs= "<font color=red><b>×</b></font>";
	        document.getElementById("2").innerHTML=msgs;
	        return;
	    }
	  }
	  
	   function searchByState(){
	    var f = document.forms[0];
	    var state = f.state.value;
	    if(state!=null){
	    f.action="<%=path%>/check/car.do?methodName=searchByCarState&state="+state;
	    f.submit();
	    }else{
	       return;
	    }
	  }
   </script>

	</head>

	<body>
		<h1>
			车辆查询
		</h1>
		<center>
			<form action="<%=path%>/check/car.do?methodName=searchCar" method="post">
				<table class="t1">
					<tr>
						<td>
							按车牌号查询:
						</td>
						<td>
							<input type="text" name="carNO" />
						</td>
						<td>
							<input type="button" value="查询" onclick="searchByCarNO()" />
							<span id="1"></span>
						</td>
					</tr>

					<tr>
						<td>
							按运营证号查询:
						</td>
						<td>
							<input type="text" name="workNO" />
						</td>
						<td>
							<input type="button" value="查询" onclick="searchByWorkNO()" />
							<span id="2"></span>
						</td>
					</tr>

					<tr>
						<td>
							按状态查询:
						</td>
						<td>
							<select name="state">
								<option value="1">
									新购
								</option>
								<option value="2">
									途中
								</option>
								<option value="3">
									维修
								</option>
								<option value="4">
									空闲
								</option>
							</select>
						</td>
						<td>
							<input type="button" value="查询" onclick="searchByState()" />
						</td>
					</tr>
				</table>
			</form>
			<font color="red">${error }</font>
			<c:if test="${carList != null}">
				<hr />
				<form action="<%=path%>/check/car.do?methodName=dels" method="post">
					<table cellpadding="0" cellspacing="0" class="t2" align="center">
						<tr>
							<th>
								车牌号
							</th>
							<th>
								营运证号
							</th>
							<th>
								车型
							</th>
							<th>
								运营线路
							</th>
							<th>
								发车时间
							</th>
							<th>
								购买日期
							</th>
							<th>
								车辆状态
							</th>
							<c:if test="${UserSession.power.powerid == 1}">
								<th>
									修改
								</th>
								<th>
									删除
								</th>
							</c:if>
						</tr>
						<tbody>
							<pg:pager items="${count}" isOffset="true" url="${path}/check/car.do"
								maxPageItems="7" export="currentPageNumber=pageNumber">
								<pg:param name="methodName" value="searchByCarState" />
								<pg:param name="state" value="${state}" />
								<c:forEach var="car" items="${carList}">
									<pg:item>
										<tr>
											<td>
												<a
													href="<%=path%>/check/car.do?methodName=carDetail&carid=${car.carid }">${car.carno
													}</a>
											</td>
											<td>
												${car.workno }
											</td>
											<td>
												${car.cartype.name }
											</td>
											<td>
												<a
													href="<%=path%>/check/line.do?methodName=viewLineInfo&id=${car.line.lineid }">${car.line.linename
													}</a>
											</td>
											<td>
												${car.leavetime }
											</td>
											<td>
												${car.buytime }
											</td>
											<td>
												${car.carstate.name }
											</td>
											<c:if test="${UserSession.power.powerid == 1}">

												<td>
													<a
														href="<%=path%>/check/car.do?methodName=update&carid=${car.carid }">修改</a>
												</td>
												<td>
													<input type="checkbox" name="carIDs" value="${car.carid }" />
													<input type="hidden" name="state" value="${state }" />
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
											if (pageNumber.intValue() < 7) {
											%>&nbsp;<%
														}
														if (pageNumber == currentPageNumber) {
											%>
											<b>&nbsp;<%=pageNumber%> </b>
											<%
											} else {
											%> &nbsp;<a href="<%=path%><%=pageUrl%>"><%=pageNumber%> </a>
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
						<tfoot>
							<c:if test="${UserSession.power.powerid == 1}">
								<tr>
									<td colspan="4" align="center">
										<input type="button" name="d" value="全选"
											onclick="selectAll();" />
									</td>
									<td colspan="4" align="center">
										<input type="button" value="删除" onclick="del()" />
									</td>
								</tr>
							</c:if>
						</tfoot>
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
	</body>
</html>
