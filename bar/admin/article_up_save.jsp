<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<%
request.setCharacterEncoding("gb2312");
            String sArticleid = request.getParameter("articleid");
	        long lArticleid = Long.parseLong(sArticleid);
			String stitle=request.getParameter("title");
			String scontent=request.getParameter("content");
			//��������Ϣ���浽���ݿ���
			Article.setArticleid(lArticleid);
			Article.setTitle(stitle);
			Article.setContent(scontent);
			if(Article.modify())
			{
				out.println("<p><font color=blue>�����޸ĳɹ�</font></p>");
				out.println("<input type=button name=btn1 value=\"���������б�\" onClick='window.location=\"./type_list.jsp\"'>");
			}
			else
			{
				out.println("<p><font color=red>�����޸�ʧ�ܣ�������</font></p>");
				out.println("<input type=button name=btn2 value=\"����\" onClick='window.history.go(-1)'>");
				return;
			}
%>