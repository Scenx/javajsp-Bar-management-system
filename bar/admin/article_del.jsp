<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />

	</head>
	<body>
	<div align="center"><br>
<%
	//��ȡ��Ҫɾ������������Ϣ������
	String[] sArticleid = request.getParameterValues("articleid");	
	//��������������֯��һ���ַ���
	String sDeleteArticleid = "0";
	if (sArticleid != null)
	{
		for(int i=0;i<sArticleid.length;i++)
		{
			sDeleteArticleid = sDeleteArticleid +"," + sArticleid[i];	
		}		
	}

	//ɾ��������
	if(Article.delete(sDeleteArticleid))
	{
		out.println("<p><font color=blue>����ɾ���ɹ�</font></p>");
		out.println("<p><a href=\"type_list.jsp\" target=\"_self\"><font color=blue>�������¹���</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>����ɾ��ʧ�ܣ�������</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
%>
	</div>
	</body>
</html>
