<?xml version="1.0" encoding="gb2312" ?>
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" import="net.fckeditor.*" %>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>


		<link href="../sample.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function FCKeditor_OnComplete(editorInstance) {
				window.status = editorInstance.Description;
			}
		</script>

	<%
		FCKeditor fckEditor = new FCKeditor(request, "EditorDefault");
	%>

		
		<hr />
		<form action="add.jsp" method="post" target="_blank">
		<%
			fckEditor.setValue("");
			out.println(fckEditor);
		%>
		<br />
		<input type="submit" value="Submit" /></form>
