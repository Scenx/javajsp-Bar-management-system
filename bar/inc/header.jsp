<%@ page contentType="text/html; charset=gb2312" language="java" %>
<script language="javascript" type="text/javascript">

function Mycheck(){
if(from1.uname.value=="")
{alert("�û�������Ϊ�գ���");return false;}
if (from1.pwd.value=="")
{alert("��½���벻��Ϊ�գ���");return false;}

from1.submit();
}

</script>
<div class="container">
    <div id="header">
    	 
  <ul class="topnav">
            <li><a href="index.jsp">��ҳ</a></li>
            <li><a href="news.jsp">�ư�����</a></li>
            <li><a href="beer.jsp">�ưɾ�ˮ</a></li>
            <li><a href="photos.jsp">�ư����</a></li>
            <li><a href="talk.jsp">���԰�</a></li>
            <li><a href="pay.jsp">Ԥ��/����</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li><a href="get_password_form.html" target="_blank">��������</a></li>

      </ul>
    </div>
</div>
<div class="header_login_all">
<hr style="position: relative; height:1px; border:1px #FFF dotted" />
<%
  if(uname!=null)
  {
   uname = (String)session.getAttribute("uname");
   out.println("<div class='panel_button1'><a href='#'>��ӭ����'"+ uname +"'</a>|<a href='updata_user.jsp'>�޸���Ϣ</a>|<a href='goods_list.jsp'>������ʷ</a>|<a href='pay.jsp'>Ԥ��/����</a>|<a href='music.jsp'>�Ƽ�����</a>|<a href='email.jsp'>վ���ʼ�</a>|<a href='loginout.jsp'>�˳���½ </a></div>");
   
  }

else 
{ 


%>
  
<hr id="header_login_stripe"/>
  <div id="page_container">
  <div id="toppanel">
    <div id="panel">
      <div id="panel_contents"> </div>
      <h1>��Ա��½</h1>
      <h2>COPYRIGHT&copy;С�;ư�����ϵͳ</h2>
      <a href="reg.jsp"><img class="border_pic" src="images/tutsplus.jpg" alt="Screenshot" /></a>
      <div class="border" id="login">
      <form action="check_login.jsp" method="post" name="from1" onSubmit="return Mycheck()">
        <p>
        <br />
        �û�����
          <input type="text" size="15" name="uname" id="uname" />
          <br /><br />
          ��&nbsp;&nbsp;&nbsp;&nbsp;�룺
          <input type="password" size="15" name="pwd" id="pwd" />
          <br />
          <input type="submit" accesskey="l" id="login_btn" name="submit" value="���ٵ�½" />
        </p>
        </form>
      </div>
    </div>
    <div class="panel_button" style="display: visible;"><a href="#">��½/ע��</a> </div>
    <div class="panel_button" id="hide_button" style="display: none;"><a href="#">�ر�/����</a> </div>
  </div>
</div></div>

<%
}
%>