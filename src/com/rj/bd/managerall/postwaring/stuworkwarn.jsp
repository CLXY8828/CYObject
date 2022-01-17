<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>学生就业预警</title>
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
					<span class="h3" style="position: absolute;margin-top: 50px;">学生就业预警</span>
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
							<th width="8%">序号</th>
							<th width="10%">姓名</th>
							<th width="10%">学号</th>
							<th width="14%">未就业时长</th>
							<th width="14%">联系电话</th>
							<th width="14%">离职/未就业</th>
							<th width="14%">专业老师</th>
							<th width="6%">删除</th>
							<th width="10%">联系处理</th>
						</tr>
						<!-- /*以下放数据 -->
						<tr>
							<td>1</td>
							<td>张三</td>
							<td>206666666</td>
							<td>9<span>天</span></td>
							<td>99999999999</td>
							<td>离职</td>
							<td>小龙女</td>
							<td><a href="/*"><img src="../img/delete.png" style="width: 38px;height: 38px;" ></a></td>
							<td><a href="/*"><img src="../img/deal.png" style="width: 30px;height: 30px;" ></a></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>207777777</td>
							<td>10<span>天</span></td>
							<td>00000000000</td>
							<td>未就业</td>
							<td>过儿</td>
							<td><a href="/*"><img src="../img/delete.png" style="width: 38px;height: 38px;" ></a></td>
							<td><a href="/*"><img src="../img/warning.png" style="width: 30px;height: 30px;" ></a></td>
						</tr>
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
</html>
