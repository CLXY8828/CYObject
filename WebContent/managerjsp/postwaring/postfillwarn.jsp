<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				font-size: 20px;
				text-align: center;
			}
			td{
				font-size: 20px;
				text-align: center;
			}
			.container{
				width: 95%;
				left: 2.5%;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div id="header">
				<div class="row" style="margin-left: 10px;margin-right: 10px;">
					<img src="../img/userA.png" style="width: 80px;height: 80px;">
					<span class="h3" style="position: absolute;margin-top: 50px;">岗位招满预警</span>
					<a href="/*">
						<span id="addclass" style="color:royalblue;float: right;padding-top: 10px;" class="h3">
							<img src="../img/expoet2.png" width="50px" height="50px">
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
							<th width="12%">预招人数</th>
							<th width="12%">已招人数</th>
							<th width="14%">联系电话</th>
							<th width="24%">公司名称</th>
							<th width="6%">查看</th>
							<th width="6%">删除</th>
						</tr>
		<!-- /*以下放数据 -->
					<%int i=1;
					int count = (Integer)request.getAttribute("count");
					int pagej = (Integer)request.getAttribute("page");%>
					<c:forEach items="${list_employment}" var="map" >
						<tr>
							<td><%=i++%></td>
							<td>${map.employment_name}</td>
							<td>${map.recrultsNumb }</td>
							<td>${map.readyNumb }</td>
							<td>${map.phone }</td>
							<td>${map.gsname }</td>
							<td><a href="#idenfier" data-toggle="modal" data-target="#view${map.eid}"><img src="../img/view.png" style="width: 38px;height: 38px;" ></a></td>
							<td>
							<a href="#" onclick="checkdel(this)" id="${map.eid}"><img src="../img/delete.png" style="width: 30px;height: 30px;" ></a>
							</td>
						</tr>
					
						<div class="modal fade" id="view${map.eid}" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h2 class="modal-title" id="modaltitle">查看</h2>
									</div>
									<div class="modal-body" style="font-size: 20px; margin-left: 20px;">
										<div class="row">
											<span>
												公司名称
												<span>${map.gsname}</span>
											</span>
										</div>
										<br>
										<div class="row">
											<span>
												岗位
												<span>${map.employment_name}</span>
											</span>
										</div>
										<br>
										
										<div style="overflow-y:scroll;height: 500px; width: 100%;">
											<span>
												学生信息
											</span><br>
									<!-- 从这往下是另一个list -->
									<c:forEach items="${list_account}" var="map_acction">
										<c:if test="${map.eid==map_acction.eid&&map_acction.applystate==1}" >
												<div class="row" style="width: 100%;">
													<span style="margin-left: 5%;">
														姓名：
														<span>${map_acction.name}</span>
													</span>
													<span style="margin-left: 15%;">
														学号：
														<span>${map_acction.sid}</span>
													</span>
													<span style="margin-left: 15%;">
														联系电话
														<span>${map_acction.phone}</span>
													</span>
												</div>
										</c:if>
									</c:forEach>
									<!-- 到这为止 -->
											<br>
										</div>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
		<!-- 以上存数据 -->
						<tr>
															<td colspan="9">
									<div class="row" style="background-color: #dafffb;">
										<div  style="float: left;">
											<%if(pagej==1){%>
												<span onclick="del()" class="glyphicon glyphicon-chevron-left" style="width: 30px;height: 30px;border: #000000 1px solid;"></span>
											<%}else{%>
												<a href="<%=request.getContextPath()%>/waring/stu.do?method=query&page=<%=(pagej-1)%>"><span class="glyphicon glyphicon-chevron-left" style="width: 30px;height: 30px;border: #000000 1px solid;"></span></a>
											<%} %>
											<%if(pagej==((count/10)!=0?((count/10)+1):1)){%>
												<span onclick="add()" class="glyphicon glyphicon-chevron-right" style="width: 30px;height: 30px;border: #000000 1px solid;"></span>
											<%}else{%>
												<a href="<%=request.getContextPath()%>/waring/stu.do?method=query&page=<%=(pagej+1)%>"><span class="glyphicon glyphicon-chevron-right" style="width: 30px;height: 30px;border: #000000 1px solid;"></span></a>
											<%} %>
										</div>
										<span style="float: left; margin-left: 10px;">
											<span><%=count %></span>条总记录数
										</span>
										<span style="float: left; margin-left: 20px;">
											显示<span><%=(count/10)!=0|count!=10?((count/10)+1):1%></span>页
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
	var page = document.getElementById("pagenum").value;
	function add() {
			alert("已经是最后一页了！")
		}
		function del() {
			alert("前面没有了！")
		}
		function pagenum1(num) {
			if(num<=<%=(count/10)!=0?((count/10)+1):1%>){
				var url= "<%=request.getContextPath()%>/waring/fill.do?method=query&page="+num+"";	
				  window.location.href=encodeURI(url);	
			}else{
				alert("没有当前页数")
			}
		}
		function checkdel(delform){
			if(confirm("确认删除该公司招聘信息")){
				var url= "<%=request.getContextPath()%>/waring/fill.do?method=delete&eid="+delform.id+"&page="+page+"";
				window.location.href=encodeURI(url);
			}
		}
	</script>
</html>
