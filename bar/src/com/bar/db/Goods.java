/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;
import java.sql.*;
/**
 *
 * @author asus
 */
public class Goods extends ExecuteDB {
    //�������Ա����
	private long goodsid;
	private int buynumber;
	private long userid;
	private float price;
	private long goodinfoid;
	private String strSql;
public Goods(){
        this.goodsid=0;
	this.buynumber=0;
	this.userid=0;
	this.price=0;
        this.goodinfoid=0;
        this.strSql="";
}
//��GOODS�����һ���¼�¼
	public boolean add()
	{
		this.strSql="insert into goods ";
		this.strSql=this.strSql + "(buynumber,userid,price,goodinfoid)";
		this.strSql=this.strSql + "values('" + this.buynumber + "','" + this.userid + "','" + this.price + "','" + this.goodinfoid + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}
        //ɾ����Ա������GOODSID��Ӧ����Ʒ��Ϣ
        public boolean delete()
        {
            this.strSql = "delete from goods where goodsid = ";
            this.strSql = this.strSql + this.goodsid;

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }
        public boolean delete(String sgoodsid)
        {
            this.strSql = "delete from goods where goodsid in ( ";
            this.strSql = this.strSql + sgoodsid +")";

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }
        //��֤Goodsid��userid�Ƿ�ƥ��
        public boolean valid()
        {
            this.strSql = "select * from `goods`";
            this.strSql = this.strSql + " where userid = ' " + this.userid + "'";
            this.strSql = this.strSql + " and goodsid = ' " + this.goodsid + "'";

            try
            {
                ResultSet rs = super.exeQuery(this.strSql);
                if(rs.next())
                    return true;
                else
                    return false;

            }
            catch(Exception e)
            {
                System.out.println(e.toString());
                return false;
            }
        }
        //��ȡ���Զ�����Ϣ������һ��ResultSet���Ͷ���
        public ResultSet show_all_goods()
        {
            this.strSql = "select goodsid,buynumber,userid,price,goodinfoid from goods";
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

        //��ȡ��Ա����Userid��Ӧ�Ķ�����Ϣ������һ��ResultSet���Ͷ���
        public ResultSet show_my_goods()
        {
            this.strSql = "select * from goods where userid = " + this.userid;
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



        //�������Ա����GoodsID��ֵ
	public void setGoodsid(long goodsid)
	{
		this.goodsid = goodsid;
	}

	//��ȡ���Ա����GoodsID��ֵ
	public long getGoodsid()
	{
		return this.goodsid;
	}


         //�������Ա����buynumber��ֵ
 	public void setbuynumber(int buynumber)
	{
		this.buynumber = buynumber;
	}

	//��ȡ���Ա����buynumber��ֵ
	public int getbuynumber()
	{
		return this.buynumber;
	}

	 //�������Ա����GoodsID��ֵ
 	public void setUserid(long userid)
	{
		this.userid = userid;
	}

	//��ȡ���Ա����UserID��ֵ
	public long getUserid()
	{
		return this.userid;
	}

                //�������Ա����buynumber��ֵ
 	public void setPrice(float price)
	{
		this.price = price;
	}

	//��ȡ���Ա����buynumber��ֵ
	public float getPrice()
	{
		return this.price;
	}

        //�������Ա����WareID��ֵ
 	public void setGoodinfoid(long goodinfoid)
	{
		this.goodinfoid = goodinfoid;
	}

	//��ȡ���Ա����WareID��ֵ
	public long getGoodinfoid()
	{
		return this.goodinfoid;
	}
	


}
