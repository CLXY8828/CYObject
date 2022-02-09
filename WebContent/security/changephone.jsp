<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>其他验证的更换手机号码</title>
	<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
			//手机号验证未通过之前按钮禁止点击
			$(document).ready(function()
			{
				document.getElementById("lg-get").disabled=true;
				document.getElementById("xs-get").disabled=true;
			});
			$(function(){  
		        /*点击改变按钮状态，已经简略掉ajax发送短信验证的代码*/  
		        $('#lg-get').click(function()
		        {
		        	var sjh=$("#sjh").val();
		        	var url ="<%=request.getContextPath()%>/users/security.do?method=changepasswordphone";	
		        	$.post(url,{userphone:"${user.phone}"},function(data){ 
		        		var btn = $('#lg-get');  
			            var count = 60;  
			            var resend = setInterval(function(){  
			                count--;  
			                if (count > 0){  
			                    btn.val(count+"秒后可重新获取");  
			                }else {  
			                    clearInterval(resend);  
			                    btn.val("获取验证码").removeAttr('disabled style');
			                }  
			            }, 1000);
			            btn.attr('disabled',true).css('cursor','not-allowed'); 
		        	})
		             
		        });  
		        
		        $('#xs-get').click(function()
		        {
		        	var sjh=$("#phone-sjh").val();
		        	var url ="<%=request.getContextPath()%>/users/security.do?method=changepasswordphone";	
		        	$.post(url,{userphone:"${user.phone}"},function(data){ 
		        		var btn = $('#xs-get');  
			            var count = 60;  
			            var resend = setInterval(function(){  
			                count--;  
			                if (count > 0){  
			                    btn.val(count+"秒");  
			                }else {  
			                    clearInterval(resend);  
			                    btn.val("获取验证码").removeAttr('disabled style');  
			                }  
			            }, 1000);  
			            btn.attr('disabled',true).css('cursor','not-allowed');  
		        	})
		            
		        });  
		   		 
		    });
		    
		    //电脑端表单验证
		    function yz()
		    {
		    	var sjh=$("#sjh").val();
		    	var yzm=$("#yzm").val();
		    	var regexp=new RegExp("^1[58379]\\d{9}$");
		    	if((!yzm.trim()) && (!sjh.trim()))
		    	{
		    		$("#nr01").html("手机号不能为空，请输入手机号");
		    		$("#error01").show();
		    		$("#error").show();
		    		$("#success").hide();
		    		$("#nr02").html("验证码不能为空，请输入验证码");
		    		$("#error02").show();
		    		return false;
		    	}
		    	else
		    	{
		    		if(!regexp.test(sjh))
		    		{
		    			$("#nr01").html("手机号不正确，请重新输入");
		    			$("#error").show();
		    			$("#success").hide();
		    			$("#error01").show();
		    			return false;
		    		}
		    		else
		    		{
		    			var url="<%=request.getContextPath()%>/users/security.do?method=formphone";
						$.post(url,{code:yzm,phone:sjh},function(data){
							if (data=="no") {
								$("#nr02").html("验证码输入有误");
					    		$("#error02").show();
					    		return;
							}
							window.location.href=encodeURI("<%=request.getContextPath()%>/users/index.do?method=query");
						});
						return false;
		    		}
		    		
		    	}
		    }
		    
		    function yz01()
		    {
		    	var sjh=$("#sjh").val();
		    	var regexp=new RegExp("^1[58379]\\d{9}$");
		    	if(!sjh.trim())
		    	{
		    		$("#nr01").html("手机号不能为空，请输入手机号");
		    		$("#error").show();
		    		$("#success").hide();
		    		$("#error01").show();
		    	}
		    	else
		    	{
		    		if(!regexp.test(sjh))
		    		{
		    			$("#nr01").html("手机号不正确，请重新输入");
		    			$("#error").show();
		    			$("#success").hide();
		    			$("#error01").show();
		    			return false;
		    		}
		    		else
		    		{
		    			var url="<%=request.getContextPath()%>/users/security.do?method=phoneok";
						$.post(url,{phone:sjh},function(data){
							if (data=="no") {
								$("#nr01").html("手机号重复或已被使用，请查证您的手机号");
				    			$("#error").show();
				    			$("#success").hide();
				    			$("#error01").show();
					    		return;
							}
							else{
								document.getElementById("lg-get").disabled=false;
				    			$("#error01").hide();
				    			$("#success").show();
				    			$("#error").hide();
							}
						});
						return false;
		    			
		    		}
		    		
		    	}
		    }
		    
		    //手机端表单验证
		    function phoneyz()
		    {
		    	var sjh=$("#phone-sjh").val();
		    	var yzm=$("#phone-yzm").val();
		    	var regexp=new RegExp("^1[58379]\\d{9}$");
		    	if((!yzm.trim()) && (!sjh.trim()))
		    	{
		    		$("#phone-nr01").html("手机号不能为空，请输入手机号");
		    		$("#phone-error01").show();
		    		$("#phone-error").show();
		    		$("#phone-success").hide();
		    		$("#phone-nr02").html("验证码不能为空，请输入验证码");
		    		$("#phone-error02").show();
		    		return false;
		    	}
		    	else
		    	{
		    		if(!regexp.test(sjh))
		    		{
		    			$("#phone-nr01").html("手机号不正确，请重新输入");
		    			$("#phone-error").show();
		    			$("#phone-success").hide();
		    			$("#phone-error01").show();
		    			return false;
		    		}
		    		else
		    		{
		    			var url="<%=request.getContextPath()%>/users/security.do?method=formphone";
						$.post(url,{code:yzm,phone:sjh},function(data){
							if (data=="no") {
								$("#phone-nr02").html("验证码输入有误");
					    		$("#phone-error02").show();
					    		
					    		return;
							}
							window.location.href=encodeURI("<%=request.getContextPath()%>/users/index.do?method=query");
						});
						return false;
		    		}
		    		
		    	}
		    }
		    
		    function phoneyz01()
		    {
		    	var sjh=$("#phone-sjh").val();
		    	var regexp=new RegExp("^1[58379]\\d{9}$");
		    	if(!sjh.trim())
		    	{
		    		$("#phone-nr01").html("手机号不能为空，请输入手机号");
		    		$("#phone-error").show();
		    		$("#phone-success").hide();
		    		$("#phone-error01").show();
		    	}
		    	else
		    	{
		    		if(!regexp.test(sjh))
		    		{
		    			$("#phone-nr01").html("手机号不正确，请重新输入");
		    			$("#phone-error").show();
		    			$("#phone-success").hide();
		    			$("#phone-error01").show();
		    			return false;
		    		}
		    		else
		    		{
		    			var url="<%=request.getContextPath()%>/users/security.do?method=phoneok";
						$.post(url,{phone:sjh},function(data){
							if (data=="no") {
								$("#phone-nr01").html("手机号重复或已被使用，请查证您的手机号");
				    			$("#phone-error").show();
				    			$("#phone-success").hide();
				    			$("#phone-error01").show();
					    		return;
							}
							else{
								document.getElementById("xs-get").disabled=false;
				    			$("#phone-error01").hide();
				    			$("#phone-success").show();
				    			$("#phone-error").hide();
							}
						});
						return false;
		    			
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
	        <img id="loge" class="img-responsive" alt="Responsive image" src="../img/001.png">
	      </a>
	      <p class="navbar-text"><strong>高校就业平台</strong></p>
	    </div>
	     <div class="collapse navbar-collapse " id="top-text">
	     	 <ul class="nav visible-lg-block navbar-nav navbar-right">
		        <li id="address"><a href="<%= request.getContextPath() %>/users/security.do?method=changephonepage">点击返回上一页</a></li>
		        
		        
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     	 <ul class="nav visible-xs-block navbar-nav">
		        <li><a href="<%= request.getContextPath() %>/users/security.do?method=changephonepage"style="color: white;">点击返回上一页</a>	</li>
	            
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
							  	<form onsubmit="return yz()" >
							   	<div class="row" >
							  		<div class="col-lg-6 col-xs-8 col-lg-push-2 col-xs-push-1">
							  			<h3 >
							    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
							    			更换手机号码
							    		</h3>
							  		</div>
								 </div>
								 <br />
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
							  			<p style="color: #888888;">请填写新的手机号码，并进行短信验证</p>
							  		</div>
								 </div>
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
							  			<div class="input-group input-group-lg">
						  				 	<span class="input-group-addon" id="sizing-addon1">+86</span>
									    	<input type="text" class="form-control input-lg" id="sjh" name="code" placeholder="请输入手机号" onkeyup="yz01()">
							  			</div>
							  			<span id="success" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"style="padding-right: 15px;color: green; display: none;"></span>
									      <span id="error" class="glyphicon glyphicon-remove  form-control-feedback" aria-hidden="true"style="padding-right: 30px;color: red; padding-top: 7px; display: none;"></span>
							  		</div>
								 </div>
								 <!--
                                 	作者：1148969471@qq.com
                                 	时间：2022-02-04
                                 	描述：错误提示
                                 -->
								 <div class="row" id="error01" style="display: none; ">
							  		<div id="nr01" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
							  		
							  		</div>
								 </div>
								 <br />
								 <div class="row">
							  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" >
							  			<div class="input-group">
										      <input type="text" class="form-control input-lg" id="yzm" name="code" placeholder="请输入验证码">
										      <span class="input-group-btn">
										         <input type="button"  class="btn btn-default input-lg"id="lg-get" value="获取验证码" style="color: #269ABC">
										      </span>
								    	</div>
							  		</div>
								 </div>
								 <!--
                                 	作者：1148969471@qq.com
                                 	时间：2022-02-04
                                 	描述：错误提示
                                 -->
								 <div class="row" id="error02" style="display: none;">
							  		<div id="nr02" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
							  		
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
				  	<form onsubmit="return phoneyz()"  action="../index.html">
				  	  	<div class="row" >
					  		<div class=" col-xs-8  col-xs-push-1">
					  			<h3 >
					    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
					    			更换手机号码
					    		</h3>
					  		</div>
						 </div>
						 <br />
						 <div class="row">
					  		<div class="col-xs-10  col-xs-push-1" >
					  			<p style="color: #888888;">请填写新的手机号码，并进行短信验证</p>
					  		</div>
						 </div>
						 <div class="row">
					  		<div class="col-xs-10 col-lg-push-2 col-xs-push-1" >
					  			<div class="input-group input-group-lg">
				  				 	<span class="input-group-addon" id="sizing-addon1">+86</span>
							    	<input type="text" class="form-control input-lg" id="phone-sjh" name="code" placeholder="请输入手机号" onkeyup="phoneyz01()">
					  				<span id="phone-success" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"style="padding-right: 15px;color: green; display: none;"></span>
									<span id="phone-error" class="glyphicon glyphicon-remove  form-control-feedback" aria-hidden="true"style="padding-right: 30px;color: red; padding-top: 7px; display: none;"></span>
					  			</div>
					  		</div>
						 </div>
						 <!--
                         	作者：1148969471@qq.com
                         	时间：2022-02-04
                         	描述：错误提示
                         -->
						 <div class="row" id="phone-error01" style="display: none; ">
					  		<div id="phone-nr01" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
					  		
					  		</div>
						 </div>
						 <br />
						 <div class="row">
					  		<div class=" col-xs-10  col-xs-push-1" >
					  			<div class="input-group">
								      <input type="text" class="form-control input-lg" id="phone-yzm" name="code" placeholder="请输入验证码">
								      <span class="input-group-btn">
								         <input type="button"  class="btn btn-default input-lg"id="xs-get" value="获取验证码" style="color: #269ABC">
								      </span>
						    	</div>
					  		</div>
						 </div>
						 <!--
                         	作者：1148969471@qq.com
                         	时间：2022-02-04
                         	描述：错误提示
                         -->
						 <div class="row" id="phone-error02" style="display:none ;">
					  		<div id="phone-nr02" class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="font-size: 10px; color: red; ">
					  		
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
