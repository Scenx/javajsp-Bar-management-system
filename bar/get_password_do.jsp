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
			//��ȡ�û���
			String sUserName = request.getParameter("UserName");
			User.setUname(sUserName);
			//�����û�����ȡ�û���Ϣ
			if(User.init_byUserName())
			{
				try
				{
					//��html���н����ʼ���Ϣ
					String sTo = User.getEmail();
					String sTitle = "����"+Sitename+"�е�����";
					String sContent= "<p>����"+Sitename+"�е��û����ǣ�<i>"+User.getUname()+"</i></p>";
					String sFoot = "<p>���ڼ�ס���������ɾ�����ż����Է����˿����������롣---"+Sitename+"�ͷ�����</p>";
					sContent = sContent + "<p>����"+Sitename+"�е�������:<i>"+User.getSpwd()+"</i></p>" + sFoot;
					//�����ʼ��Ự��Ҳ����Properties props = System.getProperties(); 
					Properties props=new Properties();		
					//�����ʼ��Ự
					props.put("mail.smtp.host","smtp.qq.com");
					props.put("mail.smtp.auth","true");
					Session s=Session.getInstance(props);
					s.setDebug(true);
					MimeMessage message=new MimeMessage(s);
					
					//����Ϣ�������÷�����/�ռ���/����/����ʱ��
					InternetAddress from=new InternetAddress("1417942786@qq.com");
					//������
					message.setFrom(from);
					InternetAddress to=new InternetAddress(sTo);
					message.setRecipient(Message.RecipientType.TO,to);
					message.setSubject(sTitle);
					message.setSentDate(new java.util.Date());
					
					//����Ϣ������������
					//�½�һ������ż����ݵ�BodyPart����
					BodyPart mdp=new MimeBodyPart();
					//��BodyPart�����������ݺ͸�ʽ�ı��뷽ʽ
					mdp.setContent(sContent,"text/html;charset=gb2312");
					//�½�һ��MimeMultipart�����������BodyPart����(��ʵ�Ͽ��Դ�Ŷ��)
					Multipart mm=new MimeMultipart();
					//��BodyPart���뵽MimeMultipart������(���Լ�����BodyPart)
					mm.addBodyPart(mdp);
					//��mm��Ϊ��Ϣ���������
					message.setContent(mm);				
					message.saveChanges();
					Transport transport=s.getTransport("smtp");
					//��smtp��ʽ��¼����,��һ�������Ƿ����ʼ��õ��ʼ�������SMTP��ַ,�ڶ�������Ϊ�û���,����������Ϊ����
					transport.connect("smtp.qq.com","1417942786","qq123456");
					transport.sendMessage(message,message.getAllRecipients());
					transport.close();
		%>
		<br><br><br><br><br><br><br><br><br>
			<p align="center">���������Ѿ����͵���<font color="#FF0000"><%=sTo%></font></p>
			<p align="center"><input class=input1 type="button" name="btn" value="�رմ���" onClick="javascript:window.close()"></p>
		<%
				}
				catch(MessagingException e)
				{
					out.println("<br><br><br><br><br><br><br><br><p><font color=red>���뷢��ʧ�ܣ�</font></p>");
					out.println("<center><input class=input1 type=button name=goback value=���� onclick=javascript:window.history.go(-1)></center>");			
				}
			}
			else
			{
				out.println("<br><br><br><br><br><br><br><p>�û���&nbsp;<font color=red>"+sUserName+"</font>&nbsp;�����ڣ�</p>");
				out.println("<p><input class=input1 type=button name=goback1 value=���� onclick=javascript:window.history.go(-1)></p>");			
			}
		%>
		</div>
	</body>
</html>
