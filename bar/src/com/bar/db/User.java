/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

/**
 *
 * @author asus
 */

import java.sql.*;

public class User extends ExecuteDB
{
	//�������Ա����
	private long userid;
	private String uname;
	private String name;
	private String pwd;
	private String sex;
	private String email;
	private String address;
	private String tel;
	private String birth;
	private String post;
	private String safequestion;
	private String safeanswer;
	private String role;
	private float money;
	private String strSql;

    //���캯�����Գ�Ա�������г�ʼ����ֵ
	public User()
	{
		super();
		this.userid=0;
		this.uname="";
		this.name="";
		this.pwd="";
		this.sex="";
		this.email="";
		this.address="";
		this.tel="";
		this.birth="";
		this.post="";
		this.safequestion="";
		this.safeanswer="";
		this.role = "1";
		this.money=0;
		this.strSql="";
	}

	//������û�����users���ݱ������һ���¼�¼
	public boolean add()
	{

		this.strSql="insert into users ";
		this.strSql=this.strSql + "(uname,name,pwd,sex,email,address,tel,birth,post,safequestion,safeanswer,role,money) ";
		this.strSql=this.strSql + "values('" + this.uname + "','" + this.name + "','" + this.pwd + "','" + this.sex + "','" + this.email + "','" + this.address + "','" + this.tel + "','" + this.birth + "','" + this.post + "','" + this.safequestion + "','" + this.safeanswer + "','" + this.role + "','" + this.money + "')";
		boolean isAdd = super.exeSql(this.strSql);
                return isAdd;
	}

        public boolean delete(String sUserID)
        {
            this.strSql = "delete from users where userid in (";
            this.strSql = this.strSql + sUserID +")";

            boolean isDelete = super.exeSql(this.strSql);
            return isDelete;
        }

	//�޸�UserID��Ӧ���û�����Ϣ
	public boolean modify_info()
	{
		this.strSql="update users set";
		this.strSql=this.strSql + " name=" + "'" + this.name + "',";
		this.strSql=this.strSql + " sex=" + "'" + this.sex + "',";
		this.strSql=this.strSql + " email=" + "'" + this.email + "',";
		this.strSql=this.strSql + " address=" + "'" + this.address + "',";
		this.strSql=this.strSql + " tel=" + "'" + this.tel + "',";
		this.strSql=this.strSql + " birth=" + "'" + this.birth + "',";
		this.strSql=this.strSql + " post=" + "'" + this.post + "',";
		this.strSql=this.strSql + " safequestion=" + "'" + this.safequestion + "',";
		this.strSql=this.strSql + " safeanswer=" + "'" + this.safeanswer + "',";
		this.strSql=this.strSql + " money=" + "'" + this.money + "'";
		this.strSql=this.strSql + " where userid='" + this.userid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}

	//�޸�UserID��Ӧ���û�������
 	public boolean modify_UserPassword()
 	{
		this.strSql="update users set ";
		this.strSql=this.strSql + "pwd=" + "'" + this.pwd + "'";
		this.strSql=this.strSql + " where userid='" + this.userid + "'";
		boolean isUpdatekey = super.exeSql(this.strSql);

		return isUpdatekey;
	}

        //�޸�UserID��Ӧ���û�����Ϣ
	public boolean money()
	{
		this.strSql="update users set";
		this.strSql=this.strSql + " money=" + "'" + this.money + "'";
		this.strSql=this.strSql + " where userid='" + this.userid + "'";
		boolean isUpdate = super.exeSql(this.strSql);

		return isUpdate;
	}

