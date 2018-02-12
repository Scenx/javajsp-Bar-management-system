<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="systems.jsp" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="keywords" content="<%=Keywords%>" />
<meta http-equiv="description" content="<%=Description%>" />
<title><%=Sitename%>-�û�����</title>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Talk" class="com.bar.db.Talk" />
<style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
.font1{color:#FFF}
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
<%@ include file="inc/header.jsp" %>

<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td>
<iframe src="inc/top_news.jsp" frameborder="0" scrolling="no" width="960" height="30"></iframe>
</td>
</tr>
</table>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr><td valign="top">
	<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td align="left" height="40" colspan="2" valign="middle">���û�������Ϣ��</td>
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
	<td width="30%" height="20" align="left" bgcolor="#33CC00" >&nbsp;&nbsp;<font class="font1">�û�����</font><font color="#0000FF"><%=User.getUname()%></font></td>
	<td width="84%" height="20" align="left" bgcolor="#33CC00"><font class="font1">����ʱ�䣺</font><font color="#0000FF"><%=rs.getString("createtime")%></font></td>
	</tr>
	<tr>
	<td align="left" colspan="2" style="border-left:1px #999 dashed;border-right:1px #999 dashed; border-bottom:1px #999 dashed; padding-top:5px;">
	&nbsp;&nbsp;&nbsp;&nbsp;<%=sContent%></td>
	</tr>
<%
	}
%>
	</table>
    </td>
    <td valign="top">

	<form name="form1" method="post" action="talk.jsp" target="_self" onSubmit="return Mycheck()">
    <input type="hidden" name="Words" value="YES" />
	<table width="400" border="0" align="center" cellpadding="0" cellspacing="1">
		<tr>
		<td width="100%" align="left" height="20">
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
<table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
<%@ include file="inc/footer.jsp" %>
    </td>
  </tr>
</table>

</body>
</html>