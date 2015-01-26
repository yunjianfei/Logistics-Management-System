<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
String path = request.getContextPath();
%>
<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---生成报表</title>
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/style/wuliu_back.css" />
		<script language="javascript" src="<%=path%>/js/baobiao.js"></script>
		<SCRIPT language=javascript src="<%=path%>/js/calendar.js"></SCRIPT>
		<script type="text/javascript">
			function test(){
				DeliverySpotDaoJS.queryAllDeliverySpotOfAddLine(callback);
			}
		
			function callback(list){
				dwr.util.removeAllOptions("dsid");
				dwr.util.addOptions("dsid",list,"deliveryspotid","name");
				
			}	
		</script>
		<script type="text/javascript">
		function compareDate()
		{ 
		var DateOne = document.getElementById("t1").value;
		var DateTwo = document.getElementById("t2").value;
		
		var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ("-"));
		var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ("-")+1);
		var OneYear = DateOne.substring(0,DateOne.indexOf ("-"));
		
		var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ("-"));
		var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ("-")+1);
		var TwoYear = DateTwo.substring(0,DateTwo.indexOf ("-"));
		if (DateOne == ""){
		   var msg ="<font color=red><b>×</b></font>";
		   document.getElementById("time").innerHTML=msg;
		   return false;
		}
		else if(DateTwo == ""){
		   var msg ="<font color=red><b>×</b></font>";
		   document.getElementById("time").innerHTML=msg;
		   return false;
		}
		else{
		if (Date.parse(OneMonth+"/"+OneDay+"/"+OneYear) >
		Date.parse(TwoMonth+"/"+TwoDay+"/"+TwoYear))
		{
		   var msg ="<font color=red><b>×</b></font>";
		   document.getElementById("time").innerHTML=msg;
		  return false;
		}

		  else
		  {
		   return true;
		   }
		  }
		}

		  function submitFrom(){
		     var f = document.forms[0];
		    if(compareDate())
		    {
		 
		     if(document.getElementById("hq").checked == true){
		        f.action = "<%=path%>/check/report.do?methodName=queryHQ";
		       f.submit();
		     }
		    else{
		       f.action = "<%=path%>/check/report.do?methodName=queryDeliverySpot";
		       f.submit();
		      }
		    }
		    else{
		    return;
		    }
		   }
		  
		   function submitFrom2(){
		   
		    var f = document.forms[0];
		    if(compareDate())
		    {
		     f.action = "<%=path%>/check/report.do?methodName=queryDeliverySpot";
		     f.submit();
		    }
		    else{
		      return;
		    }
		  }
		</script>
<script type="text/javascript">
			var aDataList = new Array();
			function DataInfo(a1, a2, a3) 
			{
			    this.a1 = a1;
				this.a2 = a2;
				this.a3 = a3;
			}
			
