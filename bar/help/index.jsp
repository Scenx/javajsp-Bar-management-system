<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head profile="http://gmpg.org/xfn/11">

	<meta name="robots" content="index, follow" />





    
<script type="text/javascript">
			
	
		Event.observe(window, 'load', loadAccordions, false);
	
		function loadAccordions() {
			var topAccordion = new accordion('horizontal_container', {
				classNames : {
					toggle : 'horizontal_accordion_toggle',
					toggleActive : 'horizontal_accordion_toggle_active',
					content : 'horizontal_accordion_content'
				},
				defaultSize : {
					width : 525
				},
				direction : 'horizontal'
			});
			
			var bottomAccordion = new accordion('vertical_container');
			
			var nestedVerticalAccordion = new accordion('vertical_nested_container', {
			  classNames : {
					toggle : 'vertical_accordion_toggle',
					toggleActive : 'vertical_accordion_toggle_active',
					content : 'vertical_accordion_content'
				}
			});
			
			
			bottomAccordion.activate($$('#vertical_container .accordion_toggle')[0]);
			
			
			topAccordion.activate($$('#horizontal_container .horizontal_accordion_toggle')[2]);
		}
		
	</script>
	
	
	<style type="text/css" >
		
		.accordion_toggle {
	display: block;
	height: 30px;
	width: 940px;
	background: url(images/accordion_toggle.jpg) no-repeat top right #a9d06a;
	padding: 0 10px 0 10px;
	line-height: 30px;
	color: #ffffff;
	font-weight: normal;
	text-decoration: none;
	outline: none;
	font-size: 12px;
	color: #000000;
	border-bottom: 1px solid #cde99f;
	cursor: pointer;
	margin: 0 0 0 0;
	
		}
		
		.accordion_toggle_active {
			background: url(images/accordion_toggle_active.jpg) no-repeat top right #e0542f;
			color: #ffffff;
			border-bottom: 1px solid #f68263;
		}
		
		.accordion_content {
	background-color: #171B20;
	color: #fff;
	overflow: hidden;
		}
			
			.accordion_content h2 {
				margin: 15px 0 5px 10px;
				color: #0099FF;
			}
			
			.accordion_content p {
				line-height: 150%;
				padding: 5px 10px 15px 10px;
			}
			
		.vertical_accordion_toggle {
			display: block;
			height: 30px;
			width: 600px;
			background: url(images/accordion_toggle.jpg) no-repeat top right #a9d06a;
			padding: 0 10px 0 10px;
			line-height: 30px;
			color: #ffffff;
			font-weight: normal;
			text-decoration: none;
			outline: none;
			font-size: 12px;
			color: #000000;
			border-bottom: 1px solid #cde99f;
			cursor: pointer;
			margin: 0 0 0 0;
		}

		.vertical_accordion_toggle_active {
			background: url(images/accordion_toggle_active.jpg) no-repeat top right #e0542f;
			color: #ffffff;
			border-bottom: 1px solid #f68263;
		}

		.vertical_accordion_content {
			background-color: #ffffff;
			color: #444444;
			overflow: hidden;
		}

			.vertical_accordion_content h2 {
				margin: 15px 0 5px 10px;
				color: #0099FF;
			}

			.vertical_accordion_content p {
				line-height: 150%;
				padding: 5px 10px 15px 10px;
			}
  			
		
		.horizontal_accordion_toggle {
			
			float: left;
			

			display: block;
			height: 100px;
			width: 30px;
			background: url(images/h_accordion_toggle.jpg) no-repeat top left #a9d06a;
			color: #ffffff;
			text-decoration: none;
			outline: none;
			border-right: 1px solid #cde99f;
			cursor: pointer;
			margin: 0 0 0 0;
		}
		
		.horizontal_accordion_toggle_active {
			background: url(images/h_accordion_toggle_active.jpg) no-repeat top left #e0542f;
			border-right: 1px solid #f68263;
		}
		
		.horizontal_accordion_content {
			
			height: 100px;
			float: left;	
			
			
			overflow: hidden;
			background-color: #ffffff;
			color: #444444;
		}
			
			.horizontal_accordion_content p {
				width: 450px;
				line-height: 150%;
				padding: 5px 10px 15px 10px;
			}
					
					
   
    #horizontal_container {
	margin: 20px auto 20px auto;
	width: 960px;
    }
    
    #vertical_nested_container {
      margin: 20px auto 20px auto;
      width: 620px;
    }

	</style>


