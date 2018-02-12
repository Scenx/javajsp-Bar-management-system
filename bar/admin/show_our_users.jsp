<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
		<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage" />
         <style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		td{border-right:1px #999 dashed; border-bottom:1px #999 dashed;}
		.input1{width:120px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		.input2{width:80px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		</style>
	</head>
	<%

	//��ȡ����Ա����Ϣ
	ResultSet rs = User.show_our_users();
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
	<body bgcolor="#F2F2F2">
		<div align="center">
		<form name="form1" method="post" action="delete_user.jsp" target="_self">
		<input type="hidden" name="showPage" value="<%=showPage%>">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
			<tr bgcolor="#CC99FF">
			<th width="2%" height="30" align="center">ѡ��</th>
			<th width="3%" height="30" align="center">Ա����</th>
			<th width="4%" height="30" align="center">����</th>
			<th width="3%" align="center">�Ա�</th>
			<th width="15%" height="30" colspan="2" align="center">��ϵ��ʽ</th>
			<th width="12%" height="30" align="center">��ַ</th>
			<th width="5%" align="center">����</th>
			<th width="5%" height="30" align="center">�޸�</th>
			</tr>
		<%			
			//ѭ����ʾ��ǰҳ��Ա����Ϣ
			for(int i=0;i<vData.size();i++)
			{ 
				//��ʾ����
				String[] sData=(String[])vData.get(i);
		%>
				<tr>
					<td width="2%" height="25" align="center">&nbsp;<input type="checkbox" name="DeleteID" value="<%=sData[0]%>"></td>
					<td width="3%" height="25" align="center"><%=sData[0]%></td>
			    <td width="4%" height="25" align="center"><font color="#0000FF"><%=sData[3]%></font></td>
			    <td width="3%" height="25" align="center"><%=sData[1]%></td>
			    <td width="6%" height="25" align="center">&nbsp;tel:<%=sData[6]%></td>
			    <td width="9%" align="center">E-mail:<%=sData[5]%></td>
					<td width="12%" height="25" align="center">&nbsp;
					<%=sData[4]%>
					</td>
			    <td width="5%" height="25" align="center"><%=sData[7]%>/��</td>
					<td width="5%" height="25" align="center">&nbsp;<a href="updata_user_form.jsp?UserID=<%=sData[0]%>&showPage=<%=showPage%>" target="_self"><font color="#0000FF">�޸�</font></a></td>
		
				</tr>
		<%
				
			}
		%>
		</table>
		<p><input name="sub" type="submit" class="input1" value="ɾ��ѡ�е�Ա��">&nbsp;&nbsp;
		<input name="btn" type="button" class="input1" onClick="javascript:window.location='add_our_users.jsp'" value="�����Ա��">
		</p>
		</form>
		<p>
		<form action="show_our_users.jsp" method="post" target="_self">	
			��<font color="#FF0000"><%=showPage%></font>ҳ/��<font color=red><%=pages.getPageCount()%></font>ҳ&nbsp;
			<a href="show_our_users.jsp?showPage=1" target="_self"><font color="#0000FF">[��ҳ]</font></a>&nbsp;			
			<%
				//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
				if(showPage > 1)
				{				
			%>
					<a href="show_our_users.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
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
					<a href="show_our_users.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[��һҳ]&nbsp;");
				}
			%> 
			<a href="show_our_users.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[βҳ]</font> </a>&nbsp;
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
	      <input name="go" type="submit" class="input2" value="�ύ"/>
		</form>
		</p>
		<%rs.close();%>
	</div>
	</body>
</html>
