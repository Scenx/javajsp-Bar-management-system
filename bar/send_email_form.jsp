<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%
	String uname = (String) session.getAttribute("uname");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Email发送</title>
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
<jsp:useBean scope="page" id="Email" class="com.bar.db.Email" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
</head>
<%
	//获取当前用户的用户名
	String sUserName = (String) session.getAttribute("uname");
	String sSubject = "";
	String sContent = "";
	String sReceiver = "";
	//获得索要回复的邮件的索引号，并将它转化为长整型	
	String sEmailID = request.getParameter("EmailID");
	long lEmailID = Long.parseLong(sEmailID);

	//判断是否是回复邮件，如果是的话则获取邮件信息
	if(lEmailID != 0)
	{
		Email.setEmailid(lEmailID);
		Email.init();
		sSubject = "回复："+Email.getSubject();		
		sReceiver = Email.getSender();
		sContent = Email.getContent();
		if(sContent.length()>100)
		{
			sContent = sContent.substring(1,100);
			sContent = sContent + "………………";
		}
		sContent = "【 在 "+sReceiver+" 的来信中提到: 】\r\n" + sContent;
		sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
	}
	//获取所要回信的文章的索引号，并将它转化为长整型
	String sArticleID = request.getParameter("ArticleID");
	long lArticleID = Long.parseLong(sArticleID);

	//判断是否是回信文章，如果是的话则获取文章信息
	if(lArticleID != 0)
	{
		Article.setArticleid(lArticleID);
		Article.init();		
		sSubject = "回复："+Article.getTitle();		
		User.setUserid(Article.getUserid());
		User.init();
		sReceiver = User.getUname();
		sContent = Article.getContent();				
		if(sContent.length()>100)
		{
			sContent = sContent.substring(1,100);
			sContent = sContent + "………………";
		}
		sContent = "【 在 "+sReceiver+" 的文章中提到: 】\r\n" + sContent;
		sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
	}
%>
<body>
<%@ include file="inc/header.jsp" %>
<div align="center">
<br>
<form name="form1" method="post" action="send_email_save.jsp" target="_self">
<table width="960px" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发信人：<font color="#0000FF"><%=sUserName%></font><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标&nbsp;&nbsp;题: <input type="text" name="Subject" size="50" value="<%=sSubject%>"> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收信人：<input type="text" name="Receiver" value="<%=sReceiver%>">&nbsp;&nbsp; <br>
<center><textarea name="Content" rows="16" cols="120"><%=sContent%>
</textarea></center>
<p align="center">
<input type="submit" value="发送" name="sub">
&nbsp;&nbsp;
<input type="reset" value="重写" name="res">
</p>
</table>
</form>
</div>
<table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
<%@ include file="inc/footer.jsp" %>
    </td>
  </tr>
</table>
</body>
</html>
