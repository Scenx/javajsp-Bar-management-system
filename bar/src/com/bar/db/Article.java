package com.bar.db;

import java.sql.*;

public class Article extends ExecuteDB
{
	//�������Ա����
	private long articleid;
	private String title;
	private String content;
	private long userid;
	private int readcount;
	private int recount;
        private long typeid;
        private String createtime;
	private String strSql;

    //���캯�����Գ�Ա�������г�ʼ����ֵ
	public Article()
	{
		this.articleid=0;
		this.title="";
		this.content="";
		this.readcount=0;
                this.recount=0;
		this.userid=0;
                this.typeid=0;
                this.createtime="";
		this.strSql="";
	}

	//��������£���articles���ݱ������һ���¼�¼
	public boolean add()
	{
		this.strSql="insert into articles ";
		this.strSql=this.strSql + "(";
		this.strSql=this.strSql + "title,content,userid,readcount,recount,typeid)";
		this.strSql=this.strSql + "values('" + this.title + "','" + this.content + "','" + this.userid + "','" + this.readcount + "','" + this.recount + "','" + this.typeid + "')";
		boolean isAdd = super.exeSql(this.strSql);

		return isAdd;
	}

  	//ɾ��articleid��Ӧ�����µ���Ϣ
		public boolean delete(String sActicleid)
	{
		this.strSql="delete from articles";
		this.strSql=this.strSql + "  where articleid in ("+ sActicleid +")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

	//��֤articleid��userid�Ƿ�ƥ��
	public boolean valid()
	{
		this.strSql="select articleid from `articles` ";
		this.strSql=this.strSql + " where articleid='" + this.articleid + "'";
		this.strSql=this.strSql + "  and userid='"+ this.userid + "'";
		System.out.println(this.strSql);

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
		catch(Exception ex)
		{
                    System.out.println(ex.toString());
			return false;
		}
	}



  	//��ȡarticleid��Ӧ�����µ���Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean  init()
	{
    	this.strSql="select * from `articles` where articleid=";
        this.strSql=this.strSql + "'" + this.articleid + "'";
        try
		{
   			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
                articleid=rs.getLong("articleid");
                title=rs.getString("title");
                content=rs.getString("content");
                readcount=rs.getInt("readcount");
                userid=rs.getLong("userid");
                recount=rs.getInt("recount");
                typeid = rs.getLong("typeid");
                createtime = rs.getString("createtime");
                return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception ex)
		{
                    System.out.println(ex.toString());
			return false;
		}
	}

	//���typeid��ͬ��һ�����µ���Ϣ������һ��ResultSet���Ͷ���
	public ResultSet show_son_articles()
	{
		this.strSql="select * from `articles`";
                this.strSql=this.strSql + " where typeid = '"+ this.typeid +"'";
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

        
        public ResultSet show_type_articles()
	{	
		this.strSql="select articleid,title,userid,readcount,recount,createtime from `articles`";
        this.strSql=this.strSql + " where typeid = '" + this.typeid + "'";
        this.strSql=this.strSql + " order by createtime desc";
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
        //��ȡǰ4����������
        public ResultSet show_news_articles()
	{
		this.strSql="select articleid,title from `articles` ";
                this.strSql=this.strSql + " where typeid = '" + this.typeid + "'";
                this.strSql=this.strSql + " order by createtime desc limit 0,4";
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
         //��ȡ��ǰǰ
         public ResultSet show_anews_articles()
	{
		this.strSql="select articleid,title from `articles` ";
                this.strSql=this.strSql + " where typeid = '" + this.typeid + "'";
                this.strSql=this.strSql + " order by createtime desc limit 0,24";
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
	
         //��ȡǰ4����������
        public ResultSet show_new_articles()
	{
		this.strSql="select articleid,title from `articles` ";
                this.strSql=this.strSql + " order by createtime desc limit 0,10";
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
        public ResultSet show_all_articles()
	{
		this.strSql="select articleid,title,userid,readcount,recount,createtime from `articles` ";
                this.strSql=this.strSql + " order by createtime desc";
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



	//���BoardID��Ӧ������������������������
	public int articles_count()
	{	
		this.strSql="select articleid,title,userid,readcount,recount,createtime from `articles`";
        this.strSql=this.strSql + " where typeid = '" + this.typeid + "'";
        ResultSet rs = null; 
		try
		{
			rs = super.exeQuery(this.strSql);
			rs.last();
			return rs.getRow();	
		}
		catch(Exception e)
		{
			System.out.println(e.toString()); 
			return 0;
		}  
	}

        public boolean modify()
	{
		this.strSql="update articles set";
		this.strSql=this.strSql + " title = '"+this.title+"',";
                this.strSql=this.strSql + "content = '"+this.content+"'";
		this.strSql=this.strSql + " where articleid='" + this.articleid + "'";
		boolean isModify = super.exeSql(this.strSql);

		return isModify;
	}



	//����articles���ݱ���articleid����Ӧ��readcount��ֵ
	public boolean modify_readcount()
	{
		this.strSql="update articles set";
		this.strSql=this.strSql + " readcount = '"+this.readcount+"'";
		this.strSql=this.strSql + " where articleid='" + this.articleid + "'";
		boolean isModify = super.exeSql(this.strSql);

		return isModify;
	}

	//����articles���ݱ���articleid����Ӧ��ReCount��ֵ
	public boolean modify_ReCount()
	{
		this.strSql="update articles set";
		this.strSql=this.strSql + " recount = '"+this.recount+"'";
		this.strSql=this.strSql + " where articleid='" + this.articleid + "'";
		boolean isModify = super.exeSql(this.strSql);

		return isModify;
	}




  	//�������Ա����articleid��ֵ
	public void setArticleid(long articleid)
	{
		this.articleid = articleid;
	}

	//��ȡ���Ա����articleid��ֵ
	public long getArticleid()
	{
		return this.articleid;
	}

	//�������Ա����title��ֵ
 	public void setTitle(String title)
	{
		this.title = title;
	}

	//��ȡ���Ա����title��ֵ
	public String getTitle()
	{
		return this.title;
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


	//�������Ա����readcount��ֵ
	public void setReadcount(int readcount)
	{
		this.readcount = readcount;
	}

	//��ȡ���Ա����readcount��ֵ
	public int getReadcount()
	{
		return this.readcount;
	}

	//�������Ա����ReCount��ֵ
 	public void setRecount(int recount)
	{
		this.recount = recount;
	}

	//��ȡ���Ա����ReCount��ֵ
	public int getRecount()
	{
		return this.recount;
	}

        //�������Ա����typeid��ֵ
 	public void setTypeid(Long typeid)
	{
		this.typeid = typeid;
	}

	//��ȡ���Ա����picname��ֵ
	public Long getTypeid()
	{
		return this.typeid;
	}
        //�������Ա����content��ֵ
 	public void setCreatetime(String createtime)
	{
		this.createtime = createtime;
	}

	//��ȡ���Ա����content��ֵ
	public String getCreatetime()
	{
		return this.createtime;
	}
}