function putDataInExcel(sTitle, aDataList, iCount) 
{
//*******************************
//参数说明：sTitle---------报表题目
//        aDataList-------数据对象
//*******************************

//NO.1 Step: get Excel Sheet.
//***********************************************************************************************
    if (iCount == 0) {
	    alert("无数据，不能进行该操作！")
		return false;
    }

	var theSheet;
	try
	{
		theSheet = getExcelSheet();
	} catch(exception) {
        alert("Error!" + "\n" + "可能原因是你的浏览器的安全级别太高！");
	    return false;
    }
//***********************************************************************************************
//NO.2 Step:draw title
//***********************************************************************************************
    theSheet.Cells(1,1).Value = sTitle;
    with (theSheet.Range("A1:C2")) {
        Font.Name = "楷体_GB2312"
	    Font.FontStyle = "加粗"
	    Font.Size = 14
	    RowHeight = 30
	    HorizontalAlignment = -4108
	    VerticalAlignment = -4108
	    Mergecells = true
    }
//***********************************************************************************************

//NO.3 Step:draw theSheet
//***********************************************************************************************

    theSheet.Cells(3, 1).Value = "订单号";
    with (theSheet.Range("A3")) 
    {
        Font.Name = "楷体_GB2312"
	    Font.FontStyle = "加粗"
	    Font.Size = 12
	    RowHeight = 25
	    HorizontalAlignment = -4131
	    VerticalAlignment = -4108
	    Mergecells = true
    }
	theSheet.Cells(3, 2).Value = "价格(元)";
	with (theSheet.Range("B3")) 
    {
        Font.Name = "楷体_GB2312"
	    Font.FontStyle = "加粗"
	    Font.Size = 12
	    RowHeight = 25
	    HorizontalAlignment = -4131
	    VerticalAlignment = -4108
	    Mergecells = true
    }
	theSheet.Cells(3, 3).Value = "创建时间";
	with (theSheet.Range("C3")) 
    {
        Font.Name = "楷体_GB2312"
	    Font.FontStyle = "加粗"
	    Font.Size = 12
	    RowHeight = 25
	    HorizontalAlignment = -4131
	    VerticalAlignment = -4108
	    Mergecells = true
    }
    
    alert(aDataList[0]);
	
	for (var i = 0; i < iCount; i ++)
	{	
        theSheet.Cells((4 + i), 1).Value = aDataList[i].a1;
    	theSheet.Cells((4 + i), 2).Value = aDataList[i].a2;
    	theSheet.Cells((4 + i), 3).Value = aDataList[i].a3;
    }
	with (theSheet.Range("A3:C3")) {
        Font.Name = "宋体"
	    Font.FontStyle = "加粗"
	    Font.Size = 9
	    RowHeight = 30
	    HorizontalAlignment = -4108
	    VerticalAlignment = -4108
		Borders.LineStyle = 1
	    Borders.Weight = 2
	    Borders.ColorIndex = 1
		Interior.ColorIndex = 34
        Interior.Pattern = 1
        Interior.PatternColorIndex = -4105
    }
    cons = "A4:C" + (3 + parseInt(iCount));
    with (theSheet.Range(cons)) {
	    Font.Name = "宋体"
	    Font.FontStyle = "常规"
	    Font.Size = 9
	    RowHeight = 20
	    HorizontalAlignment = -4152
	    VerticalAlignment = -4108
		Borders.LineStyle = 1
	    Borders.Weight = 2
	    Borders.ColorIndex = 1
		NumberFormatLocal = "#,##0"
    }
    var total = document.getElementById("total").value;
    var t = document.getElementById("t").value;
    
    cons = "A" + (4 +parseInt(iCount)) + ":C" + (4 +parseInt(iCount));
	with (theSheet.Range(cons)) {
	    Font.Name = "宋体"
	    Font.FontStyle = "常规"
	    Font.Size = 9
	    RowHeight = 20
	    HorizontalAlignment = -4108
	    VerticalAlignment = -4108
		Borders.LineStyle = 1
	    Borders.Weight = 2
	    Borders.ColorIndex = 1
		MergeCells = true
    }
    theSheet.Cells((4 + parseInt(iCount)), 1).Value = "总营业额：￥" + total + "        " + t;
	theSheet.Columns("A:A").ColumnWidth = 30;
	theSheet.Columns("B:B").ColumnWidth = 20;
	theSheet.Columns("C:C").ColumnWidth = 20;
//***********************************************************************************************
}

function getExcelSheet() {//得到Excel工作表
    var theSheet;
    theApp = new ActiveXObject("Excel.Application");
	theApp.Visible = true;
    theApp.WorkBooks.Add
	theSheet = theApp.ActiveSheet;

	return theSheet
}

function GetAlphabet(number) {//输入数字得到字母，如0----A, 1-----B
	var iCount;
	var iRemainder;
	var tmpstr;
	
	iCount = parseInt(number/26)
	
	iRemainder = number % 26
	
	if (iCount == 0) {
		tmpstr = String.fromCharCode(iRemainder + 65)          
	} else {
		tmpstr = String.fromCharCode(iCount + 64) + String.fromCharCode(iRemainder + 65)          
	}

	return tmpstr
}

