<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%request.setCharacterEncoding("gb2312"); 
%>
<style type="text/css">
input{height:20px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <div align="center">
  <table width="548" height="41" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td background="images/top.jpg">&nbsp;</td>
    </tr>
  </table>
  <table width="548" border="0" cellpadding="0" cellspacing="0">
    <form name="form1" method="post" action="inc/insert.jsp" onSubmit="return Mycheck()">
    <tr bgcolor="#FFFFFF">
      <td width="119" height="25"><div align="right">用&nbsp;户&nbsp;名：</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="uname" type="text" id="uname" size="30">



	    *输入用户名 
        </td>


    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="pwd1" type="password" size="30">
        *（由6-20位内的字母和数字组成）</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">确认密码：</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="pwd2" type="password" size="30">
        *</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">真实姓名：</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="name" type="text" size="30">
        *</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">性&nbsp;&nbsp;&nbsp;&nbsp;别：</div></td>
      <td colspan="2">&nbsp;&nbsp;
        <input name="sex" type="radio" value="男" checked>
        男
        <input type="radio" name="sex" value="女">
        女
        <input type="radio" name="sex" value="保密">
        保密</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">出生日期：</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="birth" type="text" size="30" onfocus="getDateString(this,oCalendarChs)" readOnly value="1987-10-20" runat="server">
        *（如：1980/07/17或1980-07-17）</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">地&nbsp;&nbsp;&nbsp;&nbsp;址：</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="address" type="text" size="30">
        *</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">邮政编码：</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="post" type="text" size="30">
        *</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">电&nbsp;&nbsp;&nbsp;&nbsp;话：</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="tel" type="text" size="30">
        *</td>
    </tr>
	  <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">Email：&nbsp;&nbsp;</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="email" type="text" size="30">
        *</td>
    </tr>

	  <tr bgcolor="#FFFFFF">
      <td height="6"><div align="right">密保问题：</div></td>
      <td height="6" colspan="2">&nbsp;&nbsp;<input name="safequestion" type="text" size="30">
      *（为找回密码使用，10-15个汉字）</td>
      </tr>
	  <tr bgcolor="#FFFFFF">
	    <td height="3"><div align="right">密保答案：</div></td>
	    <td height="3" colspan="2">&nbsp;&nbsp;<input name="safeanswer" type="text" size="30">
        *（为找回密码使用，10-15个汉字）</td>
      </tr>
	  <tr bgcolor="#FFFFFF">
	    <td height="33"><div align="right">验&nbsp;证&nbsp;码：</div></td>
	    <td width="84" height="33">&nbsp;&nbsp;<input name="Rand" type="text" size="8"></td>
	    <td width="345"><img src="inc/image.jsp" name="myImage" /></td>
      </tr>
	  <tr bgcolor="#FFFFFF">
	    <td height="13" colspan="3"><div align="center"><font color="FF9000">注：如果您在30天内没有登录该网站，您的信息将会被删除。</font></div></td>
      </tr>
	 <tr bgcolor="#FFFFFF">
       <td height="25">&nbsp;</td>
       <td colspan="2">&nbsp;&nbsp;<input type="submit" name="Submit2" value="注册">&nbsp;&nbsp;
     &nbsp;&nbsp;   <input type="reset" name="Submit" value="重置">        </td>
    </tr></form>
	   
	  <tr bgcolor="#FFFFFF">
      <td height="25" colspan="3">
        <div align="center"></div></td>
     </tr>
	
  </table>


</div>
