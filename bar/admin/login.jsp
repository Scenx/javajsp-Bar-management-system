<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*"  errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>С�;ư����߹���ϵͳ��̨���</title>
<style type="text/css">
body{margin:0 0; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; padding-top:200px; background-color:#000}
.input1{width:80px; border:1px #CCC dotted;}
.input2{width:150px; border:1px #CCC dotted; height:20px;}
.input3{width:70px; border:1px #CCC dotted; height:20px;}
h1{font-size:13px;}
</style>
<script language="javascript">
	function check(form){
		if(form1.adminname.value==""){
			alert("�������û���");form1.adminname.focus();return false;		
		}
		if(form1.password.value==""){
			alert("����������");form1.password.focus();return false;
		}
	}
</script>

</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#000000">
    <form name="form1" method="post" action="check_login.jsp" onSubmit="return check(form1)">
    <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td height="33" colspan="2" align="center" bgcolor="#99CC00"><h1>&nbsp;</h1>
          <h1>С�;ư����߹���ϵͳ��̨��½</h1></td>
      </tr>
      <tr>
        <td width="169" height="31" bgcolor="#99CC00"><p align="center">�û�����</p></td>
        <td width="231" bgcolor="#99CC00"><input name="uname" type="text" class="input2" id="uname" /></td>
      </tr>
      <tr>
        <td height="38" bgcolor="#99CC00"><p align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</p></td>
        <td bgcolor="#99CC00"><input name="pwd" type="password" class="input2" id="pwd" /></td>
      </tr>
      <tr>
        <td bgcolor="#99CC00"><p align="center">
          <input name="adminlogin" type="submit" class="input1" value="��½" />
          </p>
          <p align="center">&nbsp;</p></td>
        <td bgcolor="#99CC00"><p align="center">
          <input name="reset" type="reset" class="input1" value="���" />
          </p>
          <p align="center">&nbsp;</p></td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
</body>
</html>