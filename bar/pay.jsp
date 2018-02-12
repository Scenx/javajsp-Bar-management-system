<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="systems.jsp" %>
<%
	String uname = (String) session.getAttribute("uname");	
%>
<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="keywords" content="<%=Keywords%>" />
<meta http-equiv="description" content="<%=Description%>" />
<title><%=Sitename%>-������Ϣ</title>
<style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
td{border-bottom:1px #999 dashed}
.font1{color:#09F; font-size:12px}
.font2{color:#F00}
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

<%
    String sUserName = (String) session.getAttribute("uname");
	long lUserID = (Long) session.getAttribute("userid");	
	User.setUserid(lUserID);	
    User.init();
	float fMoney = User.getMoney();
	
	
	
	ResultSet rs = Goodinfo.show_goodinfo();
	pages.initialize(rs,5);
	String strPage=null;
	int showPage = 1;
	//��ȡ��ת����Ŀ��ҳ��
	strPage=request.getParameter("showPage");
	
	if (strPage==null)
	{
		showPage=1;
	}
	else
	{
		try
		{
			showPage=Integer.parseInt(strPage);
		}
		catch(NumberFormatException e)
		{
			showPage = 1;
		}
		if(showPage<1) 
		{
			showPage=1;
		}
		if(showPage>pages.getPageCount()) 
		{
			showPage=pages.getPageCount();
		}
	}
	//��ȡҪ��ʾ�����ݼ���
	Vector vData=pages.getPage(showPage);	
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
  <%
	for(int i=0;i<vData.size();i++)
	{ 
		//��ʾ����
		String[] sData=(String[])vData.get(i);
		long lGoodinfoid = Long.parseLong(sData[0]);
		Goodinfo.setGoodinfoid(lGoodinfoid);
		Goodinfo.init();
		float sPrice = Goodinfo.getPrice();
		
%>
  <tr style="padding-top:5px;">
    <td width="153" rowspan="2"><img src="pic/<%=Goodinfo.getPicurl()%>" border="0" width="150px" height="100px"></td>
    <td width="191" height="18">�ײ����ƣ�<font class="font1"><%=sData[1]%></font></td>
    <td width="206">ơ�����ͣ�<font class="font1"><%=sData[2]%></font></td>
    <td width="111">ơ��������<font class="font1"><%=sData[5]%>��</font></td>
    <td width="173">�ײͼ۸�<font class="font1"><%=sData[6]%>Ԫ</font></td>
    <td width="126" align="center">
    <%
	if(lUserID!= 0 & fMoney >= sPrice){
	
    out.print("<A href=payfor.jsp?Goodinfoid="+ sData[0] +"&userid="+lUserID+">��Ҫ����</A>");
    
	}
	else{
    out.print("<font class=font2>��Ҫ����(����)</font>");
	}
	%>
    </td>
  </tr>
  <tr>
    <td colspan="5">�ײͽ��ܣ�<%=sData[4]%></td>
  </tr>
  <%
		
	}
%>
</table>

<center>
<font class="font1">
<form action="pay.jsp" method="post" target="_self">	
	��<font class="font1"><%=showPage%>ҳ/��<font color=red><%=pages.getPageCount()%>ҳ&nbsp;
	<a href="pay.jsp?showPage=1" target="_self"><font color="#0000FF">[��ҳ]</a>&nbsp;			
	<%
		//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
		if(showPage > 1)
		{				
	%>
			<a href="pay.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[��һҳ] </a>&nbsp;
	<%
		}
		else
		{
			out.println("[��һҳ]&nbsp;");
		}
		//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
		if(showPage < pages.getPageCount())
		{				
	%>
			<a href="pay.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[��һҳ] </a>&nbsp;
	<%
		}
		else
		{
			out.println("[��һҳ]&nbsp;");
		}
	%> 
	<a href="pay.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[βҳ] </a>&nbsp;
	ת��
	<select name="showPage">
	<%
		for(int x=1;x<=pages.getPageCount();x++)
		{
	%>
			<option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
	<%
		}
	%>
	</select>
	ҳ&nbsp;

	<input name="go" type="submit" class="input1" value="�ύ"/>
</form>
</font>
</center>
<table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
<%@ include file="inc/footer.jsp" %>
    </td>
  </tr>
</table>
</body>
<%rs.close();%>
</html>