<%@ page contentType="text/html; charset=gb2312" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<jsp:useBean scope="page" id="Email" class="com.bar.db.Email" />
	<style type="text/css">
	body{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px}
	</style>
	</head>
	<body>
<div align="center"><br>
<%
	request.setCharacterEncoding("gb2312");
	//判断当前用户是否是登录用户
	String sUserName = (String) session.getAttribute("uname");

	//获取所要发送的邮件信息
	String sReceiver = request.getParameter("Receiver");
	String sSubject = request.getParameter("Subject");
	String sContent = request.getParameter("Content");
	
	Email.setSender(sUserName);
	Email.setReceiver(sReceiver);
	Email.setSubject(sSubject);
	Email.setContent(sContent);	

	//保存邮件信息
	if(Email.add())
	{
		out.println("<p><font color=blue>邮件发送成功！</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"确定\" onClick=\"javascript:window.location='email.jsp'\"></div>");
	}
	else
	{
		out.println("<p><font color=red>邮件发送失败，请重试！</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
%>
	</div>
	</body>
</html>
