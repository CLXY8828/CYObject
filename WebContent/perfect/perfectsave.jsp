<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改信息</title>
		<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<script src="../bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		
		<script src="../js/xgxx.js"></script>
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
			.gsname{
				
				text-overflow: ellipsis;/*用...代替超出部分*/
				
				white-space: nowrap;/*一行显示*/
				 
				overflow: hidden;/*超出部分隐藏*/
				 
				
			}
			.yjys
			{
				display: none;
			}
			
		</style>
		<script type="text/javascript">
			//如果勾选的是否就业为是，则显示，反之
			$(document).ready(function () {
				var sfjy = $('input:radio[name="sfjy"]:checked').val();
				if(sfjy==1)
				{
					$(".yjys").show()
				}
				else
				{
					$(".yjys").hide()
				}
				
			})
			//显示就业
			function xsjy()
			{
				$(".yjys").show()
			}
			//隐藏就业
			function ycjy()
			{
				$(".yjys").hide()
			}
			//显示邮箱验证的模态框
			function yxyz()
			{
				$('#yxyz').modal('show')
			}
			//表单验证
		    function yz()
		    {
		    	var yzm=$("#yzm").val();
		    	if(!yzm.trim())
		    	{
		    		$("#nr").html("验证码不能为空，请输入验证码");
		    		$("#error").show();
		    		return false;
		    	}
		    	else
		    	{
		    		//如果验证码错误这块去传到后端，然后判断验证码是否正确再进行判断
		    		return true;
		    	}
		    }
		    
		    $(function(){  
		        /*点击改变按钮状态，已经简略掉ajax发送短信验证的代码*/  
		        $('#lg-get').click(function()
		        {
		            var btn = $(this);  
		            var count = 60;  
		            var resend = setInterval(function(){  
		                count--;  
		                if (count > 0){  
		                    btn.val(count+"秒");  
		                    $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});  
		                }else {  
		                    clearInterval(resend);  
		                    btn.val("获取验证码").removeAttr('disabled style');  
		                }  
		            }, 1000);  
		            btn.attr('disabled',true).css('cursor','not-allowed');  
		        });  
		        
		   		 
		    });
		    
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
			  		<div class="col-lg-2 col-xs-8  " style="padding-top: 10px;">
			   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
				   	</div>
					<div class=" col-lg-6 col-xs-4 col-lg-pull-1 col-xs-pull-5 ">
						<h2>${map.data_sname}</h2>
					</div>
			  	</div>
			  	<div class="row">
			  		<div class="col-lg-4 col-xs-12 col-lg-push-1 col-xs-push-3">
			  			<h4>手机号：${fn:substring(user.phone, 0, 3)}***${fn:substring(user.phone, 7, -1)}</h4>
			  		</div>
			  		<div class="col-lg-4 col-xs-12 col-lg-push-1 col-xs-push-3">
			  			<h4>考生号：${map.examinee_id}</h4>
			  		</div>
			  	</div>
			  	<div class="row">
			  		<div class="col-lg-4 col-xs-12 col-lg-push-1 col-xs-push-3">
			  			<h4 >学号：${map.data_sid}</h4>
			  		</div>
			  		<div class="col-lg-4 col-xs-12 col-lg-push-1 col-xs-push-3">
			  			<h4 class="gsname">户籍所在地：${map.data_registeraddress}</h4>
			  		</div>
			  	</div>
			  	<hr style="border: 100 solid #000000; background-color: #000000;"/>
			  	<div class="row">
			  		<div class="col-lg-10 col-xs-12 col-lg-offset-1">
			  			<form method="post" action="<%= request.getContextPath() %>/users/perfect.do?method=saveall" onsubmit="return xgxx()">
			  			<div class="row ">
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >Q Q</span>
								  <input type="text" class="form-control" name="qq" value="${map.sqq}" id="xgxx01" >
									<span id="xgxx-success01" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error01" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error01" style="font-size: 13px; color: red; padding-left: 60px;display: none; "></div>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								   <span class="input-group-addon" id="sizing-addon2">工作经验</span>
								  	<select name="gzjy" class="form-control">
			          					<option ${map.student_jy=="在校大学生"?"selected='selected'":""} value="">在校大学生</option>
			          					<option ${map.student_jy=="应届毕业生"?"selected='selected'":""} value="">应届毕业生</option>
			          					<option ${map.student_jy=="实习生"?"selected='selected'":""} value="">实习生</option>
			          					<option ${map.student_jy=="1年以内"?"selected='selected'":""} value="">1年以内</option>
			          					<option ${map.student_jy=="1-3年"?"selected='selected'":""} value="">1-3年</option>
			          					<option ${map.student_jy=="3-5年"?"selected='selected'":""} value="">3-5年</option>
			          					<option ${map.student_jy=="5-10年"?"selected='selected'":""} value="">5-10年</option>
			          					<option ${map.student_jy=="10年以上"?"selected='selected'":""} value="">10年以上</option>
			          				</select>
								</div>
								<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  				</div>
			  				
			  			</div>
			  			<div class="row " >
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >邮箱</span>
								  <input type="email" class="form-control" name="email" value="${map.email}" onclick="yxyz()" id="xgxx03">
									<span id="xgxx-success03" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error03" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error03" style="font-size: 13px; color: red; padding-left: 60px;display: none; "></div>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group" >
								  <span class="input-group-addon" >是否就业</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="sfjy"  value="1" onclick="xsjy()" ${fn:trim(user.employment_status) eq"1"?"checked":"" }> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="sfjy"  value="0" onclick="ycjy()" ${fn:trim(user.employment_status) eq"0"?"checked":"" }> 否
										</label>
								  	</div>
								  </div>
								</div>
								<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  				</div>
			  			</div>
			  			<div class="row  yjys" >
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >毕业去向</span>
									  <select class="form-control" name="byqx" id="gsxx001">
				          					<c:forEach var="map2" items="${byqx}">
				          					<option ${map.destination_id==map2.nature_id?"selected='selected'":""} value="${map2.destination_id}">${map2.destination_explain}</option>
				          					</c:forEach>
				          				</select>
								</div>
								<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								   <span class="input-group-addon" >单位名称</span>
								  <input type="text" class="form-control" name="gsname" value="${map.company_name}" id="xgxx06">
									<span id="xgxx-success06" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error06" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error06" style="font-size: 13px; color: red; padding-left: 80px;display: none; "></div>
			  				</div>
			  				
			  			</div>
			  			<div class="row  yjys" >
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >单位性质</span>
									  <select class="form-control" name="dwxz" id="gsxx003">
				          					<c:forEach var="map2" items="${dwxz}">
				          					<option ${map.nature_id==map2.nature_id?"selected='selected'":""} value="${map2.nature_id}">${map2.nature_name}</option>
				          					</c:forEach>
				          				</select>
				          			
								</div>
								<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								   <span class="input-group-addon" >单位所在地</span>
								   <select  class="form-control" name="dwdz" id="gsxx004">
									  <c:forEach var="map2" items="${dwdz}">
		          					<option ${map.companyaddress_id==map2.companyaddress_id?"selected='selected'":""} value="${map2.companyaddress_id}">${map2.companyaddress_name}</option>
		          					</c:forEach>
		          				</select>
		          				
								<span id="xgxx-success08" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error08" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error08" style="font-size: 13px; color: red; padding-left: 100px;display: none; "></div>
			  				</div>
			  				
			  			</div>
			  			<div class="row  yjys" >
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >单位行业</span>
								  <select  class="form-control" name="dwhy" id="gsxx005">
								  <c:forEach var="map2" items="${dwhy}">
		          					<option ${map.industry_id==map2.industry_id?"selected='selected'":""} value="${map2.industry_id}">${map2.industry_name}</option>
		          					</c:forEach>
		          				</select>
								<span id="xgxx-success09" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error09" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error09" style="font-size: 13px; color: red; padding-left: 80px;display: none; "></div>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								   <span class="input-group-addon" >工作职位类别</span>
								   <select  class="form-control" name="zwlb" id="gsxx006">
								  <c:forEach var="map2" items="${zwlb}">
		          					<option ${map.positiontype_id==map2.positiontype_id?"selected='selected'":""} value="${map2.positiontype_id}">${map2.positiontype_name}</option>
		          					</c:forEach>
		          					</select>
								<span id="xgxx-success10" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error10" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error10" style="font-size: 13px; color: red; padding-left: 110px;display: none; "></div>
			  				</div>
			  				
			  			</div>
			  			<div class="row  yjys" >
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >单位联系人</span>
								  <input type="text" class="form-control" name="contact_person" value="${map.contact_person}" id="xgxx11">
								<span id="xgxx-success11" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error11" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error11" style="font-size: 13px; color: red; padding-left: 100px;display: none; "></div>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								   <span class="input-group-addon" >联系人电话</span>
								  <input type="text" class="form-control" name="cell_phone" value="${map.cell_phone}" id="xgxx12">
								<span id="xgxx-success12" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error12" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error12" style="font-size: 13px; color: red; padding-left: 100px;display: none; "></div>
			  				</div>
			  				
			  			</div>
			  			<div class="row  yjys" >
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >联系人手机</span>
								  <input type="text" class="form-control" name="sphone" value="${map.sphone}" id="xgxx13">
								<span id="xgxx-success13" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error13" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error13" style="font-size: 13px; color: red; padding-left: 100px;display: none; "></div>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								   <span class="input-group-addon" >联系人电子邮箱</span>
								  <input type="email" class="form-control" name="contact_email" value="${map.contact_email}" id="xgxx14">
								<span id="xgxx-success14" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error14" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  					<div id="error14" style="font-size: 13px; color: red; padding-left: 120px;display: none; "></div>
			  				</div>
			  				
			  			</div>
			  			<div class="row  yjys" >
			  				<div class="col-lg-12 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >单位地址</span>
								  <input type="text" class="form-control" name="company_address"  value="${map.company_address}" id="xgxx15">
								  <span id="xgxx-success15" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error15" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
								</div>
								<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
								<div id="error15" style="font-size: 13px; color: red; padding-left: 80px;display: none; ">asd</div>
			  				</div>
			  			</div>
			  			<div class="row ">
			  				<div class="col-lg-12 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group  " >
								  <span class="input-group-addon" >现居住址</span>
								  <input type="text" class="form-control" name="sutdent_address"  value="${map.sutdent_address}" id="xgxx16">
								<span id="xgxx-success16" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;display:none ;"></span>
								  <span id="xgxx-error16" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; display: none;"></span>
								</div>
								<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
								<div id="error16" style="font-size: 13px; color: red; padding-left: 80px;display: none; "></div>
			  				</div>
			  			</div>
			  			<div class="row " >
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group">
			  						<span class="input-group-addon " >在校期间是否获得过奖状</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="school-jz"  value="1" ${map.school-jz==1?"checked":"" }> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="school-jz"  value="0" ${map.school-jz==0?"checked":"" }> 否
										</label>
								  	</div>
								  </div>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group">
			  						<span class="input-group-addon " >在校期间是否获得三好学生</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="school-sh"  value="1" ${map.school-sh==1?"checked":"" }> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="school-sh" value="0" ${map.school-sh==0?"checked":"" }> 否
										</label>
								  	</div>
								  </div>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  				</div>
			  			</div>
			  			
			  			<div class="row " >
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group">
			  						<span class="input-group-addon " >在校期间是否担任班委</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="school-bw"  value="1" ${map.school-bw==1?"checked":"" }> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="school-bw"  value="0" ${map.school-bw==0?"checked":"" }> 否
										</label>
								  	</div>
								  </div>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  				</div>
			  				<div class="col-lg-6 col-xs-12" style="padding-top: 10px;">
			  					<div class="input-group">
			  						<span class="input-group-addon " >在校期间是否参加过活动</span>
								  <div class="form-control " align="center">
								  	<div class="col-lg-6 col-xs-6">
								  		<label class="radio-inline">
										  <input type="radio" name="school-hd"  value="1" ${map.school-hd==1?"checked":"" }> 是
										</label>
								  	</div>
								  	<div class="col-lg-6 col-xs-6">
										<label class="radio-inline">
										  <input type="radio" name="school-hd"  value="0" ${map.school-hd==0?"checked":"" }> 否
										</label>
								  	</div>
								  </div>
			  					</div>
			  					<span class="form-control-feedback" style="color: red; font-size: 20px; padding-top: 12px; padding-left: 20px;">*</span>
			  				</div>
			  			</div>
			  			<div class="row ">
			  				<div class="col-lg-12 col-xs-12">
			  					<h4>填写个人喜好</h4>
			  					<textarea class="form-control" rows="2" name="hobby" id="xgxx21">${fn:trim(map.hobby)==""?"无":map.hobby}</textarea>
			  					 <span id="xgxx-success21" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-top: 48px; padding-right: 30px; display: none;"></span>
								  <span id="xgxx-error21" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-top: 48px; padding-right: 30px; display: none;"></span>
								</div>
								<div id="error21" style="font-size: 13px; color: red; padding-left: 20px; display: none; "></div>
			  			</div>
			  			<div class="row form-group">
			  				<div class="col-lg-12 col-xs-12">
			  					<h4>自身有的不足</h4>
			  					<textarea class="form-control" name="Insufficient" rows="2" id="xgxx22">${fn:trim(map.Insufficient)==""?"无":map.Insufficient}</textarea>
			  					<span id="xgxx-success22" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-top: 48px; padding-right: 30px; display: none;"></span>
								  <span id="xgxx-error22" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-top: 48px; padding-right: 30px; display: none;"></span>
								</div>
								<div id="error22" style="font-size: 13px; color: red; padding-left: 20px; display: none; "></div>
			  			</div>
			  			<div class="row form-group">
			  				<div class="col-lg-12 col-xs-12">
			  					<h4>自我评价</h4>
			  					<textarea class="form-control" name="evaluate" rows="2" id="xgxx23">${fn:trim(map.evaluate)==""?"无":map.evaluate}</textarea>
			  					<span id="xgxx-success23" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-top: 48px; padding-right: 30px; display: none;"></span>
								  <span id="xgxx-error23" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-top: 48px; padding-right: 30px; display: none;"></span>
								</div>
								<div id="error23" style="font-size: 13px; color: red; padding-left: 20px; display: none; "></div>
			  			</div>
			  			<div class="row form-group">
			  				<div class="col-lg-12 col-xs-12">
			  					<h4>填写自身优势</h4>
			  					<textarea class="form-control" name="advantage" rows="2" id="xgxx24">${fn:trim(map.advantage)==""?"无":map.advantage}</textarea>
			  					<span id="xgxx-success24" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-top: 48px; padding-right: 30px; display: none;"></span>
								  <span id="xgxx-error24" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-top: 48px; padding-right: 30px; display: none;"></span>
								</div>
								<div id="error24" style="font-size: 13px; color: red; padding-left: 20px; display: none; "></div>
			  			</div>
			  			<div class="row form-group">
			  				<div class="col-lg-12 col-xs-12">
			  					<h4>填写个人获取的荣誉</h4>
			  					<textarea class="form-control" name="honor" rows="2" id="xgxx25">${fn:trim(map.honor)==""?"无":map.honor}</textarea>
			  					<span id="xgxx-success25" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-top: 48px; padding-right: 30px; display: none;"></span>
								  <span id="xgxx-error25" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-top: 48px; padding-right: 30px; display: none;"></span>
								</div>
								<div id="error25" style="font-size: 13px; color: red; padding-left: 20px; display: none; "></div>
			  			</div>
			  			<div class="row form-group">
			  				<div class="col-lg-12 col-xs-12">
			  					<h4>参加过的工作经验及感触</h4>
			  					<textarea class="form-control" name="Feeling" rows="3" id="xgxx26">${fn:trim(map.Feeling)==""?"无":map.Feeling}</textarea>
			  					<span id="xgxx-success26" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true" style="color: green;padding-top: 48px; padding-right: 30px; display: none;"></span>
								  <span id="xgxx-error26" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" style="color: red; padding-top: 48px; padding-right: 30px; display: none;"></span>
								</div>
								<div id="error26" style="font-size: 13px; color: red; padding-left: 20px; display: none; "></div>
			  			</div>
			  			<div class="row form-group">
			  				<div class="col-lg-6 col-xs-6 " >
			  					<a href="zhaq.html" class="btn btn-default" style="width: 100px;">取消</a>
			  				</div>
			  				<div class="col-lg-6 col-xs-6 col-lg-push-4 col-xs-push-1">
			  					<button type="submit" class="btn btn-primary" style="width: 100px;">保存</button>
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
		
		<!--
        	作者：1148969471@qq.com
        	时间：2022-02-04
        	描述：进行邮箱验证的拟态框
        -->
	</body>
</html>
