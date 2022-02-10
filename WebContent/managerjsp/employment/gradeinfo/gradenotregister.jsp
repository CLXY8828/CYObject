<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>JAVAPLUS班</title>
		<link rel="stylesheet" type="text/css" href="../../bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="../../bootstrap-3.3.7-dist/js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.container{
				width: 100%;
			}
			th{
				font-size: 14px;
				text-align: center;
			}
			td{
				font-size: 14px;
				text-align: center;
			}
			.modal-lg{
				width: 90%;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<ul class="breadcrumb">
				    <li>就业</li>
					<li><span>18级</span>就业信息</li>
				    <li class="active">未注册学生信息</li>
				</ul>
			</div>
			<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
				<form action="/*" method="post">
					<img src="../../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">未注册学生信息</span>
					<span style="float: right;padding-top: 10px;" class="h4">
						<select name="queryinfo" style="width: 90px;height: 30px;border-radius: 10px 0px 0px 10px;">
							<option value="name">姓名</option>
							<option value="stu_id">学号</option>
						</select>
						<input type="text" name="queryCondition" id="queryCondition" value="" style="width: 300px;height: 30px;margin-left: -8px;border-radius: 0px 10px 10px 0px;" />
						<input type="submit" value="搜索" style="height: 33px;width: 90px;margin-left: -8px;font-size: 14px;margin-top: -3px;border-radius: 10px;" class="btn btn-primary" />
					</span>
				</form>
			</div>
			<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
			<div style="width: 100%;">
				<form action="/*" method="post" name="exportform">
					<table border="0px" cellspacing="5px" cellpadding="0px" class="table" style="width:100%">
						<tr>
							<th width="5%">序号</th>
							<th width="10%">姓名</th>
							<th width="10%">学号</th>
							<th width="15%">身份证</th>
							<th width="13%">考生号</th>
							<th width="13%">QQ</th>
							<th width="5%">删除</th>
						</tr>
						<tr>
							<td>1</td>
							<td>张三</td>
							<td>1511307526</td>
							<td>130603********0918</td>
							<td>17130601111</td>
							<td>999999999</td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#delete"><img src="../../img/delete.png" style="width: 28px;height: 28px;" ></a></td>
						</tr>
						<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">确认删除</h3>
									</div>
									<div class="modal-body"  style="margin-left: 8%;font-size: 16px;">
										<span class="row">
											你将删除该学生信息
										</span>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<a href="/*" class="btn btn-danger">确认</a>
									</div>
								</div>
							</div>
						</div>
						<tr>
							<td colspan="10">
								<div class="row" style="background-color: #e5e5e5;">
									<div  style="float: left;margin-left: 1%;">
										<a href="/*"><span class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
										<a href="/*"><span class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
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
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	</script>
</html>
