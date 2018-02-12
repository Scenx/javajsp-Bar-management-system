<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<style type="text/css">
* {margin:0;padding:0;}
ol,ul {list-style:none;}
a:link,a:visited {text-decoration:none;}
a:hover,a:focus,a:active {text-decoration:underline;}
.clearfix,.clear {display:inline-block;}
.clearfix,.clear {display:block;}/* www.codefans.net */
.clearfix:after,.clear:after {content:'';display:block;clear:both;height:0px;}
 
body {
	font: 12px/1.5 Arial, Helvetica, sans-serif;
	color: #666;
	background: white;
}
#dv_demo {
	margin: 0 auto;
	margin-top: 0px;
	width: 252px;
	line-height: 20px;
	border: 1px solid #fc9;
}
#dv_demo ol {
	padding-left: 23px;
	width: 250px;
	background: url(images/bg.png) no-repeat 2px 4px;
}
#dv_demo li {
	clear: both;
}
#dv_demo li a {
	float: left; _display: inline;
	max-width: 14em;
	white-space: nowrap;
	_white-space: normal;  /*
 超长就换行，第二行被裁掉 @ IE6 
*/
	_height: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	color: #333;
	_background: transparent;  /*
 解决莫名占据高度bug @ IE6 
*/
}
#dv_demo li span {
	_position: relative;  /*
 父容器hasLayout裁切bug @ IE6 
*/
	float: left; _display: inline;
	margin-right: -99px;
	padding-left: 10px;
	font-size: 10px;
	color: #999;
}

#dv_note,
#dv_back {
	clear: both;
	margin: 0 auto;
	padding-top: 20px;
	width: 600px;
}
h2 {
	font-size: 100%;
}
#dv_note ul {
	margin-left: 1em;
	padding-left: 2em;
	padding-bottom: 1em;
	list-style: disc;
}
#dv_note li {
	padding-top: 3px;
	text-align: justify; text-justify: distribute;
}
#dv_note code {
	padding: 0 3px;
	font-family: 'Courier New',monospace;
	background: #eee;
}
#dv_back a {
	color: black;
}
</style>

<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />

<div id="dv_demo">
<ol class="clearfix">
<%
ResultSet rs = Article.show_new_articles();


while(rs.next()){
	out.print("<li><a target=_blank href='../show_news.jsp?articleid="+rs.getString("articleid")+"'>"+rs.getString("title")+"</a></li>");
	}
	%></ol></div>