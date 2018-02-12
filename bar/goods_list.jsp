<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="systems.jsp" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="keywords" content="<%=Keywords%>" />
<meta http-equiv="description" content="<%=Description%>" />
<title><%=Sitename%>-������ʷ</title>
<style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
td{border-bottom:1px #999 dashed}
.font1{color:#09F; font-size:12px}
.font2{color:#F00}
td{border-bottom:1px #999 dashed; border-right:1px #999 dashed}
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

	<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
	<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
	</head>
<body bgcolor="#F4FFFE">
<%
		//��ȡ��ǰ�����û����û���
		String sUserName = (String) session.getAttribute("uname");	
		//��ȡ��ǰ�����û���������
		long lUserID = (Long) session.getAttribute("userid");	
		Goods.setUserid(lUserID);
		//��ȡ��ǰ�����û����ﳵ�е�������Ϣ
		ResultSet rs = Goods.show_my_goods();
	%>

	<div align="center">
    <%@ include file="inc/header.jsp" %>
    <table width="960" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td>
<iframe src="inc/top_news.jsp" frameborder="0" scrolling="no" width="960" height="30"></iframe>
</td>
</tr>
</table>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr bgcolor="#0066FF">
		<td height="30" colspan="6" align="center" bgcolor="#339933"><font color="#FFFFFF"><%=sUserName%> �Ĺ�����ʷ</font></td>
		</tr>
		<tr>
		<td width="24%" height="25" align="center"><font color="#0000FF">��Ʒ����</font></td>
		<td width="16%" height="25" align="center"><font color="#0000FF">ơ������</font></td>
		<td width="16%" height="25" align="center"><font color="#0000FF">��������</font></td>
		<td width="11%" height="25" align="center"><font color="#0000FF">�۸�</font></td>
		<td width="10%" height="25" align="center"><font color="#0000FF">��������</font></td>
		<td width="23%" height="25" align="center"><font color="#0000FF">�ӹ�����ʷ�����</font></td>
		</tr>
	<%
		float total = 0; //������Ʒ���ܼ�
		//ѭ����ʾ���й�����Ϣ
		while(rs.next())
		{
			long lGoodsID = rs.getLong("goodsid");
			Goodinfo.setGoodinfoid(rs.getLong("goodinfoid"));
			Goodinfo.init();
			int iBuyNumber = rs.getInt("buynumber");
			//������Ʒ�ܼ�
			total = iBuyNumber * Goodinfo.getPrice() + total;
		    float all = iBuyNumber * Goodinfo.getPrice();
	%>
		<tr>
		<td width="24%" height="25" align="center">&nbsp;<a href="pay.jsp" target="_self"><font color="#0000FF"><%=Goodinfo.getGoodinfoname()%></font></a></td>
		<td width="16%" height="25" align="center">&nbsp;<%=Goodinfo.getCompany()%></td>
		<td width="16%" height="25" align="center">&nbsp;<%=Goodinfo.getAddr()%></td>
		<td width="11%" height="25" align="center">&nbsp;<%=all%></td>
		<td width="10%" height="25" align="center"><%=iBuyNumber%></td>
		<td width="23%" height="25" align="center"><input type="button" name="btn" value="���" onClick='javascript:window.location="delete_goods.jsp?Goodsid=<%=lGoodsID%>"'></td>
		</tr>
	<%
		}
	%>
		<tr>
		<td height="30" align="center" colspan="6">�ܼƣ�<font color="#0000FF"><%=total%></font>&nbsp;��RMB��</td>
		</tr>
	</table>
    <table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
<%@ include file="inc/footer.jsp" %>
    </td>
  </tr>
</table>
	<%rs.close();%>
</div>
</body>
</html>
