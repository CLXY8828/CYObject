<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>权限管理</title>
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
				    <li class="active">权限管理</li>
				</ul>
			</div>
			<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
				<form action="<%=request.getContextPath() %>/management/authority.do?method=query" method="post">
					<img src="../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">权限管理</span>
					<span style="color: #00FFFF;top: 28px;position: absolute;left:80px;top:73px;" class="h4"><a href="#idenfier" data-toggle="modal" data-target="#addmanage">添加管理</a></span>
					<span style="float: right;padding-top: 10px;" class="h4">
						<select name="queryinfo" style="width: 90px;height: 30px;border-radius: 10px 0px 0px 10px;">
							<option value="name" <%="name".equals(request.getAttribute("queryinfo"))?"selected":""%> >姓名</option>
							<option value="author" <%="author".equals(request.getAttribute("queryinfo"))?"selected":""%>>权限</option>
						</select>
						<input type="text" name="queryCondition" id="queryCondition" value="<%=request.getAttribute("queryCondition")==null?"":request.getAttribute("queryCondition")%>" style="width: 300px;height: 30px;margin-left: -8px;border-radius: 0px 10px 10px 0px;" />
						<input type="submit" value="搜索" style="height: 33px;width: 90px;margin-left: -8px;font-size: 14px;margin-top: -3px;border-radius: 10px;" class="btn btn-primary" />
					</span>
				</form>
			</div>
	<!-- 添加管理 -->
			<form action="<%=request.getContextPath() %>/management/authority.do?method=add" method="post" id="newmanager">
				<div class="modal fade" id="addmanage" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<div class="row">
									<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">添加管理</h3>
								</div>
							</div>
							<div class="modal-body">
								<span class="row">
									<span style="margin-left: 13%;">
										姓名：
										<input type="text" name="name" id="name" value="" style="width: 55%;height: 40px;border-radius: 5px;font-size: 14px;" />
									</span>
								</span>
								<span class="row">
									<span style="margin-left: 13%;">
										账号：
										<input type="text" name="account" id="account" value="" style="width: 55%;height: 40px;border-radius: 5px;font-size: 14px;" />
									</span>
								</span>
								<span class="row">
									<span style="margin-left: 13%;">
										密码：
										<input type="text" name="new_password" id="new_password" value="" style="width: 55%;height: 40px;border-radius: 5px;font-size: 14px;" data-container="body" data-trigger="manual" data-toggle="popover" data-placement="right"
										data-content="密码不能含有中文" onblur="matchs()" />
									</span>
								</span>
								<span class="row">
									<span style="margin-left: 8%;">
										确认密码：
										<input type="text" name="new_password_confirm" id="new_password_confirm" value="" style="width: 55%;height: 40px;border-radius: 5px;font-size: 14px;" data-container="body" data-trigger="manual" data-toggle="popover" data-placement="right"
										data-content="两次输入密码不一致" onblur="checkPass()" />
									</span>
								</span>
								<span class="row">
									<span style="margin-left: 21%;">
										<span id="condition1" class="glyphicon glyphicon-remove-circle" style="color:red ;"></span>
										<span>密码由8-16位数字、字母或符号组成</span>
									</span><br>
									<span style="margin-left: 21%;">
										<span id="condition2" class="glyphicon glyphicon-remove-circle" style="color:red;"></span>
										<span>至少含2种以上字符</span>
									</span>
								</span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<a href="javascript:void(-1);" class="btn btn-primary" onclick="makesure()">确认</a>
							</div>
						</div>
					</div>
				</div>
	<!-- 权限设置 -->
				<div class="modal fade" id="auth" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">设置权限</h3>
							</div>
							<div class="modal-body">
								<span class="row">
									<select id="teacherset" name="auth" style="width:75% ;margin-left: 13%;height: 40px;">
										<option value="1">就业老师</option>
										<option value="2">专业老师</option>
									</select>
								</span>
								<span class="row">
									<span style="margin-left:16%;">
										<small style="color: darkgray;">专业老师只能查看本班就业信息</small>
									</span>
								</span>
								<span class="row" style="margin-top: -10%;">
									<span style="margin-left: 16%;">
										<small style="color: darkgray;">就业老师上传岗位及查看年级就业信息</small>
									</span>
								</span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<button type="button" class="btn btn-primary" onclick="authorset()">确认</button>
							</div>
						</div>
					</div>
				</div>
	<!-- 选定班级 -->
				<div class="modal fade" id="classset" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">选定班级</h3>
							</div>
							<div class="modal-body">
								<span class="row">
									<span style="margin-left: 13%;">
										为专业老师选定班级：
										<select name="classset">
											<option value="JAVAPLUS班">JAVAPLUS班</option>
											<option value="JAVANB01班">JAVANB01班</option>
										</select>
									</span>
								</span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<button type="submit" class="btn btn-primary">确认</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
			<div style="width: 100%;">
				<table border="0px" cellspacing="5px" cellpadding="0px" class="table" style="width:100%">
					<tr>
						<th width="5%">序号</th>
						<th width="10%">姓名</th>
						<th width="10%">账号</th>
						<th width="15%">密码</th>
						<th width="13%">权限</th>
						<th width="10%">权限管理</th>
						<th width="8%">编辑</th>
						<th width="8%">删除</th>
					</tr>
				<%int i=1;
					int count = (Integer)request.getAttribute("count");
					int pagej = (Integer)request.getAttribute("page");%>
				<c:forEach items="${list_query}" var="map" >
					<tr>
						<td><%=i++%></td>
						<td>${map.admin_name}</td>
						<td>${map.admin_UUID}</td>
						<td>${map.admin_password}</td>
						<td>${map.admin_have =="1"?"就业老师":map.admin_have=="2"?"专业老师":"超级管理员"}</td>
						<td><a href="#idenfier" data-toggle="modal" data-target="#authmanage${map.admin_id}"><img src="../img/authority.png" style="width: 28px;height:28px;margin-top: -5px;" ></a></td>
						<td><a href="#idenfier" data-toggle="modal" data-target="#edit${map.admin_id}"><img src="../img/edit.png" style="width: 28px;height:28px;margin-top: -5px;" ></a></td>
						<td><a href="#idenfier" data-toggle="modal" data-target="#checkdel${map.admin_id}"><img src="../img/delete.png" style="width: 28px;height: 28px;margin-top: -5px;" ></a></td>
					</tr>
	<!-- 权限管理 -->
					<form action="<%=request.getContextPath() %>/management/authority.do?method=editauth&editauthid=${map.admin_id}" method="post">
						<div class="modal fade" id="authmanage${map.admin_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;">权限管理</h3>
									</div>
									<div class="modal-body" style="">
										<div class="row">
											<span style="margin-left: 15%;">
												权限：
											</span>
										</div>
										<div class="row">
											<span style="margin-left: 15%;">
												<select id="teacherset_edit_${map.admin_id}" name="teacherset_edit_${map.admin_id}" style="width: 40%;height: 30px;" onchange="" >
													<option value="1" ${map.admin_have eq '1'?"selected":""}>就业老师</option>
													<option value="2" ${map.admin_have eq '2'?"selected":""}>专业老师</option>
												</select>
											</span>
										</div><br>
										<div id="classchose_edit_${map.admin_id}" style="display: none;">
											<div class="row" >
												<span style="margin-left: 15%;">
													选择班级：
												</span>
											</div>
											<div class="row">
												<span style="margin-left: 15%;">
													<select name="classchose_edit_${map.admin_id}" style="width: 40%;height: 30px;">
														<option value="无">无</option>
														<c:forEach items="${list_class}" var="classmap" >
														<option value="${classmap.class_id}">${classmap.class_name}</option>
														</c:forEach>
													</select>
												</span>
											</div>
										</div>
										<br><br>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<button type="submit" class="btn btn-primary">确认</button>
									</div>
								</div>
							</div>
						</div>
					</form>
	<!-- 删除 -->	
					<div class="modal fade" id="checkdel${map.admin_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h3 class="modal-title" id="modaltitle" style="margin-left: 2%;color: red;">删除</h3>
								</div>
								<div class="modal-body">
									<span class="h4" style="margin-left: 10%;">你将删除该老师的信息</span>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭
									</button>
									<a href="<%=request.getContextPath() %>/management/authority.do?method=delete&deleteid=${map.admin_id}" class="btn btn-danger">确认</a>
								</div>
							</div>
						</div>
					</div>
	<!-- 编辑 -->
					<form action="<%=request.getContextPath() %>/management/authority.do?method=edit&editid=${map.admin_id}" method="post">
					<div class="modal fade" id="edit${map.admin_id}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h3 class="modal-title" id="modaltitle">编辑</h3>
								</div>
								<div class="modal-body" style="font-size: 14px; margin-left: 20px;">
									<br>
									<div class="row"  style="margin-left: 8%;">
										姓名：
										<input type="text" name="teacher_name_edit_${map.admin_id}" id="teacher_name" value="${map.admin_name}" style="width: ;" />
									</div><br>
									<div class="row"  style="margin-left: 8%;">
										账号：
										<input type="text" name="teacher_account_edit_${map.admin_id}" id="teacher_account" value="${map.admin_UUID}" />
									</div><br>
									<div class="row"  style="margin-left: 8%;">
										密码：
										<input type="text" name="teacher_password_edit_${map.admin_id}" id="teacher_password" value="${map.admin_password}" />
									</div><br>
									<div class="row"  style="margin-left: 8%;">
										邮箱：
										<input type="text" name="teacher_email_edit_${map.admin_id}" id="teacher_email" value="${map.admin_email}" />
									</div><br><br>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭
									</button>
									<button type="submit" class="btn btn-primary">确认</button>
								</div>
							</div>
						</div>
					</div>
					</form>
					</c:forEach>
					<tr>
							<td colspan="9">
								<div class="row" style="background-color: #e5e5e5;">
									<div  style="float: left;margin-left: 1%;">
									<%if(pagej==1){%>
									<span onclick="del()" class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/management/authority.do?method=query&page=<%=(pagej-1)%>"><span class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
									<%} %>
									<%if(pagej==((count/10)!=0&count!=10?((count/10)+1):1)){%>
									<span onclick="add()" class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/management/authority.do?method=query&page=<%=(pagej+1)%>"><span class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
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
		var page = <%=pagej%>;
		function add() {
			alert("已经是最后一页了！")
		}
		function del() {
			alert("前面没有了！")
		}
		
		function pagenum1(num) {
			if(num<=<%=(count/10)!=0?((count/10)+1):1%>){
				var url= "<%=request.getContextPath()%>/management/authority.do?method=query&page="+num+"";	
				  window.location.href=encodeURI(url);	
			}else{
				document.getElementById("pagenum").value = page;
				alert("没有当前页数")
			}
		}
		function authorset(){
			var selected = document.getElementById("teacherset");
			if(selected.options[selected.selectedIndex].value=="1"){
				$("#newmanager").submit();
			}else if(selected.options[selected.selectedIndex].value=="2"){
				
				$("#classset").modal("show");
				$("#auth").modal("hide");
			}
		}
		function choseclass(id){
			var selected2=document.getElementById("teacherset_edit_"+id);
			alert(selected2);
			if(selected2.options[selected2.selectedIndex].value=="1"){
				$("#classchose_edit_"+id).css("display","none");
			}else if(selected2.options[selected2.selectedIndex].value=="2"){
				$("#classchose_edit_"+id).css("display","block");
			}
		}
		function makesure(){
			var name=$("#name").val().trim();
			var account=$("#account").val().trim();
			if(name==""){
				alert("名称不能为空");
				$("#name").focus();
				return false;
			}else if(account==""){
				alert("账号不能为空");
				$("#account").focus();
				return false;
			}else if(checkPass()){
				$("#auth").modal("show");
				$("#addmanage").modal("hide");
			}
		}
		function checkPass(){
			var pass1=$("#new_password").val().trim();
			var pass2=$("#new_password_confirm").val().trim();
			
			if(pass1!=pass2){
				$("#new_password_confirm").popover("show");
			}else{
				$("#new_password_confirm").popover("hide");
			}
			if((pass1===pass2)&&(pass1!="")&&(pass1!=null)&&(pass1.length>=8)&&(pass1.length<=16)&&(matchs())&&(name!=null)&&(account!=null)){
				$("#condition1").removeClass("glyphicon-remove-circle").addClass("glyphicon glyphicon-ok-circle").css("color","#aaff7f");
				$("#condition2").removeClass("glyphicon-remove-circle").addClass("glyphicon glyphicon-ok-circle").css("color","#aaff7f");
				return true;
			}else{
				$("#condition1").removeClass("glyphicon-ok-circle").addClass("glyphicon glyphicon-remove-circle").css("color","red");
				$("#condition2").removeClass("glyphicon-ok-circle").addClass("glyphicon glyphicon-remove-circle").css("color","red");
				return false;
			}
		}
		function matchs(){
			var reg=/\p{Unified_Ideograph}/u;//汉字
			var upcase = /[\u0041-\u004A]/g;//大写字母
			var lowcase = /[\u0061-\u007A]/g;//小写字母
			var number = /[^\d.]/g;
			var chart = /\<\!\-\-([\s\S]*?)\-\-\>/g; 
			var num=0;
			var pass1=$("#new_password").val().trim();
			var pass2=$("#new_password_confirm").val().trim();
			if(reg.test(pass1)){
				$("#new_password").popover("show");
				return false;
			}else{
				$("#new_password").popover("hide");
			}
			if(upcase.test(pass1)){
				num++;
			}
			if(lowcase.test(pass2)){
				num++;
			}
			if(number.test(pass1)){
				num++;
			}
			if(chart.test(pass1)){
				num++;
			}
			if(num>=2){
				return true;
				
			}
			return false;
		}
		
		
</script>
</html>
