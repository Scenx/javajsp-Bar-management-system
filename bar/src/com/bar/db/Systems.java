/**
 * @(#)System.java
 *
 *
 * @author
 * @version 1.00 2009/11/27
 */
package com.bar.db;

import java.sql.*;

public class Systems extends ExecuteDB {


    //�������Ա����
	private long sid;
	private String sitename;
	private String description;
	private String keywords;
	private String author;
	private String email;
	private String tel;
	private String strSql;

public Systems()
{
	    super();
		this.sid=1;
		this.sitename="С�;ư����߹���ϵͳ";
		this.description="С�;ư����߹���ϵͳ";
		this.keywords="�ư�,����,ϵͳ,����";
		this.author="�ŷ�";
		this.email="";
		this.tel="";
		this.strSql="";
}
//�޸�sID��Ӧ����վ��Ϣ
public boolean update()
	{
		this.strSql="update systems set";
		this.strSql=this.strSql + " sitename=" + "'" + this.sitename + "',";
		this.strSql=this.strSql + " description=" + "'" + this.description + "',";
		this.strSql=this.strSql + " keywords=" + "'" + this.keywords + "',";
		this.strSql=this.strSql + " author=" + "'" + this.author + "',";
		this.strSql=this.strSql + " email=" + "'" + this.email + "',";
		this.strSql=this.strSql + " tel=" + "'" + this.tel + "'";
		this.strSql=this.strSql + " where sid='" + this.sid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}
	 	//���sID��Ӧ���û�����Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean init()
	{
		this.strSql="select * from `systems` where sid=";
		this.strSql=this.strSql + "'" + this.sid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{

				this.sid=rs.getLong("sid");
				this.sitename=rs.getString("sitename");
				this.description=rs.getString("description");
				this.keywords=rs.getString("keywords");
				this.author=rs.getString("author");
				this.email=rs.getString("email");
				this.tel=rs.getString("tel");
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
	}
public ResultSet show_systems()
{
	this.strSql = "select * from systems where sid=";
	this.strSql=this.strSql + "'" + this.sid + "'";
	ResultSet rs = null;
	try
	{
		rs = super.exeQuery(this.strSql);
	}
	catch(Exception ex)
	{
		System.out.println(ex.toString());
	}
	return rs;
}

	public void setSid(long sid) {
		this.sid = sid;
	}
	public long getSid() {
		return (this.sid);
	}

	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
	public String getSitename() {
		return (this.sitename);
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescription() {
		return (this.description);
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getKeywords() {
		return (this.keywords);
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	public String getAuthor() {
		return (this.author);
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return (this.email);
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel() {
		return (this.tel);
	}


}