</head>

<body>



<div id="container">

  <div id="vertical_container" >


  <h1 class="accordion_toggle">用户注册于登陆 - 主要介绍用户注册与登录的相关内容</h1>
		<div class="accordion_content">
		  <p>1、首先，您要先进行注册，注册请点击本站1.jpg，在登陆窗口的左边有一个用户注册的图标，请点击它，即可进行注册。</p>
		  <p>2、登陆，直接点击登陆/注册图标，输入您的用户名与密码即可进行登陆，登陆后方可发表留言、订购套餐等。</p>
		  <p>3、找回密码，在您忘记了密码或者丢失了密码的情况下，请点击忘记密码，进行相应的操作，您将可以获得密码。</p>
    </div>
    
		<h1 class="accordion_toggle">留言版的使用方法 - 主要介绍了留言板的使用方法和使用规则</h1>
		<div class="accordion_content">
		  <p>当您进行了登陆后，点击留言板，即可进行留言，在留言过程中，请仔细填写留言信息。留言请遵守本国国家法律法规，请勿使用谩骂、诋毁等来进行对他人的人身攻击。 </p>
		  <p>如果要投诉本酒吧的服务请利用站内邮件发邮件给管理员。详情请看&ldquo;站内邮件的使用方法&rdquo;。</p>
    </div>
		
		<h1 class="accordion_toggle">会员推荐音乐的使用方法 - 主要介绍会员推荐音乐的使用方法以及应主要的问题</h1>
		<div class="accordion_content">
<p>会员推荐音乐主要是会员把好的音乐推荐给本酒吧，在本酒吧的精心选择下，在晚上黄金时间段里播出，在填写歌曲地址的时候必须要以http://为开始，</p>
<p>以.mp3/.wma/.mid等音乐文件名结尾，否则音乐将无法被管理员听到，也就只有删除。在推荐音乐的同时，你也可以把自己最喜欢听的歌曲都添加进来，</p>
<p>每个会员能添加无限首歌！</p>

</div>

		<h1 class="accordion_toggle">预定/付款的使用方法 - 主要介绍预定与付款当中运作程序与解决问题--如有疑问请致电0871-1617181</h1>
		<div class="accordion_content">
			
            

            <div id="horizontal_container" >
              <p>1、预定/付款的主要目的是为所有会员、新老顾客带来方便，不出门就可以直接预订本酒吧的套餐。</p>
              <p>2、要预订者，请通过网上银行、支付宝转账进入本酒吧系统，当您的账户余额足够付款时，您将可以进行预订、预订完成后，您的账户余额将被扣减去相应的资金。</p>
              <p>3、在预订好了后，如果您还有什么不清楚的可以直接拨打0871-1718181来进行咨询和查询。</p>
            </div>
    
</div>
   	
		<h1 class="accordion_toggle">站内邮件的使用方法</h1>
		<div class="accordion_content">
          <p>1、站内邮件只可以在站内发送和使用，不能发送站外邮件。</p>
          <p>2、发送站内邮件必须知道对方的用户名 。</p>
          <p>3、如果要对酒吧服务的投诉或者发送邮件给管理员，那么在&ldquo;接收人&rdquo;那里请填写&ldquo;admin&rdquo;。</p>
		</div>
   	
		
		
  </div>
</div>

<script type="text/javascript" >
	var verticalAccordions = $$('.accordion_toggle');
	verticalAccordions.each(function(accordion) {
		$(accordion.next(0)).setStyle({
		  height: '0px'
		});
	});

	
</script>
	


	
</body>
</html>
