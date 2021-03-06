<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="com.jspsmart.upload.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>欢迎光临网上商城</title>
	<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />

	</head>
	<body bgcolor="#F4FFFE">
	<div align=center>
	<%
		try
		{
			// 新建一个SmartUpload对象
			SmartUpload su = new SmartUpload();
			// 上传初始化
			su.initialize(pageContext);
			//设定上传限制
			//限制每个上传文件的最大长度。
			su.setMaxFileSize(1000000*8);
			//设定允许上传的文件（通过扩展名限制）
			su.setAllowedFilesList("jpg,gif,bmp,JPG,GIF,BMP,png,PNG");
			// 上传文件
			su.upload();		
			String sGoodinfoid=su.getRequest().getParameter("Goodinfoid");
			long lGoodinfoid = Long.parseLong(sGoodinfoid);
			Goodinfo.init();

			String sGoodinfoname=su.getRequest().getParameter("Goodinfoname");
			String sCompany=su.getRequest().getParameter("Company");
			String sAddr=su.getRequest().getParameter("Addr");
			String sNum=su.getRequest().getParameter("Num");
			int iNum = Integer.parseInt(sNum);
			String sPrice=su.getRequest().getParameter("Price");
			float fPrice = Float.parseFloat(sPrice);
			String sIntro=su.getRequest().getParameter("Intro");
			String sPicUrl=Goodinfo.getPicurl();
			//判断是否有附件上传
			com.jspsmart.upload.File file = su.getFiles().getFile(0);
			if (!file.isMissing())
			{
				String sPic=file.getFileName();	
				//将附件以 当前时间+附件扩展名 作为文件名保存		
				java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
				String sNowTime = dateFormatter.format(new java.util.Date());
				sPicUrl = sNowTime+"."+ file.getFileExt();
				file.saveAs("./pic/"+sPicUrl);
			}
			//将文章信息保存到数据库中
			Goodinfo.setGoodinfoid(lGoodinfoid);
			Goodinfo.setGoodinfoname(sGoodinfoname);
			Goodinfo.setCompany(sCompany);
			Goodinfo.setAddr(sAddr);
			Goodinfo.setNum(iNum);
			Goodinfo.setPrice(fPrice);
			Goodinfo.setIntro(sIntro);
			Goodinfo.setPicurl(sPicUrl);
			if(Goodinfo.updata())
			{
				out.println("<p><font color=blue>商品信息修改成功</font></p>");
				out.println("<input type=button name=btn1 value=\"返回商品管理\" onClick='window.location=\"./goods_list.jsp\"'>");
			}
			else
			{
				out.println("<p><font color=red>商品信息修改失败，请重试</font></p>");
				out.println("<input type=button name=btn2 value=\"返回\" onClick='window.history.go(-1)'>");
				return;
			}
		}
		catch(Exception e)
		{
			out.println("<p><font color=red>您上传的文件格式不对，或者上传文件太大！</font></p>");
			out.println("<input type=button name=btn3 value=返回 onClick='window.history.go(-1)'>");
			return;
		}
	%>
	</div>
	</body>
</html>
