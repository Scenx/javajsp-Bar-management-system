<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Talk" class="com.bar.db.Talk" />
<style type="text/css">
body{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#999}
</style>

</head>


<%
	request.setCharacterEncoding("gb2312");
	String sUserName = (String) session.getAttribute("uname");
	long lUserID = (Long) session.getAttribute("userid");	
	//��ȡ�Ƿ���Ҫ����������Ϣ�Ĳ���ֵ	
	String sWords = request.getParameter("Words");
	//�ж��Ƿ���Ҫ����������Ϣ
	if(sWords != null)
	{
		//��ȡ��������
		String sContent = request.getParameter("Content");
		//��������
		
		Talk.setContent(sContent);
		Talk.setUserid(lUserID);		
		Talk.add();
	}	
		
	%>



<body>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
  <td valign="top">
	<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td align="left" height="40" colspan="3" valign="middle">���û�������Ϣ��</td>
		</tr>

<%
	//��ȡ��ǰ������������Ϣ
	ResultSet rs = Talk.show_talk();
	//ѭ����ʾ��ǰ������������Ϣ
	while(rs.next())
	{
		String sContent = rs.getString("content");
		sContent = sContent.replaceAll("\r\n","<br>");
		lUserID = rs.getLong("userid"); 
		User.setUserid(lUserID);
		User.init();
%>
	<tr bgcolor="#ffffff">
	<td width="30%" height="20" align="left" bgcolor="#33CC00" >�û�����<font color="#0000FF"><%=User.getUname()%></font></td>
	<td width="42%" height="20" align="left" bgcolor="#33CC00">����ʱ�䣺<font color="#0000FF"><%=rs.getString("createtime")%></font></td>
	<td width="42%" align="left" bgcolor="#33CC00"><a href="delete_talk.jsp?talkid=<%=rs.getString("talkid")%>">ɾ��������</a></td>
	</tr>
	<tr>
	<td align="left" colspan="3" style="border-left:1px #999 dashed;border-right:1px #999 dashed; border-bottom:1px #999 dashed; padding-top:5px;">
	<%=sContent%></td>
	</tr>
<%
	}
%>
	</table>
    </td>
    <td valign="top">
	<form name="form1" method="post" action="talk_list.jsp" target="_self">
    <input type="hidden" name="Words" value="YES">
	<table width="400" border="0" align="center" cellpadding="0" cellspacing="1">
		<tr>
		<td width="100%" align="left" height="20" >
		  <p>&nbsp;</p>
		  <p>&nbsp;&nbsp;�����û����ǣ�<font color="#0000FF"><%=sUserName%></font>�������������������д������Ϣ</p></td>
		</tr>
		<tr>
		<td width="100%" align="left" >&nbsp;
		<textarea name="Content" rows="6" cols="50"></textarea>
		</td>
		</tr>
		<td width="100%" align="left" height="30">&nbsp;
		<input type="submit" name="sub" value="��������">
		</td>
	</table>
	</form>
    
</table>
</td>
</td>
</table>

</body>
</html>