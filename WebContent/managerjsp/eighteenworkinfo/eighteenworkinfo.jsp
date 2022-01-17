<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="../bootstrap-3.3.7-dist/js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="../bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.container{
				width: 95%;
				left: 2.5%;
			}
			th{
				font-size: 20px;
				text-align: center;
			}
			td{
				font-size: 20px;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row" style="margin-left: 10px;margin-right: 10px;">
				<form action="/*" method="post">
					<img src="../img/userA.png" style="width: 80px;height: 80px;">
					<span class="h3" style="position: absolute;margin-top: 25px;">18级就业详情信息表</span>
					<span style="color: #00FFFF;top: 38px;position: absolute;" class="h3"><a href="/*" style="margin-right: 20px;">一键导出</a><a href="/*">选中导出</a></span>
					<span id="addclass" style="float: right;padding-top: 10px;" class="h3">
						<select name="queryinfo" style="width: 90px;height: 39px;border-radius: 10px 0px 0px 10px;">
							<option value="name">姓名</option>
							<option value="stu_id">学号</option>
						</select>
						<input type="text" name="queryCondition" id="queryCondition" value="" style="width: 300px;height: 40px;margin-left: -8px;border-radius: 0px 10px 10px 0px;" />
						<input type="submit" id="" value="搜索" style="height: 40px;width: 90px;margin-left: -8px;font-size: 20px;" class="btn btn-primary" />
					</span>
				</form>
			</div>
			<hr style="border: #000000 2px solid;margin-top: 7px; width: 100%;" />
			
			<div style="width: 100%;">
				<table border="0px" cellspacing="5px" cellpadding="0px" class="table" style="width:100%">
					<tr>
						<th width="8%">序号</th>
						<th width="10%">姓名</th>
						<th width="10%">学号</th>
						<th width="14%">身份证</th>
						<th width="10%">考生号</th>
						<th width="9%">联系电话</th>
						<th width="15%">单位名称</th>
						<th width="6%">编辑</th>
						<th width="6%">详情</th>
						<th width="6%">导出</th>
					</tr>
					<tr>
						<td>1</td>
						<td>张三</td>
						<td>1511307526</td>
						<td>130603********0918</td>
						<td>17130601111***</td>
						<td>110</td>
						<td>单位名称</td>
						<td><a href="/*"><img src="../img/edit.png" style="width: 30px;height:30px;" ></a></td>
						<td><a href="/*"><img src="../img/view.png" style="width: 30px;height: 30px;" ></a></td>
						<td><a href="/*"><img src="../img/expoet2.png" style="width:30px;height: 30px;" ></a></td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>
