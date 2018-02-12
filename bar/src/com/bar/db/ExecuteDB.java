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

//�����̳���ConnectDB��
public class ExecuteDB extends ConnectDB
{
	//���ݿ����Ӷ���
	private Connection dbConn;
	private Statement stmt;
	private ResultSet rs;
    //error ���� ������Ϣ
    private String errMes;

	//��ʼ������
	public ExecuteDB()
	{
		dbConn = super.getConn();
		stmt = null;
		rs = null;
		this.errMes = super.getErrMes();
	}

	 //ִ��sql ִ����䣬��Ҫ��ִ�в����ɾ����SQL���
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

	//ִ��sql��ѯ���
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

    //ȡ�ô�����Ϣ
    public String getErrMes()
    {
        return errMes;
    }

}
