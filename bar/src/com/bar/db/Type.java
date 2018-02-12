/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

/**
 *
 * DROP TABLE IF EXISTS `type`; 
CREATE TABLE type (
typeid bigint(20) NOT NULL auto_increment,
typename varchar(100) default  null,
PRIMARY KEY  (typeid),
UNIQUE KEY articleid (typename)
) TYPE=MyISAM;
 */

import java.sql.*;

public class Type extends ExecuteDB
{
	//�������Ա����
	private long typeid;
	private String typename;
	private String strSql;

    //���캯�����Գ�Ա�������г�ʼ����ֵ
	public Type()
	{
		this.typeid=0;
		this.typename="";
		this.strSql="";
	}

	//���������������type���ݱ������һ���¼�¼
	public boolean add()
	{

		this.strSql="insert into type ";
		this.strSql=this.strSql + "(typename) ";
		this.strSql=this.strSql + "values('" + this.typename + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}

	//�޸�typeid��Ӧ������������Ϣ
	public boolean modify()
	{
		this.strSql="update type set";
		this.strSql=this.strSql + " typename=" + "'" + this.typename + "'";
		this.strSql=this.strSql + " where typeid='" + this.typeid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}


 	//���typeid��Ӧ������������Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean init()
	{
		this.strSql="select * from `type` where typeid=";
		this.strSql=this.strSql + "'" + this.typeid + "'";
		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.typeid=rs.getLong("typeid");
				this.typename=rs.getString("typename");
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

 	//�ж����������Ƿ����
	public boolean exist()
	{
		this.strSql="select * from `type` ";
		this.strSql=this.strSql + " where typename='" + this.typename + "'";
		System.out.println(strSql);
		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
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

	//���������������Ϣ������һ��ResultSet����
	public ResultSet show_all()
	{
		this.strSql="select * from `type` order by typeid asc";
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

	//�������Ա����typeid��ֵ
	public void setTypeid(long typeid)
	{
		this.typeid = typeid;
	}

	//��ȡ���Ա����typeid��ֵ
	public long getTypeid()
	{
		return this.typeid;
	}

	//�������Ա����typename��ֵ
 	public void setTypename(String typename)
	{
		this.typename = typename;
	}

	//��ȡ���Ա����typename��ֵ
	public String getTypename()
	{
		return this.typename;
	}
}


