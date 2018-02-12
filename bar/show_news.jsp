<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
<%@ include file="systems.jsp" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="keywords" content="<%=Keywords%>" />
<meta http-equiv="description" content="<%=Description%>" />
<title><%=Sitename%>-文章阅读</title>
<style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
</style>
<script type="text/javascript" src="js/jquery-latest.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/javascript.js" type="text/javascript"></script>
<script type="text/javascript"> 
$(document).ready(function(){

	$("ul.subnav").parent().append("<span></span>"); 
	
	$("ul.topnav li span").click(function() { 
		
		
		$(this).parent().find("ul.subnav").slideDown('fast').show(); 

		$(this).parent().hover(function() {
		}, function(){	
			$(this).parent().find("ul.subnav").slideUp('slow'); 
		});

		
		}).hover(function() { 
			$(this).addClass("subhover"); 
		}, function(){
			$(this).removeClass("subhover"); 
	});

});
</script>

</head>
<%
	//获得要显示的文章的参数，并将它转为整型值
	String sArticleid = request.getParameter("articleid");
	long lArticleid = Long.parseLong(sArticleid);
	
	//获得主题文章信息
	Article.setArticleid(lArticleid);
	Article.init();

	
	//获得作者信息
	User.setUserid(Article.getUserid());
	User.init();
	
	//获得当前讨论区信息
	Type.setTypeid(Article.getTypeid());
	Type.init();	
	
	int count=1;
%>
<body>
<%@ include file="inc/header.jsp" %>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td>
<iframe src="inc/top_news.jsp" frameborder="0" scrolling="no" width="960" height="30"></iframe>
</td>
</tr>
</table>
<table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
    
<div class="content_all">
<div class="line"></div>
<div class="content">
<div class="left">





    <h3><font color="#0000FF"><center><%=Article.getTitle()%></center></font></h3>
	<table width="700" border="0" cellpadding="0" cellspacing="0" bordercolor="#E1E1E1" align="left">
	<tr bgcolor="#F5F5F5">
	<td height="20" align="center"><font color="#0000FF">[发布者]<font color="#000000"><%=User.getUname()+"（"+User.getName()+"）"%></font></font>&nbsp;&nbsp;<font color="#0000FF">[发布时间]<font color="#000000"><%=Article.getCreatetime()%></font></font>&nbsp;&nbsp;<font color="#0000FF">[阅读次数]<font color="#000000"><%=Article.getReadcount()%></font></font>&nbsp;&nbsp;<a href="news.jsp">返回文章列表</a></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td width="100%" align="left">
	&nbsp;
	<%
	String sContent = Article.getContent();
	sContent = sContent.replaceAll("\r\n","<br>");
	out.println("&nbsp;"+sContent);
	%>	  <br></td>
	</tr>
	</table>
	<%
		//将阅读数加1
		int iReadCount = Article.getReadcount()+1;
		Article.setReadcount(iReadCount);
		Article.modify_readcount();
		

	%>

	<br>
	<br>
    






</div>
<div class="right">
<div class="title">
最新文章
</div>
<iframe src="inc/new_article.jsp" frameborder="0" scrolling="no" width="250" height="205"></iframe>
</div>
</div>
</div>
    
    </td>
  </tr>
</table>

<table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
<%@ include file="inc/footer.jsp" %>
    </td>
  </tr>
</table>
</body>
</html>
