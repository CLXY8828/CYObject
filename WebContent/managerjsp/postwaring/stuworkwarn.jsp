<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>学生就业预警</title>
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
					    <li class="active">学生就业预警</li>
					</ul>
				</div>
				<div class="row" style="margin-left: 10px;margin-right: 10px;margin-top: -10px;">
					<img src="../img/userA.png" style="width: 50px;height: 50px;">
					<span class="h3">学生就业预警</span>
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
					<table border="0px" cellspacing="5px" cellpadding="0px" style="width: 100%;" class="table">
						<tr>
							<th width="8%">序号</th>
							<th width="10%">姓名</th>
							<th width="10%">学号</th>
							<th width="14%">未就业时长</th>
							<th width="14%">联系电话</th>
							<th width="14%">离职/未就业</th>
							<th width="14%">专业老师</th>
							<th width="8%">联系处理</th>
						</tr>
						<!-- /*以下放数据 -->
						<%
						List list=(List)request.getAttribute("list");
						 int count = (Integer)request.getAttribute("count");
						  int pagej = (Integer)request.getAttribute("page");
						  
						  String nian_r = (String)request.getAttribute("nian");
						  String yue_r = (String)request.getAttribute("yue");
						  String ri_r = (String)request.getAttribute("ri");
						  int nian = Integer.parseInt(nian_r);
						  int yue =0;
						  yue+=yue_r.charAt(0)*10*30;
						  yue+=yue_r.charAt(1)*30;
						  int ri = 0;
						  ri+=ri_r.charAt(0)*10;
						  ri+=ri_r.charAt(1);
							
						for(int i =0; i < list.size();i++){
							Map map = (Map)list.get(i);
							String salary = (String)map.get("time");
							String [] salaryarr  = salary.split("-");
							String nian_1 = salaryarr[0];
							String yue_1 = salaryarr[1];
							String ri_1 = salaryarr[2];
							int nian_old = Integer.parseInt(nian_1);
							int yue_old =0;
							yue_old+=yue_1.charAt(0)*10*30;
							yue_old+=yue_1.charAt(1)*30;
							int ri_old = 0;
							ri_old+=ri_1.charAt(0)*10;
							ri_old+=ri_1.charAt(1);
							
							int date = ((nian-nian_old)*365)+yue-yue_old+ri-ri_old;
						%>
					        <tr>
							<td><%=i+1 %></td>
							<td><%=map.get("name") %></td>
							<td><%=map.get("sid") %></td>
							<td><%=date %><span>天</span></td>
							<td><%=map.get("account_phone") %></td>
							<td>未就业</td>
							<td><%=map.get("tname") %></td>
							<td>
							<%if((map.get("processdate")).equals("0")){%>
								
								<a href="#idenfier<%=map.get("sid") %>" data-toggle="modal" data-target="#dealmethod<%=map.get("sid") %>"><img src="../img/warning.png" style="width: 30px;height: 30px;" ></a>
							<%}else{%>
								<img src="../img/deal.png" style="width: 28px;height: 28px;" >
							<%} %>
							</td>
						</tr>
							
						<div class="modal fade" id="dealmethod<%=map.get("sid") %>" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h2 class="modal-title" id="modaltitle">处理方式</h4>
									</div>
									<div class="modal-body">
										<br>
										<div class="row">
											<span style="margin-left: 20%;">
												<a href="#idenfier<%=map.get("sid") %>"  data-toggle="modal" data-target="#emaildeal<%=map.get("sid") %>" data-dismiss="modal"><span class="h3">发送学生信息到邮箱</span></a>
											</span>
										</div>
										<br>
										<div class="row">
											<span style="margin-left: 20%;">
												<a href="#idenfier<%=map.get("sid") %>" data-toggle="modal" data-target="#dealnow<%=map.get("sid") %>" data-dismiss="modal"><span class="h3">联系学生了解情况</span></a>
											</span>
										</div>
									</div><br><br><br>
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
						<!-- email处理 -->
						<div class="modal fade" id="emaildeal<%=map.get("sid") %>" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h2 class="modal-title" id="modaltitle">处理方式</h4>
									</div>
									<div class="modal-body">
										<br>
										<div class="row">
											<span style="margin-left: 20%;">
												<span class="h3">已将<%=map.get("name") %>学生信息发送至您的邮箱</span>
											</span>
										</div>
										<br><br><br>
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
						<div class="modal fade" id="dealnow<%=map.get("sid") %>" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h2 class="modal-title" id="modaltitle">学生联系方式</h4>
									</div>
									<div class="modal-body">
										<br>
										<div class="row" style="margin-left:10%">
											<span class="h3">
												电话：
												<span><%=map.get("account_phone")%></span>
											</span>
										</div><br>
										<div class="row" style="margin-left:10%">
											<span class="h3">
												QQ：
												<span>99999999999</span>
											</span>
										</div><br>
										<div class="row" style="margin-left:10%">
											<span class="h3">
												微信：
												<span>99999999999</span>
											</span>
										</div>
										<br><br><br>
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
						<%} %>
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
		function checkexport(){
			if(confirm("你将导出预警系统中未就业学生的信息")){
				window.location.href="/*";
			}else{
				return false;
			}
		}
	</script>
</html>