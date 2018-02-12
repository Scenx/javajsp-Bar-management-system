<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
        <style type="text/css">
		body{ font-family:Georgia, "Times New Roman", Times, serif; font-size: 12px}
		</style>
	</head>
	<body bgcolor="#F4FFFE">
	<div align="center">
	<%
		//获取所要删除的购物信息索引号
		String sGoodsID = request.getParameter("Goodsid");
		long lGoodsID = Long.parseLong(sGoodsID);
		
		long lUserID = (Long) session.getAttribute("userid");			
		Goods.setGoodsid(lGoodsID);
		Goods.setUserid(lUserID);
		if(Goods.valid())
		{
			//删除购物车信息
			if(Goods.delete())
			{
				response.sendRedirect("goods_list.jsp");
			}
			else
			{
				out.println("<p><font color=red>操作失败，请重试</font></p>");
				out.println("<input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\">");
			}
		}
		else
		{
			out.println("<p><font color=red>您无权进行操作操作</font></p>");
			out.println("<input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\">");
		}
	%>
	</div>
	</body>
</html>
