<%@ page contentType="text/html; charset=gb2312" language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
   <style type="text/css">
		body{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		</style>
	</head>
	<body>
		<div align="center"><br>

<%
	//���ñ����ʽ
	request.setCharacterEncoding("gb2312");
	
	String sUserName = (String) session.getAttribute("uname");
	
	long userid = (Long) session.getAttribute("userid");
	User.setUserid(userid);

	//��ȡ�޸ĺ���û���Ϣ
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	String birth = request.getParameter("birth");
	String post = request.getParameter("post");
	String safequestion = request.getParameter("safequestion");
	String safeanswer = request.getParameter("safeanswer");
	String smoney = request.getParameter("money");
	float money =  Float.parseFloat(smoney);
	

	
	//�����û���Ϣ
	User.setName(name);
	User.setSex(sex);
	User.setEmail(email);
	User.setAddress(address);
	User.setTel(tel);
	User.setBirth(birth);
	User.setPost(post);
	User.setSafequestion(safequestion);
	User.setSafeanswer(safeanswer);
	User.setMoney(money);
	if(User.modify_info())
	{
		out.println("<p><font color=blue>�޸��û���Ϣ�ɹ�</font></p>");
		out.println("<p><a href=\"../updata_user.jsp\" target=\"_self\"><font color=blue>�������Ϲ���</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>�޸��û���Ϣʧ�ܣ����Ժ�����</font></p>");
		out.println("<div><input type=button name=btn value=���� onClick='window.history.go(-1)'></div>");
	}
%>
	</div>
	</body>
</html>
