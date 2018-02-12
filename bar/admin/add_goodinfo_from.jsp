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

	</head>


	<body bgcolor="#F4FFFE">
	<div align="center">
		<form name="form1" method="post" action="./add_goodinfo_save.jsp" target="_self" enctype="multipart/form-data">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
			<td height="33" colspan="2" align="center"><h1 style="color: #66F; font-size:12px">添加新的酒水套餐<br>请准确填写一下信息，在确认无误后点击提交按钮进行保存</h1></td>
		  </tr>
			<tr>
			<td width="26%" height="33" align="right">套餐名称：</td>
			<td width="74%" height="33" align="left">&nbsp;<input name="Goodinfoname" type="text" class="input1" id="Goodinfoname" size="30"></td>
			</tr>
			<tr>
			<td width="26%" height="32" align="right">啤酒厂家：</td>
			<td width="74%" height="32" align="left">&nbsp;<input name="Company" type="text" class="input1" size="30"></td>
			</tr>
			<tr>
			<td width="26%" height="38" align="right">啤酒产地：</td>
			<td width="74%" height="38" align="left">&nbsp;<input name="Addr" type="text" class="input1" size="30"></td>
			</tr>
			<tr>
			  <td height="36" align="right">啤酒数量：</td>
			  <td width="74%" height="36" align="left">&nbsp;<input name="Num" type="text" class="input1" id="Num" size="30">
			    /打</td>
	      </tr>
			<tr>
			<td width="26%" height="38" align="right">啤酒价格：</td>
			<td width="74%" height="38" align="left">&nbsp;<input name="Price" type="text" class="input1" size="10">（RMB）</td>
			</tr>
			<tr>
			  <td height="37" align="right">上传图片：</td>
			  <td width="74%" height="37" align="left">&nbsp;<input name="Picurl" type="file" id="Picurl"  size="50"></td>
	      </tr>
			<tr>
			<td width="26%" height="127" align="right">商品简介：</td>
			<td width="74%" height="127" align="left">&nbsp;<textarea name="Intro" rows="8" cols="80"></textarea></td>
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
