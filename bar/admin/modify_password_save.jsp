<%@ page contentType="text/html; charset=gb2312" language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
        <jsp:useBean id="oMD5" scope="request" class="com.bar.safe.MD5"/>
	</head>
	<body>
	<div align="center"><br>
<%
	//��ȡsession�б����UserName
	String sUserName = (String) session.getAttribute("uname");
	User.setUname(sUserName);
	//��ȡsession�б����UserID
	long lUserID = (Long) session.getAttribute("userid");	
	User.setUserid(lUserID);
	//��ȡ����д�ľ�����
	String sOldUserPassword = oMD5.getMD5ofStr(request.getParameter("OldUserPassword"));

	User.setPwd(sOldUserPassword);
	//�ж��û���д�ľ������Ƿ���ȷ
	if(User.valid())
	{
		//�޸��û�����
		String sUserPassword = oMD5.getMD5ofStr(request.getParameter("pwd"));
		String sPwd = request.getParameter("pwd");
		
		User.setSpwd(sPwd);
		
		User.setPwd(sUserPassword);	
		if(User.modify_UserPassword())
		{
			out.println("<p><font color=blue>�޸��û�����ɹ�</font></p>");
		out.println("<p><a href=\"admin_info.jsp\" target=\"_self\"><font color=blue>�������Ϲ���</font></a></p>");

		}
		else
		{
			out.println("<p><font color=red>�޸��û�����ʧ�ܣ����Ժ�����</font></p>");
			out.println("<input type=button name=btn value=���� onClick='window.history.go(-1)'>");
		}
	}
	else
	{
		out.println("<p><font color=red>������ľ��������</font></p>");
		out.println("<input type=button name=btn value=���� onClick='window.history.go(-1)'>");
	}
%>
	</div>
	</body>
</html>
