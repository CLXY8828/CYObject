<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>18级就业详情</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
				    <li class="active">未就业信息详情</li>
				</ul>
			</div>
			<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
				<form action="/*" method="post">
					<img src="../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">未就业详情信息表</span>
					<span id="allexport" style="color: #00FFFF;top: 28px;position: absolute;left:80px;top:73px;" class="h4"><a href="#idenfier" data-toggle="modal" data-target="#exportall" style="margin-right: 20px;">一键导出</a><a onclick="chose()">选中导出</a></span>
					<span id="choseexport" style="color: #00FFFF;top: 28px;position: absolute;left:80px;top:73px;display: none;" class="h4"><a onclick="nochose()" style="margin-right: 20px;">取消选中</a><a href="#idenfier" data-toggle="modal" data-target="#makesureexport">导出</a></span>
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
			<div class="modal fade" id="makesureexport" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 class="modal-title" id="modaltitle">导出学生信息</h3>
						</div>
						<div class="modal-body">
							<span class="h4" style="margin-left: 10%;">你将导出所选中学生信息详情表</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<a onclick="checkexport(exportform)" class="btn btn-primary" data-dismiss="modal">确认</a>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="exportall" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 class="modal-title" id="modaltitle">导出学生信息</h3>
						</div>
						<div class="modal-body">
							<span class="h4" style="margin-left: 10%;">你将导出该年级未就业学生信息详情表</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<a href="*" class="btn btn-primary">确认</a>
						</div>
					</div>
				</div>
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
							<th width="10%">联系电话</th>
							<th width="19%">邮箱</th>
							<th width="5%">编辑</th>
							<th width="5%">详情</th>
							<th width="5%"><span name="exportnochose">导出</span>
							<span name="exportcheckedc" style="display: none;">选中</span></th>
						</tr>
						<tr>
							<td>1</td>
							<td>张三</td>
							<td>1511307526</td>
							<td>130603********0918</td>
							<td>17130601111</td>
							<td>999999999</td>
							<td>123456789@123.com</td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#edit"><img src="../img/edit.png" style="width: 28px;height:28px;" ></a></td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#view"><img src="../img/view.png" style="width: 28px;height: 28px;" ></a></td>
							<td>
								<a href="#idenfier" data-toggle="modal" data-target="#exportsingle" name="exportnochose"><img src="../img/expoet2.png" style="width:28px;height: 28px;" ></a>
								<input type="checkbox" name="exportchecked" value="" style="display: none;width: 20px;height: 20px;padding-left: 10px;" />
							</td>
						</tr>
		<!-- 导出模态框 -->
						<div class="modal fade" id="exportsingle" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<div class="row">
											<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">简历
										</div>
									</div>
									<div class="modal-body">
										<span class="h4" style="margin-left: 10%;">你将导出该学生的未就业详细信息表</span>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<a href="/*" class="btn btn-primary">确认</a>
									</div>
								</div>
							</div>
						</div>
			<!-- 查看模态框 -->
						<div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<div class="row">
											<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">查看
											<a href="#idenfier" data-toggle="modal" data-target="#resume" data-dismiss="modal"><span class="h3">查看该生简历</span></a></h3>
										</div>
									</div>
									<div class="modal-body" style="font-size: 14px; margin-left: 20px;">
										<div>
											<div class="row">
												<span  class="h4">个人信息</span>
											</div>
											<br>
											<div class="row">
												<span style="margin-left: 2%;">
													姓名：
													<input type="text" name="username_edit" id="username_edit" value="" style="width: 6%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 2%;">
													性别：
													<input type="text" name="sex_edit" id="sex_edit" value="" style="width: 4%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 2%;">
													学号：
													<input type="text" name="scid_edit" id="scid_edit" value="" style="width: 20%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 2%;">
													身份证号：
													<input type="text" name="identity_edit" id="identity_edit" value="" style="width: 25%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													手机号：
													<input type="text" name="tel_edit" id="tel_edit" value="" style="width: 12%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 3%;">
													QQ：
													<input type="text" name="qq_edit" id="qq_edit" value="" style="width: 12%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left:3%;">
													邮箱：
													<input type="email" name="email_edit" id="email_edit" value="" style="width: 16%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 3%;">
													是否就业：
													<input type="radio" name="gowork_edit" id="gowork_edit" value="是" />是
													<input type="radio" name="gowork_edit" id="gowork_edit" value="否" />否
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												
												<span style="margin-left: 6%;">
													现居住地：
													<input type="text" name="home_edit" id="home_edit" value="" style="width: 30%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
										</div>
										<div style="margin-top: 2%;">
											<div class="row" style="margin-top: 1.5%;">
												<span  class="h4">其他信息</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													在校期间是否获取过奖状：
													<input type="radio" id="certificate" name="certificate" value="" />是
													<input type="radio" id="certificate" name="certificate" value="" style="margin-left: 2%;"/>否
												</span>
												<span style="margin-left: 20%;">
													在校期间是否获得过三好学生：
													<input type="radio" name="threehao" id="threehao" value="" />是
													<input type="radio" name="threehao" id="threehao" value="" style="margin-left: 2%;"/>否
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													在校期间是否担任班委：
													<input type="radio" name="committee" id="committee" value="" />是
													<input type="radio" name="committee" id="committee" value="" style="margin-left: 2%;"/>否
												</span>
												<span style="margin-left: 21.7%;">
													在校期间是否参加过活动：
													<input type="radio" name="activity" id="activity" value="" />是
													<input type="radio" name="activity" id="activity" value="" style="margin-left: 2%;"/>否
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<div>
													<span name="uploadspan">个人获得的荣誉：</span><br>
													<textarea rows="2" cols="97%" name="workrequire_upload" style="width: 97%;outline: none;border: none;" id="workrequire_upload"  disabled="disabled"></textarea>
												</div>
												<div>
													<span name="uploadspan">擅长的技能：</span><br>
													<textarea rows="2" cols="97%" name="cominfo_upload" style="width: 97%;outline: none;border: none;" id="cominfo_upload"  disabled="disabled"></textarea>
												</div>
												<div>
													<span name="uploadspan">自我的评价：</span><br>
													<textarea rows="2" cols="97%" name="tips_upload" style="width: 97%;outline: none;border: none;" id="tips_upload"  disabled="disabled"></textarea>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<button type="submit" class="btn btn-primary">
											确定
										</button>
									</div>
								</div>
							</div>
						</div>
		<!-- 简历 -->
						<div class="modal fade" id="resume" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<div class="row">
											<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">简历
										</div>
									</div>
									<div class="modal-body" style="overflow:auto;height: 500px; width: 100%;">
										<img src="../img/resume.png" width="100%">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<button type="button" class="btn btn-primary" data-dismiss="modal">
											确定
										</button>
									</div>
								</div>
							</div>
						</div>
		<!-- 编辑模态框 -->
						<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<form action="/*" method="post" name="editform">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<div class="row">
												<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">编辑
												<a href="#idenfier" data-toggle="modal" data-target="#checkdel"><span class="h3">删除该学生信息</span></a></h3>
												<div class="modal fade" id="checkdel" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
																<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">编辑</h3>
															</div>
															<div class="modal-body">
																<span class="h4" style="margin-left: 10%;">你将导出该学生的就业详细信息表</span>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default" data-dismiss="modal">关闭
																</button>
																<a href="/*" class="btn btn-danger">确认</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-body" style="font-size: 14px; margin-left: 20px;">
											<div>
												<div class="row">
													<span  class="h4">个人信息</span>
												</div>
												<br>
												<div class="row">
													<span style="margin-left: 2%;">
														姓名：
														<input type="text" name="username_edit" id="username_edit" value="" style="width: 6%;" />
													</span>
													<span style="margin-left: 2%;">
														性别：
														<input type="text" name="sex_edit" id="sex_edit" value="" style="width: 4%;" />
													</span>
													<span style="margin-left: 2%;">
														学号：
														<input type="text" name="scid_edit" id="scid_edit" value="" style="width: 20%;" />
													</span>
													<span style="margin-left: 2%;">
														身份证号：
														<input type="text" name="identity_edit" id="identity_edit" value="" style="width: 25%;" />
													</span>
												</div>
												<div class="row" style="margin-top: 1.5%;">
													<span style="margin-left: 2%;">
														手机号：
														<input type="text" name="tel_edit" id="tel_edit" value="" style="width: 12%;" />
													</span>
													<span style="margin-left: 3%;">
														QQ：
														<input type="text" name="qq_edit" id="qq_edit" value="" style="width: 12%;" />
													</span>
													<span style="margin-left:3%;">
														邮箱：
														<input type="email" name="email_edit" id="email_edit" value="" style="width: 16%;"/>
													</span>
													<span style="margin-left: 3%;">
														是否就业：
														<input type="radio" name="gowork_edit" id="gowork_edit" value="是" />是
														<input type="radio" name="gowork_edit" id="gowork_edit" value="否" />否
													</span>
												</div>
												<div class="row" style="margin-top: 1.5%;">
													<span style="margin-left: 2%;">
														毕业去向：
														<input type="text" name="where_edit" id="where_edit" value="" style="width: 30%;" />
													</span>
													<span style="margin-left: 6%;">
														现居住地：
														<input type="text" name="home_edit" id="home_edit" value="" style="width: 30%;" />
													</span>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<button type="submit" class="btn btn-primary">
												确定
											</button>
										</div>
									</form>
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
		function chose(){
			$("#allexport").css("display","none");
			$("#choseexport").css("display","block");
			$('[name="exportchecked"]').css("display","block");
			$('[name="exportcheckedc"]').css("display","block");
			$('[name="exportnochose"]').css("display","none");
		}
		function nochose(){
			$("#allexport").css("display","block");
			$("#choseexport").css("display","none");
			$('[name="exportchecked"]').css("display","none");
			$('[name="exportcheckedc"]').css("display","none");
			$('[name="exportnochose"]').css("display","block");
		}
		function checkexport(exportform){
			var flag = false;
			var exportid=document.getElementsByName("exportchecked");
			
			for (var i = 0; i < exportid.length; i++) {
				if (exportid[i].checked) {
					flag = true;
					break;
				}
			}
			if (!flag) {
				alert("你并未选中任何信息");
				return false;
			} else {
				exportform.submit();
			}
		}
	</script>
</html>
