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


  <h1 class="accordion_toggle">�û�ע���ڵ�½ - ��Ҫ�����û�ע�����¼���������</h1>
		<div class="accordion_content">
		  <p>1�����ȣ���Ҫ�Ƚ���ע�ᣬע��������վ1.jpg���ڵ�½���ڵ������һ���û�ע���ͼ�꣬�����������ɽ���ע�ᡣ</p>
		  <p>2����½��ֱ�ӵ����½/ע��ͼ�꣬���������û��������뼴�ɽ��е�½����½�󷽿ɷ������ԡ������ײ͵ȡ�</p>
		  <p>3���һ����룬����������������߶�ʧ�����������£������������룬������Ӧ�Ĳ������������Ի�����롣</p>
    </div>
    
		<h1 class="accordion_toggle">���԰��ʹ�÷��� - ��Ҫ���������԰��ʹ�÷�����ʹ�ù���</h1>
		<div class="accordion_content">
		  <p>���������˵�½�󣬵�����԰壬���ɽ������ԣ������Թ����У�����ϸ��д������Ϣ�����������ر������ҷ��ɷ��棬����ʹ��á�ڮ�ٵ������ж����˵��������� </p>
		  <p>���ҪͶ�߱��ưɵķ���������վ���ʼ����ʼ�������Ա�������뿴&ldquo;վ���ʼ���ʹ�÷���&rdquo;��</p>
    </div>
		
		<h1 class="accordion_toggle">��Ա�Ƽ����ֵ�ʹ�÷��� - ��Ҫ���ܻ�Ա�Ƽ����ֵ�ʹ�÷����Լ�Ӧ��Ҫ������</h1>
		<div class="accordion_content">
<p>��Ա�Ƽ�������Ҫ�ǻ�Ա�Ѻõ������Ƽ������ưɣ��ڱ��ưɵľ���ѡ���£������ϻƽ�ʱ����ﲥ��������д������ַ��ʱ�����Ҫ��http://Ϊ��ʼ��</p>
<p>��.mp3/.wma/.mid�������ļ�����β���������ֽ��޷�������Ա������Ҳ��ֻ��ɾ�������Ƽ����ֵ�ͬʱ����Ҳ���԰��Լ���ϲ�����ĸ�������ӽ�����</p>
<p>ÿ����Ա����������׸裡</p>

</div>

		<h1 class="accordion_toggle">Ԥ��/�����ʹ�÷��� - ��Ҫ����Ԥ���븶�������������������--�����������µ�0871-1617181</h1>
		<div class="accordion_content">
			
            

            <div id="horizontal_container" >
              <p>1��Ԥ��/�������ҪĿ����Ϊ���л�Ա�����Ϲ˿ʹ������㣬�����žͿ���ֱ��Ԥ�����ưɵ��ײ͡�</p>
              <p>2��ҪԤ���ߣ���ͨ���������С�֧����ת�˽��뱾�ư�ϵͳ���������˻�����㹻����ʱ���������Խ���Ԥ����Ԥ����ɺ������˻������ۼ�ȥ��Ӧ���ʽ�</p>
              <p>3����Ԥ�����˺����������ʲô������Ŀ���ֱ�Ӳ���0871-1718181��������ѯ�Ͳ�ѯ��</p>
            </div>
    
</div>
   	
		<h1 class="accordion_toggle">վ���ʼ���ʹ�÷���</h1>
		<div class="accordion_content">
          <p>1��վ���ʼ�ֻ������վ�ڷ��ͺ�ʹ�ã����ܷ���վ���ʼ���</p>
          <p>2������վ���ʼ�����֪���Է����û��� ��</p>
          <p>3�����Ҫ�Ծưɷ����Ͷ�߻��߷����ʼ�������Ա����ô��&ldquo;������&rdquo;��������д&ldquo;admin&rdquo;��</p>
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
