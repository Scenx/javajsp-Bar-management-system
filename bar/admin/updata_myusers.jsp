<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="Myusers" class="com.bar.db.Myusers" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

	<style type="text/css">
	body{margin:0 auto; padding-top:10px; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
	.input1{width:250px; height:20px;}
	.input2{ width:80px; height:20px; border: 1px #999 dashed; background-color:#333; color:#fff}
	.input3{width:400px; height:20px;}
	</style>
    
    
    <%
	    String strPage = request.getParameter("showPage");
		String sMyuserid = request.getParameter("Myuserid");
		long lMyuserid = Long.parseLong(sMyuserid);
		Myusers.setMyuserid(lMyuserid);
		Myusers.init();	
		
	%>
    
	</head>
	<body bgcolor="#F2F2F2">
	<div align="center">
	<form name="form1" method="post" action="updata_myusers_save.jsp" target="_self">
    <input name="Myuserid" type="hidden" class="input2" value="<%=Myusers.getMyuserid()%>" />
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<td height="25" colspan="4" align="center"><h1 style="color:#0F3; font-size:14px">����¹�Ӧ����Ϣ</h1>
	    <p style="color: #F00; font-size:12px">����ѡ���Ϊ�������������д������д������ɾ��������Ϣ��������ӣ�</p></td>
	  </tr>
	<tr>
		<td width="13%"height="39" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</td>
		<td width="30%"height="39" align="left">&nbsp;&nbsp;<input name="Myuname" type="text" class="input1" id="Myuname" value="<%=Myusers.getMyuname()%>" size="20"></td>
		<td height="41" align="right">����Ӧơ�Ƶ����ͣ�</td>
		<td height="41" align="left">&nbsp;&nbsp;
		  <input name="Pname" type="text" class="input1" id="Pname" value="<%=Myusers.getPname()%>" size="20"></td>
	  </tr>
	<tr>
	  <td height="48" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
	  <td height="48" align="left">&nbsp;&nbsp;
	    <input type="radio" value="��" name="Sex" <%if(Myusers.getSex().equals("��")) out.println("checked");%>>
	    ��&nbsp;
	    <input type="radio" value="Ů" name="Sex" <%if(Myusers.getSex().equals("Ů")) out.println("checked");%>>
	    Ů</td>
	  <td height="48" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�䣺</td>
	  <td height="48" align="left">&nbsp;&nbsp;
	    <input name="Email" type="text" class="input1" value="<%=Myusers.getEmail()%>" size="20"></td>
	  </tr>
	<tr>
	  <td height="39" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</td>
	  <td height="39" align="left">&nbsp;&nbsp;
	    <input name="Tel" type="text" class="input1" id="Tel" value="<%=Myusers.getTel()%>" size="20"></td>
		<td width="20%"height="48" align="right">&nbsp;</td>
		<td width="37%"height="48" align="left">&nbsp;</td>
	</tr>
	<tr>
	  <td height="48" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
	  <td height="48" colspan="3" align="left">&nbsp;&nbsp;<input name="Addr" type="text" class="input3" id="Tel" value="<%=Myusers.getAddress()%>" size="20"></td>
	  </tr>
	<tr>
	  <td height="39" colspan="4" align="center"><p>��дע�����
</p>
	    <p>����Ѿ�ȷ����Ϣ��ȷ������&ldquo;���&rdquo;��ť����������&ldquo;���&rdquo;��ť�ػ�������д</p></td>
	  </tr>

	</table>
	<p>
	<input name="sub" type="submit" class="input2" value="���">&nbsp;&nbsp;
	<input name="res" type="reset" class="input2" value="���">&nbsp;&nbsp;
    <input type="button" name="btn2" value="����" onClick="window.history.go(-1)" class="input2">
	</p>
	</form>
	</div>
	</body>
</html>
