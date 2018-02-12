<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		.input1{width:200px; height:20px;}
		.input2{ width:80px; height:20px; color:#FFF; background-color:#333; border:1px #CCC dashed;}
		</style>
        <jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
	</head>

<%
	//获取商品的索引号
	String sGoodinfoid = request.getParameter("Goodinfoid");
	long lGoodinfoid = Long.parseLong(sGoodinfoid);
	
	
	
	//获取商品信息
	Goodinfo.setGoodinfoid(lGoodinfoid);
	Goodinfo.init();
	ResultSet rs = Goodinfo.show_goodinfo();
%>
	<body bgcolor="#F4FFFE">
	<div align="center">
	  <form name="form1" method="post" action="./goodinfo_updata_save.jsp" target="_self" enctype="multipart/form-data">
        <input type="hidden" name="Goodinfoid" value="<%=lGoodinfoid%>">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
			<td height="33" colspan="3" align="center"><h1 style="color: #66F; font-size:12px">添加新的酒水套餐<br>请准确填写一下信息，在确认无误后点击提交按钮进行保存</h1></td>
		  </tr>
			<tr>
			<td width="25%" height="33" align="right">套餐名称：</td>
			<td width="41%" height="33" align="left">&nbsp;<input name="Goodinfoname" type="text" class="input1" size="30" value="<%=Goodinfo.getGoodinfoname()%>"></td>
			<td width="34%" rowspan="6" align="left"><img src="../pic/<%=Goodinfo.getPicurl()%>" border="0" width="300px" height="200px"></td>
			</tr>
			<tr>
			<td width="25%" height="32" align="right">啤酒厂家：</td>
			<td width="41%" height="32" align="left">&nbsp;<input name="Company" type="text" class="input1" size="30" value="<%=Goodinfo.getCompany()%>"></td>
			</tr>
			<tr>
			<td width="25%" height="38" align="right">啤酒产地：</td>
			<td width="41%" height="38" align="left">&nbsp;<input name="Addr" type="text" class="input1" size="30" value="<%=Goodinfo.getAddr()%>"></td>
			</tr>
			<tr>
			  <td height="36" align="right">啤酒数量：</td>
			  <td width="41%" height="36" align="left">&nbsp;<input name="Num" type="text" class="input1" size="30" value="<%=Goodinfo.getNum()%>">
			    /打</td>
		  </tr>
			<tr>
			<td width="25%" height="38" align="right">啤酒价格：</td>
			<td width="41%" height="38" align="left">&nbsp;<input name="Price" type="text" class="input1" size="10" value="<%=Goodinfo.getPrice()%>">（RMB）</td>
			</tr>
			<tr>
			  <td height="37" align="right">上传图片：</td>
			  <td width="41%" height="37" align="left">&nbsp;<input name="Picurl" type="file" size="50"></td>
		  </tr>
			<tr>
			<td width="25%" height="127" align="right">商品简介：</td>
			<td height="127" colspan="2" align="left">&nbsp;<textarea name="Intro" rows="8" cols="80"><%=Goodinfo.getIntro()%></textarea></td>
			</tr>
		</table>
		<p>
		<input name="sub" type="submit" class="input2" value="提交">&nbsp;&nbsp;
		<input name="res" type="reset" class="input2" value="重填">&nbsp;&nbsp;
		<input type="button" name="btn" value="返回" onClick="javascript:window.history.go(-1)" class="input2"></p>
	  </form>
	</div>
	</body>
</html>
