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
      <td width="119" height="25"><div align="right">��&nbsp;��&nbsp;����</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="uname" type="text" id="uname" size="30">



	    *�����û��� 
        </td>


    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="pwd1" type="password" size="30">
        *����6-20λ�ڵ���ĸ��������ɣ�</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">ȷ�����룺</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="pwd2" type="password" size="30">
        *</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">��ʵ������</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="name" type="text" size="30">
        *</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
      <td colspan="2">&nbsp;&nbsp;
        <input name="sex" type="radio" value="��" checked>
        ��
        <input type="radio" name="sex" value="Ů">
        Ů
        <input type="radio" name="sex" value="����">
        ����</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">�������ڣ�</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="birth" type="text" size="30" onfocus="getDateString(this,oCalendarChs)" readOnly value="1987-10-20" runat="server">
        *���磺1980/07/17��1980-07-17��</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;ַ��</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="address" type="text" size="30">
        *</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">�������룺</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="post" type="text" size="30">
        *</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;����</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="tel" type="text" size="30">
        *</td>
    </tr>
	  <tr bgcolor="#FFFFFF">
      <td height="25"><div align="right">Email��&nbsp;&nbsp;</div></td>
      <td colspan="2">&nbsp;&nbsp;<input name="email" type="text" size="30">
        *</td>
    </tr>

	  <tr bgcolor="#FFFFFF">
      <td height="6"><div align="right">�ܱ����⣺</div></td>
      <td height="6" colspan="2">&nbsp;&nbsp;<input name="safequestion" type="text" size="30">
      *��Ϊ�һ�����ʹ�ã�10-15�����֣�</td>
      </tr>
	  <tr bgcolor="#FFFFFF">
	    <td height="3"><div align="right">�ܱ��𰸣�</div></td>
	    <td height="3" colspan="2">&nbsp;&nbsp;<input name="safeanswer" type="text" size="30">
        *��Ϊ�һ�����ʹ�ã�10-15�����֣�</td>
      </tr>
	  <tr bgcolor="#FFFFFF">
	    <td height="33"><div align="right">��&nbsp;֤&nbsp;�룺</div></td>
	    <td width="84" height="33">&nbsp;&nbsp;<input name="Rand" type="text" size="8"></td>
	    <td width="345"><img src="inc/image.jsp" name="myImage" /></td>
      </tr>
	  <tr bgcolor="#FFFFFF">
	    <td height="13" colspan="3"><div align="center"><font color="FF9000">ע���������30����û�е�¼����վ��������Ϣ���ᱻɾ����</font></div></td>
      </tr>
	 <tr bgcolor="#FFFFFF">
       <td height="25">&nbsp;</td>
       <td colspan="2">&nbsp;&nbsp;<input type="submit" name="Submit2" value="ע��">&nbsp;&nbsp;
     &nbsp;&nbsp;   <input type="reset" name="Submit" value="����">        </td>
    </tr></form>
	   
	  <tr bgcolor="#FFFFFF">
      <td height="25" colspan="3">
        <div align="center"></div></td>
     </tr>
	
  </table>


</div>
