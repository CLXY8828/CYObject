<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
			th{
				font-size: 14px;
				text-align: center;
			}
			td{
				font-size: 14px;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<%
		int i = 1;
		int count = (Integer)request.getAttribute("count");
		int pagej = (Integer)request.getAttribute("page");
		%>
		<div class="container">
			<div id="header">
				<div class="row">
					<ul class="breadcrumb">
					    <li>就业</li>
					    <li class="active">班级就业</li>
					</ul>
				</div>
				<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
					<img src="../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">班级就业</span>
					<a href="#idenfier" data-toggle="modal" data-target="#addmodal">
						<span id="addclass" style="color:royalblue;float: right;" class="h3">
							<img src="../img/newfolder.png" width="30px" height="30px">
							<span style="">新建就业班级</span>
						</span>
					</a>
				</div>
				<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
				<!-- /*模态框 -->
				<div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="<%=request.getContextPath()%>/classs/set.do?method=add" method="post">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h3 class="modal-title" id="modaltitle">新建就业年级</h3>
								</div>
								<div class="modal-body" style="font-size: 16px;">
									<div class="row">
										<span style="margin-left: 20%;">
											名称：
											<input type="test" name="class_name" id="add_class_name" value=""  onblur="checkadd()"/>	
										</span>
									</div>
									<div class="row" style="margin-top: 3.8%;">
										<span style="margin-left: 14.8%;">
											隶属年级：
											<select name="department_id" style="width: 30%;">
												<c:forEach items="${school_department}" var="map_xi">
												<option value="${map_xi.department_id}">${map_xi.department_name}</option>
												</c:forEach>
											</select>
										</span>
									</div>
									<div class="row"  style="margin-top: 3.8%;">
										<span style="margin-left:9.2%;">
											设定专业老师：
											<select name="tid" style="width: 30%;">
												<option value="无" >无</option>
												<c:forEach items="${zteacher}" var="map_te">
													<option value="${map_te.tid}" >${map_te.tname}</option>
												</c:forEach>
											</select>
										</span>
									</div>
									<br><br>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭
									</button>
									<button type="submit" class="btn btn-primary" id="addnew" disabled="disabled">
										新建
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div style="width: 100%;">
						<table border="0px" cellspacing="5px" cellpadding="0px" style="width: 100%;" class="table">
							<tr>
								<th width="5%">序号</th>
								<th width="9%">名称</th>
								<th width="8%">总人数</th>
								<th width="9%">就业人数</th>
								<th width="8%">就业率</th>
								<th width="10%">隶属年级</th>
								<th width="6%">编辑</th>
								<th width="9%">就业信息</th>
								<th width="6%">删除</th>
								<th width="16%">导入导出学生信息</th>
								<th width="6%">进入</th>
							</tr>
							<!-- /*以下放数据 -->
						<c:forEach items="${list_value}" var="map" >
							<tr>
								<td><%=i++%></td>
								<td>${map.class_name}</td>
								<td>${map.sum}<span>人</span></td>
								<td>${map.job}<span>人</span></td>
								<td>${map.job_lv}<span>%</span></td>
								<td>${map.department_name}</td>
								<td><a href="#idenfier" data-toggle="modal" data-target="#edit${map.class_id}"><img src="../img/edit.png" style="width: 28px;height:28px;" ></a></td>
								<td><a href="#idenfier" data-toggle="modal" data-target="#export${map.class_id}"><img src="../img/export3.png" style="width: 28px;height:28px;" ></a></td>
								<td><a href="#idenfier" data-toggle="modal" data-target="#delete${map.class_id}"><img src="../img/delete.png" style="width: 28px;height: 28px;" ></a></td>
								<td>
									<a href="#idenfier" data-toggle="modal" data-target="#import${map.class_id}"><img src="../img/import.png" style="width:28px;height: 28px; margin-right: 20%" ></a>
									<a href="#idenfier" data-toggle="modal" data-target="#exportstu${map.class_id}"><img src="../img/expoet2.png" style="width: 28px;height: 28px;" ></a>
								</td>
								<td>
								<a><img src="../img/inside.png" style="width: 28px;height: 28px;"></a>
									<!--  <a onclick="gradeindex()"><img src="../img/inside.png" style="width: 28px;height: 28px;"></a>-->
								</td>
							</tr>
						
							<div class="modal fade" id="exportstu${map.class_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">导出学生信息</h3>
										</div>
										<div class="modal-body">
											<span class="h4" style="margin-left: 10%;">你将导出该班级所有学生信息</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="<%=request.getContextPath()%>/classs/set.do?method=exportstu&class_id=${map.class_id}" class="btn btn-primary">确认</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="import${map.class_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">导入学生信息</h3>
											<a href="#idenfier" data-toggle="modal" data-target="#importsingle" class="h3" data-dismiss="modal" style="color: skyblue;">单条信息导入</a>
										</div>
										<div class="modal-body" style="font-size: 16px; margin-left: 20px;">
											<span class="row">
												班级名称：
												<input type="input" name="grade" id="grade" value="" disabled="" style="outline: none;border: none;" />
											</span>
											<span class="row">
												导入学生信息：
												<input type="file" name="stuinfo" id="stuinfo1" value="" accept=".xls, .xlsx"/>
											</span>
											<span class="row">
												<a href="<%=request.getContextPath()%>/classs/set.do?method=download"><span style="color:skyblue;">下载Excel模板</span></a>
											</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="#" class="btn btn-primary" onclick="importExcel('${map.class_id}')">确认</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="importsingle" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form action="<%=request.getContextPath()%>/classs/set.do?method=singleimport&class_id=${map.class_id}" method="post">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h3 class="modal-title" id="modaltitle">单条信息导入</h3>
											</div>
											<div class="modal-body" font-size: 14px; margin-left: 20px;>
												<span class="row">
													<span style="margin-left: 6%;">
														姓名：
														<input type="text" name="name" id="name" value="" />
													</span>
													<span style="margin-left: 5%;">
														性别：
														<input type="radio" name="sex" id="sex" value="男" />男
														<input type="radio" name="sex" id="sex" value="女" />女
													</span>
												</span>
												<span class="row">
													<span style="margin-left: 6%;">
														学号：
														<input type="text" name="stuid" id="stuid" value="" />
													</span>
													<span style="margin-left: 5%;">
														考生号：
														<input type="text" name="gradeid" id="gradeid" value="" />
													</span>
												</span>
												<span class="row">
													<span style="margin-left: 3.7%;">
														手机号：
														<input type="text" name="tel" id="tel" value="" />
													</span>
													<span style="margin-left: 5%;">
														身份证：
														<input type="text" name="selid" id="selid" value="" />
													</span>
												</span>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭
												</button>
												<a href="*" class="btn btn-primary">确认</a>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="modal fade" id="export${map.class_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">导出就业信息</h3>
										</div>
										<div class="modal-body">
											<span class="h4" style="margin-left: 10%;">你将导出该班级就业信息</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="*" class="btn btn-primary">确认</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="delete${map.class_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">删除</h3>
										</div>
										<div class="modal-body">
											<span class="h4" style="margin-left: 10%;">你将删除该班级就业信息</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="#idenfier" data-toggle="modal" data-target="#checkdel${map.class_id}" data-dismiss="modal" class="btn btn-primary">确认</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="checkdel${map.class_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">删除</h3>
										</div>
										<div class="modal-body">
											<span class="h4" style="margin-left: 10%;">这将删除该班级下所有学生</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="<%=request.getContextPath()%>/classs/set.do?method=deleteclass&class_id=${map.class_id}" class="btn btn-danger">确认</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="edit${map.class_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form action="<%=request.getContextPath()%>/classs/set.do?method=edit&class_id=${map.class_id}&page=<%=pagej%>" method="post">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h3 class="modal-title" id="modaltitle">编辑</h3>
											</div>
											<div class="modal-body" style="font-size: 16px;">
												<div class="row">
													<span style="margin-left: 20%;">
														名称：
														<input type="test" name="class_name" id="add_class_name" value="${map.class_name}"/>	
													</span>
												</div>
												<div class="row" style="margin-top: 3.8%;">
													<span style="margin-left: 14.8%;">
														隶属年级：
														<select name="department_id" style="width: 30%;">
															<c:forEach items="${school_department}" var="map_xi">
															<option value="${map_xi.department_id}" 
															${fn:contains(map.department_id,map_xi.department_id)==true? "selected":""}>
															${map_xi.department_name}</option>
															</c:forEach>
														</select>
													</span>
												</div>
												<div class="row"  style="margin-top: 3.8%;">
													<span style="margin-left:9.2%;">
														设定专业老师：
														<select name="tid" style="width: 30%;">
														<option value="无" ${fn:contains(map.tid,"")==true? "selected":""}>无</option>
														<c:forEach items="${zteacher}" var="map_te">
															<option value="${map_te.tid}" 
															${fn:contains(map.tid,map_te.tid)==true? "selected":""}>
															${map_te.tname}</option>
														</c:forEach>
															
														</select>
													</span>
												</div>
												<br><br>
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
						</c:forEach>
							<tr>
							<td colspan="12">
								<div class="row" style="background-color: #e5e5e5;">
									<div  style="float: left;margin-left: 1%;">
									<%if(pagej==1){%>
									<span onclick="del()" class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/classs/set.do?method=query&page=<%=(pagej-1)%>"><span class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
									<%} %>
									<%if(pagej==((count/10)!=0&count!=10?((count/10)+1):1)){%>
									<span onclick="add()" class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/classs/set.do?method=query&page=<%=(pagej+1)%>"><span class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
									<%} %>
									</div>
									<span style="float: left; margin-left: 10px;">
										<span><%=count %></span>条总记录数
									</span>
									<span style="float: left; margin-left: 20px;">
										显示<span><%=(count/10)!=0&count!=10?((count/10)+1):1%></span>页
									</span>
									<span style="float: left; margin-left: 35px;">
										跳转至
										<input type="text" onblur="pagenum1(this.value)" name="pagenum" id="pagenum" value="<%=pagej %>" style="width: 35px;" />
										页
									</span>
								</div>
							</td>
						</tr>
			<!-- 以上存数据*/ -->
						</table>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function importExcel(id)
		{
			var fed=$("#stuinfo1").val();
			if(fed.length<=0){
			 alert("请选择需要导入的excel的文件");
	         return false;					
			}
			var url= "<%=request.getContextPath() %>/classs/set.do?method=importExcel&fed="+fed+"&class_id=+"+id+"";				   
			 window.location.href=encodeURI(url); 
		}
		
		var page = <%=pagej%>;
		function add() {
			alert("已经是最后一页了！")
		}
		function del() {
			alert("前面没有了！")
		}
		
		function pagenum1(num) {
			if(num<=<%=(count/10)!=0?((count/10)+1):1%>){
				var url= "<%=request.getContextPath()%>/classs/set.do?method=query&page="+num+"";	
				  window.location.href=encodeURI(url);	
			}else{
				document.getElementById("pagenum").value = page;
				alert("没有当前页数")
			}
		}
		function gradeindex(){
			top.location.href="classinfo/classindex.jsp"
		}
		function checkadd(){
			var name=$("#add_class_name").val().trim();
			if(name==""){
				$("#addnew").attr("disabled","disabled");
			}else{
				$('#addnew').removeAttr("disabled");
			}
		}
	</script>
</html>