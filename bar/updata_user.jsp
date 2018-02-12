<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户信息修改</title>
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
<script language="javascript" type="text/javascript">

function Mycheck(){
	   
if(form1.OldUserPassword.value=="")
{alert("旧密码不能为空！！");return false;}
if (form1.pwd.value=="")
{alert("新密码不能为空！！");return false;}
if (form1.pwd1.value=="")
{alert("确认密码不能为空！！");return false;}
if(form1.pwd.value!=form1.pwd1.value)
{alert('您两次输入的密码不一致！');return false;}

form1.sub();
}



</script>
</head>

<body>
<%@ include file="inc/header.jsp" %>
<table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
    
<%@ include file="inc/update_user.jsp" %>

    </td>
  </tr>
</table>
<%@ include file="inc/footer.jsp" %>

</body>
</html>