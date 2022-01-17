<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>岗位信息</title>
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
			.container{
				width: 95%;
				left: 2.5%;
			}
			.modal-lg{
				width: 80%;
			}
			th{
				font-size: 20px;
				text-align: center;
			}
			td{
				font-size: 20px;
				text-align: center;
			}
		</style>
	</head>
	<body>
	<%List list=(List)request.getAttribute("list");%>
		<div class="container">
			<div id="header">
				<div class="row" style="margin-left: 10px;margin-right: 10px;">
					<img src="../img/userA.png" style="width: 80px;height: 80px;">
					<span class="h3" style="position: absolute;margin-top: 50px;">岗位信息</span>
					<a href="#idenfier" data-toggle="modal" data-target="#upload">
						<span id="addclass" style="color:royalblue;float: right;padding-top: 10px;" class="h3">
							<img src="../img/export.png" width="50px" height="50px">
							<span style="margin-top: 50px">上传岗位</span>
						</span>
					</a>
				</div>
				<hr style="border: #000000 2px solid;margin-top: -1px; width: 100%;" />
				<!-- /*模态框 -->
				<div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<!-- 上传岗位 -->
							<form action="<%=request.getContextPath()%>/postinfo/postin.do?method=add" method="post">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h2 class="modal-title" id="modaltitle">上传岗位</h2>
								</div>
								<div class="modal-body" style="font-size: 20px; margin-left: 20px;">
									<div class="row">
										<span>
											岗位名称：
											<input type="text" name="employment_name" id="postname_upload" value="" style="width: 20%;" />	
										</span>
										<span style="margin-left:2%;">
											公司名称：
											<input type="text" name="gsname" id="comname_upload" value="" style="width: 20%;" />
										</span>
										<span style="margin-left: 2%;">
											薪资:
											<select name="salary_upload" style="width: 12%;">
												<option value="3K以下">3K以下</option>
												<option value="3k-5k">3k-5k</option>
												<option value="5k-10k">5k-10k</option>
												<option value="10k-20k">10k-20k</option>
												<option value="20k-40k">20k-40k</option>
												<option value="40k-60k">40k-60k</option>
												<option value="60k以上">60k以上</option>
											</select>
											<span style="font-size: 32px;">·</span>
											<select name="salarytimes_upload">
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
											</select>
											薪
										</span>
									</div>
									<br>
									<div class="row">
										<span>
											公司规模：
											<select name="scale" style="width: 18%;">
												<option value="20以下">20以下</option>
												<option value="20-99人">20-99人</option>
												<option value="100-299人">100-299人</option>
												<option value="500-999人">500-999人</option>
												<option value="1000-9999人">1000-9999人</option>
												<option value="万人以上">万人以上</option>
												<option value="不限">不限</option>
											</select>
										</span>
										<span style="margin-left: 4%;">
											公司性质：
											<select name="nature_id" style="width: 18%;">
												<option value="dwxz007">国有企业</option>
												<option value="dwxz001">机关</option>
												<option value="dwxz002">科研设计单位</option>
												<option value="dwxz003">高等教育单位</option>
												<option value="dwxz004">中初教育单位</option>
												<option value="dwxz005">医疗卫生单位</option>
												<option value="dwxz006">其他事业单位</option>
												<option value="dwxz008">三资企业</option>
												<option value="dwxz009">其他企业</option>
												<option value="dwxz0010">部队</option>
												<option value="dwxz0011">农村建制村</option>
												<option value="dwxz0012">城镇社区</option>
												<option value="dwxz0013">其他</option>
											</select>
										</span>
										<span style="margin-left: 4%;">
											招聘人数：
											<input type="text" name="recrultsNumb" id="recrultsNumb" value="" style="width: 10%;" />
											人
										</span>
									</div>
									<br>
									<div class="row">
										<span>
											公司福利：
											<input type="text" name="welfare" id="comwelfare_upload" value="" style="width: 20%;"/>
										</span>
										<span style="margin-left: 2%;">
											公司类型：
											<input type="text" name="type" id="comtype_upload" value="" style="width: 20%;"/>
										</span>
										<span style="margin-left: 2%;">
											公司所在地：
											<input type="text" name=address id="comaddress_upload" value="" style="width: 18%;" />
										</span>
									</div>
									<br>
									<div class="row">
										<span>
											学历要求：
											<select name="education" style="width: 18%;">
												<option value="初中及以下">初中及以下</option>
												<option value="高中">高中</option>
												<option value="中专">中专</option>
												<option value="大专">大专</option>
												<option value="本科">本科</option>
												<option value="硕士">硕士</option>
												<option value="博士">博士</option>
												<option value="MEA/EMBA">MEA/EMBA</option>
											</select>
										</span>
										<span style="margin-left: 2%;">
											联系电话：
											<input type="text" name="phone" id="comtype_upload" value="" style="width: 20%;"/>
										</span>
										<span style="margin-left: 2%;">
											工作经验要求：
											<select name="experience" style="width: 16%;">
												<option value="应届生">应届生</option>
												<option value="实习生">实习生</option>
												<option value="1年以内">1年以内</option>
												<option value="1-3年">1-3年</option>
												<option value="3-5年">3-5年</option>
												<option value="5-10年">5-10年</option>
												<option value="10年以上">10年以上</option>
											</select>
										</span>
									</div>
									<br>
									<div class="row">
										<span>
											岗位类型：
											<select name="zwtype" style="width: 18%;">
												<option value="JAVA">JAVA</option>
												<option value="Python">Python</option>
												<option value="PHP">PHP</option>
												<option value="UED">UED</option>
												<option value="AI">AI</option>
												<option value="前端">前端</option>
												<option value="运维">运维</option>
												<option value="产品设计">产品设计</option>
												<option value="其他">其他</option>
											</select>
										</span>
									</div>
									<br>
									<div style="margin-left: -1.5%;">
										<span >岗位描述：</span><br>
										<textarea rows="2" cols="97%" name="employment_describe"></textarea>
									</div>
									<div style="margin-left: -1.5%;">
										<span>任职要求：</span><br>
										<textarea rows="4" cols="97%" name="demand"></textarea>
									</div>
									<div style="margin-left: -1.5%;">
										<span>公司信息：</span><br>
										<textarea rows="4" cols="97%" name="introduce"></textarea>
									</div>
									<div style="margin-left: -1.5%;">
										<span>备注</span><br>
										<textarea rows="2" cols="97%" name="note"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭
									</button>
									<button type="submit" class="btn btn-primary">
										上传
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<div style="width: 100%;">
					<!-- 删除提交：
						删除需要id请自己加
						蟹蟹
					 -->
					<form action="<%=request.getContextPath()%>/postinfo/postin.do?method=delete" method="post" name="delform">
						<table border="0px" cellspacing="5px" cellpadding="0px" style="width: 100%;" class="table">
							<tr>
								<th width="8%">序号</th>
								<th width="10%">岗位名称</th>
								<th width="10%">招聘人数</th>
								<th width="10%">薪资</th>
								<th width="10%">联系电话</th>
								<th width="27%">公司名称</th>
								<th width="6%">编辑</th>
								<th width="6%">查看</th>
								<th width="6%">删除</th>
							</tr>
							<!-- /*以下放数据 -->
							<% 
							for(int i =0; i < list.size();i++){
								Map map = (Map)list.get(i);
								String salary = (String)map.get("salary");
								String [] salaryarr  = salary.split("\\.");
								String qian = salaryarr[0];
								String xin = salaryarr[1];
							%>
							<tr>
							
								<td><%=(i+1)%></td>
								<td><%=map.get("employment_name")%></td>
								<td><%=map.get("recrultsNumb")%><span>人</span></td>
								<td><%=map.get("salary")%><span>/月</span></td>
								<td><%=map.get("phone")%></td>
								<td><%=map.get("gsname")%></td>
								<td><a href="#idenfier" data-toggle="modal" data-target="#edit<%=map.get("eid")%>"><img src="../img/edit.png" style="width: 30px;height:30px;" ></a></td>
								<td><a href="#idenfier" data-toggle="modal" data-target="#view<%=map.get("eid")%>"><img src="../img/view.png" style="width: 30px;height:30px;" ></a></td>
								<td><a href="" onclick="checkdel(delform)"><img src="../img/delete.png" style="width: 30px;height: 30px;" ></a></td>
							</tr>
							<div class="modal fade" id="edit<%=map.get("eid")%>" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog modal-lg" role="document">
									<div class="modal-content">
										<!-- 编辑模态框 -->
										<form action="<%=request.getContextPath()%>/postinfo/postin.do?method=edit&eid=<%=map.get("eid")%>" method="post">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h2 class="modal-title" id="modaltitle">编辑</h2>
											</div>
											<div class="modal-body" style="font-size: 20px; margin-left: 20px;">
												<div class="row">
													<span>
														岗位名称：
														<input type="text" name="employment_name_<%=map.get("eid")%>" id="postname_edit" value="<%=map.get("employment_name")%>" style="width: 20%;" />	
													</span>
													<span style="margin-left:2%;">
														公司名称：
														<input type="text" name="gsname_<%=map.get("eid")%>" id="comname_edit" value="<%=map.get("gsname")%>" style="width: 20%;" />
													</span>
													<span style="margin-left: 2%;">
														薪资:
														<select name="qian_<%=map.get("eid")%>" style="width: 12%;">
															<option value="3K以下" <%="3K以下".equals(qian)?"selected":"" %>>3K以下</option>
															<option value="3k-5k" <%="3k-5k".equals(qian)?"selected":"" %>>3k-5k</option>
															<option value="5k-10k" <%="5k-10k".equals(qian)?"selected":"" %>>5k-10k</option>
															<option value="10k-20k" <%="10k-20k".equals(qian)?"selected":"" %>>10k-20k</option>
															<option value="20k-40k" <%="20k-40k".equals(qian)?"selected":"" %>>20k-40k</option>
															<option value="40k-60k" <%="40k-60k".equals(qian)?"selected":"" %>>40k-60k</option>
															<option value="60k以上" <%="60k以上".equals(qian)?"selected":"" %>>60k以上</option>
														</select>
														<span style="font-size: 32px;">·</span>
														<select name="xin_<%=map.get("eid")%>">
															<option value="12" <%="12".equals(xin)?"selected":"" %>>12</option>
															<option value="13" <%="13".equals(xin)?"selected":"" %>>13</option>
															<option value="14" <%="14".equals(xin)?"selected":"" %>>14</option>
															<option value="15" <%="15".equals(xin)?"selected":"" %>>15</option>
															<option value="16" <%="16".equals(xin)?"selected":"" %>>16</option>
															<option value="17" <%="17".equals(xin)?"selected":"" %>>17</option>
															<option value="18" <%="18".equals(xin)?"selected":"" %>>18</option>
														</select>
														薪
													</span>
												</div>
												<br>
												<div class="row">
													<span>
														公司规模：
														<select name="scale_<%=map.get("eid")%>" style="width: 18%;">
															<option value="20以下" <%="20以下".equals(map.get("scale"))?"selected":"" %>>20以下</option>
															<option value="20-99人" <%="20-99人".equals(map.get("scale"))?"selected":"" %>>20-99人</option>
															<option value="100-299人" <%="100-299人".equals(map.get("scale"))?"selected":"" %>>100-299人</option>
															<option value="500-999人" <%="500-999人".equals(map.get("scale"))?"selected":"" %>>500-999人</option>
															<option value="1000-9999人" <%="1000-9999人".equals(map.get("scale"))?"selected":"" %>>1000-9999人</option>
															<option value="万人以上" <%="万人以上".equals(map.get("scale"))?"selected":"" %>>万人以上</option>
															<option value="不限" <%="不限".equals(map.get("scale"))?"selected":"" %>>不限</option>
														</select>
													</span>
													<span style="margin-left: 4%;">
														公司性质：
														<select name="nature_id_<%=map.get("eid") %>" style="width: 18%;">
															<option value="dwxz007" <%="dwxz007".equals(map.get("nature_id"))?"selected":"" %>>国有企业</option>
															<option value="dwxz001" <%="dwxz001".equals(map.get("nature_id"))?"selected":"" %>>机关</option>
															<option value="dwxz002" <%="dwxz002".equals(map.get("nature_id"))?"selected":"" %>>科研设计单位</option>
															<option value="dwxz003" <%="dwxz003".equals(map.get("nature_id"))?"selected":"" %>>高等教育单位</option>
															<option value="dwxz004" <%="dwxz004".equals(map.get("nature_id"))?"selected":"" %>>中初教育单位</option>
															<option value="dwxz005" <%="dwxz005".equals(map.get("nature_id"))?"selected":"" %>>医疗卫生单位</option>
															<option value="dwxz006" <%="dwxz006".equals(map.get("nature_id"))?"selected":"" %>>其他事业单位</option>
															<option value="dwxz008" <%="dwxz008".equals(map.get("nature_id"))?"selected":"" %>>三资企业</option>
															<option value="dwxz009" <%="dwxz009".equals(map.get("nature_id"))?"selected":"" %>>其他企业</option>
															<option value="dwxz0010" <%="dwxz010".equals(map.get("nature_id"))?"selected":"" %>>部队</option>
															<option value="dwxz0011" <%="dwxz011".equals(map.get("nature_id"))?"selected":"" %>>农村建制村</option>
															<option value="dwxz0012" <%="dwxz012".equals(map.get("nature_id"))?"selected":"" %>>城镇社区</option>
															<option value="dwxz0013" <%="dwxz013".equals(map.get("nature_id"))?"selected":"" %>>其他</option>
														</select>
													</span>
													<span style="margin-left: 4%;">
														招聘人数：
														<input type="text" name="recrultsNumb_<%=map.get("eid") %>" id="recruits_edit" value="<%=map.get("recrultsNumb")%>" style="width: 10%;" />
														人
													</span>
												</div>
												<br>
												<div class="row">
													<span>
														公司福利：
														<input type="text" name="welfare_<%=map.get("eid") %>" id="comwelfare_edit" value="<%=map.get("welfare")%>" style="width: 20%;"/>
													</span>
													<span style="margin-left: 2%;">
														公司类型：
														<input type="text" name="gstype_<%=map.get("eid") %>" id="comtype_edit" value="<%=map.get("gstype")%>" style="width: 20%;"/>
													</span>
													<span style="margin-left: 2%;">
														公司所在地：
														<input type="text" name="address_<%=map.get("eid") %>" id="comaddress_edit" value="<%=map.get("address")%>" style="width: 18%;" />
													</span>
												</div>
												<br>
												<div class="row">
													<span>
														学历要求：
														<select name="education_<%=map.get("eid") %>" style="width: 18%;">
															<option value="初中及以下" <%="初中及以下".equals(map.get("education"))?"selected":"" %>>初中及以下</option>
															<option value="高中" <%="高中".equals(map.get("education"))?"selected":"" %>>高中</option>
															<option value="中专" <%="中专".equals(map.get("education"))?"selected":"" %>>中专</option>
															<option value="大专" <%="大专".equals(map.get("education"))?"selected":"" %>>大专</option>
															<option value="本科" <%="本科".equals(map.get("education"))?"selected":"" %>>本科</option>
															<option value="硕士" <%="硕士".equals(map.get("education"))?"selected":"" %>>硕士</option>
															<option value="博士" <%="博士".equals(map.get("education"))?"selected":"" %>>博士</option>
															<option value="MEA/EMBA" <%="MEA/EMBA".equals(map.get("education"))?"selected":"" %>>MEA/EMBA</option>
														</select>
													</span>
													<span style="margin-left: 2%;">
														联系电话：
														<input type="text" name="phone_<%=map.get("eid") %>" id="tel_edit" value="<%=map.get("phone")%>" style="width: 20%;"/>
													</span>
													<span style="margin-left: 2%;">
														工作经验要求：
														<select name="experience_<%=map.get("eid") %>" style="width: 16%;">
															<option value="应届生" <%="应届生".equals(map.get("experience"))?"selected":"" %>>应届生</option>
															<option value="实习生" <%="实习生".equals(map.get("experience"))?"selected":"" %>>实习生</option>
															<option value="1年以内" <%="1年以内".equals(map.get("experience"))?"selected":"" %>>1年以内</option>
															<option value="1-3年" <%="1-3年".equals(map.get("experience"))?"selected":"" %>>1-3年</option>
															<option value="3-5年" <%="3-5年".equals(map.get("experience"))?"selected":"" %>>3-5年</option>
															<option value="5-10年" <%="5-10年".equals(map.get("experience"))?"selected":"" %>>5-10年</option>
															<option value="10年以上" <%="10年以上".equals(map.get("experience"))?"selected":"" %>>10年以上</option>
														</select>
													</span>
												</div>
												<br>
												<div class="row">
													<span>
														已招人数：
														<input type="text" name="readyNumb_<%=map.get("eid") %>" id="hadwork_edit" value="<%=map.get("readyNumb")%>" width="5%"/>
														人
													</span>
													<span style="margin-left: 12%;">
														岗位类型：
														<select name="zwtype_<%=map.get("eid") %>" style="width: 18%;">
															<option value="JAVA" <%="JAVA".equals(map.get("zwtype"))?"selected":"" %>>JAVA</option>
			 												<option value="Pyhton" <%="Pyhton".equals(map.get("zwtype"))?"selected":"" %>>pyhton</option>
															<option value="PHP" <%="PHP".equals(map.get("zwtype"))?"selected":"" %>>php</option>
															<option value="UED" <%="UED".equals(map.get("zwtype"))?"selected":"" %>>UED</option>
															<option value="AI" <%="AI".equals(map.get("zwtype"))?"selected":"" %>>AI</option>
															<option value="前端" <%="前端".equals(map.get("zwtype"))?"selected":"" %>>前端</option>
															<option value="运维" <%="运维".equals(map.get("zwtype"))?"selected":"" %>>运维</option>
															<option value="产品设计" <%="产品设计".equals(map.get("zwtype"))?"selected":"" %>>产品设计</option>
															<option value="其他" <%="其他".equals(map.get("zwtype"))?"selected":"" %>>其他</option>
														</select>
													</span>
												</div>
												<br>
												<div style="margin-left: -1.5%;">
													<span >岗位描述：</span><br>
													<textarea rows="2" cols="97" name="employment_describe_<%=map.get("eid") %>"><%=map.get("employment_describe")%></textarea>
												</div>
												<div style="margin-left: -1.5%;">
													<span>任职要求：</span><br>
													<textarea rows="4" cols="97" name="demand_<%=map.get("eid") %>"><%=map.get("demand")%></textarea>
												</div>
												<div style="margin-left: -1.5%;">
													<span>公司信息：</span><br>
													<textarea rows="4" cols="97" name="introduce_<%=map.get("eid") %>"><%=map.get("introduce")%></textarea>
												</div>
												<div style="margin-left: -1.5%;">
													<span>备注：</span><br>
													<textarea rows="2" cols="97%" name="note_<%=map.get("eid") %>"><%=map.get("note")%></textarea>
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
							<!-- 查看模态框 -->
							<div class="modal fade" id="view<%=map.get("eid")%>" tabindex="-1" role="dialog" aria-labelledby="modaltitle" aria-hidden="true">
								<div class="modal-dialog modal-lg" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h2 class="modal-title" id="modaltitle">查看</h2>
										</div>
										<div class="modal-body" style="font-size: 20px; margin-left: 20px;">
											<div class="row">
												<span>
													岗位名称：
													<input type="text" disabled="disabled" name="postname_view" id="postname_view" value="<%=map.get("employment_name")%>" style="width: 20%;" />	
												</span>
												<span style="margin-left:2%;">
													公司名称：
													<input type="text" disabled="disabled" name="comname_view" id="comname_view" value="<%=map.get("gsname")%>" style="width: 20%;" />
												</span>
												<span style="margin-left: 2%;">
													薪资:
													<input type="text" disabled="disabled" name="salary_view" id="salary_view" value="<%=qian%>" style="width: 12%;"/>
													<span style="font-size: 32px;">·</span>
													<input type="text" disabled="disabled" name="salarytimes_view" id="salarytimes_view" value="<%=xin%>" style="width: 5%;" />
													薪
												</span>
											</div>
											<br>
											<div class="row">
												<span>
													公司规模：
													<input type="text" disabled="disabled" name="comsize_view" id="comsize_view" value="<%=map.get("scale") %>" style="width: 20%;" />
												</span>
												<span style="margin-left: 2%;">
													公司性质：
													<input type="text" disabled="disabled" name="comattr_view" id="comattr_view" value="<%=map.get("nature_name")%>" style="width: 20%;" />
												</span>
												<span style="margin-left: 2%;">
													招聘人数：
													<input type="text" disabled="disabled" name="recruits_view" id="recruits_view" value="<%=map.get("recrultsNumb")%>" style="width: 10%;" />
													人
												</span>
											</div>
											<br>
											<div class="row">
												<span>
													公司福利：
													<input type="text" disabled="disabled" name="comwelfare_view" id="comwelfare_view" value="<%=map.get("welfare")%>" style="width: 20%;"/>
												</span>
												<span style="margin-left: 2%;">
													公司类型：
													<input type="text" disabled="disabled" name="comtype_view" id="comtype_view" value="<%=map.get("gstype")%>" style="width: 20%;"/>
												</span>
												<span style="margin-left: 2%;">
													公司所在地：
													<input type="text" disabled="disabled" name="comaddress_view" id="comaddress_view" value="<%=map.get("address")%>" style="width: 18%;" />
												</span>
											</div>
											<br>
											<div class="row">
												<span>
													学历要求：
													<input type="text" disabled="disabled" name="degree_view" id="comwelfare_view" value="<%=map.get("education")%>" style="width: 20%;"/>
												</span>
												<span style="margin-left: 2%;">
													联系电话：
													<input type="text" disabled="disabled" name="tel_view" id="comtype_view" value="<%=map.get("phone")%>" style="width: 20%;"/>
												</span>
												<span style="margin-left: 2%;">
													工作经验要求：
													<input type="text" disabled="disabled" name="workexp_view" id="comaddress_view" value="<%=map.get("experience")%>" style="width: 16%;" />
												</span>
											</div>
											<br>
											<div class="row">
												<span>
													已招人数：
													<input type="text" disabled="disabled" name="hadwork_view" id="hadwork_view" value="<%=map.get("readyNumb")%>" width="5%"/>
													人
												</span>
												<span>
													岗位类型：
													<input type="text" disabled="disabled" name="hadwork_view" id="hadwork_view" value="<%=map.get("zwtype")%>" width="5%"/>
												</span>
											</div>
											<br>
											<div style="margin-left: -1.5%;">
												<span >岗位描述：</span><br>
												<textarea disabled="disabled" rows="2" cols="97%" name="descript_view"><%=map.get("employment_describe")%></textarea>
											</div>
											<div style="margin-left: -1.5%;">
												<span>任职要求：</span><br>
												<textarea disabled="disabled" rows="4" cols="97%" name="workrequire_view"><%=map.get("demand")%></textarea>
											</div>
											<div style="margin-left: -1.5%;">
												<span>公司信息：</span><br>
												<textarea disabled="disabled" rows="4" cols="97%" name="cominfo_view"><%=map.get("introduce")%></textarea>
											</div>
											<div style="margin-left: -1.5%;">
													<span>备注：</span><br>
													<textarea rows="2" cols="97%" name=""><%=map.get("note")%></textarea>
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
							<%}%>
							<!-- 以上都要存数据*/ -->
							<tr>
								<td colspan="9">
									<div class="row" style="background-color: #dafffb;">
										<div  style="float: left;">
											<a href="/*"><span class="glyphicon glyphicon-chevron-left" style="width: 30px;height: 30px;border: #000000 1px solid;"></span></a>
											<a href="/*"><span class="glyphicon glyphicon-chevron-right" style="width: 30px;height: 30px;border: #000000 1px solid;"></span></a>
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
										<div style="float: right;">
											<span>
												每页显示
												<select name="infonum" style="width:80px">
													<option value="15">15</option>
													<option value="20">20</option>
													<option value="25">25</option>
													<option value="30">30</option>
												</select>
											</span>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function checkdel(delform){
			if(confirm("确认删除该公司招聘信息？")){
				delform.submit();
			}
		}
	</script>
</html>
    