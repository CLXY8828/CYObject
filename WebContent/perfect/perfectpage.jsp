<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人信息</title>
		<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<script src="../bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="../js/grxx.js"></script>
		
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
			
			.label-default{
				background-color: white;
				color: #000000;
				font-size: 18px;
				font-weight: 300;
			}
			.label-default01{
				background-color: white;
				color: #000000;
				font-size: 14px;
				font-weight: 300;
			}
			.color-zb{
				color: black;
			}
			
		</style>
		
		<script type="text/javascript">
		
			function formjb() {
				var url="<%= request.getContextPath() %>/users/perfect.do?method=formjb"//提交的地址  
			 		$.post(url,$('#fm-jb').serialize(),function(data)
						{
			 				if(data=='yes'){
			 					$('#gsxx02').tab('show');
			 					return;
			 				}
			 				else if(data='no'){
			 					$("#error05").html("学号与身份证号不匹配！");
			 					$("#error05").show();
			 					$("#jbxx-error05").show();
			 					$("#jbxx-success05").hide();
			 					return;
			 				}
			 				window.location.href=encodeURI("<%=request.getContextPath()%>/users/index.do?method=query");
						});
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
		        <li id="address"><a href="../zym.html">点击返回上一页</a></li>
		        
		      </ul>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     	 <ul class="nav visible-xs-block navbar-nav" style="color: white;">
		        <li><a href="#home01" aria-controls="home" role="tab" data-toggle="tab">基本信息</a></li>
		        <li><a href="#home02" aria-controls="home" role="tab" data-toggle="tab">公司信息</a></li>
		        <li><a href="#home03" aria-controls="home" role="tab" data-toggle="tab">工作经验</a></li>
		        <li><a href="#home04" aria-controls="home" role="tab" data-toggle="tab">在校情况</a></li>
		        <li><a href="#home05" aria-controls="home" role="tab" data-toggle="tab">技能特长</a></li>
		        <li><a href="#home05" aria-controls="home" role="tab" data-toggle="tab">自我评价</a></li>
		      </ul>
		      
	    </div>
	    
	  </div>
	  
	</nav>
	
	<body>
		
		<div class="container-fluid">
		  <div class="row" >
		  	<div class="col-lg-10 col-xs-12 col-lg-offset-1">
		  	<div class="panel panel-default" style="background-color: whitesmoke">
			  <div class="panel-body">
			  	
			  	<!--
                  	作者：1148969471@qq.com
                  	时间：2022-01-30
                  	描述：左边
                  -->
			  	<div class="col-lg-3 visible-lg-block ">
	  				<div class="table-responsive">
					  <table class="table table-bordered table-hover" style=" font-size: 20px; text-align: center; ">
					  	<tr >
					  		<td>
					  			<br />
					  			<h2> 我的个人信息 </h2>
					  			<br />
					  		</td>
					  		
					  	</tr>
					    <tr style="background-color: white;">
					    	<td>
					    		<a href="#home01" class="color-zb" aria-controls="home" role="tab" data-toggle="tab" id="jbxx" >基本信息</a>
					    	</td>
					    </tr>
					    <tr style="background-color: white;">
					    	<td>
					    		<a href="#home02" class="color-zb" aria-controls="home" role="tab" data-toggle="tab" id="gsxx01">公司信息</a>
					    	</td>
					    </tr>
					    <tr style="background-color: white;">
					    	<td>
					    		<a href="#home03" class="color-zb" aria-controls="home" role="tab" data-toggle="tab" id="gzjy">工作经验</a>
					    	</td>
					    </tr>
					    <tr style="background-color: white;">
					    	<td>
					    		<a href="#home04" class="color-zb" aria-controls="home" role="tab" data-toggle="tab" id="zxqk">在校情况</a>
					    	</td>
					    </tr>
					    <tr style="background-color: white;">
					    	<td>
					    		<a href="#home05" class="color-zb" aria-controls="home" role="tab" data-toggle="tab" id="jntc">技能特长</a>
					    	</td>
					    </tr>
					    <tr style="background-color: white;">
					    	<td>
					    		<a href="#home06" class="color-zb" aria-controls="home" role="tab" data-toggle="tab" id="zwpj">自我评价</a>
					    	</td>
					    </tr>
					    <!--
                        	作者：1148969471@qq.com
                        	时间：2022-02-05
                        	描述：这是选择是后展示的公司信息的模块
                        -->
					    <tr class="">
					    	<td>
					    		<a href="#home07" class="color-zb" aria-controls="home" role="tab" data-toggle="tab" id="gsxx02">公司信息</a>
					    	</td>
					    </tr>
					  </table>
			  		</div>
			   		
			   	</div>
			   	
			   	<!--
                   	作者：1148969471@qq.com
                   	时间：2022-01-30
                   	描述：右边
                   -->
			   	<div class="col-lg-9 col-xs-12">
			  	  <div class="tab-content" >
			  	  	<!--
                        	作者：1148969471@qq.com
                        	时间：2022-01-30
                        	描述：基本信息
                        -->
				    <div role="tabpanel" class="tab-pane active" id="home01">
				    	<div class="container-fluid">
				    		<!--
                            	作者：1148969471@qq.com
                            	时间：2022-01-30
                            	描述：完善信息之前展示的是请完善基本信息
                            -->
                            <div class="row " style="padding-top: 15px; background-color: white; height: 120px;" >
						  	<div class="row ">
							   	<div class="col-lg-2 col-xs-2 col-lg-push-1 " style="padding-top: 10px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-10  ">
									<h2>请完善基本信息</h2>
								</div>
								
						   	</div>
						   	
						  </div>
				    		<hr />
						  
						  <div class="row" >
						  	<form  id="fm-jb" onsubmit="return jbxx()" action="#" >
						   		<div class="row" > 
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
										  <div class="input-group  " >
											  <span class="input-group-addon" >姓 名</span>
											  <input type="text" name="name" class="form-control"  id="jbxx01" >
											  <span id="jbxx-success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
											  <span id="jbxx-error01" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
											</div>
											<div id="error01" style="font-size: 13px; color: red; padding-left: 60px;display: none; "></div>
						   			</div>
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
										  <div class="input-group" >
											  <span class="input-group-addon" >性 别</span>
											  <div class="form-control " align="center">
											  	<div class="col-lg-6 col-xs-6">
											  		<label class="radio-inline">
													  <input type="radio" name="sex"  value="男"> 男
													</label>
											  	</div>
											  	<div class="col-lg-6 col-xs-6">
													<label class="radio-inline">
													  <input type="radio" name="sex"  value="女"> 女
													</label>
											  	</div>
											  	<span id="jbxx-success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
											  	<span id="jbxx-error02" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
											  </div>
											</div>
											<div id="error02" style="font-size: 13px; color: red; padding-left: 60px;display: none; "></div>
						   			</div>
						   			
						   		</div>
						   		<div class="row" >
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
									  	<div class="input-group" >
										  <span class="input-group-addon" >Q Q</span>
										  <input type="text" name="qq" class="form-control"  id="jbxx03">
										  <span id="jbxx-success03" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
										  <span id="jbxx-error03" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
										</div>
										<div id="error03" style="font-size: 13px; color: red; padding-left: 60px;display: none; "></div>
						   			</div>
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
									  	<div class="input-group" >
										  <span class="input-group-addon" >邮 箱</span>
										  <input type="email" name="email" class="form-control"  id="jbxx04">
										  <span id="jbxx-success04" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
										  <span id="jbxx-error04" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
										</div>
										<div id="error04" style="font-size: 13px; color: red; padding-left: 60px;display: none; "></div>
						   			</div>
						   		</div>
						   		<div class="row" > 
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
										  <div class="input-group" >
											  <span class="input-group-addon" >学 号</span>
											  <input type="text" name="sid" class="form-control" id="jbxx05">
											  <span id="jbxx-success05" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
										  		<span id="jbxx-error05" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
											</div>
											<div id="error05" style="font-size: 13px; color: red; padding-left: 60px;display: none; "></div>
						   			</div>
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
										  <div class="input-group" >
											  <span class="input-group-addon" >是否就业</span>
											  <div class="form-control " align="center">
											  	<div class="col-lg-6 col-xs-6">
											  		<label class="radio-inline">
													  <input type="radio" name="sfjy"  value="1"> 是
													</label>
											  	</div>
											  	<div class="col-lg-6 col-xs-6">
													<label class="radio-inline">
													  <input type="radio" name="sfjy"  value="0"> 否
													</label>
											  	</div>
											  	<span id="jbxx-success06" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
										  		<span id="jbxx-error06" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
											  </div>
											</div>
											<div id="error06" style="font-size: 13px; color: red; padding-left: 80px;display: none; "></div>
						   			</div>
						   		</div>
						   		<div class="row" >
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
									  	<div class="input-group" >
										  <span class="input-group-addon" >身份证号</span>
										  <input type="text" name="NumbID" class="form-control"  id="jbxx07">
										  <span id="jbxx-success07" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
										  <span id="jbxx-error07" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
										</div>
										<div id="error07" style="font-size: 13px; color: red; padding-left: 80px;display: none; "></div>
						   			</div>
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
									  	<div class="input-group" >
										  <span class="input-group-addon" >电话号码</span>
										  <input type="text" name="phonecode" class="form-control"  id="jbxx08">
										  <span id="jbxx-success08" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
										  <span id="jbxx-error08" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
										</div>
										<div id="error08" style="font-size: 13px; color: red; padding-left: 80px;display: none; "></div>
						   			</div>
						   		</div>
						   		<div class="row" >
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
									  	<div class="input-group" >
										  <span class="input-group-addon" >现居住地</span>
										  <input type="text" name="address" class="form-control"  id="jbxx09">
										  <span id="jbxx-success09" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display: none;"></span>
										  <span id="jbxx-error09" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
										</div>
										<div id="error09" style="font-size: 13px; color: red; padding-left: 80px;display: none; "></div>
						   			</div>
						   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
									  	<div class="input-group" >
										  <span class="input-group-addon" id="sizing-addon2">工作经验</span>
										  	<select class="form-control" name="gzjy" id="jbxx10">
					          					<option value="">请选择</option>
					          					<option value="在校大学生">在校大学生</option>
					          					<option value="应届毕业生">应届毕业生</option>
					          					<option value="实习生">实习生</option>
					          					<option value="1年以内">1年以内</option>
					          					<option value="1-3年">1-3年</option>
					          					<option value="3-5年">3-5年</option>
					          					<option value="5-10年">5-10年</option>
					          					<option value="10年以上">10年以上</option>
					          				</select>
					          				<span id="jbxx-success10" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 30px; display: none;"></span>
										  <span id="jbxx-error10" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 30px; display: none;"></span>
										</div>
										<div id="error10" style="font-size: 13px; color: red; padding-left: 80px;display: none; "></div>
						   			</div>
						   		</div>
						   		<div class="row " >
						   			<div class="col-lg-6 col-xs-6 " style="padding-top: 10px;">
									  	<a class="btn btn-default " href="../zym.html" >取消</a>
						   			</div>
						   			<div class="col-lg-6 col-xs-6  col-lg-push-5 col-xs-push-2" style="padding-top: 10px;">
									  	<button type="button" onclick="formjb()" class="btn btn-primary">提交</button>
						   			</div>
						   		</div>
						   	</form>
						  </div>
				    	</div>
				    </div>
				    <!--
                    	作者：1148969471@qq.com
                    	时间：2022-01-30
                    	描述：公司信息（未就业时展示）
                    -->
				    <div role="tabpanel" class="tab-pane" id="home02">
				    	<div class="container-fluid">
						  <div class="row">
						    <!--
                            	作者：1148969471@qq.com
                            	时间：2022-01-30
                            	描述：完善信息之前展示的是请完善基本信息
                            -->
                            <div class="row" style="padding-top: 15px;background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-2 col-lg-push-1 " style="padding-top: 10px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-10  ">
									<h2>请完善基本信息</h2>
								</div>
								
						   	</div>
						  </div>
						  
						  </div>
						  <hr />
						  <div class="row">
						  	<div class="col-lg-6 visible-lg-block col-lg-push-3" align="center">
						  		<img src="../img/11.jpg" alt="..." class="img-rounded" style="width: 300px; ">
						  	</div>
						  	<div class="col-xs-12 visible-xs-block " >
						  		<img src="../img/11.jpg" alt="..." class="img-rounded" style="width: 250px; ">
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12 col-lg-push-3" align="center">
						  		<h4><small>您还未入职点击返回上一页寻找职位</small></h4>
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12 col-lg-push-3" align="center">
						  		<a class="btn btn-primary " type="submit" href="#home03" aria-controls="home" role="tab" data-toggle="tab" >确 定</a>
						  	</div>
						  </div>
						</div>
				    </div>
				    <!--
                    	作者：1148969471@qq.com
                    	时间：2022-01-30
                    	描述：工作经验
                    -->
				    <div role="tabpanel" class="tab-pane" id="home03">
				    	<div class="container-fluid">
				    		<form onsubmit="return gzjy()" action="#">
				    		<!--
                            	作者：1148969471@qq.com
                            	时间：2022-01-30
                            	描述：完善信息之前展示的是请完善基本信息
                            -->
                            <div class="row hidden" style="padding-top: 15px; background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-2 col-lg-push-1 " style="padding-top: 10px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-10  ">
									<h2>请完善基本信息</h2>
								</div>
								
						   	</div>
						  </div>
				    		<div class="row " style="padding-top: 15px; background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-8 col-lg-push-1 " style="padding-top: 15px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-4 col-lg-pull-0 col-xs-pull-5 ">
									<h2>张三</h2>
								</div>
								
						   	</div>
						  </div>
						  <hr />
						  <div class="row">
						    <div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
							  <div class="" >
								  <span class="input-group-addon" >是否参加过工作</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="sfcjgz"  value=""> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="sfcjgz"  value=""> 否
										</label>
								  	</div>
								  <span id="gzjy-success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="gzjy-error01" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gzjy-cwts01" style="font-size: 13px; color: red; display: none; "></div>
								</div>
			   				</div>
						  </div>
						  <hr />
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12">
						  		<h4>请填写参加过的工作经验</h4>
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-8 col-xs-12">
						  		<textarea class="form-control" rows="5" id="gzjy02"></textarea>
						  	<span id="gzjy-success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
							<span id="gzjy-error02" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
								</div>
								
						  </div>
						  <div id="gzjy-cwts02" style="font-size: 13px; color: red; display: none; "></div>
						  <br />
						   <div class="row">
						  	<div class="col-lg-6 col-xs-12 col-lg-push-3" align="center">
						  		<button type="submit" class="btn btn-primary">提交</button>
						  	</div>
						  </div>
							</form>
				    	</div>
				    </div>
				    <!--
                    	作者：1148969471@qq.com
                    	时间：2022-01-30
                    	描述：在校情况
                    -->
				    <div role="tabpanel" class="tab-pane" id="home04">
				    	<div class="container-fluid">
				    		<form onsubmit="zxqk()" action="#">
				    		<!--
                            	作者：1148969471@qq.com
                            	时间：2022-01-30
                            	描述：完善信息之前展示的是请完善基本信息
                            -->
                            <div class="row hidden" style="padding-top: 15px; background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-2 col-lg-push-1 " style="padding-top: 10px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-10  ">
									<h2>请完善基本信息</h2>
								</div>
								
						   	</div>
						  </div>
				    		<div class="row " style="padding-top: 15px; background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-8 col-lg-push-1 " style="padding-top: 15px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-4 col-lg-pull-0 col-xs-pull-5 ">
									<h2>张三</h2>
								</div>
								
						   	</div>
						  </div>
						  <hr />
						  <div class="row">
						    <div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
							  <div class="" >
								  <span class="input-group-addon " >在校期间是否获得过奖状</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="zxqk01"  value="option1"> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="zxqk01"  value="option2"> 否
										</label>
								  	</div>
								  <span id="zxqk-success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="zxqk-error01" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="zxqk-cwts01" style="font-size: 13px; color: red; display: none; "></div>
								</div>
			   				</div>
						  </div>
						  <div class="row">
						    <div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
							  <div class="" >
								  <span class="input-group-addon" >在校期间是否获得过三好学生</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="zxqk02"  value="option1"> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="zxqk02"  value="option2"> 否
										</label>
								  	</div>
								  <span id="zxqk-success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="zxqk-error02" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="zxqk-cwts02" style="font-size: 13px; color: red; display: none; "></div>
								</div>
			   				</div>
						  </div>
						  <div class="row">
						    <div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
							  <div class="" >
								  <span class="input-group-addon" >在校期间是否担任班委</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="zxqk03"  value="option1"> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="zxqk03"  value="option2"> 否
										</label>
								  	</div>
								   <span id="zxqk-success03" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="zxqk-error03" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="zxqk-cwts03" style="font-size: 13px; color: red; display: none; "></div>
								</div>
			   				</div>
						  </div>
						  <div class="row">
						    <div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
							  <div class="" >
								  <span class="input-group-addon" >在校期间是否参加过活动</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="zxqk04"  value="option1"> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="zxqk04"  value="option2"> 否
										</label>
								  	</div>
								  <span id="zxqk-success04" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="zxqk-error04" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="zxqk-cwts04" style="font-size: 13px; color: red; display: none; "></div>
								</div>
			   				</div>
						  </div>
						  <hr />
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12">
						  		<h4>请填写个人获取的荣誉</h4>
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-8 col-xs-12">
						  		<textarea class="form-control" rows="5" id="zxqk05"></textarea>
						  		<span id="zxqk-success05" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="zxqk-error05" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
						  	</div>
						  </div>
						  <div id="zxqk-cwts05" style="font-size: 13px; color: red; display: none; "></div>
						  <br />
						   <div class="row">
						  	<div class="col-lg-6 col-xs-12 col-lg-push-3" align="center">
						  		<button type="submit" class="btn btn-primary">提交</button>
						  	</div>
						  </div>
							</form>
				    	</div>
				    </div>
				    <!--
                    	作者：1148969471@qq.com
                    	时间：2022-01-30
                    	描述：技能特长
                    -->
				    <div role="tabpanel" class="tab-pane" id="home05">
				    	<div class="container-fluid">
				    		<form onsubmit="jntc()" action="#">
				    		<!--
                            	作者：1148969471@qq.com
                            	时间：2022-01-30
                            	描述：完善信息之前展示的是请完善基本信息
                            -->
                            <div class="row hidden" style="padding-top: 15px; background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-2 col-lg-push-1 " style="padding-top: 10px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-10  ">
									<h2>请完善基本信息</h2>
								</div>
								
						   	</div>
						  </div>
				    		<div class="row " style="padding-top: 15px; background-color: white; height: 120px;" >
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-8 col-lg-push-1 " style="padding-top: 15px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-4 col-lg-pull-0 col-xs-pull-5 ">
									<h2>张三</h2>
								</div>
								
						   	</div>
						  </div>
						  <hr />
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12">
						  		<h4>请填写擅长的技能</h4>
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-8 col-xs-12">
						  		<textarea class="form-control" rows="5" id="jntc01"></textarea>
						  		<span id="jntc-success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="jntc-error01" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
						  	</div>
						  </div>
						  <div id="jntc-cwts01" style="font-size: 13px; color: red; display: none; "></div>
						  <hr />
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12">
						  		<h4>请填写自身优势</h4>
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-8 col-xs-12">
						  		<textarea class="form-control" rows="5" id="jntc02"></textarea>
						  		<span id="jntc-success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="jntc-error02" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
						  	</div>
						  </div>
						  <div id="jntc-cwts02" style="font-size: 13px; color: red; display: none; "></div>
						  <br />
						   <div class="row">
						  	<div class="col-lg-6 col-xs-12 col-lg-push-3" align="center">
						  		<button type="submit" class="btn btn-primary">提交</button>
						  	</div>
						  </div>
							</form>
				    	</div>
				    </div>
				    <!--
                    	作者：1148969471@qq.com
                    	时间：2022-01-30
                    	描述：自我评价
                    -->
				    <div role="tabpanel" class="tab-pane" id="home06">
				    	<div class="container-fluid">
				    		<form onsubmit="zwpj()" action="#">
				    		<!--
                            	作者：1148969471@qq.com
                            	时间：2022-01-30
                            	描述：完善信息之前展示的是请完善基本信息
                            -->
                            <div class="row hidden" style="padding-top: 15px; background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-2 col-lg-push-1 " style="padding-top: 10px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-10  ">
									<h2>请完善基本信息</h2>
								</div>
								
						   	</div>
						  </div>
				    		<div class="row " style="padding-top: 15px; background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-8 col-lg-push-1 " style="padding-top: 15px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-4 col-lg-pull-0 col-xs-pull-5 ">
									<h2>张三</h2>
								</div>
								
						   	</div>
						  </div>
						  <hr />
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12">
						  		<h4>请填写个人爱好</h4>
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-8 col-xs-12">
						  		<textarea class="form-control" rows="3" id="zwpj01"></textarea>
						  		<span id="zwpj-success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="zwpj-error01" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
						  	</div>
						  </div>
						  <div id="zwpj-cwts01" style="font-size: 13px; color: red; display: none; "></div>
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12">
						  		<h4>自身有的不足优势</h4>
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-8 col-xs-12">
						  		<textarea class="form-control" rows="3" id="zwpj02"></textarea>
						  		<span id="zwpj-success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="zwpj-error02" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
						  	</div>
						  </div>
						  <div id="zwpj-cwts02" style="font-size: 13px; color: red; display: none; "></div>
						  <div class="row">
						  	<div class="col-lg-6 col-xs-12">
						  		<h4>自我评价</h4>
						  	</div>
						  </div>
						  <div class="row">
						  	<div class="col-lg-8 col-xs-12">
						  		<textarea class="form-control" rows="5" id="zwpj03"></textarea>
						  		<span id="zwpj-success03" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 40px;padding-top: 38px; display: none;"></span>
								<span id="zwpj-error03" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 40px;padding-top: 38px; display: none;"></span>
						  	</div>
						  </div>
						  <div id="zwpj-cwts03" style="font-size: 13px; color: red; display: none; "></div>
						  <hr />
						  <br />
						   <div class="row">
						  	<div class="col-lg-6 col-xs-12 col-lg-push-3" align="center">
						  		<button type="submit" class="btn btn-primary">提交</button>
						  	</div>
						  </div>
							</form>
				    	</div>
				    </div>
				    <!--
                    	作者：1148969471@qq.com
                    	时间：2022-02-02
                    	描述：公司信息2
                    -->
				    <div role="tabpanel" class="tab-pane" id="home07">
				    	<div class="container-fluid">
				    		<form onsubmit="return gsxx02()" action="#">
				    		
				    		<div class="row " style="padding-top: 15px; background-color: white; height: 120px;">
						  	<div class="row">
							   	<div class="col-lg-2 col-xs-8 col-lg-push-1 " style="padding-top: 15px;">
						   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
							   	</div>
								<div class=" col-lg-6 col-xs-4 col-lg-pull-0 col-xs-pull-5 ">
									<h2>张三</h2>
								</div>
								
						   	</div>
						   	
						  </div>
						  <hr />
						  <div class="row" >
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >毕业去向</span>
									  <select class="form-control" id="gsxx001">
				          					<option>请选择</option>
				          					<c:forEach var="map" items="${byqx}">
				          					<option value="${map.destination_id}">${map.destination_explain}</option>
				          					</c:forEach>
				          				</select>
				          				 <span id="gsxx-success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
										 <span id="gsxx-error01" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
								  	</div>
									<div id="gsxx-cwts01" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >单位名称</span>
									  <input type="text" class="form-control"  id="gsxx002">
									  <span id="gsxx-success02" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
										<span id="gsxx-error02" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts02" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
				   		   </div>
				   		   <div class="row" >
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >单位性质</span>
									  <select class="form-control" id="gsxx003">
				          					<option>请选择</option>
				          					<c:forEach var="map" items="${dwxz}">
				          					<option value="${map.nature_id}">${map.nature_name}</option>
				          					</c:forEach>
				          				</select>
				          				<span id="gsxx-success03" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
										<span id="gsxx-error03" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts03" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >单位所在地</span>
									  <select  class="form-control" id="gsxx004">
				          					<option>请选择</option>
				          					<c:forEach var="map" items="${dwdz}">
				          					<option value="${map.companyaddress_id}">${map.companyaddress_name}</option>
				          					</c:forEach>
				          				</select>
									  <span id="gsxx-success04" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
									  <span id="gsxx-error04" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts04" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
				   		   </div>
				   		   <div class="row" >
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >单位行业</span>
									  <select  class="form-control" id="gsxx005">
				          					<option>请选择</option>
				          					<c:forEach var="map" items="${dwhy}">
				          					<option value="${map.industry_id}">${map.industry_name}</option>
				          					</c:forEach>
				          				</select>
										<span id="gsxx-success05" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
									  <span id="gsxx-error05" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts05" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >工作职位类别</span>
									  <select  class="form-control" id="gsxx006">
				          					<option>请选择</option>
				          					<c:forEach var="map" items="${zwlb}">
				          					<option value="${map.positiontype_id}">${map.positiontype_name}</option>
				          					</c:forEach>
				          				</select>
										<span id="gsxx-success06" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
									  <span id="gsxx-error06" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts06" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
				   		   </div>
				   		   <div class="row" >
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >单位联系人</span>
									  <input type="text" class="form-control"  id="gsxx007">
										<span id="gsxx-success07" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
									  <span id="gsxx-error07" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts07" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >联系人电话</span>
									  <input type="text" class="form-control"  id="gsxx008">
										<span id="gsxx-success08" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
									  <span id="gsxx-error08" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts08" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
				   		   </div>
				   		   <div class="row" >
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >联系人手机</span>
									  <input type="text" class="form-control"  id="gsxx009">
									<span id="gsxx-success09" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
									  <span id="gsxx-error09" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts09" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
					   			<div class="col-lg-6 col-xs-12 " style="padding-top: 10px;">
								  	<div class="" >
									  <span class="input-group-addon" >联系人电子邮箱</span>
									  <input type="email" class="form-control"  id="gsxx010">
									<span id="gsxx-success10" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 38px;  display: none;"></span>
									  <span id="gsxx-error10" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 38px; display: none;"></span>
									</div>
									<div id="gsxx-cwts10" style="font-size: 13px; color: red; display: none; "></div>
					   			</div>
					   			</div>
				   		   </div>
				   		   <div class="row">
						  	<div class="col-lg-12 col-xs-12" style="padding-top: 10px;">
						  		<div class="" >
								  <span class="input-group-addon" >单位地址</span>
								  <textarea class="form-control" rows="2" placeholder="例如：xx省xx市xx区xx街道xx号" id="gsxx011"></textarea>
									<span id="gsxx-success11" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green; padding-right: 60px;padding-top: 48px;  display: none;"></span>
									  <span id="gsxx-error11" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-right: 60px;padding-top: 48px; display: none;"></span>
						  		</div>
						  		<div id="gsxx-cwts11" style="font-size: 13px; color: red; display: none; ">/div>
						  	</div>
						  </div>
						  <div class="row" >
				   			<div class="col-lg-6 col-xs-6 " style="padding-top: 10px;">
							  	<a class="btn btn-default " href="#home01" aria-controls="home" role="tab" data-toggle="tab">取消</a>
				   			</div>
				   			<div class="col-lg-6 col-xs-6  col-lg-push-5 col-xs-push-2" style="padding-top: 10px;">
							  	<button type="submit" class="btn btn-primary">提 交</button>
				   			</div>
				   		  </div>
						</form>
				    	</div>
				    </div>
				  </div>
					  
			   	</div>
			  </div>
			  
			</div>
		  </div>
		  </div>
		</div>
		
		<!--
        	作者：1977455153@qq.com
        	时间：2022-01-28
        	描述：错误提示的模态框
        -->
        <div class="modal fade" tabindex="-1" role="dialog" id="error" style="margin-top: 250px;">
		  <div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content">
		    	<div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      </div>
		      <div class="modal-body text-center">
		        <h4 style="color: red;">请输入账号</h4>
		      </div>
		      <div class="modal-footer">
		      	<div class="row">
			      	<div class="col-lg-12 col-xs-12" align="center">
			      		<a  type="button" class="btn  btn-danger" data-dismiss="modal">确定</a>
			      	</div>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		
		
	</body>
</html>