 	//���UserID��Ӧ���û�����Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean init()
	{
		this.strSql="select * from `users` where userid=";
		this.strSql=this.strSql + "'" + this.userid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.userid=rs.getLong("userid");
				this.uname=rs.getString("uname");
				this.name=rs.getString("name");
				this.pwd=rs.getString("pwd");
				this.sex=rs.getString("sex");
				this.email=rs.getString("email");
				this.address=rs.getString("address");
				this.tel=rs.getString("tel");
				this.birth=rs.getString("birth");
				this.post=rs.getString("post");
				this.safequestion=rs.getString("safequestion");
				this.safeanswer=rs.getString("safeanswer");
				this.money=rs.getFloat("money");
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

	//��֤�û����������Ƿ���ȷ
	public boolean valid()
	{
		this.strSql="select userid,uname,role from `users` ";
		this.strSql=this.strSql + " where uname='" + this.uname + "'";
		this.strSql=this.strSql + "  and pwd='"+ this.pwd + "'";
		System.out.println(this.strSql);

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.userid=rs.getLong("userid");
				this.uname=rs.getString("uname");
				this.role = rs.getString("role");
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception ex)
		{
			return false;
		}
	}

   	//�ж��û����Ƿ����
	public boolean exist()
	{
		this.strSql="select * from `users` ";
		this.strSql=this.strSql + " where uname='" + this.uname + "'";

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



               	public ResultSet show_our_users()
	{
		this.strSql="select userid,sex,uname,name,address,email,tel,money from `users` where role= 3 order by userid asc";
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
                public ResultSet show_member_users()
	{
		this.strSql="select userid,sex,uname,name,address,email,tel,money from `users` where role= 1 order by userid asc";
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
	public void setUserid(long userid)
	{
		this.userid = userid;
	}

	//��ȡ���Ա����userid��ֵ
	public long getUserid()
	{
		return this.userid;
	}


	//�������Ա����uname��ֵ
 	public void setUname(String uname)
	{
		this.uname = uname;
	}

	//��ȡ���Ա����uname��ֵ
	public String getUname()
	{
		return this.uname;
	}


	//�������Ա����name��ֵ
 	public void setName(String name)
	{
		this.name = name;
	}

	//��ȡ���Ա����name��ֵ
	public String getName()
	{
		return this.name;
	}


	//�������Ա����pwd��ֵ
 	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	//��ȡ���Ա����pwd��ֵ
	public String getPwd()
	{
		return this.pwd;
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

	//�������Ա����address��ֵ
 	public void setAddress(String address)
	{
		this.address = address;
	}

	//��ȡ���Ա����address��ֵ
	public String getAddress()
	{
		return this.address;
	}


	//�������Ա����tel��ֵ
 	public void setTel(String tel)
	{
		this.tel = tel;
	}

	//��ȡ���Ա����tel��ֵ
	public String getTel()
	{
		return this.tel;
	}

	//�������Ա����birth��ֵ
 	public void setBirth(String birth)
	{
		this.birth = birth;
	}

	//��ȡ���Ա����birth��ֵ
	public String getBirth()
	{
		return this.birth;
	}

	//�������Ա����post��ֵ
 	public void setPost(String post)
	{
		this.post = post;
	}

	//��ȡ���Ա����post��ֵ
	public String getPost()
	{
		return this.post;
	}


	//�������Ա����safequestion��ֵ
 	public void setSafequestion(String safequestion)
	{
		this.safequestion = safequestion;
	}

	//��ȡ���Ա����safequestion��ֵ
	public String getSafequestion()
	{
		return this.safequestion;
	}



	//�������Ա����safeanswer��ֵ
 	public void setSafeanswer(String safeanswer)
	{
		this.safeanswer = safeanswer;
	}

	//��ȡ���Ա����safeanswer��ֵ
	public String getSafeanswer()
	{
		return this.safeanswer;
	}


		//�������Ա����money��ֵ
 	public void setMoney(float money)
	{
		this.money = money;
	}

	//��ȡ���Ա����money��ֵ
	public float getMoney()
	{
		return this.money;
	}


	//�������Ա����Role��ֵ
 	public void setRole(String role)
	{
		this.role = role;
	}

	//��ȡ���Ա����Role��ֵ
	public String getRole()
	{
		return this.role;
	}
}

