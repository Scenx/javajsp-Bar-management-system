<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%
	String uname = (String) session.getAttribute("uname");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

		<jsp:useBean scope="page" id="Email" class="com.bar.db.Email" />
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
	<div align="center">
<%
	//��ȡ��ǰ�û����û���
	String sUserName = (String) session.getAttribute("uname");

	//�����Ҫ��ʾ�ʼ���������
	String sID = request.getParameter("EmailID");
	long lEmailID = Long.parseLong(sID);

	//����ʼ���Ϣ
	Email.setEmailid(lEmailID);
	Email.init();

	//�жϵ�ǰ�û��Ƿ���Ȩ�쿴���ʼ�
	if(Email.getReceiver().compareTo(sUserName) != 0 && Email.getSender().compareTo(sUserName) != 0)
	{
		out.println("<p align=center>��ûȨ�鿴���ʼ���</p>");
		out.println("<div align=\"center\"><input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\"></div>");
		return;
	}
%>

	<br>
	<table width="960" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
	<td align="left">
	�����ˣ�<font color="#0000FF"><%=Email.getSender()%></font>&nbsp;&nbsp;&rarr;&nbsp;&nbsp;
	�����ˣ�<font color="#0000FF"><%=Email.getReceiver()%></font>&nbsp;&nbsp;&rarr;&nbsp;&nbsp;
	��&nbsp;&nbsp;�⣺<%=Email.getSubject()%>
    <hr>
	<%
		//�滻�ʼ������еĻس��ͻ��з��ţ��Ա���ҳ������������ʾ
		String sContent = Email.getContent();
		sContent = sContent.replaceAll("\r\n","<br>");
		out.println(sContent+"<br>");
	%>
	<br>
	</table>
	<p>
	[<a href="send_email_form.jsp?ArticleID=0&EmailID=<%=lEmailID%>" target="_self"><font color="#0000FF">�ظ�</font></a>]&nbsp;&nbsp;&nbsp;&nbsp;
	[<a href="javascript:window.history.go(-1)" target="_self"><font color="#0000FF">����</font></a>]
	</p>
	</div>
	<%
		//���ʼ��������Ѷ�
		Email.update_tag();
	%>
    <table width="962" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#FFF">
  <tr>
    <td>
<%@ include file="inc/footer.jsp" %>
    </td>
  </tr>
</table>
	</body>
</html>
