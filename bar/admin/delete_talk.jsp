<%@ page contentType="text/html; charset=gb2312" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Talk" class="com.bar.db.Talk" />

	</head>
	<body bgcolor="#F4FFFE">
	<div align=center>

<%
	//��ȡ��Ҫɾ������Ʒ��Ϣ��������
	String[] smusicid = request.getParameterValues("talkid");
	//���������������һ���ַ���
	String sDeleteGoodinfoid = "0";
	if (smusicid != null)
	{
		for(int i=0;i<smusicid.length;i++)
		{
			sDeleteGoodinfoid = sDeleteGoodinfoid +"," + smusicid[i];	
		}		
	}	
	//ɾ��ѡ�е���Ʒ��Ϣ��Ϣ
	if(Talk.delete(sDeleteGoodinfoid))
	{
		out.println("<p><font color=blue>����ɾ���ɹ�</font></p>");
		out.println("<p><a href=\"talk_list.jsp\" target=\"_self\"><font color=blue>�������Թ���</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>����ɾ��ʧ�ܣ�������</font></p>");
		out.println("<input type=\"button\" name=\"btn2\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
	}
%>
	</div>
	</body>
</html>