function getE(){
	var msg = document.getElementById("msg").value;
	var s = document.getElementById("s").value;
	putDataInExcel(msg,aDataList,s);
}
</script>


		<script src='/wuliu_project/dwr/interface/DeliverySpotDaoJS.js'></script>
		<script src='/wuliu_project/dwr/engine.js'></script>
		<script src='/wuliu_project/dwr/util.js'></script>
	</head>
	<body onload="test()">
		<c:if test="${UserSession.power.powerid != 3}">
		<h1>
			生成报表
		</h1>
		<center>
			<form action="<%=path%>/check/report.do?methodName=queryHQ" name="f1"
				method="post">
				<input type="hidden" id="s" value="${size }"/>
				<table border="1" class="t1">

					<tr>
						<c:if test="${UserSession.power.powerid == 1}">
							<td>
								<input type="radio" name="op" id="hq" value="1"
									checked="checked" onClick="points1();">
								总部
								<br>
								<input type="radio" name="op" value="2" onClick="points();">
								配送点
								<div id="points" style="display:none; ">
									<select name="dsid" id="dsid">
									</select>
								</div>
							</td>
						</c:if>
						<td>
							<c:if test="${UserSession.power.powerid == 2}">
								<b>${UserSession.deliveryspot.name}</b>
							</c:if>
							&nbsp;从
							<input name="txtDate1" id="t1" class="textborder" type="text"
								readonly="true" size="12" />
							<a title=选择日期
								href="javascript:fPopCalendar(document.all.img1,document.f1.txtDate1,250);"
								style="text-decoration:none"> <img id=img1
									src="<%=path%>/images/img_date.gif" width="22" align=absMiddle
									border=0></img> </a> 至
							<input name="txtDate2" id="t2" class="textborder" type="text"
								readonly="true" size="12" />
							<a title=选择日期
								href="javascript:fPopCalendar(document.all.img2,document.f1.txtDate2,400);"
								style="text-decoration:none"> <img id=img2
									src="<%=path%>/images/img_date.gif" width="22" align=absMiddle
									border=0></img> </a>
						</td>
						<td align="center">
							<font><span id="time"></span> <c:if
									test="${UserSession.power.powerid == 1}">
									<input type="button" value="生成" onclick="submitFrom();" />
								</c:if> <c:if test="${UserSession.power.powerid == 2}">
									<input type="hidden" name="dsid"
										value="${UserSession.deliveryspot.deliveryspotid }" />
									<input type="button" value="生成" onclick="submitFrom2();" />
								</c:if>
						</td>
					</tr>
				</table>
			</form>
			<hr />
			<c:if test="${reportList != null}">
				<table cellpadding="0" cellspacing="0" class="t2" align="center">
					<tr>
						<th colspan="3" align="center">
							<h2>
								${msg }<font color="red">共${size }条记录</font>
								<input type="hidden" id="msg" value="${msg }"/>
							</h2>
						</th>
					</tr>
					<tr>
						<th>
							订单号
						</th>
						<th>
							价格
						</th>
						<th>
							时间
						</th>
					</tr>
					<tbody>
						<c:forEach var="rL" items="${reportList}" varStatus="status">
							<tr>
								<td>
									${rL.orderno }
								</td>
								<td>
									${rL.totalprice }
								</td>
								<td>
									${rL.createtime }
									<input type="hidden" id="ct" value="${rL.createtime }">
								</td>
							</tr>
							  <SCRIPT language="JavaScript">
							        aDataList[ ${status.index } ] = new DataInfo( ${rL.orderno } , ${rL.totalprice } , ${rL.createtime } );
							  </SCRIPT>
							
						</c:forEach>
						<tr>
							<td colspan="2" align="right">
								总营业额：￥${total }&nbsp;
								<input type="hidden" id="total" value="${total }">
							</td>
							<td>
								${time }
								<input type="hidden" id="t" value="${time }">
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3">
								<input type="button" name="outToExcel" class="bt1" value="导出到Excel" onClick="getE()">
							</td>
						</tr>
					</tfoot>
				</table>
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
