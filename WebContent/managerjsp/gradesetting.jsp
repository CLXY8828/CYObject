<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="bootstrap-3.3.7-dist/js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
			<div id="header">
				<div class="row" style="margin-left: 10px;margin-right: 10px;">
					<img src="img/userA.png" style="width: 80px;height: 80px;">
					<span class="h3" style="position: absolute;margin-top: 50px;">年级设定</span>
					<a href="#idenfier" data-toggle="modal" data-target="#addmodal">
						<span id="addclass" style="color:royalblue;float: right;padding-top: 10px;" class="h3">
							<img src="img/newfolder.png" width="50px" height="50px">
							<span style="margin-top: 50px">新建就业年级</span>
						</span>
					</a>
				</div>
				<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
				<!-- /*模态框 -->
				<div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="/*" method="post">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h2 class="modal-title" id="modaltitle">新建就业年级</h4>
								</div>
								<div class="modal-body" style="font-size: 25px; margin-left: 20px;">
									<span>
										名称：
										<input type="test" name="add_class_name" id="add_class_name" value=""/>	
									</span>
									<br><br>
									<span>
										设置为就业
										<input type="radio" name="add_att" id="add_att" value="" />班级
										<input type="radio" name="add_att" id="add_att" value="" />年级
									</span>
									<br><br>
									<span>
										导入学生信息
										<input type="file" name="add_stu_info" id="add_stu_info" value="选择文件" />
									</span>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭
									</button>
									<button type="submit" class="btn btn-primary">
										新建
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 模态框*/ -->
				<div style="width: 100%;">
					<table border="0px" cellspacing="5px" cellpadding="0px" style="width: 100%;" class="table">
						<tr>
							<th width="8%">序号</th>
							<th width="10%">名称</th>
							<th width="12%">总人数</th>
							<th width="12%">就业人数</th>
							<th width="10%">未就业人数</th>
							<th width="9%">就业率</th>
							<th width="6%">编辑</th>
							<th width="6%">查看</th>
							<th width="6%">删除</th>
							<th width="15%">导入导出学生信息</th>
						</tr>
						<!-- /*以下放数据 -->
						<tr>
							<td>1</td>
							<td>18级就业</td>
							<td>150<span>人</span></td>
							<td>100<span>人</span></td>
							<td>50<span>人</span></td>
							<td>66.66<span>%</span></td>
							<td><a href="/*"><img src="img/edit.png" style="width: 30px;height:30px;" ></a></td>
							<td><a href="/*"><img src="img/view.png" style="width: 30px;height:30px;" ></a></td>
							<td><a href="/*"><img src="img/delete.png" style="width: 30px;height: 30px;" ></a></td>
							<td>
								<a href="/*"><img src="img/import.png" style="width:30px;height: 30px; margin-right: 50px;" ></a>
								<a href="/*"><img src="img/expoet2.png" style="width: 30px;height: 30px;" ></a>
							</td>
						</tr>
						<!-- 存数据*/ -->
						
					</table>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	</script>
</html>
