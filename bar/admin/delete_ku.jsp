<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������ҵ�칫ƽ̨</title>
		<jsp:useBean scope="page" id="Ku" class="com.bar.db.Ku" />

	</head>

	<body bgcolor="#F2F2F2">
	<div align=center>
	<%
	String strPage = request.getParameter("showPage");

	//��ȡ��Ҫɾ����Ա����Ϣ��������
	String[] sKuid = request.getParameterValues("DeleteID");	
	String sDeleteKuid = "0";
	if (sKuid != null)
	{
		for(int i=0;i<sKuid.length;i++)
		{
			sDeleteKuid = sDeleteKuid +"," + sKuid[i];	
		}		
	}	
		//ɾ��ѡ�е�Ա����Ϣ
		if(Ku.delete(sDeleteKuid))
		{
			out.println("<p><font color=blue>��Ʒ�����Ϣɾ���ɹ�</font></p>");
			out.println("<p><a href=\"ku_list.jsp?showPage="+strPage+"\" target=\"_self\"><font color=blue>����Ա����Ϣ����</font></a></p>");
		}
		else
		{
			out.println("<p><font color=red>��Ʒ�����Ϣɾ��ʧ�ܣ�������</font></p>");
			out.println("<input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
		}
	%>
	</div>
	</body>
</html>
