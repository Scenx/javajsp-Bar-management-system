<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӭ���������̳�</title>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean id="oMD5" scope="request" class="com.bar.safe.MD5"/>

</head>
<body bgcolor="#F4FFFE">
<div align="center">
<%
	request.setCharacterEncoding("gb2312");
	String sRand_1 = (String)session.getAttribute("Rand");
	String sRand_2 = request.getParameter("Rand");
	if (sRand_1.compareTo(sRand_2)==0) 
	{	
		String uname = request.getParameter("uname");
		User.setUname(uname);
		if(User.exist())
		{
			out.println("<p>�û���<font color=red>"+uname+"</font>�Ѿ����ڣ�</p>");
			out.println("<input type=button name=btn1 value=���� onClick='window.history.go(-1)'>");
		}
		else
		{    
		    String spwd = request.getParameter("pwd1");
			String pwd =  oMD5.getMD5ofStr(request.getParameter("pwd1"));
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String birth = request.getParameter("birth");
			String address = request.getParameter("address");
			String post = request.getParameter("post");
			String safequestion = request.getParameter("safequestion");
			String safeanswer = request.getParameter("safeanswer");
			
			User.setSpwd(spwd);
			User.setPwd(pwd);
			User.setName(name);
			User.setSex(sex);
			User.setTel(tel);
			User.setEmail(email);
			User.setBirth(birth);
			User.setAddress(address);
			User.setPost(post);
			User.setSafequestion(safequestion);
			User.setSafeanswer(safeanswer);
			User.setRole("0");
			if(User.add())
			{
				out.println("<p><font color=blue>�û�ע��ɹ�</font></p>");
				out.println("<a href='../index.jsp' target='_self'>���ڵ�¼</a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>�û�ע��ʧ�ܣ����Ժ�����</font></p>");
				out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
			}
		}
	} 
	else
	{
		out.println("<p><font color=#0000FF>���������֤�����</font></p>");
		out.println("<input type=button name=btn3 value=���� onClick='window.history.go(-1)'>");
	}
	session.removeAttribute("Rand");
%>
</div>
</body>
</html>
