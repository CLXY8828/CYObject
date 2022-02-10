<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>${map_grade.department_name}就业详情</title>
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
					<li><span>${map_grade.department_name}</span>就业信息</li>
				    <li class="active">就业信息详情</li>
				</ul>
			</div>
			<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
				<form action="/*" method="post">
					<img src="../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">就业详情信息表</span>
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
							<a onclick="checkexport(exportform,'<%=request.getContextPath()%>/gradework/work.do?method=exportchose')" class="btn btn-primary" data-dismiss="modal">确认</a>
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
							<span class="h4" style="margin-left: 10%;">你将导出该年级学生信息详情表</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<a href="<%=request.getContextPath()%>/gradework/work.do?method=exportall" class="btn btn-primary">确认</a>
						</div>
					</div>
				</div>
			</div>
			<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
			<div style="width: 100%;">
				<form action="/*" method="post" name="exportform"  id="exportform">
					<table border="0px" cellspacing="5px" cellpadding="0px" class="table" style="width:100%">
						<tr>
							<th width="5%">序号</th>
							<th width="10%">姓名</th>
							<th width="10%">学号</th>
							<th width="15%">身份证</th>
							<th width="13%">考生号</th>
							<th width="10%">联系电话</th>
							<th width="19%">单位名称</th>
							<th width="5%">编辑</th>
							<th width="5%">详情</th>
							<th width="5%"><span name="exportnochose">导出</span>
							<span name="exportcheckedc" style="display: none;">选中</span></th>
						</tr>
						<%
						int i = 1;
						int count = (Integer)request.getAttribute("count");
						int pagej = (Integer)request.getAttribute("page");
						%>
						<c:forEach items="${list_value}" var="map" >
						<tr>
							<td><%=i++ %></td>
							<td>${map.name}</td>
							<td>${map.sid}</td>
							<td>${map.IDnumber}</td>
							<td>${map.examinee_id}</td>
							<td>${map.phone}</td>
							<td>${map.company_name}</td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#edit${map.id}"><img src="../img/edit.png" style="width: 28px;height:28px;" ></a></td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#view${map.id}"><img src="../img/view.png" style="width: 28px;height: 28px;" ></a></td>
							<td>
								<a href="#idenfier" data-toggle="modal" data-target="#exportsingle${map.id}" name="exportnochose"><img src="../img/expoet2.png" style="width:28px;height: 28px;" ></a>
								<input type="checkbox" name="exportchecked" value="" style="display: none;width: 20px;height: 20px;padding-left: 10px;" />
							</td>
						</tr>
		<!-- 导出模态框 -->
						<div class="modal fade" id="exportsingle${map.id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<div class="row">
											<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">导出
										</div>
									</div>
									<div class="modal-body">
										<span class="h4" style="margin-left: 10%;">你将导出该学生的就业详细信息表</span>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<a href="<%=request.getContextPath()%>/gradework/work.do?method=exportsingle&id=${map.id}" class="btn btn-primary">确认</a>
									</div>
								</div>
							</div>
						</div>
			<!-- 查看模态框 -->
						<div class="modal fade" id="view${map.id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<div class="row">
											<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">查看
											<a href="#idenfier" data-toggle="modal" data-target="#resume${map.id}" data-dismiss="modal"><span class="h3">查看该生简历</span></a></h3>
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
													<input type="text" name="username_edit" id="username_edit" value="${map.name}" style="width: 6%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 2%;">
													性别：
													<input type="text" name="sex_edit" id="sex_edit" value="${map.ssex}" style="width: 4%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 2%;">
													学号：
													<input type="text" name="scid_edit" id="scid_edit" value="${map.sid}" style="width: 20%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 2%;">
													身份证号：
													<input type="text" name="identity_edit" id="identity_edit" value="${map.IDnumber}" style="width: 25%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													手机号：
													<input type="text" name="tel_edit" id="tel_edit" value="${map.phone}" style="width: 12%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 3%;">
													QQ：
													<input type="text" name="qq_edit" id="qq_edit" value="${map.sqq}" style="width: 12%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left:3%;">
													邮箱：
													<input type="email" name="email_edit" id="email_edit" value="${map.email}" style="width: 16%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 3%;">
													是否就业：
													<c:if test="${map.employment_status==1}">
													<input type="radio" name="gowork_edit" id="gowork_edit" value="是" />是
													</c:if>
													<c:if test="${map.employment_status==0}">
													<input type="radio" name="gowork_edit" id="gowork_edit" value="否" />否
													</c:if>
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													毕业去向：
													<input type="text" name="where_edit" id="where_edit" value="${map.destination_explain}" style="width: 30%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 6%;">
													现居住地：
													<input type="text" name="home_edit" id="home_edit" value="${map.sutdent_address}" style="width: 30%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
										</div>
										<div style="margin-top: 2%;">
											<div class="row" style="margin-top: 1.5%;">
												<span  class="h4">公司信息</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													单位组织机构代码：
													<input type="text" name="organiza_edit" id="organiza_edit" value="${map.company_code}" style="width: 25.5%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 6%;">
													单位性质：
													<input type="text" name="unit_edit" id="unit_edit" value="${map.nature_name}" style="width: 30%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													单位名称：
													<input type="text" name="organizaname_edit" id="organiza_edit" value="${map.company_name}" style="width: 25.5%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 6%;">
													单位行业：
													<input type="text" name="industry_edit" id="industry_edit" value="${map.industry_name}" style="width: 35%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													单位所在地：
													<input type="text" name="organizaaddress_edit" id="organizaaddress_edit" value="${map.companyaddress_name}" style="width: 30%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 2%;">
													工作职业类别：
													<input type="text" name="industry_edit" id="industry_edit" value="${map.positiontype_name}" style="width: 30%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
										</div>
										<div style="margin-top: 2%;">
											<div class="row" style="margin-top: 1.5%;">
												<span  class="h4">公司联系信息</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													单位联系人：
													<input type="text" name="work_contact" id="work_contact" value="${map.contact_person}" style="width: 7%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 3%;">
													联系人电话：
													<input type="text" name="contact_tel_edit" id="contact_tel_edit" value="${map.sphone}" style="width: 13%;outline: none;border: none;" disabled="disabled"/>
												</span>
												<span style="margin-left: 5%;">
													联系人电子邮箱：
													<input type="email" name="contact_email_edit" id="contact_email_edit" value="${map.contact_email}" style="width: 15%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span>
													单位地址：
													<input type="text" name="work_address" id="work_address" value="${map.company_address}" style="width: 23%;outline: none;border: none;" disabled="disabled"/>
												</span>
											</div>
										</div>
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
		<!-- 简历 -->
						<div class="modal fade" id="resume${map.id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<div class="row">
											<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">简历
										</div>
									</div>
									<div class="modal-body" style="overflow:auto;height: 500px; width: 100%;">
									<iframe src="<c:url value="../pdfjs/web/viewer.jsp" />?file=<%=request.getContextPath()%>/gradework/work.do?method=download&id=${map.id}" width="100%" height="800"></iframe>
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
						<div class="modal fade" id="edit${map.id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<div class="row">
											<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">编辑
											<a href="#idenfier" data-toggle="modal" data-target="#checkdel${map.id}"><span class="h3">删除该学生信息</span></a></h3>
											<div class="modal fade" id="checkdel${map.id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
															<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">编辑</h3>
														</div>
														<div class="modal-body">
															<span class="h4" style="margin-left: 10%;">你将删除该学生的信息</span>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default" data-dismiss="modal">关闭
															</button>
															<a href="<%=request.getContextPath()%>/gradework/work.do?method=deletework&id=${map.id}" class="btn btn-danger">确认</a>
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
													<input type="text" name="name" id="username_edit" value="${map.name}" style="width: 6%;" />
												</span>
												<span style="margin-left: 2%;">
													性别：
													<input type="text" name="ssex" id="sex_edit" value="${map.ssex}" style="width: 4%;" />
												</span>
												<span style="margin-left: 2%;">
													学号：
													<input type="text" name="sid" id="scid_edit" value="${map.sid}" style="width: 20%;" />
												</span>
												<span style="margin-left: 2%;">
													身份证号：
													<input type="text" name="IDnumber" id="identity_edit" value="${map.IDnumber}" style="width: 25%;" />
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													手机号：
													<input type="text" name="phone" id="tel_edit" value="${map.phone}" style="width: 12%;" />
												</span>
												<span style="margin-left: 3%;">
													QQ：
													<input type="text" name="sqq" id="qq_edit" value="${map.sqq}" style="width: 12%;" />
												</span>
												<span style="margin-left:3%;">
													邮箱：
													<input type="email" name="email" id="email_edit" value="${map.email}" style="width: 16%;"/>
												</span>
												<span style="margin-left: 3%;">
													是否就业：
													<input type="radio" name="gowork_edit" id="gowork_edit" value="是" 
													${fn:contains(map.employment_status,"1")==true? "checked":""}/>是
													<input type="radio" name="gowork_edit" id="gowork_edit" value="否" 
													${fn:contains(map.employment_status,"0")==true? "checked":""}/>否
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													毕业去向：
													<input type="text" name="destination_explain" id="where_edit" value="${map.destination_explain}" style="width: 30%;" />
												</span>
												<span style="margin-left: 6%;">
													现居住地：
													<input type="text" name="sutdent_address" id="home_edit" value="${map.sutdent_address}" style="width: 30%;" />
												</span>
											</div>
										</div>
										<div style="margin-top: 2%;">
											<div class="row" style="margin-top: 1.5%;">
												<span  class="h4">公司信息</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													单位组织机构代码：
													<input type="text" name="company_code" id="organiza_edit" value="${map.company_code}" style="width: 25.5%;" />
												</span>
												<span style="margin-left: 6%;">
													单位性质：
													<input type="text" name="nature_name" id="unit_edit" value="${map.nature_name}" style="width: 30%;" />
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													单位名称：
													<input type="text" name="company_name" id="organiza_edit" value="${map.company_name}" style="width: 25.5%;" />
												</span>
												<span style="margin-left: 6%;">
													单位行业：
													<input type="text" name="industry_name" id="industry_edit" value="${map.industry_name}" style="width: 35%;" />
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													单位所在地：
													<input type="text" name="companyaddress_name" id="organizaaddress_edit" value="${map.companyaddress_name}" style="width: 30%;" />
												</span>
												<span style="margin-left: 2%;">
													工作职业类别：
													<input type="text" name="positiontype_name" id="industry_edit" value="${map.positiontype_name}" style="width: 30%;" />
												</span>
											</div>
										</div>
										<div style="margin-top: 2%;">
											<div class="row" style="margin-top: 1.5%;">
												<span  class="h4">公司联系信息</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span style="margin-left: 2%;">
													单位联系人：
													<input type="text" name="contact_person" id="work_contact" value="${map.contact_person}" style="width: 7%;" />
												</span>
												<span style="margin-left: 3%;">
													联系人电话：
													<input type="text" name="sphone" id="contact_tel_edit" value="${map.sphone}" style="width: 13%;" />
												</span>
												<span style="margin-left: 5%;">
													联系人电子邮箱：
													<input type="email" name="contact_email" id="contact_email_edit" value="${map.contact_email}" style="width: 15%;" />
												</span>
											</div>
											<div class="row" style="margin-top: 1.5%;">
												<span>
													单位地址：
													<input type="text" name="company_address" id="work_address" value="${map.company_address}" style="width: 23%;"/>
												</span>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<button type="button" onclick="editform('<%=request.getContextPath()%>/gradework/work.do?method=workedit&id=${map.id}')" class="btn btn-primary">
											确定
										</button>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
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
		function checkexport(exportform,id){
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
				var form=document.getElementById("exportform");
				form.setAttribute("action",id);
				form.submit();
			}
		}
		function editform(id){
			var form=document.getElementById("exportform");
			form.setAttribute("action",id);
			form.submit();
		}
	</script>
</html>
