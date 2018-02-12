/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;
import java.sql.*;

/**
 *DROP TABLE IF EXISTS `myusers`; 
CREATE TABLE `myusers` (
`myuserid` bigint(20) unsigned not null auto_increment ,
`myuname` char(36) NOT NULL default '',
`sex` enum('��','Ů') NOT NULL default '��',
`pname` char(50) NOT NULL default '',
`address` varchar(255) NOT NULL default '', 
`email` char(50) NOT NULL default '',
`tel` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`myuserid`),
  UNIQUE KEY `myuserid` (`myuserid`)
) TYPE=MyISAM;
 * @author asus
 */
public class Myusers extends ExecuteDB
{
   private long myuserid;
   private String myuname;
   private String sex;
   private String pname;
   private String address;
   private String email;
   private String tel;
   private String strSql;

   public Myusers()
   {
       this.myuserid=0;
       this.myuname="";
       this.sex="";
       this.pname="";
       this.address="";
       this.email="";
       this.tel="";
       this.strSql="";
   }
   public boolean add()
   {
       this.strSql="insert into myusers ";
       this.strSql=this.strSql + "(myuname,sex,pname,address,email,tel) ";
       this.strSql=this.strSql + "values('" + this.myuname + "','" + this.sex + "','" + this.pname + "','" + this.address + "','" + this.email + "','" + this.tel + "')";
       boolean isAdd = super.exeSql(this.strSql);
       return isAdd;
   }
    public boolean delete(String sMyuserid)
        {
            this.strSql = "delete from myusers where myuserid in (";
            this.strSql = this.strSql + sMyuserid +")";

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }
    	public boolean modify_info()
	{
		this.strSql="update myusers set";
		this.strSql=this.strSql + " myuname=" + "'" + this.myuname + "',";
		this.strSql=this.strSql + " sex=" + "'" + this.sex + "',";
		this.strSql=this.strSql + " email=" + "'" + this.email + "',";
		this.strSql=this.strSql + " address=" + "'" + this.address + "',";
		this.strSql=this.strSql + " tel=" + "'" + this.tel + "',";
		this.strSql=this.strSql + " pname=" + "'" + this.pname + "'";
		this.strSql=this.strSql + " where myuserid='" + this.myuserid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}
        public boolean init()
	{
		this.strSql="select * from `myusers` where myuserid=";
		this.strSql=this.strSql + "'" + this.myuserid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.myuserid=rs.getLong("myuserid");
				this.myuname=rs.getString("myuname");
				this.pname=rs.getString("pname");
				this.sex=rs.getString("sex");
				this.email=rs.getString("email");
				this.address=rs.getString("address");
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
        public ResultSet show_all_myusers()
	{
		this.strSql="select myuserid,myuname,sex,pname,address,email,tel from `myusers` order by myuserid asc";
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

       //�������Ա����userid��ֵ
	public void setMyuserid(long myuserid)
	{
		this.myuserid = myuserid;
	}

	//��ȡ���Ա����userid��ֵ
	public long getMyuserid()
	{
		return this.myuserid;
	}


	//�������Ա����uname��ֵ
 	public void setMyuname(String myuname)
	{
		this.myuname = myuname;
	}

	//��ȡ���Ա����uname��ֵ
	public String getMyuname()
	{
		return this.myuname;
	}


	//�������Ա����name��ֵ
 	public void setPname(String pname)
	{
		this.pname = pname;
	}

	//��ȡ���Ա����name��ֵ
	public String getPname()
	{
		return this.pname;
	}



	//�������Ա����sex��ֵ
 	public void setSex(String sex)
	{
		this.sex = sex;
	}

	//��ȡ���Ա����sex��ֵ
	public String getSex()
	{
		return this.sex;
	}

	//�������Ա����Email��ֵ
	public void setEmail(String email)
	{
		this.email = email;
	}

	//��ȡ���Ա����Email��ֵ
	public String getEmail()
	{
		return this.email;
	}

        public void setTel(String tel)
	{
		this.tel = tel;
	}

	//��ȡ���Ա����Email��ֵ
	public String getTel()
	{
		return this.tel;
	}

        	public void setAddress(String address)
	{
		this.address = address;
	}

	//��ȡ���Ա����Email��ֵ
	public String getAddress()
	{
		return this.address;
	}

}
