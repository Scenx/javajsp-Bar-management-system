DROP DATABASE bar;

CREATE DATABASE bar;

USE bar;

DROP TABLE IF EXISTS systems; /*ϵͳ����*/
CREATE TABLE systems (
  sid bigint(20) unsigned NOT NULL auto_increment,/*�Զ����*/
  sitename varchar(255) not null default 'С�;ư����߹���ϵͳ',
  description varchar(255) not null default 'С�;ư����߹���ϵͳ',
  keywords varchar(255) not null default '�ư�,����,ϵͳ,����',
  author varchar(255) not null default '�ŷ�',  /*������*/
  email char(50) NOT NULL default '',
  tel varchar(255) NOT NULL default '',
  PRIMARY KEY  (sid)
) TYPE=MyISAM;

INSERT INTO systems VALUES (1,'С�;ư����߹���ϵͳ','С�;ư����߹���ϵͳ','�ư�,����,ϵͳ,����','�ŷ�','xx@qq.com','11111111111')



DROP TABLE IF EXISTS users; /*��Ա��*/
CREATE TABLE users (
  userid bigint(20) unsigned not null auto_increment ,/*�Զ����*/
  uname char(36) NOT NULL default '',
  name char(50) NOT NULL default '',/*��ʵ����*/
  pwd char(32) NOT NULL default '',
  spwd char(32) NOT NULL default '',
  sex enum('��','Ů','����') NOT NULL default '����',
  email char(50) NOT NULL default '',
  address varchar(255) NOT NULL default '',
  tel varchar(255) NOT NULL default '',
  birth  date default '0000-00-00',
  post char(50) NOT NULL default '',
  safequestion char(50) NOT NULL default '',/*��ȫ����*/
  safeanswer char(50) NOT NULL default '',/*��*/
  role enum('0','1','2') NOT NULL default '0',/*1Ϊ��Ա2Ϊ����Ա3ΪԱ��*/
  money char(50) NOT NULL default '0',
  createtime  timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,
  PRIMARY KEY  (userid),
  UNIQUE KEY userid (userid)
) TYPE=MyISAM;
INSERT INTO users(uname,name,pwd,spwd,sex,email,address,tel,birth,post,safequestion,safeanswer,role) VALUES ( 'admin', '����Ա', '21232F297A57A5A743894A0E4A801FC3','admin','��','514337551@qq.com','����ʦ����ѧԺ',
'15825254472','1987-10-18','650106','���ǹ���Ա��','�ǵ�','2');
INSERT INTO users(uname,name,sex,email,address,tel,birth,knowledge,post,safequestion,safeanswer,role) VALUES ( 'king2088', '�ŷ�','��','514337551@qq.com','����ʦ����ѧԺ',
'15825254472','1987-10-18','����','650106','���ǹ���Ա��','�ǵ�','2');


DROP TABLE IF EXISTS myusers; /*��Ӧ�̱�*/
CREATE TABLE myusers (
myuserid bigint(20) unsigned not null auto_increment ,/*�Զ����*/
myuname char(36) NOT NULL default '',/*��Ӧ������*/
sex enum('��','Ů') NOT NULL default '��',
pname char(50) NOT NULL default '',/*ơ������*/
address varchar(255) NOT NULL default '', /*��Ӧ�̵�ַ*/
email char(50) NOT NULL default '',/*��Ӧ��email*/
tel varchar(255) NOT NULL default '',/*��Ӧ����ϵ�绰*/
  PRIMARY KEY  (myuserid),
  UNIQUE KEY myuserid (myuserid)
) TYPE=MyISAM;

INSERT INTO myusers VALUES ( '1', '�ŷ�','��','����ơ��','�����и���������·99��','514337551@qq.com','15928282822');




