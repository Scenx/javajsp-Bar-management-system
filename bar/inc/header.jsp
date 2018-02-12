<%@ page contentType="text/html; charset=gb2312" language="java" %>
<script language="javascript" type="text/javascript">

function Mycheck(){
if(from1.uname.value=="")
{alert("用户名不能为空！！");return false;}
if (from1.pwd.value=="")
{alert("登陆密码不能为空！！");return false;}

from1.submit();
}

</script>
<div class="container">
    <div id="header">
    	 
  <ul class="topnav">
            <li><a href="index.jsp">首页</a></li>
            <li><a href="news.jsp">酒吧新闻</a></li>
            <li><a href="beer.jsp">酒吧酒水</a></li>
            <li><a href="photos.jsp">酒吧相册</a></li>
            <li><a href="talk.jsp">留言板</a></li>
            <li><a href="pay.jsp">预定/付款</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li><a href="get_password_form.html" target="_blank">忘记密码</a></li>

      </ul>
    </div>
</div>
<div class="header_login_all">
<hr style="position: relative; height:1px; border:1px #FFF dotted" />
<%
  if(uname!=null)
  {
   uname = (String)session.getAttribute("uname");
   out.println("<div class='panel_button1'><a href='#'>欢迎您：'"+ uname +"'</a>|<a href='updata_user.jsp'>修改信息</a>|<a href='goods_list.jsp'>购物历史</a>|<a href='pay.jsp'>预定/付款</a>|<a href='music.jsp'>推荐音乐</a>|<a href='email.jsp'>站内邮件</a>|<a href='loginout.jsp'>退出登陆 </a></div>");
   
  }

else 
{ 


%>
  
<hr id="header_login_stripe"/>
  <div id="page_container">
  <div id="toppanel">
    <div id="panel">
      <div id="panel_contents"> </div>
      <h1>会员登陆</h1>
      <h2>COPYRIGHT&copy;小型酒吧在线系统</h2>
      <a href="reg.jsp"><img class="border_pic" src="images/tutsplus.jpg" alt="Screenshot" /></a>
      <div class="border" id="login">
      <form action="check_login.jsp" method="post" name="from1" onSubmit="return Mycheck()">
        <p>
        <br />
        用户名：
          <input type="text" size="15" name="uname" id="uname" />
          <br /><br />
          密&nbsp;&nbsp;&nbsp;&nbsp;码：
          <input type="password" size="15" name="pwd" id="pwd" />
          <br />
          <input type="submit" accesskey="l" id="login_btn" name="submit" value="快速登陆" />
        </p>
        </form>
      </div>
    </div>
    <div class="panel_button" style="display: visible;"><a href="#">登陆/注册</a> </div>
    <div class="panel_button" id="hide_button" style="display: none;"><a href="#">关闭/隐藏</a> </div>
  </div>
</div></div>

<%
}
%>