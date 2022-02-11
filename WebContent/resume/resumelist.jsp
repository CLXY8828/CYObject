<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>历史简历</title>
		<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		
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
			a{
				cursor:pointer
			}
			
			
			
		</style>
		
		<script type="text/javascript">
			//pdf展示的js
			function cxzs(filedom)
			{
				alert(filedom)
				var dom=encodeURI("<%=request.getContextPath() %>/users/resume.do?method=download&path=0c7574ab-c97d-4938-a2ce-82c115fa90df.pdf");
				alert(dom)
				$('#error').modal('show')
				$("#preview").attr("src","<%=request.getContextPath() %>/pdfjs/web/viewer.html?file="+dom)
				
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
	        <img id="loge" class="img-responsive" alt="Responsive image" src="img/001.png">
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
			<!--
            	作者：1148969471@qq.com
            	时间：2022-02-09
            	描述：电脑端显示
            -->
		  <div class="row">
		  	<div class="col-lg-10 visible-lg-block col-lg-offset-1">
		  		<div class="panel panel-default">
	  			<div class="panel-heading">>>历史简历</div>
			    <div class="table-responsive">
				  <table class="table ">
				    <thead align="center" style="font-size: 18px; font-weight: 600;">
				    	<tr>
				    		<td>
				    			简历名称
				    		</td>
				    		<td>
				    			上传时间
				    		</td>
				    		<td>
				    			大小/MB
				    		</td>
				    		<td>
				    			格式
				    		</td>
				    		<td>
				    			进入简历
				    		</td>
				    	</tr>
				    </thead>
				    <tbody align="center">
				    <c:forEach var="map" items="${list }">
				    	<tr>
				    		<td>
				    			个人名片
				    		</td>
				    		<td>
				    			${map.resume_time}
				    		</td>
				    		<td>
				    			${map.sizes}MB
				    		</td>
				    		<td>
				    			pdf格式
				    		</td>
				    		<td>
				    			<a onclick="cxzs('${map.resume_one}')">
				    				<img src="img/jr.png" class="img-responsive" alt="Responsive image" style="height: 20px;">
				    			</a>
				    		</td>
				    	</tr>
				    </c:forEach>
				    </tbody>
				  </table>
				</div>
				</div>
		  	</div>
		  </div>
		  <!--
          	作者：1148969471@qq.com
          	时间：2022-02-09
          	描述：手机端显示
          -->
          <div class="row">
		  	<div class="col-xs-12 visible-xs-block ">
		  		<div class="panel panel-default">
	  			<div class="panel-heading">>>历史简历</div>
			    <div class="table-responsive">
				  <table class="table ">
				    <thead align="center" style="font-size: 14px; font-weight: 550;">
				    	<tr>
				    		<td>
				    			简历名称
				    		</td>
				    		<td>
				    			上传时间
				    		</td>
				    		<td>
				    			大小/MB
				    		</td>
				    		
				    		<td>
				    			进入简历
				    		</td>
				    	</tr>
				    </thead>
				    <tbody align="center">
				    	<tr>
				    		<td>
				    			个人名片
				    		</td>
				    		<td>
				    			2022年2月9日
				    		</td>
				    		<td>
				    			10MB
				    		</td>
				    		
				    		<td>
				    			<a onclick="cxzs('002.pdf')">
				    				<img src="img/jr.png" class="img-responsive" alt="Responsive image" style="height: 20px;">
				    			</a>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
				    			个人名片
				    		</td>
				    		<td>
				    			2022年2月9日
				    		</td>
				    		<td>
				    			10MB
				    		</td>
				    		
				    		<td>
				    			<a onclick="cxzs('002.pdf')">
				    				<img src="img/jr.png" class="img-responsive" alt="Responsive image" style="height: 20px;">
				    			</a>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
				    			个人名片
				    		</td>
				    		<td>
				    			2022年2月9日
				    		</td>
				    		<td>
				    			10MB
				    		</td>
				    		
				    		<td>
				    			<a onclick="cxzs('002.pdf')">
				    				<img src="img/jr.png" class="img-responsive" alt="Responsive image" style="height: 20px;">
				    			</a>
				    		</td>
				    	</tr>
				    </tbody>
				  </table>
				</div>
				</div>
		  	</div>
		  </div>
          
		</div>
		
		<!--
        	作者：1977455153@qq.com
        	时间：2022-01-28
        	描述：进入简历的展示拟态框
        -->
		<div class="modal fade" tabindex="-1" role="dialog" id="error" style="margin-top: 50px;">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content" >
		    	<div class="modal-header">
		    		  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title">
       					 	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
       					 	查询展示
       					 </h4>
		    	</div>
		      <div class="modal-body" align="center">
		        <iframe id="preview" style="height: 350px; width: 100%;"></iframe>
		      </div>
		      <div class="modal-footer" align="center">
		      	<div class="row" align="center">
			      	<div class="col-lg-12 col-xs-12">
			      		<button type="button" class="btn btn-primary btn-lg btn-block" data-dismiss="modal">返回</button>
			      	</div>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>
