<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<%
	String uname = (String) session.getAttribute("uname");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Music" class="com.bar.db.Music" />
<style type="text/css">
body{ font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#999}
a:link { color: #FF0; text-decoration: none} 
a:visited { color: #FF0; text-decoration: none} 
a:hover { color: #FF0; text-decoration: none} 
a:active { color: #FF0; text-decoration: none}
.font1{color:#FFF}

.input1{width:400px; height:20px;}
</style>

</head>


<%
	request.setCharacterEncoding("gb2312");
	String sUserName = (String) session.getAttribute("uname");
	long lUserID = (Long) session.getAttribute("userid");

	String sMusicname = request.getParameter("musicname");

	if(sMusicname != null)
	{
		//��ȡ��������
		String sMusicurl = request.getParameter("musicurl");
		//��������
		
		Music.setMusicname(sMusicname);
		Music.setMusicurl(sMusicurl);
		Music.setUserid(lUserID);
		Music.add();
	}	
		
	%>



<body>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#66FFFF">
<tr>
  <td><table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left" height="40" colspan="2" valign="middle">���û��Ƽ������֡�</td>
    </tr>
    <%
	//��ȡ��ǰ������������Ϣ
	ResultSet rs = Music.show_music();
	//ѭ����ʾ��ǰ������������Ϣ
	while(rs.next())
	{
		String sMusicurl = rs.getString("musicurl");
		sMusicurl = sMusicurl.replaceAll("\r\n","<br>");
		lUserID = rs.getLong("userid"); 
		User.setUserid(lUserID);
		User.init();
%>
    <tr bgcolor="#ffffff">
      <td height="20" colspan="3" align="left" bgcolor="#66CC00" ><span class="font1">�����ߣ�</span><font color="#0000FF"><%=User.getUname()%></font>&nbsp;&nbsp;<span class="font1">&nbsp;&nbsp;�������֣�</span><font color="#0000FF"><%=rs.getString("musicname")%></font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#0000FF"><a href="<%=sMusicurl%>" target="_blank">����</a></font>&nbsp;&nbsp;&nbsp;&nbsp;<a href="delete_music.jsp?musicid=<%=rs.getString("musicid")%>">ɾ��</a></td>
      </tr>
    <tr>
      <td width="98%" align="left"  style="border-left:1px #999 dashed;border-right:1px #999 dashed; border-bottom:1px #999 dashed; padding-top:5px;"><embed src="<%=sMusicurl%>" autostart="false"  loop="false" height="45" width="399"></embed></td>
    </tr>
    <%
	}
%>
  </table></td>
    <td>
	<form name="form1" method="post" action="music.jsp" target="_self">

	<table width="420" border="0" align="center" cellpadding="0" cellspacing="1">
		<tr>
		<td width="100%" align="left" height="20">
		  <p>�����û����ǣ�<font color="#0000FF"><%=sUserName%></font>��ÿ��ֻ������һ�����ֵ�ַ(��ַ������http://��ʼ)</p></td>
		</tr>
		<tr>
		<td width="100%" align="left" >
        <input name="musicname" type="text" class="input1" value="��������" >
        </td>
        </tr>
        <tr>
        <td>
        <input type="text" name="musicurl" value="http://" class="input1" >
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