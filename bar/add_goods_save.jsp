<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

		<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
        <jsp:useBean scope="page" id="User"  class="com.bar.db.User" />
        <style type="text/css">
		body{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		</style>
	</head>
	<body bgcolor="#F4FFFE">
	<div align=center><br>
<%
	request.setCharacterEncoding("gb2312");
	long lUserID = (Long) session.getAttribute("userid");
	User.setUserid(lUserID);
	User.init();
	
	String sGoodinfoid = request.getParameter("Goodinfoid");
	long lGoodinfoid = Long.parseLong(sGoodinfoid);
	String sBuyNumber = request.getParameter("BuyNumber");
	int iBuyNumber = Integer.parseInt(sBuyNumber);
	
	String fPrice = request.getParameter("Price");

	float sPrice = Float.parseFloat(fPrice);

	String strPage = request.getParameter("showPage");
	
	
	//�û�����ȥ�۸񲢴����û��˻���
	float sMoney = User.getMoney();
	float Money =sMoney-sPrice*iBuyNumber;
	float gPrice = sPrice*iBuyNumber;
    User.setMoney(Money);
	
	//��ȡ������Ϣ
	Goods.setUserid(lUserID);
	Goods.setbuynumber(iBuyNumber);
	Goods.setGoodinfoid(lGoodinfoid);
	Goods.setPrice(gPrice);
	//���湺����Ϣ
	if(Goods.add() & User.money())
	{
		
		out.println("<p><font color=blue>�����ɹ��������鿴������ʷ</font></p>");
		out.println("<input type=button name=btn1 value=ȷ�� onClick='javascript:window.location=\"goods_list.jsp?showPage="+strPage+"\"'>");

	}
	else
	{
		out.println("<p><font color=red>����ʧ�ܣ������ԡ���</font></p>");
		out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
		
	}
%>
	</div>
	</body>
</html>
