<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ include file="systems.jsp" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="keywords" content="<%=Keywords%>" />
<meta http-equiv="description" content="<%=Description%>" />
<title><%=Sitename%>-酒吧新闻</title>

		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
		<jsp:useBean scope="page" id="Page" class="com.bar.page.SplitPage" />
		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
        
        <style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
td{border-bottom:1px #FF9966 dashed; border-right:1px #FF9966 dashed}
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
		<%

			ResultSet rs = Article.show_all_articles();
			
			Page.initialize(rs,12);
			
			String strPage=null;
			int showPage = 1;
			
			strPage=request.getParameter("showPage");	
			if (strPage==null)
				showPage=1;
			else
			{
				try
				{
					showPage=Integer.parseInt(strPage);
				}
				catch(NumberFormatException e)
				{
					showPage = 1;
				}
				if(showPage<1) 
					showPage=1;
		
				if(showPage>Page.getPageCount()) 
					showPage=Page.getPageCount();
			}
			
			//获取要显示的数据集合
			Vector vData=Page.getPage(showPage);	
		%>
	</head>
	<body>
    <%@ include file="inc/header.jsp" %>
	<div align="center">
	<table width="960" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td>
    <iframe src="inc/top_news.jsp" frameborder="0" scrolling="no" width="960" height="30"></iframe>
    </td>
    </tr>
    </table>
	<table width="960" border="0" cellpadding="0" cellspacing="2" style=" border-left:1px #FF9966 dashed; " bgcolor="#FFFFFF">
		<tr bgcolor="#FF9966">
		<th width="33%" height="30" align="center">文章标题</th>
		<th width="16%" align="center">作者</th>
		<th width="19%" align="center">发布时间</th>
		<th width="16%" height="30" align="center">阅读数</th>
		</tr>
	<%
		for(int i=0;i<vData.size();i++)
		{ 
			//循环显示文章信息
			String[] sData=(String[])vData.get(i);
			long lUserID = Long.parseLong(sData[2]);
			User.setUserid(lUserID);
			if(User.init())
			{
	%>
			<tr>
				<td height="25" align="left"><a href="show_news.jsp?articleid=<%=sData[0]%>" target="_self"><font color="#0000FF"><%="&nbsp;"+sData[1]%></font></a></td>
				<td align="center"><font color="#0000FF"><%=User.getUname()%></font></td>
				<td align="center"><%=sData[5]%></td> 	
				<td height="25" align="center"><font color="#FF0000"><%=sData[3]%></font></td> 
			</tr> 		
	<%
			}
		}
	%>
	</table>
	<p>
	<form action="news.jsp" method="post" target="_self">
	    &nbsp;
		<font class="font_xc">第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=Page.getPageCount()%></font>页</font>&nbsp;
	  <a href="news.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
		<%
			//判断"上一页"链接是否要显示
			if(showPage > 1)
			{				
		%>
	  <a href="news.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
		<%
			}
			else
				out.println("<font class='font_xc'>[上一页]</font>&nbsp;");

			//判断"下一页"链接是否要显示
			if(showPage < Page.getPageCount())
			{				
		%>
	  <a href="news.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
		<%
			}
			else
				out.println("<font class='font_xc'>[下一页]</font>&nbsp;");

		%> 
	  <a href="news.jsp?showPage=<%=Page.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
		转到
		<select name="showPage">
		<%
			for(int x=1;x<=Page.getPageCount();x++)
			{
		%>
				<option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
		<%
			}
		%>
		</select>
		
		<input type="submit" name="go" value="提交"/>
	</form></p>
	<%rs.close();%>
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

