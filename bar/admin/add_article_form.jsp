<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="gb2312" import="net.fckeditor.*" %>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<style type="text/css">
		.font{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		.input1{ width:80px; height:20px; border: 1px #999 dashed; background-color:#666; color:#FFF}
		.input2{width:300px; height:20px; border: 1px  #F60 dashed}
		</style>
	<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
	<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
	<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
	<%
		//获取当前访问用户信息，并判断他是否是登录用户
		String sUname = (String) session.getAttribute("uname");
		//获取当前登录用户的索引号
		long lUserid = (Long) session.getAttribute("userid");
		//获取当前讨论区的索引号，并转为长整型
		String sTypeid = request.getParameter("typeid");
		long lTypeid = Long.parseLong(sTypeid);
		Type.setTypeid(lTypeid);
		Type.init();
		//判断是否是回复文章，如果是回复文章，则获取所要回复文章的标题和部分内容 
		String sArticleID = request.getParameter("ArticleID");	
		long lArticleID = Long.parseLong(sArticleID);
		
		String sTitle = "";
		String sContent = "";
		if(lArticleID != 0)
		{		
			Article.setArticleid(lArticleID);
			Article.init();
			sTitle="回复："+Article.getTitle();	
			
			User.setUserid(Article.getUserid());
			User.init();				
			sContent=Article.getContent();
			if(sContent.length()>100)
			{
				sContent = sContent.substring(1,100);
				sContent = sContent + "………………";
			}
			sContent = "【 在 "+User.getUname()+" 的文章中提到: 】\r\n" + sContent;
			sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
	
			
		}	
	%>

	</head>
	<body>
	<div align="center">
	<br>
	<form name="form1" method="post" action="add_article_save.jsp" target="_self" >
	<input type="hidden" name="Typeid" value="<%=lTypeid%>">
	<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#E1E1E1">
	<tr>
		<td width="30%"height="25" align="left"><span class="font">&nbsp;文章标题：<input name="Title" type="text" class="input2" value="<%=sTitle%>" size="40">
		</span></td>
		<td width="20%" align="left"><span class="font">文章作者：<font color="#0000FF"><%=sUname%></font></span></td>
		<td width="20%" align="left"><span class="font">文章类型：<font color="#0000FF"><%=Type.getTypename()%></font></span></td>
	</tr>
	<tr>
		<td width="100%" colspan="3" align="center" valign="top">
		
                <span class="font">
                <FCK:editor instanceName="content" toolbarSet="Default" height="350px">
                  <jsp:attribute name="value">
                  </jsp:attribute>
                </FCK:editor>

		
        </span></td>
	</tr>
		
	</table>
	<p>
	<input type="submit" value="发表" name="sub" class="input1">&nbsp;&nbsp;
	<input type="reset" value="清除" name="res" class="input1">
	</p>
	</form>
	</div>
	</body>
</html>
