<%@ page contentType="text/html; charset=gb2312" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />

	</head>
	<body bgcolor="#F4FFFE">
	<div align=center>

<%
	//��ȡ��Ҫɾ������Ʒ��Ϣ��������
	String[] sGoodinfoid = request.getParameterValues("DeleteID");	
	//���������������һ���ַ���
	String sDeleteGoodinfoid = "0";
	if (sGoodinfoid != null)
	{
		for(int i=0;i<sGoodinfoid.length;i++)
		{
			sDeleteGoodinfoid = sDeleteGoodinfoid +"," + sGoodinfoid[i];	
		}		
	}	
	//ɾ��ѡ�е���Ʒ��Ϣ��Ϣ
	if(Goodinfo.delete(sDeleteGoodinfoid))
	{
		out.println("<p><font color=blue>��Ʒ��Ϣɾ���ɹ�</font></p>");
		out.println("<p><a href=\"goods_list.jsp\" target=\"_self\"><font color=blue>������Ʒ��Ϣ����</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>��Ʒ��Ϣɾ��ʧ�ܣ�������</font></p>");
		out.println("<input type=\"button\" name=\"btn2\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
	}
%>
	</div>
	</body>
</html>
