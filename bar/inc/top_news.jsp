<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<SCRIPT language=javascript>function T(n){document.getElementById("ArticleCnt").style.fontSize=n+"px";}</SCRIPT>
<script src="js/news.js" type="text/javascript" language=javascript> </SCRIPT>
<style type="text/css">
body{margin:0 auto; background-color:#FFF}
#nav {
MARGIN: 7px auto 0px; HEIGHT: 117px
}
#nav #hotnews {
BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 89px
}
#Scroll {
	CLEAR: both;
	BORDER-RIGHT: #cdc9ca 1px solid;
	BORDER-TOP: #cdc9ca 1px solid;
	PADDING-LEFT: 100px;
	FONT-SIZE: 12px;
	BACKGROUND: url(images/n_scroll.gif) no-repeat 18px 7px;
	MARGIN: 0px auto;
	BORDER-LEFT: #cdc9ca 1px solid;
	WIDTH: 856px;
	COLOR: #c2130e;
	LINE-HEIGHT: 27px;
	BORDER-BOTTOM: #cdc9ca 1px solid;
	HEIGHT: 27px;
	TEXT-ALIGN: left
}
#Scroll A {
PADDING-RIGHT: 20px; PADDING-LEFT: 10px; BACKGROUND: url(images/n_bar.gif) no-repeat 0px 0px; COLOR: #000; MARGIN-RIGHT: 5px; TEXT-DECORATION: none
}
#Scroll A.s_end {
PADDING-RIGHT: 0px; MARGIN-LEFT: 8px
}
</style>
</head>
<body>
<DIV id=Scroll>
<DIV id=ScrollMe style="OVERFLOW: hidden; HEIGHT: 27px">
		<%    

			long ltypeid = 2;
			Article.setTypeid(ltypeid);
			ResultSet rs = Article.show_news_articles();


while(rs.next()){
	out.print("<a target=_blank href='../show_news.jsp?articleid="+rs.getString("articleid")+"'>"+rs.getString("title")+"</a>");
	}

%>
<br /></DIV></DIV>
<SCRIPT>new srcMarquee("ScrollMe",0,1,856,27,30,3000,3000,27)</SCRIPT>
</body>
<%rs.close();%>