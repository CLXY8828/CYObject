<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>岗位招满预警</title>
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
			th{
				font-size: 20px;
				text-align: center;
			}
			td{
				font-size: 20px;
				text-align: center;
			}
			.container{
				width: 95%;
				left: 2.5%;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div id="header">
				<div class="row" style="margin-left: 10px;margin-right: 10px;">
					<img src="../img/userA.png" style="width: 80px;height: 80px;">
					<span class="h3" style="position: absolute;margin-top: 50px;">岗位招满预警</span>
					<a href="/*">
						<span id="addclass" style="color:royalblue;float: right;padding-top: 10px;" class="h3">
							<img src="../img/expoet2.png" width="50px" height="50px">
							<span style="margin-top: 50px">导出信息</span>
						</span>
					</a>
				</div>
				<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
			</div>
			<div style="width: 100%;">
				<form action="/*" method="post" name="delform">
					<table border="0px" cellspacing="5px" cellpadding="0px" style="width: 100%;" class="table">
						<tr>
							<th width="6%">序号</th>
							<th width="14%">岗位</th>
							<th width="12%">招聘时间</th>
							<th width="13%">应招人数</th>
							<th width="13%">投简历人数</th>
							<th width="24%">公司名称</th>
							<th width="6%">查看</th>
							<th width="6%">删除</th>
						</tr>
			<!-- /*以下放数据 -->
						<tr>
							<td>1</td>
							<td>JAVA开发工程师</td>
							<td>2022-01-12</td>
							<td>5</td>
							<td>0</td>
							<td>北京京云万峰信息技术有限公司</td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#view"><img src="../img/view.png" style="width: 38px;height: 38px;" ></a></td>
							<td><a href="" onclick="checkdel(delform)"><img src="../img/delete.png" style="width: 30px;height: 30px;" ></a></td>
						</tr>
		<!-- 这里也是要存数据的 -->
						<div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h2 class="modal-title" id="modaltitle">查看</h2>
									</div>
									<div class="modal-body" style="font-size: 20px; margin-left: 20px;">
										<div class="row">
											<span>
												岗位：
												<span>JAVA开发工程师</span>
											</span>
											<span>
												招聘时间
												<span>2022-01-12</span>
											</span>
										</div>
										<br>
										<div class="row">
											<span>
												公司名称
												<span>北京京云万峰信息技术有限公司</span>
											</span>
										</div>
										<br>
										<div class="row">
											<span>
												投简历人数
												<span>5</span>
												人
											</span>
										</div>
										<br>
										<div style="overflow-y: scroll;height: 500px; width: 100%;">
											<div class="row" style="width: 100%;">
												<span style="margin-left: 5%;">
													姓名：
													<span>张三</span>
												</span>
												<span style="margin-left: 15%;">
													学号：
													<span>301369466</span>
												</span>
												<span style="margin-left: 15%;">
													联系电话
													<span>13301369466</span>
												</span>
											</div>
											<br>
										</div>
									</div>
								</div>
							</div>
						</div>
		<!-- 以上 -->
						<tr>
							<td colspan="9">
								<div class="row" style="background-color: #dafffb;">
									<div  style="float: left;">
										<a href="/*"><span class="glyphicon glyphicon-chevron-left" style="width: 30px;height: 30px;border: #000000 1px solid;"></span></a>
										<a href="/*"><span class="glyphicon glyphicon-chevron-right" style="width: 30px;height: 30px;border: #000000 1px solid;"></span></a>
									</div>
									<span style="float: left; margin-left: 10px;">
										<span>150</span>条总记录数
									</span>
									<span style="float: left; margin-left: 20px;">
										显示<span>10</span>页
									</span>
									<span style="float: left; margin-left: 35px;">
										跳转至
										<input type="text" name="pagenum" id="pagenum" value="1" style="width: 35px;" />
										页
									</span>
									<div style="float: right;">
										<span>
											每页显示
											<select name="infonum" style="width:80px">
												<option value="15">15</option>
												<option value="20">20</option>
												<option value="25">25</option>
												<option value="30">30</option>
											</select>
										</span>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function checkdel(delform){
			if(confirm("确认删除该公司招聘信息")){
				delform.submit();
			}
		}
	</script>
</html>
