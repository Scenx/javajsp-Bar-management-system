<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{
	margin:0 auto;
	background:url(images/top_bg.jpg) repeat-x center center;
	font-family:Georgia, "Times New Roman", Times, serif;
	font-size:12px;
	}

.header{ 
    width:960px;
	padding-top:20px;
    text-align:center;
	margin: 0 auto;
    }
.header .left{ 
    width:162px;
	height:65px;
	background-image:url(images/logo.jpg);
	float:left;
    text-align:center;
	margin: 0 auto;
    }
.header .right{
	width:760px;
	height:65px;
	margin:0 auto
	}
.font1{font-size:18px;line-height:50px; float:left; color:#FFF}
.font2{font-size:12px;line-height:50px; float:left; margin-left:5px; color:#FFF}
.font3{font-size:12px; line-height:50px; color:#FFF;}

</style>
</head>
<body>
<center>
<div class="header">
<div class="left"></div>
<div class="right">

<span class="font1"><b>С�;ư����߹���ϵͳ��̨</b></span>
<span class="font2"><b>Mini-bar-line management system</b></span>

<span class="font3">


��ӭ���ĵ�½:<%=uname%> | <a href="admin_info.jsp" target="mainFrame">���������Ϣ</a> | <a href="login_out.jsp" target="_parent">�˳���½</a> </span>
</div>
</div>
</center>
</body>
</html>