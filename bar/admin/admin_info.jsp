<%@ page contentType="text/html; charset=gb2312" language="java"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<style type="text/css">
body{ margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}
.input1{width:80px; background-color:#333; height:20px; color:#FFF; border:1px #666 dashed}
</style>

<%
	//��ȡsession�б����UserName����ֵ
	String suname = (String) session.getAttribute("uname");
	//��ȡsession�б����UserID
	long userid = (Long) session.getAttribute("userid");	
	User.setUserid(userid);	
	//��ʼ���û���Ϣ
	User.init();
	float sMoney = User.getMoney();
%>
</head>
<body>
<div align="center"><br>
<h3>�޸�����</h3>
<form name="form1" method="post" action="modify_password_save.jsp" target="_self">
<table width="80%" border="0">
<tr>
<td width="50%" align="right" height="25">����������룺</td>
<td width="50%" align="left" height="25"><input name="OldUserPassword" type="password" size="20"></td>
</tr>
<tr>
<td width="50%" align="right" height="25">�����������룺</td>
<td width="50%" align="left" height="25"><input name="pwd" type="password" id="pwd" size="20" ></td>
</tr>
<tr>
<td width="50%" align="right" height="25">��ȷ�������룺</td>
<td width="50%" align="left" height="25"><input name="pwd1" type="password" id="pwd1" size="20" ></td>
</tr>
<tr>
<td width="100%" align="center" height="30" colspan="2">
<input name="sub" type="submit" class="input1" value="�޸�">
&nbsp;&nbsp;
<input name="res" type="reset" class="input1" value="����">
</td>
</tr>
</table>
</form>
<h3>�޸�������Ϣ</h3>
<form name="form2" method="post" action="modify_info_save.jsp" >
<table width="84%" border="0">
<tr>
<td width="7%" align="right" height="25">�û�����</td>
<td width="5%" align="left" height="25">&nbsp;<font color="#0000FF"><%=suname%></font></td>
<td width="12%" align="right">�˻���</td>
<td width="31%" align="left"><input name="money" type="text" id="money" value="<%=sMoney%>" size="20">
(<a href="https://www.alipay.com" target="_parent">֧����ת��</a> |<a href="https://ibsbjstar.ccb.com.cn/app/V5/CN/STY1/login.jsp" target="_blank"> ��������</a>)</td>
<td width="6%" align="right">������</td>
<td width="39%" align="left"><input name="name" type="text" id="name" value="<%=User.getName()%>" size="20"></td>
</tr>
<tr>
<td width="7%" align="right" height="25">�Ա�</td>
<td height="25" colspan="3" align="left"><input type="radio" name="sex" value="��" <%if(User.getSex().compareTo("��") == 0)  out.println("checked");%> >
  ��&nbsp;
  <input type="radio" name="sex" value="Ů" <%if(User.getSex().compareTo("Ů") == 0)  out.println("checked");%> >
  Ů&nbsp;
  <input type="radio" name="sex" value="����" <%if(User.getSex().compareTo("����") == 0)  out.println("checked");%>>
  ����</td>
<td width="6%" height="25" align="right">���գ�</td>
<td width="39%" height="25" align="left"><input name="birth" type="text" id="birth" value="<%=User.getBirth()%>" size="20">
  (���ڸ�ʽ����Ϊ0000-00-00)</td>
</tr>
<tr>
<td width="7%" align="right" height="25">�ʱࣺ</td>
<td height="25" colspan="3" align="left"><input name="post" type="text" id="post" value="<%=User.getPost()%>" size="50">
<td width="6%" height="25" align="right">סַ��
<td width="39%" height="25" align="left"><input name="address" type="text" id="address" value="<%=User.getAddress()%>" size="50" maxlength="400">
</tr>
<tr>
<td width="7%" align="right" height="11">Email��</td>
<td height="11" colspan="3" align="left"><input name="email" type="text" size="50" value="<%=User.getEmail()%>"></td>
<td width="6%" height="11" align="right">�绰��</td>
<td width="39%" height="11" align="left"><input name="tel" type="text" id="tel" value="<%=User.getTel()%>" size="20"></td>
</tr>
<tr>
  <td align="right" height="12">��ȫ���⣺</td>
  <td height="12" colspan="3" align="left"><input name="safequestion" type="text" id="safequestion" value="<%=User.getSafequestion()%>" size="50"></td>
  <td width="6%" height="12" align="right">�𰸣�</td>
  <td width="39%" height="12" align="left"><input name="safeanswer" type="text" id="safeanswer" value="<%=User.getSafeanswer()%>" size="50"></td>
</tr>
<tr>
<td align="center" height="30" colspan="6">
<input name="sub" type="submit" class="input1" value="�޸�">
&nbsp;&nbsp;
<input name="res" type="reset" class="input1" value="����">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>
