/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

/**
 *���ݿ��
  DROP TABLE IF EXISTS `words`;
  CREATE TABLE words (
  wordsid bigint(20) NOT NULL auto_increment,
  content mediumtext,
  userid bigint(20) NOT NULL default '0',
  goodinfoid bigint(20) NOT NULL default '0',
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,
  PRIMARY KEY  (wordsid),
  UNIQUE KEY wordsid (wordsid)
  ) TYPE=MyISAM;
 */


import java.sql.*;

public class Words extends ExecuteDB
{
	//�������Ա����
	private long wordsid;
	private String content;
	private long userid;
	private long goodinfoid;
	private String strSql;

    //���캯�����Գ�Ա�������г�ʼ����ֵ
	public Words()
	{
		this.wordsid=0;
		this.content="";
		this.goodinfoid=0;
		this.userid=0;
		this.strSql="";
	}

	//��������ԣ���words���ݱ������һ���¼�¼
	public boolean add()
	{
		this.strSql="insert into words ";
		this.strSql=this.strSql + "(content,userid,goodinfoid)";
		this.strSql=this.strSql + "values('" + this.content + "','" + this.userid + "','" + this.goodinfoid + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}

  	//��ȡwordsid��Ӧ��������Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean init()
	{
    	this.strSql="select * from `words` where wordsid=";
        this.strSql=this.strSql + "'" + this.wordsid + "'";
		try
		{
   			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
                wordsid=rs.getLong("wordsid");
                content=rs.getString("content");
                goodinfoid=rs.getLong("goodinfoid");
                userid=rs.getLong("userid");
                return true;
			}
			else
				return false;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	//���goodinfoid��Ӧ��һ��������Ϣ������һ��ResultSet���Ͷ���
	public ResultSet show_words()
	{
		this.strSql="select * from `words`";
        this.strSql=this.strSql + " where goodinfoid = '" + this.goodinfoid + "'";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.strSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}

	//�������Ա����wordsid��ֵ
	public void setWordsid(long wordsid)
	{
		this.wordsid = wordsid;
	}

	//��ȡ���Ա����wordsid��ֵ
	public long getWordsid()
	{
		return this.wordsid;
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

	//�������Ա����userid��ֵ
	public void setUserid(long userid)
	{
		this.userid = userid;
	}

	//��ȡ���Ա����userid��ֵ
	public long getUserid()
	{
		return this.userid;
	}

	//�������Ա����goodinfoid��ֵ
 	public void setGoodinfoid(long goodinfoid)
	{
		this.goodinfoid = goodinfoid;
	}

	//��ȡ���Ա����goodinfoid��ֵ
	public long getGoodinfoid()
	{
		return this.goodinfoid;
	}
}


