<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="com.bar.db.*"%>
<%@ include file="systems.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean id="User" scope="page" class="com.bar.db.User"/>
<style type="text/css" >
body {font-family:Georgia, "Times New Roman", Times, serif; font-size:14px}
.input1{width:100px; height:25px; background-color: #09F; color:#FFF ; border:1px}
.input2{width:200px; height:25px; background-color: #FFC}
</style>
	</head>
	<body bgcolor="#F4FFFE">
	<div align="center">
		<%
			//获取用户名
			String sUserName = request.getParameter("UserName");
			User.setUname(sUserName);
			//根据用户名获取用户信息
			if(User.init_byUserName())
			{
				try
				{
					//从html表单中接收邮件信息
					String sTo = User.getEmail();
					String sTitle = "您在"+Sitename+"中的密码";
					String sContent= "<p>您在"+Sitename+"中的用户名是：<i>"+User.getUname()+"</i></p>";
					String sFoot = "<p>请在记住密码后立即删除此信件，以防别人看见您的密码。---"+Sitename+"客服中心</p>";
					sContent = sContent + "<p>您在"+Sitename+"中的密码是:<i>"+User.getSpwd()+"</i></p>" + sFoot;
					//建立邮件会话，也可用Properties props = System.getProperties(); 
					Properties props=new Properties();		
					//建立邮件会话
					props.put("mail.smtp.host","smtp.qq.com");
					props.put("mail.smtp.auth","true");
					Session s=Session.getInstance(props);
					s.setDebug(true);
					MimeMessage message=new MimeMessage(s);
					
					//给消息对象设置发件人/收件人/主题/发信时间
					InternetAddress from=new InternetAddress("1417942786@qq.com");
					//发件人
					message.setFrom(from);
					InternetAddress to=new InternetAddress(sTo);
					message.setRecipient(Message.RecipientType.TO,to);
					message.setSubject(sTitle);
					message.setSentDate(new java.util.Date());
					
					//给消息对象设置内容
					//新建一个存放信件内容的BodyPart对象
					BodyPart mdp=new MimeBodyPart();
					//给BodyPart对象设置内容和格式的编码方式
					mdp.setContent(sContent,"text/html;charset=gb2312");
					//新建一个MimeMultipart对象用来存放BodyPart对象(事实上可以存放多个)
					Multipart mm=new MimeMultipart();
					//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
					mm.addBodyPart(mdp);
					//把mm作为消息对象的内容
					message.setContent(mm);				
					message.saveChanges();
					Transport transport=s.getTransport("smtp");
					//以smtp方式登录邮箱,第一个参数是发送邮件用的邮件服务器SMTP地址,第二个参数为用户名,第三个参数为密码
					transport.connect("smtp.qq.com","1417942786","qq123456");
					transport.sendMessage(message,message.getAllRecipients());
					transport.close();
		%>
		<br><br><br><br><br><br><br><br><br>
			<p align="center">您的密码已经发送到：<font color="#FF0000"><%=sTo%></font></p>
			<p align="center"><input class=input1 type="button" name="btn" value="关闭窗口" onClick="javascript:window.close()"></p>
		<%
				}
				catch(MessagingException e)
				{
					out.println("<br><br><br><br><br><br><br><br><p><font color=red>密码发送失败！</font></p>");
					out.println("<center><input class=input1 type=button name=goback value=返回 onclick=javascript:window.history.go(-1)></center>");			
				}
			}
			else
			{
				out.println("<br><br><br><br><br><br><br><p>用户名&nbsp;<font color=red>"+sUserName+"</font>&nbsp;不存在！</p>");
				out.println("<p><input class=input1 type=button name=goback1 value=返回 onclick=javascript:window.history.go(-1)></p>");			
			}
		%>
		</div>
	</body>
</html>
