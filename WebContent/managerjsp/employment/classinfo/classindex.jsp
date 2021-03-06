<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			*{
				padding: 0;
				margin: 0;
				cursor: default;
			}        
			li{
				list-style: none;
				width: 100%;
			}
			.content_left{
				width: 22%;
				height: 1000px;
				border: 0px solid #000000;
				float: left;
				background-color: #e2e2e2;
			}
			.content_right{
				width: 78%;
				height: 1000px;
				float: left;
				margin-top: 0px;
			}
			.nav_title{
				height: 50px;
				width: 100%;
				text-align: center;
				line-height: 50px
			}
			.menu{
				width: 100%;
				text-align: center;
				margin-top:-3%;
				margin-bottom: 30px;
			}
			.norhr{
				margin-top: -5px;
				width: 70%;
				margin-left: 25px;
				border:0px;
				border-bottom:2px solid #5c5c3d;
			}
			.container{
				width: 80%;
			}
		</style>
	</head>
	<body>
		<div class="hidden-sm hidden-xs hidden-md" style="width: 100%;height: 10%;">
			<div class="navbar-header" style="width: 100%;background-color:#011536;">
				<div style="margin-left: 10%;">
					<img src="../../img/logo.png" style="width: 4%;height: 4%;padding-top: 0.5%;padding-bottom: 0.5%;">
					<span style="color: white;margin-top: 10%;margin-left: 0.5%;" class="h3"><strong>高校就业平台</strong></span>
					
					<span class="h2" style="font-size:28px;">
						<a href="../../index.html" class="btn btn-info" style="width: 80px;margin-left: 64%;">返回</a>
					</span>
				</div>
			</div>
		</div>
		<div class="container">
			<div id="body">
				<div class="content">
					<div class="content_left hidden-sm hidden-xs hidden-md">
						<div class="nav_title">
							<span style="font-size: 25px;">高校就业管理信息平台</span>
						</div>
						<hr style="width: 99%; border: #000000 1.5px solid;margin-top: -5px;" />
						<ul class="nav nav-pills" style="font-size: 22px;">
							<!--<li class="active"><a href="#analyze" tabindex="-1" aria-controls="analyze" role="tab" data-toggle="tab">就业数据分析</a></li>-->
							<li class="active"><a href="#gradeinfo" tabindex="-1" aria-controls="gradeinfo" role="tab" data-toggle="tab">就业信息详情</a></li>
							<li style="margin-left: -1px;"><a href="#gradeunwork" tabindex="-1" aria-controls="gradeunwork" role="tab" data-toggle="tab">未就业信息详情</a></li>
							<li style="margin-left: -1px;"><a href="#notregi" tabindex="-1" aria-controls="notregi" role="tab" data-toggle="tab">未注册学生信息</a></li>
						</ul>
					</div>
					<div class="content_right tab-content" style="box-shadow: 1 0 3px 3px gray;">
						<div id="analyze" class="tab-pane" style="width: 100%;height: 100%;">
							<iframe src="classanalyze.html" width="100%" height="100%"></iframe>
						</div>
						<div id="gradeinfo" class="tab-pane active" style="width: 100%;height: 100%;">
							<iframe src="classworkinfo.html" width="100%" height="100%"></iframe>
						</div>
						<div id="gradeunwork" class="tab-pane" style="width: 100%;height: 100%;">
							<iframe src="classunworkinfo.html" width="100%" height="100%"></iframe>
						</div>
						<div id="notregi" class="tab-pane" style="width: 100%;height: 100%;">
							<iframe src="classnotregister.html" width="100%" height="100%"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

