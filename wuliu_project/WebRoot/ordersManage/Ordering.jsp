<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>

<html>
	<head>
		<title>GLOBAL物流管理系统后台管理---填写订单</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />

		<script type="text/javascript"> 
		  <%--  判断收件人姓名 --%>
		function checkReceiveName() {
	    var receivename = document.getElementById("rn").childNodes[0].value;
	    if(receivename=="") {
	      var msg="<font color=red><b>×</b></font>";
	       document.getElementById("rname").innerHTML = msg;
	       return false;
	    }
	    else if(!(/^\S{1,19}$/.test(receivename))){
	       var msg="<font color=red><b>×</b></font>";
	       document.getElementById("rname").innerHTML = msg;
	       return false;
	      }
	    else {
	       var msg="<font color=green><b>√</b></font>";
	       document.getElementById("rname").innerHTML = msg;
	      return true;
	   }
	}
	
	  <%--  判断寄件人姓名 --%>
		function checkSendName() {
	       var sendname = document.getElementById("sn").childNodes[0].value;
	       if(sendname=="") {
	         var msg="<font color=red><b>×</b></font>";
	         document.getElementById("sname").innerHTML = msg;
	         return false;
	       }
	        else if(!(/^\S{1,19}$/.test(sendname))){
	        var msg="<font color=red><b>×</b></font>";
	         document.getElementById("sname").innerHTML = msg;
	         return false;
	        }
	       else {
	        var msg="<font color=green><b>√</b></font>";
	       document.getElementById("sname").innerHTML = msg;
	         return true;
	       }
	  }
	
	
	     <%--  判断收件人地址 --%>
		function checkReceiveAddress() {
	       var receiveraddress = document.getElementById("ra").childNodes[0].value;
	  if(receiveraddress=="") {
	    var msg2="<font color=red><b>×</b></font>";
	    document.getElementById("raddress").innerHTML = msg2;
	    return false;
	    }
	   else if(receiveraddress.length > 200){
	     var msg2="<font color=red><b>×</b></font>";
	     document.getElementById("raddress").innerHTML = msg2;
	      return false;
	   }
	    else {
	     var msg="<font color=green><b>√</b></font>";
	       document.getElementById("raddress").innerHTML = msg;
	     return true;
	    }
    }
       <%--  判断寄件人地址 --%>
       function checkSendAddress() {
	   var receivename = document.getElementById("sa").childNodes[0].value;
	   if(receivename=="") {
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("saddress").innerHTML = msg;
	    return false;
	   }
	    else if(receivename.length > 200){
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("saddress").innerHTML = msg;
	    return false;
	    }
	   else {
	    var msg="<font color=green><b>√</b></font>";
	       document.getElementById("saddress").innerHTML = msg;
	     return true;
	   }
	}
	
	 <%--  判断收件人固定电话 --%>
	 function checkReceiveTel() {
	   var receivename = document.getElementById("rt").childNodes[0].value;
	   if(receivename!="" &&!(/^((\d{3}-\d{8})|(\d{4}-\d{7})|(\d{11}))$/.test(receivename))){
		   var msg="<font color=red><b>×</b></font>";
	       document.getElementById("rtel").innerHTML = msg;
		   return false;
		 } 
	   else {
	     var msg="<font color=green><b>√</b></font>";
	     document.getElementById("rtel").innerHTML = msg;
	     return true;
	   }
	}
	
	<%--  判断寄件人固定电话 --%>
	 function checkSendTel() {
	   var receivename = document.getElementById("st").childNodes[0].value;
	   if(receivename!=""&&!(/^((\d{3}-\d{8})|(\d{4}-\d{7})|(\d{11}))$/.test(receivename))){
		   var msg="<font color=red><b>×</b></font>";
	       document.getElementById("stel").innerHTML = msg;
		   return false;
		 }  else {
		  var msg="<font color=green><b>√</b></font>";
	       document.getElementById("stel").innerHTML = msg;
	     return true;
	   }
	}
	
	
	<%--  判断收件人移动电话 --%>
	function checkReceiveMobile() {
	   var receivename = document.getElementById("rm").childNodes[0].value;
	   if(receivename=="") {
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("rmobile").innerHTML = msg;
	    return false;
	   }else if(!(/^\d{11}$/.test(receivename))){
		   var msg="<font color=red><b>×</b></font>";
	    document.getElementById("rmobile").innerHTML = msg;
		   return false;
		 }else {
		  var msg="<font color=green><b>√</b></font>";
	       document.getElementById("rmobile").innerHTML = msg;
	        return true;
	    }
	}
	
   <%--  判断寄件人移动电话 --%>
   function checkSendMobile() {
	    var receivename = document.getElementById("sm").childNodes[0].value;
	    if(receivename=="") {
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("smobile").innerHTML = msg;
	    return false;
	   }else if(!(/^\d{11}$/.test(receivename))){
		   var msg="<font color=red><b>×</b></font>";
	    document.getElementById("smobile").innerHTML = msg;
		   return false;
		 }else {
		  var msg="<font color=green><b>√</b></font>";
	       document.getElementById("smobile").innerHTML = msg;
	     return true;
	   }
	}
	
	<%--  判断收件人邮编 --%>
	function checkReceivePostCode() {
	   var receivename = document.getElementById("rp").childNodes[0].value;
	   if(receivename=="") {
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("rpostcode").innerHTML = msg;
	    return false;
	   } else if(!(/^\d+$/.test(receivename))){
		  var msg="<font color=red><b>×</b></font>";
	    document.getElementById("rpostcode").innerHTML = msg;
		   return false;
		 }
		else if(receivename.length > 20){
		   var msg="<font color=red><b>×</b></font>";
	       document.getElementById("rpostcode").innerHTML = msg;
		   return false;
	   }
		else {
		   var msg="<font color=green><b>√</b></font>";
	       document.getElementById("rpostcode").innerHTML = msg;
	       return true;
	   }
	}
	
	<%--  判断寄件人邮编 --%>
	function checkSendPostCode() {
	   var receivename = document.getElementById("sp").childNodes[0].value;
	   if(receivename=="") {
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("spostcode").innerHTML = msg;
	    return false;
	   } else if(!(/^\d+$/.test(receivename))){
		  var msg="<font color=red><b>×</b></font>";
	    document.getElementById("spostcode").innerHTML = msg;
		   return false;
		 }
	  else if(receivename.length > 20){
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("spostcode").innerHTML = msg;
		   return false;
	  }
	   else {
	    var msg="<font color=green><b>√</b></font>";
	       document.getElementById("spostcode").innerHTML = msg;
	     return true;
	   }
	}
	
	<%--  判断物品重量 --%>
	function checkWeight() {
	   var receivename = document.getElementById("we").childNodes[0].value;
	   if(receivename=="") {
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("w").innerHTML = msg;
	    return false;
	   } else if(!(/^\d+(\.\d+)?$/.test(receivename))){
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("w").innerHTML = msg;
		    return false;
		 }
		 else if(receivename<=0 || receivename>9999){
		  var msg="<font color=red><b>×</b></font>";
	      document.getElementById("w").innerHTML = msg;
		    return false;
		 } 
		  else {
		  var msg="<font color=green><b>√</b></font>";
	       document.getElementById("w").innerHTML = msg;
	     return true;
	   }
	}
	
	<%--  判断物品体积 --%>
	function checkVolume(){
	   var receivename = document.getElementById("vo").childNodes[0].value;
	   if(receivename=="") {
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("v").innerHTML = msg;
	    return false;
	   } else if(!(/^\d+(\.\d+)?$/.test(receivename))){
	   var msg="<font color=red><b>×</b></font>";
	    document.getElementById("v").innerHTML = msg;
		    return false;
		 }
     else if(receivename<=0 || receivename>9999){
      var msg="<font color=red><b>×</b></font>";
	    document.getElementById("v").innerHTML = msg;
		    return false;
     }
      else {
		  var msg="<font color=green><b>√</b></font>";
	       document.getElementById("v").innerHTML = msg;
	     return true;
	   }
	}
	
	   <%--  判断物品备注 --%>
		function checkRemark(){
	   var receivename = document.getElementById("re").childNodes[0].value;
	   if(receivename=="") {
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("r").innerHTML = msg;
	    return false;
	   }
	   else if(receivename.length >200){
	    var msg="<font color=red><b>×</b></font>";
	    document.getElementById("r").innerHTML = msg;
	    return false;
	   }
	   else {
	    var msg="<font color=green><b>√</b></font>";
	       document.getElementById("r").innerHTML = msg;
	     return true;
	   }
	}
	<%--  判断物品估价 --%>
	function checkGoodsPrice() {
	   var receivename = document.getElementById("gp").childNodes[0].value;
	   if(receivename=="") {
	     return true;
	   }else if(!(/^\d+(\.\d+)?$/.test(receivename))){
	   var msg="<font color=red><b>×</b></font>";
	    document.getElementById("g").innerHTML = msg;
		    return false;
		 } 
		 else if(receivename<=0 || receivename>9999){
		 var msg="<font color=red><b>×</b></font>";
	    document.getElementById("g").innerHTML = msg;
		    return false;
		 }
		 else {
		  var msg="<font color=green><b>√</b></font>";
	       document.getElementById("g").innerHTML = msg;
		   return true;
		 }
	}
	
	
	function check() {
	
	
	
	  result1 = checkReceiveName();
	  result2 = checkReceiveAddress();
      result3 = checkReceiveTel();
      result4 = checkReceiveMobile();
      result5 = checkReceivePostCode();
      
      result6 = checkSendName();
	  result7 = checkSendAddress();
      result8 = checkSendTel();
      result9 = checkSendMobile();
      result10 = checkSendPostCode();
      
      result11 = checkWeight();
      result12 = checkVolume();
	  result13 = checkRemark();
	  result13 = checkGoodsPrice()
	   if(result1&&result2&&result3&&result4&&result5&&result6&&result7&&result8&&result9&&result10&&result11&&result12&&result13&&result14){
	        return true;
	      }
	      else{
		    return false;
		  }
	}
	
	
	
		</script>
		<SCRIPT language=javascript src="<%=path%>/js/calendar.js"></SCRIPT>
	</head>

	<body>
	<c:if test="${UserSession.power.powerid==3}">
		<center>
			<h1> 
				填写新订单
			</h1>

			<html:form action="/check/order?methodName=addOrder"
				onsubmit="return check()">
				<table border="1" class="t1" width="760" height="400">
					<tr>
						<td colspan="2" align="center">
							收件人详细信息
							<br>
						</td>
						<td colspan="2" align="center">
							寄件人详细信息
							<br>
						</td>
					</tr>
					<tr>
						<td>
							姓名
							<br>
						</td>
						<td id="rn">
							<html:text property="receiveName" onblur="checkReceiveName()" />
							<html:errors property="receiveName" />
							<span id="rname"></span>
							<br>
						</td>
						<td>
							姓名
							<br>
						</td>
						<td id="sn">
							<html:text property="sendName" onblur="checkSendName()" />
							<html:errors property="sendName" />
							<span id="sname"></span>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							地址
							<br>
						</td>
						<td id="ra">
							<html:textarea property="receiveAddress" cols="25" rows="3"
								onblur="checkReceiveAddress()" />
							<html:errors property="receiveAddress" />
							<span id="raddress"></span>
							<br>
						</td>
						<td>
							地址
							<br>
						</td>
						<td id="sa">
							<html:textarea property="sendAddress" cols="25" rows="3"
								onblur="checkSendAddress()" />
							<html:errors property="sendAddress" />
							<span id="saddress"></span>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							固定电话
							<br>
						</td>
						<td id="rt">
							<html:text property="receiveTel" onblur="checkReceiveTel()" />
							<html:errors property="receiveTel" />（选填）
							<span id="rtel"></span>
							<br>
						</td>
						<td>
							固定电话
							<br>
						</td>
						<td id="st">
							<html:text property="sendTel" onblur="checkSendTel()" />
							<html:errors property="sendTel" />（选填）
							<span id="stel"></span>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							电话（手机）
							<br>
						</td>
						<td id="rm">
							<html:text property="receiveMobile" onblur="checkReceiveMobile()" />
							<html:errors property="receiveMobile" />
							<span id="rmobile"></span>
							<br>
						</td>
						<td>
							电话（手机）
							<br>
						</td>
						<td id="sm">
							<html:text property="sendMobile" onblur="checkSendMobile()" />
							<html:errors property="sendMobile" />
							<span id="smobile"></span>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							邮编
							<br>
						</td>
						<td id="rp">
							<html:text property="receivePostCode"
								onblur="checkReceivePostCode()" />
							<html:errors property="receivePostCode" />
							<span id="rpostcode"></span>
							<br>
						</td>
						<td>
							邮编
							<br>
						</td>
						<td id="sp">
							<html:text property="sendPostCode" onblur="checkSendPostCode()" />
							<html:errors property="sendPostCode" />
							<span id="spostcode"></span>
							<br>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							货物信息
							<br>
						</td>
						<td colspan="2" align="center">
							支付信息
							<br>
						</td>
					</tr>

					<tr>
						<td>
							重量（kg）
							<br>
						</td>
						<td id="we">
							<html:text property="weight" onblur="checkWeight()" />
							<html:errors property="weight" />
							<span id="w"></span>
							<br>
						</td>

						<td>
							物品估价（￥元）
							<br>
						</td>
						<td id="gp">
							<html:text property="goodsPrice" onblur="checkGoodsPrice()" />
							<html:errors property="goodsPrice" />
							<span id="g"></span>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							体积（m3）
							<br>
						</td>
						<td id="vo">
							<html:text property="volume" onblur="checkVolume()" />
							<html:errors property="volume" />
							<span id="v"></span>
							<br>
						</td>

					</tr>
					<tr>
						<td>
							备注(注明货物明细)
							<br>
						</td>
						<td colspan="3" id="re">
							<html:textarea property="remark" cols="65" rows="3"
								onblur="checkRemark()" />
							<html:errors property="remark" />（选填|200）
							<span id="r"></span>
							<br>
							<br>
						</td>

					</tr>
					<tr>
					<td colspan="2">
					&nbsp;
					</td>
						<td colspan="2">
							<html:submit>提交</html:submit>
		               &nbsp;&nbsp;&nbsp;&nbsp;
							<html:reset>重置</html:reset>
						</td>
					</tr>
				</table>
			</html:form>
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

