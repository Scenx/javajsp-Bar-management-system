<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

		<jsp:useBean scope="page" id="Email" class="com.bar.db.Email" />
<style type="text/css">
body{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
</style>
	</head>
	<body>
	<div align="center"><br>
<%
	//��ȡ��Ҫɾ�����ʼ������ţ���������ת����һ���ַ���
	String[] sEmailID = request.getParameterValues("DeleteID");	
	String sDeleteEmailID = "0";
	if (sEmailID != null)
	{
		for(int i=0;i<sEmailID.length;i++)
		{
			sDeleteEmailID = sDeleteEmailID +"," + sEmailID[i];	
		}		
	}

	//ɾ���ʼ�
	if(Email.delete(sDeleteEmailID))
	{
		response.sendRedirect("email.jsp");
	}
	else
	{
		out.println("<p><font color=red>�ʼ�ɾ��ʧ�ܣ�������</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
%>
	</div>
	</body>
</html>
