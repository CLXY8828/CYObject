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
			.container{
				width: 100%;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div id="header">
				<div class="row">
					<ul class="breadcrumb">
					    <li>就业</li>
						<li>18级就业信息</li>
						<li>JAVAPLUS班</li>
					    <li class="active">就业数据分析</li>
					</ul>
				</div>
				<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
					<img src="../../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">就业数据分析</span>
					<a href="#idenfier" data-toggle="modal" data-target="#exportanal">
						<span id="addclass" style="color:royalblue;float: right;" class="h3">
							<span style="">就业数据分析导出</span>
						</span>
					</a>
				</div>
				<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
				<div class="modal fade" id="exportanal" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h3 class="modal-title" id="modaltitle">就业数据分析导出</h3>
							</div>
							<div class="modal-body">
								<span class="h4" style="margin-left: 10%;">你将导出该班级就业数据分析图</span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<a href="*" class="btn btn-primary">确认</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
