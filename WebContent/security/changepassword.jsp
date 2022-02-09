<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>通过手机号验证的下一步</title>
		<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<script src="../bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		
			
		</script>
		<style type="text/css">
			#loge{
				width: 50px;
				height: 45px;
			}
			#top{
				height: 70px;
				border-color: #011536;;
				background-color: #011536;
			}
			#tp{
				height: 450px;
			}
			.navbar-brand
			{
				padding-top: 13px;
				padding-left: 80px;
				padding-right: 0px;
			}
			#lg-top-padding{
				width: 30px;
				height: 1px;
			}
			.navbar-text
			{
				padding-top:5px;
				font-size: 25px;
				letter-spacing: 3px;
				
			}
			.navbar-text strong
			{
				color: white;
			}
			.top-text{
				color: white;
			}
			body{
				padding-top: 100px;
				background-color: #f6f6f8;
			}

			#address{
				padding-right: 52px;
			}
			#button-top{
				margin-top: 18px;
				border-color: #011536;
				background-color: #011536;
			}
			#bs-example-navbar-collapse-1{
				border-color: #011536;;
				background-color: #011536;
			}
			#mine{
				padding-top: 19px;
				padding-right: 40px;
			}
			#top-text{
				padding-right:30px;
			}
			#address{
				margin-top: 13px;
				font-size: 16px;
				color: white;
			}
			#address a{
				font-size: 16px;
				color: white;
			}
			#query-btn{
				letter-spacing: 2px;
			}
			#userimg img{
				width: 40px;
			}
			p{
				color: black;
				font-family: "微软雅黑";
				font-size: 16px;
			}
		</style>
		<script type="text/javascript">
			//电脑端表单验证
			function yz()
				{
					var mm01=$("#mm01").val();
					var mm02=$("#mm02").val();
					var regexp=new RegExp("[A-Za-z0-9]{6,30}");
					if((!mm01.trim()) && (!mm02.trim()) )
					{
						$("#nr01").html("密码不能为空，请输入密码");
						$("#error01").show();
						$("#success01").hide();
						$("#error03").show();
						$("#nr02").html("密码不能为空，请输入密码");
						$("#error02").show();
						$("#success02").hide();
						$("#error04").show();
						return false;
					}
					else
					{
						if(!regexp.test(mm01))
						{
							$("#nr01").html("密码长度至少为六位,只能是大小写字母，数字或字符！");
							$("#error01").show();
							$("#success01").hide();
							$("#error03").show();
							return false;
						}
						else
						{
							if(mm01==mm02)
							{
								$("#success02").show();
								$("#error02").hide();
								$("#error04").hide();
								return true;
							}
							else
							{
								$("#nr02").html("两次输入密码不同，请重新输入");
								$("#error02").show();
								$("#success02").hide();
								$("#error04").show();
								return false;
							}
						}
						
					}
				}
			function yz01()
			{
				var mm01=$("#mm01").val();
				var regexp=new RegExp("[A-Za-z0-9]{6,30}");
				
				if(!mm01.trim())
				{
					$("#nr01").html("密码不能为空，请输入密码");
					$("#error01").show();
					$("#success01").hide();
					$("#error03").show();
				}
				else
				{
					if(!regexp.test(mm01))
					{
						$("#nr01").html("密码长度至少为六位,只能是大小写字母，数字或字符！");
						$("#error01").show();
						$("#success01").hide();
						$("#error03").show();
					}
					else
					{
						$("#success01").show();
						$("#error01").hide();
						$("#error03").hide();
					}
				}
				
			}
			function yz02()
			{
				var mm01=$("#mm01").val();
				var mm02=$("#mm02").val();
				if(!mm02.trim())
				{
					$("#nr02").html("密码不能为空，请输入密码");
					$("#error02").show();
					$("#success02").hide();
					$("#error04").show();
				}
				else
				{
					if(mm01==mm02)
					{
						$("#success02").show();
						$("#error02").hide();
						$("#error04").hide();
					}
					else
					{
						$("#nr02").html("两次输入密码不同，请重新输入");
						$("#error02").show();
						$("#success02").hide();
						$("#error04").show();
					}
				}
				
				
				
			}
			
			//手机端js
			function phoneyz()
				{
					var mm01=$("#phone-mm01").val();
					var mm02=$("#phone-mm02").val();
					var regexp=new RegExp("[A-Za-z0-9]{6,30}");
					if((!mm01.trim()) && (!mm02.trim()) )
					{
						$("#phone-nr01").html("密码不能为空，请输入密码");
						$("#phone-error01").show();
						$("#phone-success01").hide();
						$("#phone-error03").show();
						$("#phone-nr02").html("密码不能为空，请输入密码");
						$("#phone-error02").show();
						$("#phone-success02").hide();
						$("#phone-error04").show();
						return false;
					}
					else
					{
						if(!regexp.test(mm01))
						{
							$("#phone-nr01").html("密码长度至少为六位,只能是大小写字母，数字或字符！");
							$("#phone-error01").show();
							$("#phone-success01").hide();
							$("#phone-error03").show();
							return false;
						}
						else
						{
							if(mm01==mm02)
							{
								$("#phone-success02").show();
								$("#phone-error02").hide();
								$("#phone-error04").hide();
								return true;
							}
							else
							{
								$("#phone-nr02").html("两次输入密码不同，请重新输入");
								$("#phone-error02").show();
								$("#phone-success02").hide();
								$("#phone-error04").show();
								return false;
							}
						}
						
					}
				}
			function phoneyz01()
			{
				var mm01=$("#phone-mm01").val();
				var regexp=new RegExp("[A-Za-z0-9]{6,30}");
				
				if(!mm01.trim())
				{
					$("#phone-nr01").html("密码不能为空，请输入密码");
					$("#phone-error01").show();
					$("#phone-success01").hide();
					$("#phone-error03").show();
				}
				else
				{
					if(!regexp.test(mm01))
					{
						$("#phone-nr01").html("密码长度至少为六位,只能是大小写字母，数字或字符！");
						$("#phone-error01").show();
						$("#phone-success01").hide();
						$("#phone-error03").show();
					}
					else
					{
						$("#phone-success01").show();
						$("#phone-error01").hide();
						$("#phone-error03").hide();
					}
				}
				
			}
			function phoneyz02()
			{
				var mm01=$("#phone-mm01").val();
				var mm02=$("#phone-mm02").val();
				if(!mm02.trim())
				{
					$("#phone-nr02").html("密码不能为空，请输入密码");
					$("#phone-error02").show();
					$("#phone-success02").hide();
					$("#phone-error04").show();
				}
				else
				{
					if(mm01==mm02)
					{
						$("#phone-success02").show();
						$("#phone-error02").hide();
						$("#phone-error04").hide();
					}
					else
					{
						$("#phone-nr02").html("两次输入密码不同，请重新输入");
						$("#phone-error02").show();
						$("#phone-success02").hide();
						$("#phone-error04").show();
					}
				}
				
				
				
			}

		</script>
		
	</head>
	
	<!--
    	作者：1977455153@qq.com
    	时间：2022-01-24
    	描述：导航栏
    -->
	<nav id="top" class="navbar navbar-default navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	    	 <button id="button-top" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
	      <a class="navbar-brand" href="#">
	      	<div id="lg-top-padding">
	      		
	      	</div>
	      </a>
	      <p class="navbar-text"><strong>高校就业平台</strong></p>
	    </div>
	     <div class="collapse navbar-collapse " id="top-text">
	     	 <ul class="nav visible-lg-block navbar-nav navbar-right">
		        <li id="address"><a href="<%=request.getContextPath()%>/users/security.do?method=changepasswordpage">点击返回上一页</a></li>
		        
		        
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     	 <ul class="nav visible-xs-block navbar-nav">
		        <li><a href="<%=request.getContextPath()%>/users/security.do?method=changepasswordpage"style="color: white;">点击返回上一页</a>	</li>
	            
		      </ul>
		      
	    </div>
	    
	  </div>
	</nav>
	<body>
		
		<div class="container-fluid">
			<!--
            	作者：1148969471@qq.com
            	时间：2022-02-04
            	描述：电脑端显示
            -->
			<div class="row visible-lg-block">
				<div class="col-lg-6 col-xs-12 col-lg-offset-3">
					<div class="panel panel-default">
					  <div class="panel-body">
					  	<div class="col-lg-10 col-xs-12 col-lg-push-1" style="padding-top: 50px;">
					  		<div class="panel panel-default">
							  <div class="panel-body">
							  	<form method="post" onsubmit="return yz()" action="<%=request.getContextPath()%>/users/security.do?method=savepassword">
							   	<div class="row" >
							  		<div class="col-lg-4 col-xs-8 col-lg-push-2 col-xs-push-1">
							  			<h3 >
							    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
							    			修改密码
							    		</h3>
							  		</div>
								 </div>
								 <br />
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
							  			<h4>请设置新密码</h4>
							  		</div>
								 </div>
								 <br />
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
									      <input type="password" class="form-control input-lg" id="mm01" name="newpassword" placeholder="请设置新密码" onblur="yz01()">
									      <span id="success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"style="padding-right: 15px;color: green; display: none;"></span>
									      <span id="error01" class="glyphicon glyphicon-remove  form-control-feedback" aria-hidden="true"style="padding-right: 30px;color: red; padding-top: 7px; display: none;"></span>
							  		</div>
								 </div>
								 <!--
                                 	作者：1148969471@qq.com
                                 	时间：2022-02-04
                                 	描述：错误提示
                                 -->
								 <div class="row" id="error03" style="display: none;">
							  		<div id="nr01" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
							  		
							  		</div>
								 </div>
								 <br />
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
									      <input type="password" class="form-control input-lg" id="mm02" name="code02" placeholder="请再次输入新密码" onblur="yz02()">
									      <span id="success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"style="padding-right: 15px;color: green; display: none;"></span>
									      <span id="error02" class="glyphicon glyphicon-remove  form-control-feedback" aria-hidden="true"style="padding-right: 30px;color: red; padding-top: 7px; display: none;"></span>
							  		</div>
								 </div>
								 <!--
                                 	作者：1148969471@qq.com
                                 	时间：2022-02-04
                                 	描述：错误提示
                                 -->
								 <div class="row" id="error04" style="display: none;">
							  		<div id="nr02" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
							  		
							  		</div>
								 </div>
								 <br />
								 <div class="row">
								 	<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
								 		<footer style="color: #888888;" >
								 			<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
								 			密码由6-16位数字，字母或符号组成
								 		</footer>
								 		<footer style="color: #888888;" >
								 			<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
								 			至少含2种以上字符
								 		</footer>
							  		</div>
								 </div>
								 <br />
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
							  			<button type="submit" class="btn btn-primary btn-lg btn-block">确定</button>
							  		</div>
								 </div>
								 </form>
								 <br />
								 <br />
							  </div>
							</div>
					  	</div>
						 
					  </div>
					  <br />
					<br />
					</div>
				</div>
			</div>
			<!--
            	作者：1148969471@qq.com
            	时间：2022-02-04
            	描述：手机端显示
            -->
            <div class="row visible-xs-block">
            	<div class="panel panel-default">
				  <div class="panel-body">
				  	<form method="post" onsubmit="return phoneyz()" action="../index.html">
				  	  	<div class="row" >
					  		<div class=" col-xs-8  col-xs-push-1">
					  			<h3 >
					    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
					    			修改密码
					    		</h3>
					  		</div>
						 </div>
						 <br />
						 <div class="row">
					  		<div class="col-xs-10  col-xs-push-1" >
					  			<h4>请设置新密码</h4>
					  		</div>
						 </div>
						
						 <div class="row">
					  		<div class=" col-xs-10  col-xs-push-1" >
					  			<input type="password" class="form-control input-lg" id="phone-mm01" name="code01" placeholder="请设置新密码" onblur="phoneyz01()">
						        <span id="phone-success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"style="padding-right: 15px;color: green; display: none;"></span>
						        <span id="phone-error01" class="glyphicon glyphicon-remove  form-control-feedback" aria-hidden="true"style="padding-right: 30px;color: red; padding-top: 7px; display: none;"></span>
					  		</div>
						 </div>
						  <!--
                         	作者：1148969471@qq.com
                         	时间：2022-02-04
                         	描述：错误提示
                         -->
						 <div class="row" id="phone-error03" style="display: none;">
					  		<div id="phone-nr01" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
					  		
					  		</div>
						 </div>
						 <br />
						 <div class="row">
					  		<div class=" col-xs-10  col-xs-push-1" >
					  			<input type="password" class="form-control input-lg" id="phone-mm02" name="code02" placeholder="请再次输入新密码" onblur="phoneyz02()">
							      <span id="phone-success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"style="padding-right: 15px;color: green; display: none;"></span>
							      <span id="phone-error02" class="glyphicon glyphicon-remove  form-control-feedback" aria-hidden="true"style="padding-right: 30px;color: red; padding-top: 7px; display: none;"></span>
					  		</div>
						 </div>
						  <!--
                         	作者：1148969471@qq.com
                         	时间：2022-02-04
                         	描述：错误提示
                         -->
						 <div class="row" id="phone-error04" style="display: none;">
					  		<div id="phone-nr02" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
					  		
					  		</div>
						 </div>
						 <br />
						 <div class="row">
						 	<div class=" col-xs-10  col-xs-push-1" >
						 		<footer style="color: #888888;" >
						 			<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
						 			密码由6-16位数字，字母或符号组成
						 		</footer>
						 		<footer style="color: #888888;" >
						 			<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
						 			至少含2种以上字符
						 		</footer>
					  		</div>
						 </div>
						 <br />
						 <div class="row">
					  		<div class=" col-xs-10  col-xs-push-1" >
					  			<button type="submit" class="btn btn-primary btn-lg btn-block">确定</button>
					  		</div>
						 </div>
						 </form>
						 <br />
						 <br />
						 
				  </div>
				</div>
            </div>
		</div>
		
	</body>
</html>
