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
	//�жϵ�ǰ�û��Ƿ��ǵ�¼�û�
	String sUserName = (String) session.getAttribute("uname");

	//��ȡ��Ҫ���͵��ʼ���Ϣ
	String sReceiver = request.getParameter("Receiver");
	String sSubject = request.getParameter("Subject");
	String sContent = request.getParameter("Content");
	
	Email.setSender(sUserName);
	Email.setReceiver(sReceiver);
	Email.setSubject(sSubject);
	Email.setContent(sContent);	

	//�����ʼ���Ϣ
	if(Email.add())
	{
		out.println("<p><font color=blue>�ʼ����ͳɹ���</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"ȷ��\" onClick=\"javascript:window.location='email.jsp'\"></div>");
	}
	else
	{
		out.println("<p><font color=red>�ʼ�����ʧ�ܣ������ԣ�</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
%>
	</div>
	</body>
</html>
