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
					<span class="h3" style="position: absolute;margin-top: 50px;">学生就业预警</span>
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
							<td><%=map.get("phone") %></td>
							<td>未就业</td>
							<td><%=map.get("tname") %></td>
							<td>
								<a href="/*"><img src="../img/deal.png" style="width: 30px;height: 30px;" ></a>
								<a href="/*"><img src="../img/warning.png" style="width: 30px;height: 30px;" ></a>
							</td>
						</tr>
						<%} %>						
						
						
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
			</div>
		</div>
	</body>
	<script type="text/javascript">
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
				alert("没有当前页数")
			}
		}
	</script>
</html>
