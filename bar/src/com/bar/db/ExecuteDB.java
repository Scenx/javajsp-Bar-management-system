/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

/**
 * @(#)ExecuteDB.java
 *
 *
 * @author
 * @version 1.00 2009/11/26
 */

import java.sql.*;

//这个类继承自ConnectDB类
public class ExecuteDB extends ConnectDB
{
	//数据库连接对象
	private Connection dbConn;
	private Statement stmt;
	private ResultSet rs;
    //error 描述 错误信息
    private String errMes;

	//初始化操作
	public ExecuteDB()
	{
		dbConn = super.getConn();
		stmt = null;
		rs = null;
		this.errMes = super.getErrMes();
	}

	 //执行sql 执行语句，主要是执行插入和删除的SQL语句
	public boolean exeSql(String strSql)
	{
		boolean isSuc = false;
		try
		{
   			stmt=dbConn.createStatement();
			stmt.executeUpdate(strSql);
			stmt.close();
			isSuc = true;
		}
		catch(Exception e)
		{
			this.errMes = this.errMes + "<br>" +e.toString();
		}
		return isSuc;
	}

	//执行sql查询语句
    public ResultSet exeQuery(String strSql)
	{
		try
		{
   			stmt=dbConn.createStatement();
			rs =stmt.executeQuery(strSql);
		}
		catch(Exception e)
		{
            this.errMes = this.errMes + "<br>" +e.toString();
			rs = null;
		}
		return rs;
	}

    //取得错误信息
    public String getErrMes()
    {
        return errMes;
    }

}
