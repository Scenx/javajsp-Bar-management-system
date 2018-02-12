<jsp:useBean scope="page" id="Systems" class="com.bar.db.Systems" />
<%
 long sid=1;
 Systems.setSid(sid);
 Systems.init();
 String Sitename = Systems.getSitename();
 String Keywords = Systems.getKeywords();
 String Description = Systems.getDescription();
 String Author =Systems.getAuthor();
 String Email = Systems.getEmail();
 String Tel = Systems.getTel();
%>
