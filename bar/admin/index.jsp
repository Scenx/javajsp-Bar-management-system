<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%
	String uname = (String) session.getAttribute("uname");	
%>
<%
  if(uname!=null)
  {
   uname = (String)session.getAttribute("uname");
   
  }

else { 

    response.sendRedirect("./login.jsp");
} 

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>С�;ư����߹����̨</title>
<style type="text/css">
body{width:960px;}
</style>
</head>
<frameset rows="90,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset rows="*" cols="160,*" framespacing="0" frameborder="no" border="0">
    <frame src="left.jsp" name="leftFrame" scrolling="No" noresize="noresize" style="border-right:1px #999 dashed;" id="leftFrame" title="leftFrame" />
    <frame src="main.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
