<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
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
<title><%=Sitename%></title>
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

<body>
<%@ include file="inc/header.jsp" %>
<table width="960" height="184" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td colspan="2"><iframe src="inc/top_news.jsp" frameborder="0" scrolling="no" width="960" height="30"></iframe></td>
  </tr>
  <tr>
    <td height="120"><iframe src="ads/index.htm" frameborder="0" scrolling="no" width="620" height="258"></iframe></td>
    <td><iframe src="inc/news.jsp" frameborder="0" scrolling="no" width="340" height="258" ></iframe></td>
  </tr>
  <tr>
    <td colspan="2" ><img src="images/ads/2008315124145514_2.jpg" border="0" style="margin-top:5px;" /></td>
  </tr>
  <tr>
    <td colspan="2" >
	
	
	<%@ include file="help/index.jsp" %></td>
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
