<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="gb2312" import="net.fckeditor.*" %>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎光临网上商城</title>
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<style type="text/css">
body{ margin:5 auto;}
.font1{ font-family: Georgia, "Times New Roman", Times, serif; font-size:12px;}
</style>
</head>
<%
	request.setCharacterEncoding("gb2312");
	String sArticleid = request.getParameter("articleid");
	long lArticleid = Long.parseLong(sArticleid);
	
	Article.setArticleid(lArticleid);
	Article.init();
	
	
	ResultSet rs = Article.show_son_articles();
%>


<body bgcolor="#F4FFFE">
<div align="center">
<form name="form1" method="post" action="article_up_save.jsp?articleid=<%=lArticleid%>" target="_self" >
<input type="hidden" name="articleid" value="<%=lArticleid%>">
<table width="100%" border="0" cellpadding="0" cellspacing="1">
<tr>
<td width="10%" height="20" align="right"><span class="font1">文章标题：</span></td>
<td width="90%" height="20" align="left"><span class="font1">&nbsp;
  <input type="text" name="title" size="30" value="<%=Article.getTitle()%>">
</span></td>
</tr>
<tr>
  <td width="10%" height="20" align="right"><span class="font1">文章内容：</span></td>
  <td width="90%" height="20" align="left"><span class="font1">&nbsp;
      <FCK:editor instanceName="content" toolbarSet="Default" height="350px">
        <jsp:attribute name="value">
          <%=Article.getContent()%>
        </jsp:attribute>
      </FCK:editor>
  </span></td>
</tr>
</table>
<p><input type="submit" name="sub" value="修改">&nbsp;&nbsp;<input type="reset" name="res" value="重填"></p>
</form>
</div>
</body>
</html>
