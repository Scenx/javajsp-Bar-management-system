/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.page;

/**
 *
 * @author asus
 */


import java.sql.*;
import java.util.*;

public class SplitPage
{
	//������������
	private ResultSet rs=null;
	private ResultSetMetaData rsmd=null;
	//�ܼ�¼��Ŀ
	private int rowCount;
	//���ֵ��߼�ҳ��
	private int pageCount;
	//ÿҳ��ʾ�ļ�¼��Ŀ
	private int pageSize;

	//��ʼ��,��ȡ���ݱ��е���Ϣ
	public void initialize(ResultSet rs,int pageSize)
	{
		this.pageSize=pageSize;
		try
		{
			this.rs=rs;
			this.rsmd=this.rs.getMetaData();
			if (this.rs!=null)
			{
				this.rs.last();
				this.rowCount = this.rs.getRow();
				this.rs.first();
				this.pageCount = (this.rowCount - 1) / this.pageSize + 1;
			}
			else
			{
				this.rowCount=0;
			}
		}
		catch(SQLException e)
		{
			System.out.println(e.toString());
		}
	}

	//����ʾ����浽Vector��������
	public Vector getPage(int ipage)
	{
		Vector vData=new Vector();
		int n=ipage;
		int m=0;
		m=(n-1)*this.pageSize+1;
		try
		{
			if (this.rs!=null)
			{
				if (n!=1)
				{
					this.rs.absolute(m);
				}
				for(int i=0;i<this.pageSize;i++)
				{
					String[] sData=new String[10];
					for(int j=0;j<this.rsmd.getColumnCount();j++)
					{
						sData[j]=this.rs.getString(j+1);
					}
					if (sData==null)
					{
						break;
					}
					vData.addElement(sData);
					this.rs.next();
				}
			}
		}
		catch(SQLException e)
		{
			System.out.println(e.toString());
		}
		return vData;
	}

	//���ҳ������
	public int getPageCount()
	{
		return this.pageCount;
	}

	//��ȡ���ݱ��м�¼����
	public int getRowCount()
	{
		return this.rowCount;
	}
}
