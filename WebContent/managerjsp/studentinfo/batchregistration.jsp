<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>批量注册</title>
		<link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="../bootstrap-3.3.7-dist/js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="../bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
	<%
		int i = 1;
		int count = (Integer)request.getAttribute("count");
		int pagej = (Integer)request.getAttribute("page");
		%>
		<div class="container">
			<div class="row">
				<ul class="breadcrumb">
				    <li>学生信息管理</li>
				    <li class="active">批量注册</li>
				</ul>
			</div>
			<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
				<form action="<%=request.getContextPath()%>/student/info.do?method=queryinfo&page=<%=pagej %>" method="post">
					<img src="../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">批量注册</span>
					<span style="color: #00FFFF;top: 28px;position: absolute;left:80px;top:73px;" class="h4"><a href="#idenfier" data-toggle="modal" data-target="#importba" style="margin-right: 20px;">导入学生信息</a></span>
					<span style="float: right;padding-top: 10px;" class="h4">
						<select name="queryinfo" style="width: 90px;height: 30.5px;border-radius: 10px 0px 0px 10px;">
							<option value="name" <%="name".equals(request.getAttribute("queryinfo"))?"selected":""%>>姓名</option>
							<option value="stu_id" <%="stu_id".equals(request.getAttribute("queryinfo"))?"selected":""%>>学号</option>
						</select>
						<input type="text" name="queryCondition" id="queryCondition" value="" style="width: 300px;height: 30px;margin-left: -8px;border-radius: 0px 10px 10px 0px;" />
						<input type="submit" value="搜索" style="height: 33px;width: 90px;margin-left: -8px;font-size: 14px;margin-top: -3px;border-radius: 10px;" class="btn btn-primary" />
					</span>
				</form>
			</div>
	<!-- 批量导入 -->
			<div class="modal fade" id="importba" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h3 class="modal-title" id="modaltitle">导入学生信息</h3>
							<a href="#idenfier" data-toggle="modal" data-target="#importsingle" class="h3" data-dismiss="modal" style="color: skyblue;">单条信息导入</a>
						</div>
						<div class="modal-body" style="font-size: 16px; margin-left: 20px;">
							<span class="row">
								导入学生信息：
								<input type="file" name="stuinfo" id="stuinfo1" value="" accept=".xls, .xlsx" />
							</span>
							<span class="row">
								<a href="<%=request.getContextPath() %>/student/info.do?method=xiazaimoban"><span style="color:skyblue;">下载Excel模板</span></a>
							</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<a href="#" class="btn btn-primary" onclick="importExcel()">确认</a>
						</div>
					</div>
				</div>
			</div>
	<!-- 单条导入 -->
			<div class="modal fade" id="importsingle" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<form action="<%=request.getContextPath() %>/student/info.do?method=singileadd" method="post">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h3 class="modal-title" id="modaltitle">单条信息导入</h3>
							</div>
							<div class="modal-body" font-size: 14px; margin-left: 20px;>
								<span class="row">
									<span style="margin-left: 8%;">
										姓名：
										<input type="text" name="data_sname" id="name_import" value="" style="width: 35%;" />
									</span>
									<span style="margin-left: 8%;">
										性别：
										<input type="radio" name="data_sex" id="sex" value="男" />男
										<input type="radio" name="data_sex" id="sex" value="女" />女
									</span>
									<span style="margin-left: 4.2%;">
										民族：
										<input type="text" name="data_nation" id="ethnic_import" value="" style="width: 17%;" />
									</span>
								</span>
								<span class="row">
									<span style="margin-left: 8%;">
										班级：
										<input type="text" name="data_class" id="class_import" value="" style="width: 35%;" />
									</span>
									<span style="margin-left: 5.8%;">
										学籍号：
										<input type="text" name="data_scrollnum" id="status_import" value="" style="width: 35%;" />
									</span>
									
								</span>
								<span class="row">
									<span style="margin-left: 1.1%;">
										家庭联系方式：
										<input type="text" name="data_homephone" id="hometel_import" value="" style="width: 35%;" />
									</span>
									<span style="margin-left: 8.2%;">
										QQ：
										<input type="text" name="data_qq" id="qq_import" value="" style="width: 35%;" />
									</span>
								</span>
								<span class="row">
									<span style="margin-left: 6.4%;">
										身份证：
										<input type="text" name="data_IDnumber" id="selid_import" value="" style="width: 35%;" />
									</span>
									<span style="margin-left: 5.7%;">
										考生号：
										<input type="text" name="data_examid" id="stuid_import" value="" style="width: 35%;" />
									</span>
									
								</span>
								<span class="row">
									<span style="margin-left: 3%;">
										户籍所在地：
										<input type="text" name="data_registeraddress" id="household_import" value="" style="width: 35%;" />
									</span>
									<span style="margin-left: 7.3%;">
										学号：
										<input type="text" name="data_sid" id="stuid_import" value="" style="width: 35%;" />
									</span>
								</span>
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
			<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
	<!-- 查询数据 -->
			<div style="width: 100%;">
				
					<table border="0px" cellspacing="5px" cellpadding="0px" class="table" style="width:100%">
						<tr>
							<th width="5%">序号</th>
							<th width="10%">姓名</th>
							<th width="10%">学号</th>
							<th width="15%">身份证</th>
							<th width="13%">考生号</th>
							<th width="10%">家庭联系电话</th>
							<th width="10%">是否绑定</th>
							<th width="5%">编辑</th>
							<th width="5%">详情</th>
							<th width="5%">删除</th>
						</tr>
						<!-- 循环从这开始 -->
						<c:forEach var="map" items="${list}" >	
						<tr>
							<td><%=i++ %></td>
							<td>${map.data_sname}</td>
							<td>${map.data_sid}</td>
							<td>${map.data_IDnumber}</td>
							<td>${map.data_examid}</td>
							<td>${map.data_homephone}</td>
							<td>
							<c:if test="${map.data_state==0}">
							<span>否</span>
							</c:if>
							<c:if test="${map.data_state==1}">
							<span>是</span>
							</c:if>
							</td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#edit${map.data_id}"><img src="../img/edit.png" style="width: 28px;height:28px;" ></a></td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#view${map.data_id}"><img src="../img/view.png" style="width: 28px;height: 28px;" ></a></td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#checkdel${map.data_id}"><img src="../img/delete.png" style="width:28px;height: 28px;" ></a></td>
						</tr>
		<!-- 删除 -->
						<div class="modal fade" id="checkdel${map.data_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;color: red;">删除</h3>
									</div>
									<div class="modal-body">
										<span class="h4" style="margin-left: 10%;">你将删除该学生的信息</span>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<a href="<%=request.getContextPath() %>/student/info.do?method=indelete&student_id=${map.data_id}" class="btn btn-danger">确认</a>
									</div>
								</div>
							</div>
						</div>
		<!-- 查看模态框 -->
						<div class="modal fade" id="view${map.data_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h3 class="modal-title" id="modaltitle">查看</h3>
									</div>
									<div class="modal-body" font-size: 14px; margin-left: 20px;>
										<span class="row">
											<span style="margin-left: 8%;">
												姓名：
												<input type="text" name="name_view" id="name_view" value="${map.data_sname}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
											<span style="margin-left: 7.6%;">
												性别：
												<input type="text" name="sex_view" id="sex_view" value="${map.data_sex}" style="width: 10%;border: none;outline: none;" disabled="disabled" />
											</span>
											<span style="margin-left: 2.7%;">
												民族：
												<input type="text" name="ethnic_view" id="ethnic_view" value="${map.data_nation}" style="width: 16%;border: none;outline: none;" disabled="disabled" />
											</span>
										</span>
										<span class="row">
											<span style="margin-left: 8%;">
												班级：
												<input type="text" name="class_view" id="class_view" value="${map.data_class}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
											<span style="margin-left: 5.8%;">
												学籍号：
												<input type="text" name="status_view" id="status_view" value="${map.data_scrollnum}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
											
										</span>
										<span class="row">
											<span style="margin-left: 1.1%;">
												家庭联系方式：
												<input type="text" name="hometel_view" id="hometel_view" value="${map.data_homephone}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
											<span style="margin-left: 8.2%;">
												QQ：
												<input type="text" name="qq_view" id="qq_view" value="${map.data_qq}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
										</span>
										<span class="row">
											<span style="margin-left: 6.4%;">
												身份证：
												<input type="text" name="selid_view" id="selid_view" value="${map.data_IDnumber}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
											<span style="margin-left: 5.7%;">
												考生号：
												<input type="text" name="stuid_view" id="stuid_view" value="${map.data_examid}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
											
										</span>
										<span class="row">
											<span style="margin-left: 3%;">
												户籍所在地：
												<input type="text" name="household_view" id="household_view" value="${map.data_registeraddress}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
											<span style="margin-left: 7.3%;">
												学号：
												<input type="text" name="stuid_view" id="stuid_view" value="${map.data_sid}" style="width: 35%;border: none;outline: none;" disabled="disabled" />
											</span>
										</span>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<!--<a href="*" class="btn btn-primary">确认</a> -->
										
									</div>
								</div>
							</div>
						</div>
		<!-- 编辑模态框 -->
						<div class="modal fade" id="edit${map.data_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<form action="<%=request.getContextPath() %>/student/info.do?method=inedit&student_id=${map.data_id}" method="post" name="editform">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title" id="modaltitle">编辑</h3>
										</div>
										<div class="modal-body" font-size: 14px; margin-left: 20px;>
											<span class="row">
												<span style="margin-left: 8%;">
													姓名：
													<input type="text" name="data_sname" id="name_edit" value="${map.data_sname}"  style="width: 35%;" />
												</span>
												<span style="margin-left: 7.6%;">
													性别：
													<input type="text" name="data_sex" id="sex_edit" value="${map.data_sex}" style="width: 10%;" />
												</span>
												<span style="margin-left: 2.7%;">
													民族：
													<input type="text" name="data_nation" id="ethnic_edit" value="${map.data_nation}" style="width: 16%;" />
												</span>
											</span>
											<span class="row">
												<span style="margin-left: 8%;">
													班级：
													<input type="text" name="data_class" id="class_edit" value="${map.data_class}" style="width: 35%;" />
												</span>
												<span style="margin-left: 5.8%;">
													学籍号：
													<input type="text" name="data_scrollnum" id="status_edit" value="${map.data_scrollnum}" style="width: 35%;" />
												</span>
												
											</span>
											<span class="row">
												<span style="margin-left: 1.1%;">
													家庭联系方式：
													<input type="text" name="data_homephone" id="hometel_edit" value="${map.data_homephone}" style="width: 35%;" />
												</span>
												<span style="margin-left: 8.2%;">
													QQ：
													<input type="text" name="data_qq" id="qq_edit" value="${map.data_qq}" style="width: 35%;" />
												</span>
											</span>
											<span class="row">
												<span style="margin-left: 6.4%;">
													身份证：
													<input type="text" name="data_IDnumber" id="selid_edit" value="${map.data_IDnumber}" style="width: 35%;" />
												</span>
												<span style="margin-left: 5.7%;">
													考生号：
													<input type="text" name="data_examid" id="stuid_edit" value="${map.data_examid}" style="width: 35%;" />
												</span>
												
											</span>
											<span class="row">
												<span style="margin-left: 3%;">
													户籍所在地：
													<input type="text" name="data_registeraddress" id="household_edit" value="${map.data_registeraddress}" style="width: 35%;" />
												</span>
												<span style="margin-left: 7.3%;">
													学号：
													<input type="text" name="data_sid" id="stuid_edit" value="${map.data_sid}" style="width: 35%;" />
												</span>
											</span>
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
						<!-- 循环阔到这里-->
						<tr>
							<td colspan="9">
								<div class="row" style="background-color: #e5e5e5;">
									<div  style="float: left;margin-left: 1%;">
									<%if(pagej==1){%>
									<span onclick="del()" class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/student/info.do?method=queryinfo&page=<%=(pagej-1)%>"><span class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
									<%} %>
									<%if(pagej==((count/10)!=0&count!=10?((count/10)+1):1)){%>
									<span onclick="add()" class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/student/info.do?method=queryinfo&page=<%=(pagej+1)%>"><span class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
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
					</table>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function importExcel()
		{
			var fed=$("#stuinfo1").val();
			if(fed.length<=0)
			{
			 alert("请选择需要导入的excel的文件");
	         return false;					
			}
			var url= "<%=request.getContextPath() %>/student/info.do?method=importExcel&fed="+fed+"";				   
			 alert("url:"+encodeURI(url));			
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
				var url= "<%=request.getContextPath()%>/student/info.do?method=queryinfo&page="+num+"";	
				  window.location.href=encodeURI(url);	
			}else{
				document.getElementById("pagenum").value = page;
				alert("没有当前页数")
			}
		}
	</script>
</html>
