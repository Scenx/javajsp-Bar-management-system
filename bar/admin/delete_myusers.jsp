<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������ҵ�칫ƽ̨</title>
		<jsp:useBean scope="page" id="Myusers" class="com.bar.db.Myusers" />

	</head>

	<body bgcolor="#F2F2F2">
	<div align=center>
	<%
	String strPage = request.getParameter("showPage");

	//��ȡ��Ҫɾ����Ա����Ϣ��������
	String[] sMyuserid = request.getParameterValues("DeleteID");	
	String sDeleteUserID = "0";
	if (sMyuserid != null)
	{
		for(int i=0;i<sMyuserid.length;i++)
		{
			sDeleteUserID = sDeleteUserID +"," + sMyuserid[i];	
		}		
	}	
		//ɾ��ѡ�е�Ա����Ϣ
		if(Myusers.delete(sDeleteUserID))
		{
			out.println("<p><font color=blue>��Ӧ����Ϣɾ���ɹ�</font></p>");
			out.println("<p><a href=\"myusers_list.jsp?showPage="+strPage+"\" target=\"_self\"><font color=blue>����Ա����Ϣ����</font></a></p>");
		}
		else
		{
			out.println("<p><font color=red>��Ӧ����Ϣɾ��ʧ�ܣ�������</font></p>");
			out.println("<input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
		}
	%>
	</div>
	</body>
</html>
