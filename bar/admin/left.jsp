<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӭ���������̳�</title>
<link rel=stylesheet type=text/css href="../lib/ware.css">
<style type="text/css">
@import url(images/left.css);
</style>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
 var obj = document.getElementById("nav").getElementsByTagName("li");
 
 for (var i=0; i<obj.length; i++) {
  obj[i].onmouseover=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseDown=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseUp=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onmouseout=function() {
   this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
  }
 }
}
function DoMenu(emid)
{
 var obj = document.getElementById(emid); 
 obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
 if((LastLeftID!="")&&(emid!=LastLeftID)) //�ر���һ��Menu
 {
  document.getElementById(LastLeftID).className = "collapsed";
 }
 LastLeftID = emid;
}
function GetMenuID()
{
 var MenuID="";
 var _paramStr = new String(window.location.href);
 var _sharpPos = _paramStr.indexOf("#");
 
 if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
 {
  _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
 }
 else
 {
  _paramStr = "";
 }
 
 if (_paramStr.length > 0)
 {
  var _paramArr = _paramStr.split("&");
  if (_paramArr.length>0)
  {
   var _paramKeyVal = _paramArr[0].split("=");
   if (_paramKeyVal.length>0)
   {
    MenuID = _paramKeyVal[1];
   }
  }

 }
 
 if(MenuID!="")
 {
  DoMenu(MenuID)
 }
}
GetMenuID();
menuFix();
--></script>
</head>
<body>
<div id="PARENT">
<ul id="nav">
<li><a href="main.jsp" target="mainFrame">ϵͳ��ҳ</a></li>
<li><a href="../index.jsp" target="_blank">��վ��ҳ</a></li>
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">���¹���</a>
 <ul id="ChildMenu1" class="collapsed">
 <li><a href="type_list.jsp" target="mainFrame">���¹���</a></li>
 

 </ul>
</li>
<li><a href="#Menu=ChildMenu2" onClick="DoMenu('ChildMenu2')">Ա������</a>
 <ul id="ChildMenu2" class="collapsed">
 <li><a href="show_our_users.jsp" target="mainFrame">Ա������</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu3" onClick="DoMenu('ChildMenu3')">��Ա����</a>
 <ul id="ChildMenu3" class="collapsed">
 <li><a href="show_member_users.jsp" target="mainFrame">��Ա����</a></li>
 <li><a href="talk_list.jsp" target="mainFrame">���Թ���</a></li>
 <li><a href="music.jsp" target="mainFrame">���ֹ���</a></li>
</ul>
</li>

<li><a href="#Menu=ChildMenu4" onClick="DoMenu('ChildMenu4')">������</a>
 <ul id="ChildMenu4" class="collapsed">
 <li><a href="ku_list.jsp" target="mainFrame">���ơ��</a></li>
 <li><a href="myusers_list.jsp" target="mainFrame">��Ӧ�̹���</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu5" onClick="DoMenu('ChildMenu5')">��������</a>
 <ul id="ChildMenu5" class="collapsed">
 <li><a href="goods_list.jsp" target="mainFrame">�ײ͹���</a></li>
 <li><a href="goods.jsp" target="mainFrame">��������</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu6" onClick="DoMenu('ChildMenu6')">��վ����</a>
 <ul id="ChildMenu6" class="collapsed">
 <li><a href="systems.jsp?sid=1" target="mainFrame">��վ����</a></li>
 <li><a href="admin_info.jsp" target="mainFrame">����Ա��Ϣ</a></li>
 <li><a href="database.jsp" target="mainFrame">���ݿⱸ��/��ԭ</a></li>

 </ul>
</li>
</ul>
</div>
</body>
</html>