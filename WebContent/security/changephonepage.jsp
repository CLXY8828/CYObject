<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改手机号</title>
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
	        <img id="loge" class="img-responsive" alt="Responsive image" src="<%=request.getContextPath() %>/img/001.png">
	      </a>
	      <p class="navbar-text"><strong>高校就业平台</strong></p>
	    </div>
	     <div class="collapse navbar-collapse " id="top-text">
	     	 <ul class="nav visible-lg-block navbar-nav navbar-right">
		        <li id="address"><a href="<%=request.getContextPath() %>/users/index.do?method=securitypage">点击返回上一页</a></li>
		        
		        
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     	 <ul class="nav visible-xs-block navbar-nav">
		        <li><a href="<%=request.getContextPath() %>/users/index.do?method=securitypage"style="color: white;">点击返回上一页</a>	</li>
	            
		      </ul>
		      
	    </div>
	    
	  </div>
	</nav>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 col-xs-12 col-lg-offset-3">
					<div class="panel panel-default">
					  <div class="panel-body">
					  	<div class="row">
					  		<div class="col-lg-4 col-xs-8 col-lg-push-2 col-xs-push-1">
					  			<h3 >
					    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
					    			身份验证
					    		</h3>
					  		</div>
						 </div>
						 <div class="row">
					  		<div class="col-lg-8 col-xs-11 col-lg-push-2 col-xs-push-1" style="padding-left: 40px;">
					  			<footer style="color: #888888;" >为保护帐号安全，只有当你提供的资料足够真实完整，才能通过身份验证。</footer>
					  		</div>
						 </div>
						 <br />
						 <br />
						 <div class="row">
						 	<a href="<%=request.getContextPath()%>/users/security.do?method=changephoneOK"">
					  		<div class="col-lg-8 col-xs-12 col-lg-push-2 " >
					  			<div class="panel panel-default">
								  <div class="panel-body">
								  	<div class="col-lg-3 col-xs-3" style="padding-top: 9px;">
								  		<img src="<%=request.getContextPath() %>/img/211.png" alt="..." class="img-rounded" style=" width: 30px;">
								  	</div>
								  	<div class="col-lg-9 col-xs-9 col-lg-pull-1" style="padding-left: 0px;">
								  		<p><h4 style="color: black;">手机号验证</h4></p>
									  	<footer style="color: #888888;" >通过${fn:substring(user.phone, 0, 3)}***${fn:substring(user.phone, 7, -1)}接收短信验证码</footer>
								  	</div>
								  </div>
								</div>
					  		</div>
						 	</a>
						 </div>
						 <br />
						 <div class="row">
						 	<a href="<%=request.getContextPath()%>/users/security.do?method=changephoneemailpage">
					  		<div class="col-lg-8 col-xs-12 col-lg-push-2 " >
					  			<div class="panel panel-default">
								  <div class="panel-body">
								  	<div class="col-lg-3 col-xs-3" style="padding-top: 9px;">
								  		<img src="<%=request.getContextPath() %>/img/211.png" alt="..." class="img-rounded" style=" width: 30px;">
								  	</div>
								  	<div class="col-lg-9 col-xs-9 col-lg-pull-1" style="padding-left: 0px;">
								  		<p><h4 style="color: black;">其他身份验证</h4></p>
									  	<footer style="color: #888888;" >通过${fn:substring(ws.email, 0, 3)}***@${fn:substringAfter(ws.email, "@")}验证</footer>
								  	</div>
								  </div>
								</div>
					  		</div>
						 	</a>
						 </div>
						 <br />
						 <br />
					  </div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
