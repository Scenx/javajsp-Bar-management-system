<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���ڵ�½����</title>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean id="oMD5" scope="request" class="com.bar.safe.MD5"/>
</head>
<%
	//��ȡ��¼��Ϣ
	String uname = request.getParameter("uname");
	String pwd = oMD5.getMD5ofStr(request.getParameter("pwd"));
	
	
	//�жϵ�¼��Ϣ�Ƿ���ȷ
	User.setUname(uname);
	User.setPwd(pwd);	
	if(!User.valid())
	{
		out.println("<p align=center><font color=red>��������û���������������</font></p>");
		out.println("<div align=\"center\"><input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
	else
	{
		//���û������û�ID���û���ɫ����Ϣ���浽session��
		session.setAttribute("uname",User.getUname());
		session.setAttribute("userid",User.getUserid());
		session.setAttribute("role",User.getRole());
		
		//�ж��û���ɫ�����ݽ����ת����Ӧҳ��
		if(User.getRole().equals("2"))
			response.sendRedirect("admin/index.jsp");
		else
			response.sendRedirect("./index.jsp");
	}
%>