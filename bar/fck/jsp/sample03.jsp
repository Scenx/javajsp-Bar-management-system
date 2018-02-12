<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%--
 * FCKeditor - The text editor for Internet - http://www.fckeditor.net
 * Copyright (C) 2004-2009 Frederico Caldeira Knabben
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 * @version: $Id: sample03.jsp 2869 2009-01-09 22:01:33Z mosipov $
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>FCKeditor - JSP Sample</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="robots" content="noindex, nofollow" />
		<link href="../sample.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="../fckeditor.gif"
				type="image/x-icon" />
		<script type="text/javascript">
			function FCKeditor_OnComplete(editorInstance) {
				var oCombo = document.getElementById( 'cmbLanguages' );
				for (code in editorInstance.Language.AvailableLanguages) {
					AddComboOption( oCombo,	editorInstance.Language.AvailableLanguages[code] + '(' + code + ')', code);
				}

				oCombo.value = editorInstance.Language.ActiveLanguage.Code;
			}

			function AddComboOption(combo, optionText, optionValue) {
				var oOption = document.createElement("OPTION");
				combo.options.add(oOption);

				oOption.innerHTML = optionText;
				oOption.value = optionValue;
	
				return oOption;
			}

			function ChangeLanguage(languageCode) {
				if (languageCode != "-1")
					window.location.href = window.location.pathname + "?code=" + languageCode;
			}
		</script>
	</head>
	<body>
		<h1>FCKeditor - JSP - Sample 3</h1>
		This sample shows the editor in all it's available languages.<br />
		The Language dropdown is populated with JavaScript API.
		<hr />
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>
					Select a language:&nbsp;
				</td>
				<td>
					<select id="cmbLanguages" onchange="ChangeLanguage(this.value);" >
						<option value="-1">none selected</option>
					</select>
				</td>
			</tr>
		</table>
		<br />
		<form action="sampleposteddata.jsp" method="post" target="_blank">
			<FCK:editor instanceName="EditorDefault">
				<jsp:attribute name="value">This is some <strong>sample text
					</strong>. You are using <a href="http://www.fckeditor.net">
					FCKeditor</a>.
				</jsp:attribute>
				<jsp:body>
					<FCK:config AutoDetectLanguage="${empty param.code ? true : false}"
						DefaultLanguage="${empty param.code ? 'en' : param.code}" />
				</jsp:body>
			</FCK:editor>
			<br />
			<input type="submit" value="Submit" />
		</form>
	</body>
</html>