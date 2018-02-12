<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="com.jspsmart.upload.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	
	<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />

	</head>
	<body bgcolor="#F4FFFE">
	<div align=center>
	<%
	request.setCharacterEncoding("gb2312");
		try
		{
			// �½�һ��SmartUpload����
			SmartUpload su = new SmartUpload();
			// �ϴ���ʼ��
			su.initialize(pageContext);
			//�趨�ϴ�����
			//����ÿ���ϴ��ļ�����󳤶ȡ�
			su.setMaxFileSize(1000000*8);
			//�趨�����ϴ����ļ���ͨ����չ�����ƣ�
			su.setAllowedFilesList("jpg,gif,bmp,JPG,GIF,BMP,png,PNG");
			// �ϴ��ļ�
			su.upload();		

			String sGoodinfoname=su.getRequest().getParameter("Goodinfoname");
			String sAddr=su.getRequest().getParameter("Addr");
			String sIntro=su.getRequest().getParameter("Intro");
			String sCompany=su.getRequest().getParameter("Company");
			String sPrice=su.getRequest().getParameter("Price");
			String sNum=su.getRequest().getParameter("Num");
			int Num = Integer.parseInt(sNum);
			float fPrice = Float.parseFloat(sPrice);
			String sPicUrl="";
			//�ж��Ƿ��и����ϴ�
			com.jspsmart.upload.File file = su.getFiles().getFile(0);
			if (!file.isMissing())
			{
				String sPic=file.getFileName();	
				//�������� ��ǰʱ��+������չ�� ��Ϊ�ļ�������
				java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
				String sNowTime = dateFormatter.format(new java.util.Date());
				sPicUrl = sNowTime+"."+ file.getFileExt();
				file.saveAs("./pic/"+sPicUrl);
			}
			//��������Ϣ���浽���ݿ���
			Goodinfo.setGoodinfoname(sGoodinfoname);
			Goodinfo.setCompany(sCompany);
			Goodinfo.setIntro(sIntro);
			Goodinfo.setAddr(sAddr);
			Goodinfo.setPicurl(sPicUrl);
			Goodinfo.setPrice(fPrice);
			Goodinfo.setNum(Num);
			if(Goodinfo.add())
			{
				out.println("<p><font color=blue>��Ʒ��Ϣ�����ɹ�</font></p>");
				out.println("<input type=button name=btn1 value=\"������Ʒ����\" onClick='window.location=\"./goods_list.jsp\"'>");
			}
			else
			{
				out.println("<p><font color=red>��Ʒ��Ϣ����ʧ�ܣ�������</font></p>");
				out.println("<input type=button name=btn2 value=\"����\" onClick='window.history.go(-1)'>");
				return;
			}
		}
		catch(Exception e)
		{
			out.println("<p><font color=red>���ϴ����ļ���ʽ���ԣ������ϴ��ļ�̫��</font></p>");
			out.println("<input type=button name=btn3 value=���� onClick='window.history.go(-1)'>");
			return;
		}
	%>
	</div>
	</body>
</html>
