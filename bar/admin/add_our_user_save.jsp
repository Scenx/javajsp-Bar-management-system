<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


	<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
    <jsp:useBean id="oMD5" scope="request" class="com.bar.safe.MD5"/>
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String sUserName = request.getParameter("Uname");
		User.setUname(sUserName);
		if(User.exist())
		{
			out.println("<p>�û���&nbsp;<font color=red>"+sUserName+"</font>&nbsp;�Ѿ����ڣ�</p>");
			out.println("<input type=button name=btn1 value=���� onClick='window.history.go(-1)'>");
		}
		else
		{
			String sPwd1 = request.getParameter("PWD");
			String sPwd = oMD5.getMD5ofStr(request.getParameter("PWD"));
			String sName = request.getParameter("Name");
			String sSex = request.getParameter("Sex");			
			String sBirth = request.getParameter("Birth");
			String sTel = request.getParameter("Tel");			
			String sEmail = request.getParameter("Email");
			String sMoney = request.getParameter("Money");
			String sAddr = request.getParameter("Addr");
			
			User.setPwd(sPwd);
			User.setName(sName);
			User.setSex(sSex);
			User.setBirth(sBirth);
			User.setTel(sTel);
			User.setEmail(sEmail);
			User.setMoney(sMoney);
			User.setAddress(sAddr);
			User.setRole("3");
			
			if(User.add())
			{
				out.println("<p><font color=blue>���Ա����Ϣ�ɹ�</font></p>");
				out.println("<a href='./add_our_users.jsp' target='_self'><font color=blue>�������</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>���Ա����Ϣʧ�ܣ����Ժ�����</font></p>");
				out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
			}
		} 
%>
</div>
</body>
</html>
