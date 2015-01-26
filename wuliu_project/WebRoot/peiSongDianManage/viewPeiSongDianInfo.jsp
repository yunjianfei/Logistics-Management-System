<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>GLOBAL物流管理系统后台管理---查看配送点具体信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<%=path %>/style/wuliu_back.css" />
</head>
<body>
<center>
  <table width="632" border="0" class="t1">
    <tr>
      <td>站点名称： <font color="red">${Deliveryspot.name }</font> </td>
      <td align="right">TEL： ${Deliveryspot.tel } </td>
    </tr>
    <tr>
      <td   colspan="2"><hr></td>
    </tr>
    <tr>
      <td colspan="2">站点地址： ${Deliveryspot.province.name }--${Deliveryspot.city.name } </td>
    </tr>
     <tr>
      <td colspan="2"><hr></td>
    </tr>
    <tr>
      <td>首公斤范围：${Deliveryspot.startscope }&nbsp;公斤 </td>
      <td >首公斤价格：￥${Deliveryspot.startprice }&nbsp;元</td>
    </tr>
    <tr>
      <td></td>
      <td>次公斤价格：￥${Deliveryspot.secondprice }&nbsp;元/公斤 </td>
    </tr>
     <tr>
      <td colspan="2"><hr></td>
    </tr>
    
    <tr>
      <td>首体积范围：${Deliveryspot.startvolumescope }&nbsp;立方米 </td>
      <td >首体积价格：￥${Deliveryspot.startvolumeprice }&nbsp;元</td>
    </tr>
    <tr>
      <td></td>
      <td>次体积价格：￥${Deliveryspot.secondvolumeprice }&nbsp;元/立方米 </td>
    </tr>
  </table>
</center>
</body>
</html>
