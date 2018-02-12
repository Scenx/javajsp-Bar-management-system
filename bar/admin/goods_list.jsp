<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage" />
<style type="text/css">
body{ margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px}
td{ border-right:1px #CCC dashed; border-bottom:1px #CCC dashed;}
.font1{color:#FFF}
.input1{ width:80px; height:20px; background-color:#333; border:1px #CCC dashed; color:#FFF}
.input2{ width:120px; height:20px; background-color:#333; border:1px #CCC dashed; color:#FFF}
</style>
</head>
<%
	ResultSet rs = Goodinfo.show_goodinfo();
	pages.initialize(rs,20);
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
<form name="form1" action="delete_goodinfo.jsp" method="post" target="_self">
<table width="100%" border="0" cellpadding="0" cellspacing="1">
<tr bgcolor="#0066FF" class="font1">
<td width="7%" height="20" align="center">ѡ��</td>
<td width="20%" height="20" align="center">�ײ�</td>
<td height="20" colspan="2" align="center">��ˮ��Ϣ</td>
<td width="10%" height="20" align="center">ơ������</td>
<td width="12%" align="center" bgcolor="#0066FF">�۸�</td>
<td width="12%" height="20" align="center">�޸�</td>
</tr>
<%
	for(int i=0;i<vData.size();i++)
	{ 
		//��ʾ����
		String[] sData=(String[])vData.get(i);
		long lGoodinfoid = Long.parseLong(sData[0]);
		Goodinfo.setGoodinfoid(lGoodinfoid);
		Goodinfo.init();
		
%>
	<tr>
		<td width="7%" height="20" align="center"><input type="checkbox" name="DeleteID" value='<%=sData[0]%>'></td>
		<td width="20%" height="20" align="center"><a href="../ware_detail.jsp?Goodinfoid=<%=sData[0]%>" target="_self"><%=sData[1]%></a></td>
		<td width="22%" height="20" align="center"> ��˾��<%=sData[2]%></a></td>
		<td width="17%" align="center">��˾��ַ��<%=sData[3]%></td>
		<td width="10%" height="20" align="center"><%=sData[5]%>/��</td>
		<td width="12%" height="20" align="center"><%=Goodinfo.getPrice()%></td>
		<td width="12%" height="20" align="center"><a href="goodinfo_updata_from.jsp?Goodinfoid=<%=sData[0]%>" target="_self"><font color="#0000FF">�޸�</a></td>
	</tr>
<%
		
	}
%>

</table>
<p><input name="sub" type="submit" class="input2" value="ɾ��ѡ�е���Ʒ">&nbsp;&nbsp;
		<input name="btn" type="button" class="input2" onClick="javascript:window.location='add_goodinfo_from.jsp'" value="�������Ʒ">
</form>

<p>
<form action="goods_list.jsp" method="post" target="_self">	
	��<font color="#FF0000"><%=showPage%>ҳ/��<font color=red><%=pages.getPageCount()%>ҳ&nbsp;
	<a href="goods_list.jsp?showPage=1" target="_self"><font color="#0000FF">[��ҳ]</a>&nbsp;			
	<%
		//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
		if(showPage > 1)
		{				
	%>
			<a href="goods_list.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[��һҳ] </a>&nbsp;
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
			<a href="goods_list.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[��һҳ] </a>&nbsp;
	<%
		}
		else
		{
			out.println("[��һҳ]&nbsp;");
		}
	%> 
	<a href="goods_list.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[βҳ] </a>&nbsp;
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
</p>
<%rs.close();%>
</div>

</body>
</html>
