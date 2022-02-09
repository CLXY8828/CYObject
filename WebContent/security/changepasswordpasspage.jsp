<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>密码验证</title>
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
		    	
		    	var yzm=$("#yzm").val();
		    	if(!yzm.trim())
		    	{
		    		$("#nr").html("密码不能为空，请输入密码");
		    		$("#error").show();
		    		$("#error01").show();
					$("#success01").hide();
		    		return false;
		    	}
		    	else
		    	{
		    		var url="<%=request.getContextPath()%>/users/security.do?method=formpass";
					$.post(url,{password:yzm},function(data){
						if (data=="no") {
				    		$("#nr").html("密码输入有误！");
				    		$("#error").show();
				    		return;
						}
						window.location.href=encodeURI("<%=request.getContextPath()%>/users/security.do?method=changepassword");
					});
					return false;
		    	}
		    }
		    
		    //手机端表单验证
		    function phoneyz()
		    {
		    	var yzm=$("#phone-yzm").val();
		    	if(!yzm.trim())
		    	{
		    		$("#phone-nr").html("密码不能为空，请输入密码");
		    		$("#phone-error").show();
		    		$("#error02").show();
					$("#success02").hide();
		    		return false;
		    	}
		    	else
		    	{
		    		var url="<%=request.getContextPath()%>/users/security.do?method=formpass";
					$.post(url,{password:yzm},function(data){
						if (data=="no") {
				    		$("#phone-nr").html("密码输入有误！");
				    		$("#phone-error").show();
				    		return;
						}
						window.location.href=encodeURI("<%=request.getContextPath()%>/users/security.do?method=changepassword");
					});
					return false;
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
	        <img id="loge" class="img-responsive" alt="Responsive image" src="../img/001.png">
	      </a>
	      <p class="navbar-text"><strong>高校就业平台</strong></p>
	    </div>
	     <div class="collapse navbar-collapse " id="top-text">
	     	 <ul class="nav visible-lg-block navbar-nav navbar-right">
		        <li id="address"><a href="<%=request.getContextPath()%>/users/security.do?method=changepasswordpage">点击返回上一页</a></li>
		        
		        
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     	 <ul class="nav visible-xs-block navbar-nav">
		        <li><a href="<%=request.getContextPath()%>/users/security.do?method=changepasswordpage" style="color: white;">点击返回上一页</a>	</li>
	            
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
							  	<form onsubmit="return yz()" method="post" action="<%=request.getContextPath()%>/users/security.do?method=changepassword">
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
							  			<h4>密码验证</h4>
							  		</div>
								 </div>
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
							  			<p style="color: #888888;">请输入原密码</p>
							  		</div>
								 </div>
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
									      <input type="password" class="form-control input-lg" id="yzm" name="code" placeholder="请输入原密码">
									      <span id="success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"style="padding-right: 15px;color: green; display: none;"></span>
									      <span id="error01" class="glyphicon glyphicon-remove  form-control-feedback" aria-hidden="true"style="padding-right: 30px;color: red; padding-top: 7px; display: none;"></span>
							  		</div>
								 </div>
								 <!--
                                 	作者：1148969471@qq.com
                                 	时间：2022-02-04
                                 	描述：错误提示
                                 -->
								 <div class="row" id="error" style="display: none;">
							  		<div id="nr" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
							  		
							  		</div>
								 </div>
								 <br />
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
							  			<button type="submit" class="btn btn-primary btn-lg btn-block">下一步</button>
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
				  	<form onsubmit="return phoneyz()" method="post" action="<%=request.getContextPath()%>/users/security.do?method=changepassword">
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
					  			<h4>密码验证</h4>
					  		</div>
						 </div>
						 <div class="row">
					  		<div class=" col-xs-10  col-xs-push-1" >
					  			<p>请输入原密码</p>
					  		</div>
						 </div>
						 <div class="row">
					  		<div class=" col-xs-10  col-xs-push-1" >
							      <input type="text" class="form-control input-lg" id="phone-yzm" name="code" placeholder="请输入原密码">
							      <span id="success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"style="padding-right: 15px;color: green; display: none;"></span>
							      <span id="error02" class="glyphicon glyphicon-remove  form-control-feedback" aria-hidden="true"style="padding-right: 30px;color: red; padding-top: 7px; display: none;"></span>
					  		</div>
						 </div>
						 <!--
                         	作者：1148969471@qq.com
                         	时间：2022-02-04
                         	描述：错误提示
                         -->
						 <div class="row" id="phone-error" style="display:none ;">
					  		<div id="phone-nr" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
					  		
					  		</div>
						 </div>
						 <br />
						 <div class="row">
					  		<div class=" col-xs-10  col-xs-push-1" >
					  			<button type="submit" class="btn btn-primary btn-lg btn-block">下一步</button>
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
