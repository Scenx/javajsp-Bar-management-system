<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title></title>
        <style type="text/css">
		body{font-family:Georgia, "Times New Roman", Times, serif;font-size:12px; margin:0 auto}
		</style>
	</head>
	<body>
	<div align="center">
	<br><br>
	<table width="100%" border="0">
	<tr bgcolor="#F5F5F5">
    <th width="30%" align="center" height="30">��������ID</th>
	<th width="30%" align="center" height="30">��������</th>
	<th width="30%" align="center" height="30">��������</th>
	</tr>
	<%
		//���������������Ϣ
		ResultSet rs = Type.show_all();
		while(rs.next())
		{
			//��ʾ������������ϸ��Ϣ
			Article.setTypeid(rs.getLong("typeid"));
	%>
			<tr>
            <td width="30%" align="center" height="25">
            <%=rs.getLong("typeid")%>
            </td>
			<td width="30%" align="center" height="25">
			<a href='article_list.jsp?typeid=<%=rs.getLong("typeid")%>' target="_self"><font color="#0000FF">	<%=rs.getString("typename")%></font></a></td>
			<td width="30%" align="center" height="25"><font color="#FF0000"><%=Article.articles_count()%></font></td>
			</tr>
	<%
		}
	%>	
	</table>
    <table width="100%" border="0">
	<tr bgcolor="#F5F5F5">
	<td width="100%" align="center" height="30">��������µ����͵�����в鿴���޸����¡�</td>
    </tr>
    </table>
	</div>
	</body>
</html>
