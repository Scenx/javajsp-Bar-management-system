<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="systems.jsp" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta  http-equiv="content-type"  content="text/html; charset=gb2312" />
<meta http-equiv="keywords" content="<%=Keywords%>" />
<meta http-equiv="description" content="<%=Description%>" />
<title><%=Sitename%>-推荐音乐</title>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Music" class="com.bar.db.Music" />
<style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
.input1{width:400px; height:20px;}
a.cc:link { color: #FF0; text-decoration: none} 
a.cc:visited { color: #FF0; text-decoration: none} 
a.cc:hover { color: #FF0; text-decoration: none} 
a.cc:active { color: #FF0; text-decoration: none}
.font1{color:#FFF}
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
<script language="javascript" type="">

function Mycheck(){
if(from1.musicname.value=="")
{alert("歌曲名称不能为空！！");return false;}
if (from1.musicurl.value=="")
{alert("歌曲地址不能为空！！");return false;}

from1.submit();
}

</script>

</head>

<%
	request.setCharacterEncoding("gb2312");
	String sUserName = (String) session.getAttribute("uname");
	long lUserID = (Long) session.getAttribute("userid");

	String sMusicname = request.getParameter("musicname");

	if(sMusicname != null)
	{
		//获取留言内容
		String sMusicurl = request.getParameter("musicurl");
		//保存留言
		
		Music.setMusicname(sMusicname);
		Music.setMusicurl(sMusicurl);
		Music.setUserid(lUserID);
		Music.add();
	}	
		
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
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
  <td valign="top"><table width="451" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left" height="40" colspan="2" valign="middle">【用户推荐的音乐】</td>
    </tr>
    <%
	//获取当前的所有留言信息
	ResultSet rs = Music.show_music();
	//循环显示当前的所有留言信息
	while(rs.next())
	{
		String sMusicurl = rs.getString("musicurl");
		sMusicurl = sMusicurl.replaceAll("\r\n","<br>");
		lUserID = rs.getLong("userid"); 
		User.setUserid(lUserID);
		User.init();
%>
    <tr bgcolor="#ffffff">
      <td width="20%" height="20" align="left" bgcolor="#33CC00" >&nbsp;&nbsp;<span class="font1">歌曲名字：</span><font color="#0000FF"><%=rs.getString("musicname")%></font></td>
      <td width="30%" height="20" align="left" bgcolor="#33CC00"><span class="font1">发布者：</span><font color="#0000FF"><%=User.getUname()%></font>
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=sMusicurl%>" target="_blank" class="cc">下载</a>
      </td>
      
    </tr>
   
    <tr> 
      <td align="left" colspan="2" style="border-left:1px #999 dashed;border-right:1px #999 dashed; border-bottom:1px #999 dashed; padding-top:5px;"><embed src="<%=sMusicurl%>" autostart="false"  loop="false" height="45px" width="447"></embed><p>&nbsp;</p></td>
    </tr>
    <%
	}
%>
  </table></td>
    <td valign="top">
    

	<form name="form1" method="post" action="music.jsp" target="_self" onSubmit="return Mycheck()">

	<table width="400" border="0" align="center" cellpadding="0" cellspacing="1">
		<tr>
		<td width="100%" align="left" height="20">
		  <p>&nbsp;</p>
		  <p>&nbsp;&nbsp;您的用户名是：<font color="#0000FF"><%=sUserName%></font>，每次只能输入一个音乐地址</p></td>
		</tr>
		<tr>
		<td width="100%" align="left" ><p>&nbsp;</p>
        歌曲名字：<br /><input type="text" name="musicname" class="input1">
        </td>
        </tr>
        <tr>
        <td><p>&nbsp;</p>
        歌曲地址：(地址必须以http://开始)<br /><input type="text" name="musicurl" class="input1" >
		</td>
		</tr>
		<td width="100%" align="left" height="30"><p>&nbsp;</p>
		<input type="submit" name="submit" value="发布歌曲">
		</td>
	</table>
	</form>
    
</table>
</td>
</td>
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