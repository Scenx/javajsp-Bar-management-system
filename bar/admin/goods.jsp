<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color: #FFC; margin: 0 auto;}
td{border-bottom:1px  #F3F dashed; border-right:1px #F3F dashed}
</style>
<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage" />

</head>
<%
	//��ȡ���ж�����Ϣ
	ResultSet rs = Goods.show_all_goods();
	//��ʼ����ҳ��ʾ��
	pages.initialize(rs,25);
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
<body bgcolor="#F4FFFE">
<div align="center">
<form name="form1" action="delete_goods.jsp" method="post" target="_self">
<table width="100%" border="0" cellpadding="0" cellspacing="1">
	<tr bgcolor="#0066FF">
	<td width="6%" height="20" align="center" bgcolor="#FFFF33"><font color="#000000">ѡ��</font></td>
	<td width="9%" height="20" align="center" bgcolor="#FFFF33"><font color="#000000">�������</font></td>
	<td width="19%" height="20" align="center" bgcolor="#FFFF33"><font color="#000000">�ײ�����</font></td>
	<td width="22%" height="20" align="center" bgcolor="#FFFF33"><font color="#000000">������</font></td>
	<td width="10%" height="20" align="center" bgcolor="#FFFF33"><font color="#000000">��������</font></td>
	<td width="17%" height="20" align="center" bgcolor="#FFFF33">����ʱ��</td>
	<td width="17%" align="center" bgcolor="#FFFF33"><font color="#000000">������Ϣ</font></td>
	</tr>
<%
	//ѭ����ʾ���ж�����Ϣ
	for(int i=0;i<vData.size();i++)
	{ 
		//��ʾ����
		String[] sData=(String[])vData.get(i);
		long lUserID = Long.parseLong(sData[2]);
		long lGoodinfoid = Long.parseLong(sData[4]);
		User.setUserid(lUserID);
		Goodinfo.setGoodinfoid(lGoodinfoid);
		if(User.init() && Goodinfo.init())
		{
%>
	<tr>
	<td width="6%" height="20" align="center"><input type="checkbox" name="DeleteID" value="<%=sData[0]%>"></td>
	<td width="9%" height="20" align="center">&nbsp;<%=sData[0]%></td>
	<td width="19%" height="20" align="center">&nbsp;<font color="#0000FF"><%=Goodinfo.getGoodinfoname()%></font></td>
	<td width="22%" height="20" align="center">&nbsp;�û�����<font color="#0000FF"><%=User.getUname()%></font> | ��ʵ������<font color="#0000FF"><%=User.getName()%></font></td>
	<td width="10%" height="20" align="center">&nbsp;<%=sData[1]%></td>
	<td width="17%" height="20" align="center">&nbsp;<%=sData[5]%></td>
	<td width="17%" height="20" align="center">&nbsp;<font style="color:#F00"><%=sData[3]%>(�Ѹ���)</font></td>
	</tr>

<%
		}
	}
%>
</table>
<p><a href="javascript:form1.submit()" target="_self"><font color="#0000FF">ɾ��ѡ�еĶ�����Ϣ</font></a></p>
</form>
<p>
<form action="goods.jsp" method="post" target="_self">	
	��<font color="#FF0000"><%=showPage%></font>ҳ/��<font color=red><%=pages.getPageCount()%></font>ҳ&nbsp;
	<a href="goods.jsp?showPage=1" target="_self"><font color="#0000FF">[��ҳ]</font></a>&nbsp;			
	<%
		//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
		if(showPage > 1)
		{				
	%>
	<a href="goods.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
	<%
		}
		else
		{
	%>
			[��һҳ]&nbsp;
	<%
		}
		//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
		if(showPage < pages.getPageCount())
		{				
	%>
	<a href="goods.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
	<%
		}
		else
		{
	%>
			[��һҳ]&nbsp;
	<%
		}
	%> 
	<a href="goods.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[βҳ]</font> </a>&nbsp;
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
	<input type="submit" name="go" value="�ύ"/>
</form>
</p>
<%rs.close();%>
</div>
</body>
</html>
