<%@ page contentType="text/html; charset=gb2312" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
	body{ font-family:Georgia, "Times New Roman", Times, serif; font-size:12px}
	</style>
	
	<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
	</head>
	<body>
	<div align="center"><br>
	<%
	request.setCharacterEncoding("gb2312");
		//��ȡ��ǰ�û���������
        long lUserid = (Long) session.getAttribute("userid");

			String sTypeid = request.getParameter("Typeid");
		    long lTypeid = Long.parseLong(sTypeid);
			String stitle=request.getParameter("Title");
			String scontent=request.getParameter("content");

			//��������Ϣ���浽���ݿ���
			Article.setTitle(stitle);
			Article.setContent(scontent);
			Article.setTypeid(lTypeid);
			Article.setUserid(lUserid);
			if(Article.add())
			{
				out.println("<p><font color=blue>���·���ɹ�</font></p>");
				out.println("<div><input type=button name=btn value=\"�ص������б�\" onClick='window.location=\"./article_list.jsp?typeid="+lTypeid+"\"'></div>");
			}
			else
			{
				out.println("<p><font color=red>���·���ʧ�ܣ�������</font></p>");
				out.println("<div><input type=button name=btn value=\"����\" onClick='window.history.go(-1)'></div>");
				return;
			}
			
		
	%>
	</div>
	</body>
</html>
