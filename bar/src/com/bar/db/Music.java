/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;
import java.sql.*;
/**
 *DROP TABLE IF EXISTS `music`;
CREATE TABLE music (
musicid bigint(20) not null auto_increment,
musicname text,
musicurl text,
userid bigint(20) NOT NULL default '0',
PRIMARY KEY  (musicid)
) TYPE=MyISAM;
 * @author asus
 */
public class Music extends ExecuteDB{
        private long musicid;
	private String musicname;
	private String musicurl;
	private long userid;
	private String strSql;

public Music(){

    this.musicid = 0;
    this.musicname="";
    this.musicurl="";
    this.userid=0;
    this.strSql="";
}
public boolean add(){
    this.strSql="insert into music";
		this.strSql=this.strSql + " (musicname,musicurl,userid) ";
		this.strSql=this.strSql + "values('" + this.musicname + "','" + this.musicurl + "','" + this.userid + "')";

    boolean isAdd = super.exeSql(this.strSql);
    return isAdd;
}
public boolean delete(String smusicid)
	{
		this.strSql="delete from music";
		this.strSql=this.strSql + "  where musicid in ("+smusicid+")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}
public boolean  init()
	{
		this.strSql="select * from music";
		this.strSql=this.strSql + " where musicid='" + this.musicid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.musicid=rs.getLong("musicid");
				this.musicname=rs.getString("musicname");
				this.musicurl=rs.getString("musicurl");
				this.userid=rs.getLong("userid");
				
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
	public ResultSet show_music()
	{
		this.strSql="select * from `music` order by musicid asc";
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
//�������Ա����emailid��ֵ
	public void setMusicid(long musicid)
	{
		this.musicid = musicid;
	}

	//��ȡ���Ա����emailid��ֵ
	public long getMusicid()
	{
		return this.musicid;
	}

	//�������Ա����subject��ֵ
 	public void setMusicname(String musicname)
	{
		this.musicname = musicname;
	}

	//��ȡ���Ա����subject��ֵ
	public String getMusicname()
	{
		return this.musicname;
	}

	//�������Ա����content��ֵ
 	public void setMusicurl(String musicurl)
	{
		this.musicurl = musicurl;
	}

	//��ȡ���Ա����content��ֵ
	public String getMusicurl()
	{
		return this.musicurl;
	}

 	//�������Ա����sender��ֵ
 	public void setUserid(long userid)
	{
		this.userid = userid;
	}

	//��ȡ���Ա����sender��ֵ
	public long getUserid()
	{
		return this.userid;
	}
}
