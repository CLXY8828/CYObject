<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>岗位招满预警</title>
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
			th{
				font-size: 14px;
				text-align: center;
			}
			td{
				font-size: 14px;
				text-align: center;
			}
			.container{
				width: 100%;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div id="header">
				<div class="row">
					<ul class="breadcrumb">
					    <li>预警系统</li>
					    <li class="active">岗位过期预警</li>
					</ul>
				</div>
				<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
					<img src="../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">岗位过期预警</span>
					<a href="/*">
						<span id="addclass" style="color:royalblue;float: right;" class="h3" onclick="return checkexport()">
							<img src="../img/expoet2.png" width="30px" height="30px">
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
							<th width="6%">序号</th>
							<th width="14%">岗位</th>
							<th width="12%">招聘时间</th>
							<th width="13%">应招人数</th>
							<th width="13%">投简历人数</th>
							<th width="24%">公司名称</th>
							<th width="6%">查看</th>
							<th width="6%">删除</th>
						</tr>
			<!-- /*以下放数据 -->
						<tr>
							<td>1</td>
							<td>JAVA开发工程师</td>
							<td>2022-01-12</td>
							<td>5</td>
							<td>0</td>
							<td>北京京云万峰信息技术有限公司</td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#view"><img src="../img/view.png" style="width: 28px;height: 28px;" ></a></td>
							<td><a href="" onclick="checkdel(delform)"><img src="../img/delete.png" style="width: 28px;height: 28px;" ></a></td>
						</tr>
		<!-- 这里也是要存数据的 -->
						<div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h3 class="modal-title" id="modaltitle">查看</h3>
									</div>
									<div class="modal-body" style="font-size: 14px; margin-left: 20px;">
										<div class="row">
											<span>
												岗位：
												<span>JAVA开发工程师</span>
											</span>
											<span>
												招聘时间
												<span>2022-01-12</span>
											</span>
										</div>
										<br>
										<div class="row">
											<span>
												公司名称
												<span>北京京云万峰信息技术有限公司</span>
											</span>
										</div>
										<br>
										<div class="row">
											<span>
												投简历人数
												<span>5</span>
												人
											</span>
										</div>
										<br>
										<div style="overflow-y: scroll;height: 500px; width: 100%;">
											<div class="row" style="width: 100%;">
												<span style="margin-left: 5%;">
													姓名：
													<span>张三</span>
												</span>
												<span style="margin-left: 15%;">
													学号：
													<span>301369466</span>
												</span>
												<span style="margin-left: 15%;">
													联系电话
													<span>13301369466</span>
												</span>
											</div>
											<br>
										</div>
									</div>
								</div>
							</div>
						</div>
		<!-- 以上 -->
						<tr>
							<td colspan="9">
								<div class="row" style="background-color: #e5e5e5;">
									<div  style="float: left;margin-left: 1%;">
									<%if(pagej==1){%>
									<span onclick="del()" class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/postinfo/postin.do?method=query&page=<%=(pagej-1)%>"><span class="glyphicon glyphicon-chevron-left" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
									<%} %>
									<%if(pagej==((count/10)!=0&count!=10?((count/10)+1):1)){%>
									<span onclick="add()" class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span>
									<%}else{%>
										<a href="<%=request.getContextPath()%>/postinfo/postin.do?method=query&page=<%=(pagej+1)%>"><span class="glyphicon glyphicon-chevron-right" style="width: 22px;height: 22px;border: #000000 1px solid;"></span></a>
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
				</form>
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
				var url= "<%=request.getContextPath()%>/waring/stu.do?method=query&page="+num+"";	
				  window.location.href=encodeURI(url);	
			}else{
				document.getElementById("pagenum").value = page;
				alert("没有当前页数"+page)
			}
		}
		function checkdel(delform){
			if(confirm("确认删除该公司招聘信息")){
				delform.submit();
			}
		}
		function checkexport(){
			if(confirm("你将导出预警系统中未就业学生的信息")){
				window.location.href="/*";
			}else{
				return false;
			}
		}
	</script>
</html>

