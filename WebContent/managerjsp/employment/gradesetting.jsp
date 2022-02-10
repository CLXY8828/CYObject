<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					    <li class="active">年级就业</li>
					</ul>
				</div>
				<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
					<img src="../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">年级就业</span>
					<a href="#idenfier" data-toggle="modal" data-target="#addmodal">
						<span id="addclass" style="color:royalblue;float: right;" class="h3">
							<img src="../img/newfolder.png" width="30px" height="30px">
							<span style="">新建就业年级</span>
						</span>
					</a>
				</div>
				<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
				<!-- /*模态框 -->
				<div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="<%=request.getContextPath()%>/grade/grade.do?method=add&page=<%=pagej %>" method="post">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h3 class="modal-title" id="modaltitle">新建就业年级</h3>
								</div>
								<div class="modal-body" style="font-size: 14px; margin-left: 20px;">
									
									<span>
										名称：
										<input type="test" name="department_name" id="add_class_name" value="" onblur="checkadd()"/>	
									</span>
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
								<th width="10%">未就业人数</th>
								<th width="8%">就业率</th>
								<th width="10%">下创班级</th>
								<th width="6%">编辑</th>
								<th width="9%">就业信息</th>
								<th width="6%">删除</th>
								<th width="9%">导出信息</th>
								<th width="6%">进入</th>
							</tr>
							<!-- /*以下放数据 -->
							<c:forEach items="${list_value}" var="map" >
							<tr>
								<td><%=i++ %></td>
								<td>${map.department_name}</td>
								<td>${map.sum}<span>人</span></td>
								<td>${map.job}<span>人</span></td>
								<td>${map.no_job}<span>人</span></td>
								<td>${map.job_lv}<span>%</span></td>
								<td>${map.class_num}<span>个</span></td>
								<td><a href="#idenfier" data-toggle="modal" data-target="#edit${map.department_id}"><img src="../img/edit.png" style="width: 28px;height:28px;" ></a></td>
								<td><a href="#idenfier" data-toggle="modal" data-target="#export${map.department_id}"><img src="../img/export3.png" style="width: 28px;height:28px;" ></a></td>
								<td><a href="#idenfier" data-toggle="modal" data-target="#delete${map.department_id}"><img src="../img/delete.png" style="width: 28px;height: 28px;" ></a></td>
								<td>
									<a href="#idenfier" data-toggle="modal" data-target="#exportstu${map.department_id}"><img src="../img/expoet2.png" style="width: 28px;height: 28px;" ></a>
								</td>
								<td>
									<a onclick="gradeindex('${map.department_id}')"><img src="../img/inside.png" style="width: 28px;height: 28px;"></a>
								</td>
							</tr>
							<div class="modal fade" id="exportstu${map.department_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">导出学生信息</h3>
										</div>
										<div class="modal-body">
											<span class="h4" style="margin-left: 10%;">你将导出该年级所有学生信息</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="<%=request.getContextPath()%>/grade/grade.do?method=exportstu&department_id=${map.department_id}&page=<%=pagej %>" class="btn btn-primary" onclick="return exportsingle('#exportstu${map.department_id}')">确认</a>
										</div>
									</div>
								</div>
							</div>
							
							<div class="modal fade" id="export${map.department_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">导出就业信息</h3>
										</div>
										<div class="modal-body">
											<span class="h4" style="margin-left: 10%;">你将导出该年级就业信息</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="<%=request.getContextPath()%>/grade/grade.do?method=export&department_id=${map.department_id}&page=<%=pagej %>" class="btn btn-primary" onclick="return exportsingle('#export${map.department_id}')">确认</a>										
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="delete${map.department_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">删除</h3>
										</div>
										<div class="modal-body">
											<span class="h4" style="margin-left: 10%;">你将删除该年级就业信息</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="#idenfier" data-toggle="modal" data-target="#checkdel${map.department_id}" data-dismiss="modal" class="btn btn-primary">确认</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="checkdel${map.department_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">删除</h3>
										</div>
										<div class="modal-body">
											<span class="h4" style="margin-left: 10%;">这将删除该年级下所有班级</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
											<a href="<%=request.getContextPath()%>/grade/grade.do?method=delete&department_id=${map.department_id}&page=<%=pagej %>" class="btn btn-danger">确认</a>
										</div>
									</div>
								</div>
							</div>  
							<div class="modal fade" id="edit${map.department_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form action="<%=request.getContextPath()%>/grade/grade.do?method=edit&department_id=${map.department_id}&page=<%=pagej %>" method="post">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h3 class="modal-title" id="modaltitle">编辑</h3>
											</div>
											<div class="modal-body" style="font-size: 14px; margin-left: 20px;">
												<span>
													名称：
													<input type="text" name="department_name" id="edit_class" value="${map.department_name}" />
												</span><br>
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
										<a href="<%=request.getContextPath()%>/grade/grade.do?method=query&page=<%=(pagej-1)%>"><span class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
									<%} %>
									<%if(pagej==((count/10)!=0&count!=10?((count/10)+1):1)){%>
									<span onclick="add()" class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/grade/grade.do?method=query&page=<%=(pagej+1)%>"><span class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
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
		var page = <%=pagej%>;
		function add() {
			alert("已经是最后一页了！")
		}
		function del() {
			alert("前面没有了！")
		}
		
		function pagenum1(num) {
			if(num<=<%=(count/10)!=0?((count/10)+1):1%>){
				var url= "<%=request.getContextPath()%>/grade/grade.do?method=query&page="+num+"";	
				  window.location.href=encodeURI(url);	
			}else{
				document.getElementById("pagenum").value = page;
				alert("没有当前页数")
			}
		}
		function gradeindex(id){
			var url= "<%=request.getContextPath()%>/grade/grade.do?method=turn&department_id="+id+"";	
			  top.location.href=encodeURI(url);	
			  
		}
		function exportsingle(id){
			$(id).modal("hide");
			return true;
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
