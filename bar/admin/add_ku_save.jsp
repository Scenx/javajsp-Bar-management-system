<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


	<jsp:useBean scope="page" id="Ku" class="com.bar.db.Ku" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String sGoodname = request.getParameter("goodname");
		Ku.setGoodname(sGoodname);
		if(Ku.exist())
		{
			out.println("<p>��Ʒ&nbsp;<font color=red>"+sGoodname+"</font>&nbsp;�Ѿ����ڣ�</p>");
			out.println("<input type=button name=btn1 value=���� onClick='window.history.go(-1)'>");
		}
		else
		{
			String fNum = request.getParameter("num");
			int sNum = Integer.parseInt(fNum);

			
			Ku.setGoodname(sGoodname);
			Ku.setNum(sNum);
			
			if(Ku.add())
			{
				out.println("<p><font color=blue>��Ӳ�Ʒ�����Ϣ�ɹ�</font></p>");
				out.println("<a href='./add_ku_from.jsp' target='_self'><font color=blue>�������</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>��Ӳ�Ʒ�����Ϣʧ�ܣ����Ժ�����</font></p>");
				out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
			}
		} 
%>
</div>
</body>
</html>
