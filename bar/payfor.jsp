<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="systems.jsp" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="keywords" content="<%=Keywords%>" />
<meta http-equiv="description" content="<%=Description%>" />
<title><%=Sitename%>-确认订购信息</title>
<style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
td{border-bottom:1px #999 dashed}
.font1{color:#09F; font-size:12px}
.font2{color:#F00}
</style>
<script type="text/javascript" src="js/jquery-latest.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/javascript.js" type="text/javascript"></script>
<script type="text/javascript"> 
$(document).ready(function(){

	$("ul.subnav").parent().append("<span></span>"); 
	
	$("ul.topnav li span").click(function() { 
		
		
		$(this).parent().find("ul.subnav").slideDown('fast').show(); 

		$(this).parent().hover(function() {
		}, function(){	
			$(this).parent().find("ul.subnav").slideUp('slow'); 
		});

		
		}).hover(function() { 
			$(this).addClass("subhover"); 
		}, function(){
			$(this).removeClass("subhover"); 
	});

});
</script>

		<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
		<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
	</head>
	<%
		//获取商品索引号
		String sGoodinfoid = request.getParameter("Goodinfoid");
		long lGoodinfoid = Long.parseLong(sGoodinfoid);

		//获取商品信息
		Goodinfo.setGoodinfoid(lGoodinfoid);	
		Goodinfo.init();

		String strPage = request.getParameter("showPage");
	%>

	<body >
    <%@ include file="inc/header.jsp" %>
    <table width="960" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td>
<iframe src="inc/top_news.jsp" frameborder="0" scrolling="no" width="960" height="30"></iframe>
</td>
</tr>
</table>
	<div align="center">
	<table width="100%" cellpadding="0" cellspacing="1">
		<tr  bgcolor="#0066FF">
		<td width="100%" colspan="2" height="30" align="center"><font color="#FFFFFF">您要购买的商品信息如下</font></td>
		</tr>
		<tr>
		<td width="50%" height="25" align="right">【商品名称】&nbsp;&nbsp;</td>
		<td width="50%" height="25" align="left">&nbsp;<font color="#0000FF"><%=Goodinfo.getGoodinfoname()%></font></td>
		</tr>
		<tr>
		<td width="50%" height="25" align="right">【商品类别】&nbsp;&nbsp;</td>
		<td width="50%" height="25" align="left">&nbsp;<font color="#0000FF"><%=Goodinfo.getCompany()%></font></td>
		</tr>
		<tr>
		<td width="50%" height="25" align="right">【产&nbsp;&nbsp;&nbsp;&nbsp;地】&nbsp;&nbsp;</td>
		<td width="50%" height="25" align="left">&nbsp;<font color="#0000FF"><%=Goodinfo.getAddr()%></font></td>
		</tr>
		<tr>
		<td width="50%" height="25" align="right">【啤酒总数】&nbsp;&nbsp;</td>
		<td width="50%" height="25" align="left">&nbsp;<font color="#0000FF"><%=Goodinfo.getNum()%>打</font></td>
		</tr>
		<tr>
		<td width="50%" height="25" align="right">【价&nbsp;&nbsp;&nbsp;&nbsp;格】&nbsp;&nbsp;</td>
		<td width="50%" height="25" align="left">&nbsp;<font color="#0000FF"><%=Goodinfo.getPrice()%></font>（RMB）</td>
		</tr>
	</table>
	<p>
	<form name="form1" method="post" action="add_goods_save.jsp" target="_self">
	<input type="hidden" name="showPage" value="<%=strPage%>">
	<input type="hidden" name="Goodinfoid" value="<%=Goodinfo.getGoodinfoid()%>">
    <input type="hidden" name="Price" value="<%=Goodinfo.getPrice()%>">
	<font class="font1">请输入您要购买的商品数量：</font><input type="text" name="BuyNumber" value="1" size="5">&nbsp;
	<input type="submit" name="sub" value="确定">
	</form>
	</p>
	</div>
    <table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
<%@ include file="inc/footer.jsp" %>
    </td>
  </tr>
</table>
	</body>
</html>
