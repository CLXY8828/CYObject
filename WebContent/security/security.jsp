<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>账号安全</title>
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
				padding-top: 80px;
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
		        <li id="address"><a href="<%=request.getContextPath()%>/users/index.do?method=query">点击返回上一页</a></li>
		        
		        
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     	 <ul class="nav visible-xs-block navbar-nav">
		        <li><a href="<%=request.getContextPath()%>/users/index.do?method=query"style="color: white;">点击返回上一页</a>	</li>
	            
		      </ul>
		      
	    </div>
	    
	  </div>
	</nav>
	
	<body>
		
		<div class="container-fluid">
		  <div class="row">
		  	<div class="col-lg-8 col-xs-12 col-lg-offset-2">
		  	<div class="panel panel-default">
			  <div class="panel-body">
			  	<div class="row">
			  		<div class="col-lg-2 col-xs-3  " style="padding-top: 10px;">
			   			<img src="<%=request.getContextPath() %>/img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
				   	</div>
					<div class=" col-lg-6 col-xs-5 col-lg-pull-1  ">
						<h2>${user.name}</h2>
					</div>
			  	</div>
			  	<div class="row">
			  		<div class="col-lg-4 col-xs-12 col-lg-push-1 col-xs-push-3">
			  			<h4>手机号：${fn:substring(user.phone, 0, 3)}***${fn:substring(user.phone, 7, -1)}</h4>
			  		</div>
			  	</div>
			  	<hr style="border: 100 solid #000000; background-color: #000000;"/>
			  	<div class="row">
			  		<div class="col-lg-4 col-xs-12 col-lg-offset-1">
			  			<div class="panel panel-default">
						  <div class="panel-body">
						  	<div class="row">
						  		<div class="col-lg-6 col-xs-6 col-lg-push-4 col-xs-push-4">
						  			<img src="<%=request.getContextPath() %>/img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
						  		</div>
						  	</div>
						  	<div class="row">
						  		<div class="col-lg-6 col-xs-6 col-lg-push-2 col-xs-push-2">
						  			<h4>你好！${user.name}</h4>
						  		</div>
						  	</div>
						  	<div class="row">
						  		<div class="col-lg-6 col-xs-6 col-lg-push-3 col-xs-push-3">
						  			<h4>学号：${user.sid}</h4>
						  		</div>
						  	</div>
						    
						  </div>
						</div>
			  		</div>
			  		<div class="col-lg-6 col-xs-12 col-lg-push-1">
			  			<!--
                          	作者：1148969471@qq.com
                          	时间：2022-02-04
                          	描述：修改密码
                          -->
			  			<div class="row visible-lg-block" >
			  				<a href="<%=request.getContextPath()%>/users/security.do?method=changepasswordpage">
			  				<div class="panel panel-default">
							  <div class="panel-body">
							    <div class="col-lg-2 visible-lg-block" style="padding-top: 5px;">
							    	<img src="<%=request.getContextPath() %>/img/112.png" alt="..." class="img-rounded" style=" width: 50px;">
							    </div>
							    <div class="col-lg-6 col-xs-4">
									  <p><h4 style="color: black;">修改密码</h4></p>
									  <footer style="color: #888888;" >重置学号登录密码</footer>
							    </div>
							    <div class="col-lg-4 col-xs-6" >
							    	<div class="col-lg-9 col-xs-9" style="padding-top: 16px;">
							    		<h4>去重置</h4>
							    	</div>
							    	<div class="col-lg-3 col-xs-3" style="padding-left: 0px;">
							    		<h2><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></h2>
							    	</div>
							    </div>
							  </div>
							</div>
			  				</a>
			  			</div>
			  			<!--
                          	作者：1148969471@qq.com
                          	时间：2022-02-04
                          	描述：手机端的修改密码
                          -->
                          <div class="row visible-xs-block">
                          	<a href="<%=request.getContextPath()%>/users/security.do?method=changepasswordpage">
                          		<div class="panel panel-default">
								  <div class="panel-body">
								    <div class="col-xs-2" style="padding-left: 0px; padding-top: 5px;">
								    	<img src="<%=request.getContextPath() %>/img/112.png" alt="..." class="img-rounded" style=" width: 50px;">
								    </div>
								    <div class="col-xs-5">
								    	<p>修改密码</p>
								    	<footer style="color: #888888;" >重置学号登录密码</footer>
								    </div>
								    <div class="col-xs-5">
								    	<div class="col-lg-9 col-xs-9" style="padding-top: 18px;">
								    		<h5>去重置</h5>
								    	</div>
								    	<div class="col-lg-3 col-xs-3" style="padding-left: 0px;">
								    		<h2><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></h2>
								    	</div>
								    </div>
								  </div>
								</div>
                          	</a>
                          </div>
			  			<!--
                          	作者：1148969471@qq.com
                          	时间：2022-02-04
                          	描述：修改手机号
                          -->
                          <div class="row visible-lg-block" >
                          	<a href="<%=request.getContextPath()%>/users/security.do?method=changephonepage">
			  				<div class="panel panel-default">
							  <div class="panel-body">
							    <div class="col-lg-2 " style="padding-top: 8px;">
							    	<img src="<%=request.getContextPath() %>/img/113.png" alt="..." class="img-rounded" style=" width: 50px;">
							    </div>
							    
							    <div class="col-lg-6 ">
									  <p><h4 style="color: black;">修改手机号</h4></p>
									  <footer style="color: #888888;" >已设定手机号：${fn:substring(user.phone, 0, 3)}***${fn:substring(user.phone, 7, -1)}</footer>
							    </div>
							    <div class="col-lg-4 " >
							    	<div class="col-lg-9 col-xs-9" style="padding-top: 16px;">
							    		<h4>去更换</h4>
							    	</div>
							    	<div class="col-lg-3 col-xs-3" style="padding-left: 0px;">
							    		<h2><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></h2>
							    	</div>
							    </div>
							  </div>
							</div>
			  				</a>
                          </div>
                          <!--
                          	作者：1148969471@qq.com
                          	时间：2022-02-04
                          	描述：手机端的修改手机号
                          -->
                          <div class="row visible-xs-block">
                          	<a href="<%=request.getContextPath()%>/users/security.do?method=changephonepage">
                          		<div class="panel panel-default">
								  <div class="panel-body">
								    <div class="col-xs-2" style="padding-left: 0px; padding-top: 8px;">
								    	<img src="<%=request.getContextPath() %>/img/113.png" alt="..." class="img-rounded" style=" width: 50px;">
								    </div>
								    <div class="col-xs-5">
								    	<p>修改手机号</p>
								    	<footer style="color: #888888;" >已设定手机号：138....9999</footer>
								    </div>
								    <div class="col-xs-5">
								    	<div class="col-lg-9 col-xs-9" style="padding-top: 18px;">
								    		<h5>去更换</h5>
								    	</div>
								    	<div class="col-lg-3 col-xs-3" style="padding-left: 0px;">
								    		<h2><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></h2>
								    	</div>
								    </div>
								  </div>
								</div>
                          	</a>
                          </div>
                          <!--
                          	作者：1148969471@qq.com
                          	时间：2022-02-04
                          	描述：修改信息
                          -->
                          <div class="row visible-lg-block" >
                          	<a href="<%= request.getContextPath() %>/users/perfect.do?method=perfectsavepage">
			  				<div class="panel panel-default">
							  <div class="panel-body">
							    <div class="col-lg-2 " style="padding-top: 8px;">
							    	<img src="<%=request.getContextPath() %>/img/114.png" alt="..." class="img-rounded" style=" width: 50px;">
							    </div>
							    
							    <div class="col-lg-6 ">
									  <p><h4 style="color: black;">修改信息</h4></p>
									  <footer style="color: #888888; " >修改个人信息</footer>
							    </div>
							    <div class="col-lg-4 " >
							    	<div class="col-lg-9 col-xs-9" style="padding-top: 16px;">
							    		<h4>去修改</h4>
							    	</div>
							    	<div class="col-lg-3 col-xs-3" style="padding-left: 0px;">
							    		<h2><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></h2>
							    	</div>
							    </div>
							  </div>
							</div>
			  				</a>
                          </div>
                          <!--
                          	作者：1148969471@qq.com
                          	时间：2022-02-04
                          	描述：手机端的修改信息
                          -->
                          <div class="row visible-xs-block">
                          	<a href="xgxx.html">
                          		<div class="panel panel-default">
								  <div class="panel-body">
								    <div class="col-xs-2" style="padding-left: 0px; padding-top: 8px;">
								    	<img src="<%=request.getContextPath() %>/img/114.png" alt="..." class="img-rounded" style=" width: 50px;">
								    </div>
								    <div class="col-xs-5">
								    	<p>修改信息</p>
								    	<footer style="color: #888888;" >修改个人信息</footer>
								    </div>
								    <div class="col-xs-5">
								    	<div class="col-lg-9 col-xs-9" style="padding-top: 18px;">
								    		<h5>去修改</h5>
								    	</div>
								    	<div class="col-lg-3 col-xs-3" style="padding-left: 0px;">
								    		<h2><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></h2>
								    	</div>
								    </div>
								  </div>
								</div>
                          	</a>
                          </div>
                          <!--
                          	作者：1148969471@qq.com
                          	时间：2022-02-04
                          	描述：上传头像
                          
                          <div class="row visible-lg-block" >
                          	<a href="sctx.html">
			  				<div class="panel panel-default">
							  <div class="panel-body">
							    <div class="col-lg-2 " style="padding-top: 8px;">
							    	<img src="../img/115.png" alt="..." class="img-rounded" style=" width: 50px;">
							    </div>
							    
							    <div class="col-lg-6 ">
									  <p><h4 style="color: black;">上传头像</h4></p>
									  <footer style="color: #888888; " >设定自己的头像</footer>
							    </div>
							    <div class="col-lg-4 " >
							    	<div class="col-lg-9 col-xs-9" style="padding-top: 16px;">
							    		<h4>去上传</h4>
							    	</div>
							    	<div class="col-lg-3 col-xs-3" style="padding-left: 0px;">
							    		<h2><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></h2>
							    	</div>
							    </div>
							  </div>
							</div>
			  				</a>
                          </div>
                          -->
                          <!--
                          	作者：1148969471@qq.com
                          	时间：2022-02-04
                          	描述：手机端的修改信息
                          <div class="row visible-xs-block">
                          	<a href="sctx.html">
                          		<div class="panel panel-default">
								  <div class="panel-body">
								    <div class="col-xs-2" style="padding-left: 0px; padding-top: 8px;">
								    	<img src="../img/115.png" alt="..." class="img-rounded" style=" width: 50px;">
								    </div>
								    <div class="col-xs-5">
								    	<p>上传头像</p>
								    	<footer style="color: #888888;" >上传自己的头像</footer>
								    </div>
								    <div class="col-xs-5">
								    	<div class="col-lg-9 col-xs-9" style="padding-top: 18px;">
								    		<h5>去上传</h5>
								    	</div>
								    	<div class="col-lg-3 col-xs-3" style="padding-left: 0px;">
								    		<h2><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></h2>
								    	</div>
								    </div>
								  </div>
								</div>
                          	</a>
                          </div>
                          -->
			  		</div>
			  	</div>
			  </div>
			</div>
			</div>
		  </div>
		</div>
		
		
	</body>
</html>
