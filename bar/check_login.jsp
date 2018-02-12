<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>正在登陆……</title>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean id="oMD5" scope="request" class="com.bar.safe.MD5"/>
</head>
<%
	//获取登录信息
	String uname = request.getParameter("uname");
	String pwd = oMD5.getMD5ofStr(request.getParameter("pwd"));
	
	
	//判断登录信息是否正确
	User.setUname(uname);
	User.setPwd(pwd);	
	if(!User.valid())
	{
		out.println("<p align=center><font color=red>您输入的用户名或者密码有误</font></p>");
		out.println("<div align=\"center\"><input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
	else
	{
		//将用户名、用户ID、用户角色等信息保存到session中
		session.setAttribute("uname",User.getUname());
		session.setAttribute("userid",User.getUserid());
		session.setAttribute("role",User.getRole());
		
		//判断用户角色，根据结果跳转到相应页面
		if(User.getRole().equals("2"))
			response.sendRedirect("admin/index.jsp");
		else
			response.sendRedirect("./index.jsp");
	}
%>