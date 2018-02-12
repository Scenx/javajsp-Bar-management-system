/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

import java.sql.*;

/**
 * ��Ӧ�����ݿ��goodinfo
 * DROP TABLE IF EXISTS `goodinfo`;
 * CREATE TABLE goodinfo (
 * goodinfoid bigint(20) NOT NULL auto_increment,
 * goodinfoname varchar(100) default NULL,
 * company varchar(100) default NULL,
 * addr varchar(50) default NULL,
 * price float(20,3) default NULL,
 * picUrl varchar(30) default NULL,
 * intro mediumtext,
 * num varchar(100) default NULL,
 * createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,
 *PRIMARY KEY  (goodinfoid),
 *UNIQUE KEY goodinfoid (goodinfoid)
 *) TYPE=MyISAM;
 * 
 **/
public class Goodinfo extends ExecuteDB {
        //�������Ա����
	private long goodinfoid;
	private String goodinfoname;
	private String company;
	private String addr;
	private float price;
	private String picurl;
	private String intro;
	private int num;
	private String strSql;
public Goodinfo()
{
    this.goodinfoid = 0;
    this.goodinfoname ="";
    this.company = "";
    this.addr = "";
    this.price =0;
    this.picurl = "pic/0.jpg";
    this.intro = "";
    this.num =0;
    this.strSql = "";
}
//��goodinfo�����һ����¼
public boolean add()
{
    this.strSql = "insert into goodinfo";
    this.strSql = this.strSql + "(goodinfoname,company,addr,price,picurl,intro,num)";
    this.strSql = this.strSql + "values ('"+ this.goodinfoname +"','"+ this.company +"','"+ this.addr +"','"+ this.price +"','"+ this.picurl +"','"+ this.intro +"','"+ this.num +"')";

    boolean isAdd = super.exeSql(this.strSql);
    return isAdd;
}
//�޸ĳ�Ա����goodinfoid��Ӧ����Ʒ��Ϣ
public boolean updata()
{
    this.strSql = "update goodinfo set";
    this.strSql=this.strSql + " goodinfoname=" + "'" + this.goodinfoname + "',";
    this.strSql=this.strSql + " company=" + "'" + this.company + "',";
    this.strSql=this.strSql + " addr=" + "'" + this.addr + "',";
    this.strSql=this.strSql + " price=" + "'" + this.price + "',";
    this.strSql=this.strSql + " picurl=" + "'" + this.picurl + "',";
    this.strSql=this.strSql + " intro=" + "'" + this.intro + "',";
    this.strSql=this.strSql + " num=" + "'" + this.num + "',";
    this.strSql=this.strSql + " createtime= " ;
    this.strSql=this.strSql + " where goodinfoid='" + this.goodinfoid + "'";
    boolean isUpdate = super.exeSql(this.strSql);

    return isUpdate;
}
        //ɾ����Ա������GOODSinfoID��Ӧ����Ʒ��Ϣ
        public boolean delete(String sgoodinfo)
        {
            this.strSql = "delete from goodinfo where goodinfoid in ( ";
            this.strSql = this.strSql + sgoodinfo + ")";

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }
        //��ȡ��Ա����goodinfoid��Ӧ����Ʒ��Ϣ
        public boolean init()
        {
            this.strSql = "select * from goodinfo where goodinfoid= ";
            this.strSql = this.strSql + this.goodinfoid;
            try
            {
                ResultSet rs = super.exeQuery(this.strSql);
                if(rs.next())
                {
                    this.goodinfoid = rs.getLong("goodinfoid");
                    this.goodinfoname = rs.getString("goodinfoname");
                    this.company = rs.getString("company");
                    this.addr = rs.getString("addr");
                    this.price = rs.getFloat("price");
                    this.picurl = rs.getString("picurl");
                    this.intro = rs.getString("intro");
                    this.num = rs.getInt("num");
                    return true;
                }
                else
                    return false;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        //��ȡ������ͨ��Ʒ��Ϣ������һ��ResultSet���Ͷ���
        public ResultSet show_goodinfo()
        {
            this.strSql = "select goodinfoid,goodinfoname,company,addr,intro,num,price from goodinfo order by createtime desc";
            ResultSet rs = null;
            try
            {
                rs=super.exeQuery(this.strSql);
            }
            catch(Exception ex)
            {
                System.out.println(ex.toString());
            }
            return rs;
        }
        //��goodinfoname��company��addr��priceΪ��������goodinfo���ݿ��������һ��ResultSet���Ͷ���
        public ResultSet seach_goodinfo()
        {
            this.strSql = "select * from goodinfo where ";
            this.strSql = this.strSql + "goodinfoname like '%" + this.goodinfoname + "% '";
            this.strSql = this.strSql + " and company like '%" + this.company + "% '";
            this.strSql = this.strSql + " and addr like '%" + this.addr + "% '";
            this.strSql = this.strSql + " and price like '%" + this.price + "% '";
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


        //�����г�Ա����������
	public void setGoodinfoid(long goodinfoid)
	{
		this.goodinfoid = goodinfoid;
	}
	public long getGoodinfoid()
	{
		return this.goodinfoid;
	}
 	public void setGoodinfoname(String goodinfoname)
	{
		this.goodinfoname = goodinfoname;
	}

	public String getGoodinfoname()
	{
		return this.goodinfoname;
	}

 	public void setCompany(String company)
	{
		this.company = company;
	}
	public String getCompany()
	{
		return this.company;
	}
 	public void setAddr(String addr)
	{
		this.addr = addr;
	}

	public String getAddr()
	{
		return this.addr;
	}

 	public void setPrice(float price)
	{
		this.price = price;
	}
	public float getPrice()
	{
		return this.price;
	}
	public void setPicurl(String picurl)
	{
		this.picurl = picurl;
	}
	public String getPicurl()
	{
		return this.picurl;
	}

        public void setIntro(String intro)
	{
		this.intro = intro;
	}
	public String getIntro()
	{
		return this.intro;
	}
        public void setNum(int num)
	{
		this.num = num;
	}
	public int getNum()
	{
		return this.num;
	}
}