DROP TABLE IF EXISTS articles; /*���±�*/
CREATE TABLE articles (
  articleid bigint(20) NOT NULL auto_increment,/*����ID*/
  title varchar(100) default NULL,/*���±���*/
  content mediumtext,/*��������*/
  userid bigint(20) default '0',/*���·�����*/
  readcount int(11) default '0',/*�����Ķ�����*/
  recount int(11) default '0',/*���»ظ���*/
  typeid enum('1','2','3') NOT NULL default '1',/*1������2�ǹ���3�ǻ*/
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP, /*���·���ʱ��*/
  PRIMARY KEY  (articleid),
  UNIQUE KEY articleid (articleid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS type; /*�������ͱ�*/
CREATE TABLE type (
typeid bigint(20) NOT NULL auto_increment,/*����ID*/
typename varchar(100) default  null,
PRIMARY KEY  (typeid),
UNIQUE KEY articleid (typename)
) TYPE=MyISAM;



INSERT INTO type VALUES ( 1, '�ư�����');
INSERT INTO type VALUES ( 2, '�ưɹ���');
INSERT INTO type VALUES ( 3, '�ưɻ');






DROP TABLE IF EXISTS goods; /*������*/
CREATE TABLE goods (
  goodsid bigint(20) NOT NULL auto_increment,/*ID*/
  buynumber bigint(20) default '1',/*������Ʒ������*/
  userid bigint(20) NOT NULL default '0',/*�û�������*/
  price float(20,3) default NULL,/*�������*/
  goodinfoid bigint(20) NOT NULL default '0',/*��Ʒ������*/
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,/*����ʱ��*/
  PRIMARY KEY  (goodsid),
  UNIQUE KEY goodsid (goodsid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS goodinfo; /*��Ʒ��Ϣ��*/
CREATE TABLE goodinfo (
  goodinfoid bigint(20) NOT NULL auto_increment,
  goodinfoname varchar(100) default NULL,/*��Ʒ����*/
  company varchar(100) default NULL,/*��������*/
  addr varchar(50) default NULL,/*����*/
  price float(20,3) default NULL,/*�۸�*/
  picurl varchar(30) default NULL,/*��Ʒ��Ӧ��ͼƬ��*/
  intro mediumtext,/*��Ʒ����*/
  num varchar(100) default NULL,/*��Ʒ����*/
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,/*��Ʒ��Ϣ�ύʱ��*/
  PRIMARY KEY  (goodinfoid),
  UNIQUE KEY goodinfoid (goodinfoid)
) TYPE=MyISAM;





DROP TABLE IF EXISTS ku; 
CREATE TABLE ku ( /*�����Ϣ��*/
  kuid bigint(20) NOT NULL auto_increment,
  goodname varchar(200) NOT NULL default '',
  num varchar(100) default NULL,/*��Ʒ����*/
  PRIMARY KEY  (kuid),
  UNIQUE KEY kuid (kuid)
) TYPE=MyISAM;

INSERT INTO ku VALUES ( 1, '����ơ��','100');
INSERT INTO ku VALUES ( 2, 'ѩ��ơ��','100');
INSERT INTO ku VALUES ( 3, '�ྩơ��','100');
INSERT INTO ku VALUES ( 4, '����ơ��','100');



DROP TABLE IF EXISTS talk; 
CREATE TABLE talk ( /*�û����԰�*/
  talkid bigint(20) NOT NULL auto_increment,
  content mediumtext,
  userid bigint(20) NOT NULL default '0',
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,
  PRIMARY KEY  (talkid),
  UNIQUE KEY talkid (talkid)
) TYPE=MyISAM;



DROP TABLE IF EXISTS email; 
CREATE TABLE email (
  emailid bigint(20) NOT NULL auto_increment,
  subject varchar(200) default NULL,/*�ʼ�����*/
  content mediumtext,/*�ʼ�����*/
  sender varchar(50) NOT NULL default '',/*������*/
  receiver varchar(50) NOT NULL default '',/*�ռ���*/
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,/*����ʱ��*/
  tag tinyint(1) default '0',/*�ʼ����*/
  PRIMARY KEY  (EmailID)
) TYPE=MyISAM;



DROP TABLE IF EXISTS music; 
CREATE TABLE music (
musicid bigint(20) not null auto_increment,
musicname text,
musicurl text,
userid bigint(20) NOT NULL default '0',
PRIMARY KEY  (musicid)
) TYPE=MyISAM;