<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<% request.setCharacterEncoding("gb2312");
   response.setCharacterEncoding("gb2312");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新用户注册</title>

<style type="text/css">
@import url(images/header.css);
@import url(images/bar.css);
</style>

<script type="text/javascript" src="js/PopupCalendar.js"></script>
		<script type="text/javascript">
                var oCalendarChs=new PopupCalendar("oCalendarChs");	//初始化控件时,请给出实例名称:oCalendarChs
                oCalendarChs.weekDaySting=new Array("日","一","二","三","四","五","六");
                oCalendarChs.monthSting=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
 				oCalendarChs.oBtnTodayTitle="今天";
				oCalendarChs.oBtnCancelTitle="取消";
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
	//转换月份
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
	//转换日
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
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){ //判断是否为闰年
		if(parseInt(MM)==2){
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}	
	}
	var mm=new Array(1,3,5,7,8,10,12); //判断每月中的最大天数
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
{alert("用户名不能为空！！");return false;}
if(form1.pwd1.value=="")
{alert("密码不能为空！！");return false;}
if (form1.pwd2.value=="")
{alert("确认密码不能为空！！");return false;}
if(form1.pwd1.value!=form1.pwd2.value)
{alert('您两次输入的密码不一致！');return false;}
if(form1.name.value=="")
{alert("真实的姓名不能为空！！");return false;}
if(form1.birth.value=="")
{alert("出生日期不能为空！！");return false;}
if(CheckDate(form1.birth.value))
{alert("请输入标准日期（如：1980/07/17或1980-07-17）");return false;}
if (form1.knowledge.value=="")
{alert("学历不能为空！！");return false;}
if (form1.address.value=="")
{alert("家庭住址不能为空，请填写正确的地址！！");return false;}
if (form1.post.value=="")
{alert("邮编不能为空！！");return false;}
if (isNaN(form1.post.value))
{alert("邮编必须为数字型！！");return false;}
if (form1.tel.value=="")
{alert("联系电话不能为空！！");return false;}
if (isNaN(form1.tel.value))
{alert("联系电话必须为数字型！！");return false;}
if (form1.email.value=="")
{alert("email不能为空，请填写正确的邮件！！");return false;}
var i=form1.email.value.indexOf("@")
var j=form1.email.value.indexOf(".")
if ((i<0)||(i-j>0)||(j<0))
{alert("您输入的Email格式不正确，请重新输入！！");return false;}
if(form1.safequestion.value=="")
{alert("安全问题不能为空！！");return false;}
if(form1.safeanswer.value=="")
{alert("安全答案不能为空！！");return false;}
form1.submit();
}

function openwin(){
if (form1.uname.value==""){
alert("请输入用户名!");
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