<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<% request.setCharacterEncoding("gb2312");
   response.setCharacterEncoding("gb2312");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���û�ע��</title>

<style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
</style>

<script type="text/javascript" src="js/PopupCalendar.js"></script>
		<script type="text/javascript">
                var oCalendarChs=new PopupCalendar("oCalendarChs");	//��ʼ���ؼ�ʱ,�����ʵ������:oCalendarChs
                oCalendarChs.weekDaySting=new Array("��","һ","��","��","��","��","��");
                oCalendarChs.monthSting=new Array("һ��","����","����","����","����","����","����","����","����","ʮ��","ʮһ��","ʮ����");
 				oCalendarChs.oBtnTodayTitle="����";
				oCalendarChs.oBtnCancelTitle="ȡ��";
				oCalendarChs.Init();
		</script>


<script language="javascript" type="">
function CheckDate(INDate)
{ if (INDate=="")
    {return true;}
	subYY=INDate.substr(0,4)
	if(isNaN(subYY) || subYY<=0){
		return true;
	}
	//ת���·�
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}
		}
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}
	//ת����
	area=INDate.lastIndexOf(separate)
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}
    if(NewDate.substr(4,1)!="-"){return true;}
    if(NewDate.substr(7,1)!="-"){return true;}
	var MM=NewDate.substr(5,2);
	var DD=NewDate.substr(8,2);
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){ //�ж��Ƿ�Ϊ����
		if(parseInt(MM)==2){
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}	
	}
	var mm=new Array(1,3,5,7,8,10,12); //�ж�ÿ���е��������
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){
			if(parseInt(DD)>31){
				return true;
			}else{
				return false;
			}
		}
	}
   if(parseInt(DD)>30){return true;}
   if(parseInt(MM)>12){return true;}
   return false;
   }

function Mycheck(){
if(form1.uname.value=="")
{alert("�û�������Ϊ�գ���");return false;}
if(form1.pwd1.value=="")
{alert("���벻��Ϊ�գ���");return false;}
if (form1.pwd2.value=="")
{alert("ȷ�����벻��Ϊ�գ���");return false;}
if(form1.pwd1.value!=form1.pwd2.value)
{alert('��������������벻һ�£�');return false;}
if(form1.name.value=="")
{alert("��ʵ����������Ϊ�գ���");return false;}
if(form1.birth.value=="")
{alert("�������ڲ���Ϊ�գ���");return false;}
if(CheckDate(form1.birth.value))
{alert("�������׼���ڣ��磺1980/07/17��1980-07-17��");return false;}
if (form1.knowledge.value=="")
{alert("ѧ������Ϊ�գ���");return false;}
if (form1.address.value=="")
{alert("��ͥסַ����Ϊ�գ�����д��ȷ�ĵ�ַ����");return false;}
if (form1.post.value=="")
{alert("�ʱ಻��Ϊ�գ���");return false;}
if (isNaN(form1.post.value))
{alert("�ʱ����Ϊ�����ͣ���");return false;}
if (form1.tel.value=="")
{alert("��ϵ�绰����Ϊ�գ���");return false;}
if (isNaN(form1.tel.value))
{alert("��ϵ�绰����Ϊ�����ͣ���");return false;}
if (form1.email.value=="")
{alert("email����Ϊ�գ�����д��ȷ���ʼ�����");return false;}
var i=form1.email.value.indexOf("@")
var j=form1.email.value.indexOf(".")
if ((i<0)||(i-j>0)||(j<0))
{alert("�������Email��ʽ����ȷ�����������룡��");return false;}
if(form1.safequestion.value=="")
{alert("��ȫ���ⲻ��Ϊ�գ���");return false;}
if(form1.safeanswer.value=="")
{alert("��ȫ�𰸲���Ϊ�գ���");return false;}
form1.submit();
}

function openwin(){
if (form1.uname.value==""){
alert("�������û���!");
return false;
}

}

</script>
</head>
<body>
<%@ include file="inc/reg_header.jsp" %>
<div class="reg">
<%@ include file="inc/reg.jsp" %>
</div>
<%@ include file="inc/footer.jsp" %>
</body>
</html>