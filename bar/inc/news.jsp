<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<head>
<link href="css/master.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<div class="news">
			    <div class="news_title">
			        <span class="span1">酒吧新闻列表</span>
			        <span class="span2"><a href="../news.jsp" target="_blank" title="更多"><img src="img/w_25_02.gif" width="35" height="31"/></a></span>
			    </div>
			    <div class="news_content">
		<%    

			long ltypeid = 1;
			Article.setTypeid(ltypeid);
			ResultSet rs = Article.show_anews_articles();


while(rs.next()){
	out.print("<p class=p01><a title="+rs.getString("title")+" href='../show_news.jsp?articleid="+rs.getString("articleid")+"'target='_blank'>"+rs.getString("title")+"</a></p>");
	}

%>
</div>
</div>
<%rs.close();%>
</body>