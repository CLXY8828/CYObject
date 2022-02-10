<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人信息查询展示页</title>
		<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<script src="../bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
			.yjy
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
				
				//手机端的
				var phonesfjy = $('input:radio[name="phonesfjy"]:checked').val();
				if(phonesfjy==1)
				{
					$(".yjy").show()
				}
				else
				{
					$(".yjy").hide()
				}
				
			})
			
		    
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
			  		<div class="col-lg-2 col-xs-4  " style="padding-top: 10px;">
			   			<img src="../img/tx.png" alt="..." class="img-rounded" style=" width: 50px;">
				   	</div>
					<div class=" col-lg-6 col-xs-4 col-lg-pull-1 col-xs-pull-1 ">
						<h2>${map.data_sname}</h2>
					</div>
					<div class=" col-lg-4 col-xs-4 col-lg-push-3 col-xs-push-1 ">
						<a href="<%= request.getContextPath() %>/users/perfect.do?method=perfectsavepage"><h4>编辑</h4></a>
					</div>
			  	</div>
			  	<div class="row">
			  		<div class="col-lg-4 col-xs-12 col-lg-push-1 ">
			  			<h4>手机号：${fn:substring(user.phone, 0, 3)}***${fn:substring(user.phone, 7, -1)}</h4>
			  		</div>
			  		<div class="col-lg-4 col-xs-12 col-lg-push-1 ">
			  			<h4>考生号：${map.examinee_id}</h4>
			  		</div>
			  	</div>
			  	<div class="row">
			  		<div class="col-lg-4 col-xs-12 col-lg-push-1 ">
			  			<h4 >学号：${map.data_sid}</h4>
			  		</div>
			  		<div class="col-lg-8 col-xs-12 col-lg-push-1 ">
			  			<h4 class="gsname">户籍所在地：${map.data_registeraddress}</h4>
			  		</div>
			  	</div>
			  	<hr style="border: 100 solid #000000; background-color: #000000;"/>
			  	<div class="row">
			  		<div class="col-lg-10  col-lg-offset-1 visible-lg-block">
			  		<div class="table-responsive">
					  <table class="table table-hover">
					    <tr>
					    	<td><h4>QQ：${map.sqq}</h4></td>
					    	<td><h4>工作经验：${map.student_jy}</h4></td>
					    </tr>
					     <tr>
					    	<td><h4>邮箱：${fn:substring(map.email, 0, 3)}***@${fn:substringAfter(map.email, "@")}</h4></td>
					    	<td><h4>是否就业：
					    	<label class="radio-inline">
							  <input type="radio" name="sfjy"  value="1" ${fn:trim(user.processdate) eq"1"?"checked":"" } disabled  > 是
							</label>
							<label class="radio-inline">
							  <input type="radio" name="sfjy"  value="2"  ${fn:trim(user.processdate) eq"0"?"checked":"" } disabled  > 否
							</label>
					    	</h4></td>
					    </tr>
					    <tr class="yjys">
					    	<td><h4>毕业去向：${map.destination_explain}</h4></td>
					    	<td><h4>单位名称：${map.company_name}</h4></td>
					    </tr>
					    <tr class="yjys">
					    	<td><h4>单位性质：${map.nature_name}</h4></td>
					    	<td><h4>单位所在地：${map.companyaddress_name}</h4></td>
					    </tr>
					    <tr class="yjys">
					    	<td><h4>单位行业：${map.industry_name }</h4></td>
					    	<td><h4>工作职位类别：${map.positiontype_name }</h4></td>
					    </tr>
					    <tr class="yjys">
					    	<td><h4>单位联系人：${map.contact_person}</h4></td>
					    	<td><h4>联系人电话：${map.cell_phone}</h4></td>
					    </tr>
					    <tr class="yjys">
					    	<td><h4>联系人手机：${map.sphone}</h4></td>
					    	<td><h4>联系人电子邮箱：${map.contact_email}</h4></td>
					    </tr>
					    <tr class="yjys">
					    	<td colspan="2"><h4>单位地址：${map.company_address}</h4></td>
					    </tr>
					    <tr >
					    	<td colspan="2"><h4>现居住址：${map.sutdent_address}</h4></td>
					    </tr>
					     <tr >
					    	<td><h4>在校期间是否获得过奖状：
					    		<label class="radio-inline">
								  <input type="radio" name="hdjz"  value="1"  ${map.school-jz==1?"checked":"" } disabled> 是
								</label>
								<label class="radio-inline">
								  <input type="radio" name="hdjz"  value="2"   ${map.school-jz==0?"checked":"" } disabled> 否
								</label>
					    	</h4></td>
					    	<td><h4>在校期间是否获得三好学生：
					    		<label class="radio-inline">
								  <input type="radio" name="shxs"  value="1"  ${map.school-sh==1?"checked":"" } disabled> 是
								</label>
								<label class="radio-inline">
								  <input type="radio" name="shxs"  value="2"  ${map.school-sh==0?"checked":"" } disabled> 否
								</label>
					    	</h4></td>
					    </tr>
					     <tr >
					    	<td><h4>在校期间是否担任班委：
					    		<label class="radio-inline">
								  <input type="radio" name="drbw"  value="1"   ${map.school-bw==1?"checked":"" } disabled> 是
								</label>
								<label class="radio-inline">
								  <input type="radio" name="drbw"  value="2"  ${map.school-bw==0?"checked":"" } disabled> 否
								</label>
					    	</h4></td>
					    	<td><h4>在校期间是否参加过活动：
					    		<label class="radio-inline">
								  <input type="radio" name="cjhd"  value="1"   ${map.school-hd==1?"checked":"" } disabled > 是
								</label>
								<label class="radio-inline">
								  <input type="radio" name="cjhd"  value="2"   ${map.school-hd==0?"checked":"" } disabled> 否
								</label>
					    	</h4></td>
					    </tr>
					     <tr >
					    	<td colspan="2">
					    		<h4>填写个人喜好：</h4>
					    		<h4>${fn:trim(map.hobby)==""?"无":map.hobby}</h4>
					    	</td>
					    </tr>
					    <tr >
					    	<td colspan="2">
					    		<h4>自身有的不足：</h4>
					    		<h4>${fn:trim(map.Insufficient)==""?"无":map.Insufficient}</h4>
					    	</td>
					    </tr>
					     <tr >
					    	<td colspan="2">
					    		<h4>自我评价：</h4>
					    		<h4>${fn:trim(map.evaluate)==""?"无":map.evaluate}</h4>
					    	</td>
					    </tr>
					    <tr >
					    	<td colspan="2">
					    		<h4>自身优势：</h4>
					    		<h4>${fn:trim(map.advantage)==""?"无":map.advantage}</h4>
					    	</td>
					    </tr>
					    <tr >
					    	<td colspan="2">
					    		<h4>填写个人荣誉：</h4>
					    		<h4>${fn:trim(map.honor)==""?"无":map.honor}</h4>
					    	</td>
					    </tr>
					    <tr >
					    	<td colspan="2">
					    		<h4>参加过的工作经验及感触：</h4>
					    		<h4>${fn:trim(map.Feeling)==""?"无":map.Feeling}</h4>
					    	</td>
					    </tr>
					  </table>
					</div>
					</div>
			  	</div>
			  	<!--
                  	作者：1148969471@qq.com
                  	时间：2022-02-06
                  	描述：手机端显示
                  -->
                  <div class="row">
			  		<div class=" col-xs-12 visible-xs-block">
			  		<div class="table-responsive">
					  <table class="table table-hover">
					    <tr>
					    	<td><h5>QQ：1148969471</h5></td>
					    </tr>
					    <tr>
					    	<td><h5>工作经验：在校大学生</h5></td>
					    </tr>
					     <tr>
					    	<td><h5>邮箱：1148969471@qq.com</h5></td>
					    </tr>
					    <tr>
					    	<td><h5>是否就业：
					    	<label class="radio-inline">
							  <input type="radio" name="phonesfjy"  value="1"  checked> 是
							</label>
							<label class="radio-inline">
							  <input type="radio" name="phonesfjy"  value="2" disabled > 否
							</label>
					    	</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>毕业去向：签就业协议形式就业</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>单位名称：河北信息科技有限公司</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>单位性质：机关</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>单位所在地：河北省保定市东风东路999号</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>单位行业：软件行业</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>工作职位类别：程序员</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>单位联系人：小龙女</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>联系人电话：6060235</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>联系人手机：18033500427</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>联系人电子邮箱：1148969471@qq.com</h5></td>
					    </tr>
					    <tr class="yjy">
					    	<td><h5>单位地址：河北省和平大街翻斗花园999号</h5></td>
					    </tr>
					    <tr >
					    	<td><h5>现居住址：和平大街翻斗花园999号</h5></td>
					    </tr>
					     <tr >
					    	<td><h5>在校期间是否获得过奖状：
					    		<label class="radio-inline">
								  <input type="radio" name="phonehdjz"  value="1"  checked> 是
								</label>
								<label class="radio-inline">
								  <input type="radio" name="phonehdjz"  value="2"  disabled> 否
								</label>
					    	</h5></td>
					    	
					    </tr>
					    <tr>
					    	<td><h5>在校期间是否获得三好学生：
					    		<label class="radio-inline">
								  <input type="radio" name="phoneshxs"  value="1"  checked> 是
								</label>
								<label class="radio-inline">
								  <input type="radio" name="phoneshxs"  value="2"  disabled> 否
								</label>
					    	</h5></td>
					    </tr>
					     <tr >
					    	<td><h5>在校期间是否担任班委：
					    		<label class="radio-inline">
								  <input type="radio" name="phonedrbw"  value="1"  checked> 是
								</label>
								<label class="radio-inline">
								  <input type="radio" name="phonedrbw"  value="2"  disabled> 否
								</label>
					    	</h5></td>
					    	
					    </tr>
					     <tr >
					    	<td><h5>在校期间是否参加过活动：
					    		<label class="radio-inline">
								  <input type="radio" name="phonecjhd"  value="1"  checked > 是
								</label>
								<label class="radio-inline">
								  <input type="radio" name="phonecjhd"  value="2"  disabled> 否
								</label>
					    	</h5></td>
					    </tr>
					     <tr >
					    	<td >
					    		<h5>填写个人喜好：</h5>
					    		<p>****************</p>
					    	</td>
					    </tr>
					    <tr >
					    	<td>
					    		<h5>自身有的不足：</h5>
					    		<p>****************</p>
					    	</td>
					    </tr>
					    <tr >
					    	<td>
					    		<h5>填写自身优势：</h5>
					    		<p>****************</p>
					    	</td>
					    </tr>
					    <tr >
					    	<td>
					    		<h5>填写个人荣誉：</h5>
					    		<p>****************</p>
					    	</td>
					    </tr>
					    <tr >
					    	<td >
					    		<h5>参加过的工作经验及感触：</h5>
					    		<p>****************</p>
					    	</td>
					    </tr>
					  </table>
					</div>
					</div>
			  	</div>
                  
			  </div>
			</div>
			</div>
		  </div>
		</div>
		
		
		
	</body>
</html>
