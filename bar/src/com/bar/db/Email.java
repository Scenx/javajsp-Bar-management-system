/**
 * @(#)Email.java
 *
 *
 * @author
 * @version 1.00 2009/11/26
 */


package com.bar.db;

import java.sql.*;

public class Email extends ExecuteDB
{
	//�������Ա����
	private long emailid;
	private String subject;
	private String content;
	private String sender;
	private String receiver;
	private int tag;
	private String strSql;

    //���캯�����Գ�Ա�������г�ʼ����ֵ
	public Email()
	{
		super();
		this.emailid=0;
		this.subject="";
		this.content="";
		this.sender="";
		this.receiver="";
		this.tag=0;
		this.strSql="";
	}

	//��email���ݱ������һ���¼�¼
	public boolean add()
	{
		this.strSql="insert into email";
		this.strSql=this.strSql + " (subject,content,sender,receiver,tag) ";
		this.strSql=this.strSql + "values('" + this.subject + "','" + this.content + "','" + this.sender + "','" + this.receiver + "','" + this.tag + "')";

		boolean isAdd = super.exeSql(this.strSql);
		return isAdd;
	}

	//ɾ������ĳ�������е��ʼ�
	public boolean delete(String semailid)
	{
		this.strSql="delete from email";
		this.strSql=this.strSql + "  where emailid in ("+semailid+")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

  	//��ȡ�ʼ���ϸ��Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean  init()
	{
		this.strSql="select * from email";
		this.strSql=this.strSql + " where emailid='" + this.emailid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.emailid=rs.getLong("emailid");
				this.subject=rs.getString("subject");
				this.content=rs.getString("content");
				this.sender=rs.getString("sender");
				this.receiver=rs.getString("receiver");
				this.tag=rs.getInt("tag");
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

	//���receiver��Ӧ�Ľ����ʼ���Ϣ������һ��ResultSet���Ͷ���
	public ResultSet rec_list()
	{
		this.strSql="select * from email where receiver=";
		this.strSql=this.strSql + "'" + this.receiver + "' order by CreateTime desc";
		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if(rs == null)
			{
				System.out.println("test");
			}

			return rs;
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			return null;
		}
	}

	//�������Ա����tag��ֵ
	public boolean update_tag()
	{
		this.strSql="update email set ";
		this.strSql=this.strSql + " tag=" + "'" + 1 + "'";
		this.strSql=this.strSql + " where emailid='" + this.emailid + "'";
		boolean updatetag = super.exeSql(strSql);
		return updatetag;
	}

   	//�������Ա����emailid��ֵ
	public void setEmailid(long emailid)
	{
		this.emailid = emailid;
	}

	//��ȡ���Ա����emailid��ֵ
	public long getEmailid()
	{
		return this.emailid;
	}

	//�������Ա����subject��ֵ
 	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	//��ȡ���Ա����subject��ֵ
	public String getSubject()
	{
		return this.subject;
	}

	//�������Ա����content��ֵ
 	public void setContent(String content)
	{
		this.content = content;
	}

	//��ȡ���Ա����content��ֵ
	public String getContent()
	{
		return this.content;
	}

 	//�������Ա����sender��ֵ
 	public void setSender(String sender)
	{
		this.sender = sender;
	}

	//��ȡ���Ա����sender��ֵ
	public String getSender()
	{
		return this.sender;
	}

	//�������Ա����receiver��ֵ
 	public void setReceiver(String receiver)
	{
		this.receiver = receiver;
	}

	//��ȡ���Ա����receiver��ֵ
	public String getReceiver()
	{
		return this.receiver;
	}

 	//�������Ա����tag��ֵ
 	public void setTag(int tag)
	{
		this.tag = tag;
	}

	//��ȡ���Ա����tag��ֵ
	public int getTag()
	{
		return this.tag;
	}

}
