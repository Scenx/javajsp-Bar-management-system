<%@ page contentType="text/html; charset=gb2312" language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		

		<jsp:useBean scope="page" id="Ku" class="com.bar.db.Ku" />

	</head>
	<body>
		<div align="center"><br>

<%
	//���ñ����ʽ
	request.setCharacterEncoding("gb2312");
	
	String fKuid = request.getParameter("kuid");
	long cKuid = Long.parseLong(fKuid);
	Ku.setKuid(cKuid);

	//��ȡ�޸ĺ���û���Ϣ
	String sGoodname = request.getParameter("goodname");
	String fNum = request.getParameter("num");
	int sNum = Integer.parseInt(fNum);


	
	//�����û���Ϣ
	Ku.setGoodname(sGoodname);
	Ku.setNum(sNum);
	if(Ku.updata())
	{
		out.println("<p><font color=blue>�޸Ĳ�Ʒ�����Ϣ�ɹ�</font></p>");
		out.println("<p><a href=\"ku_list.jsp\" target=\"_self\"><font color=blue>���ز�Ʒ������</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>�޸Ĳ�Ʒ�����Ϣʧ�ܣ����Ժ�����</font></p>");
		out.println("<div><input type=button name=btn value=���� onClick='window.history.go(-1)'></div>");
	}
%>
	</div>
	</body>
</html>
