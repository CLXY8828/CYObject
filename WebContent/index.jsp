<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>主页面</title>
		
		<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/zym.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/jquery/jquery.js"></script>
		<style type="text/css">
			#address{
			  border:1px solid #CCCCCC;
			  padding:6px 16px 4px 4px;
			  /*background: url(img/1.jpg) no-repeat 80px center;*/
			  width:80px;
			  height:30px;
			  text-align:center;
			  cursor:pointer;
			}
			*{
			  padding:0;
			  margin:0;
			}
			ul{
			  margin:0px;
			  padding:5px;
			  font-size:12px;
			}
			a{
			  color:#009999;
			  text-decoration:none;
			}
			a:hover{
			  background-color:#006699;
			  color:#FFFFFF;
			  text-decoration:underline;
			}
			li{
			  list-style:none;
			  width:38px;
			  padding:2px 2px;
			  display:inline-block;
			}
			#citys{
			  border:1px solid #FF0000;
			  width:336px;
			  position:relative;
			}
			#citys span{
			  padding:5px;
			}
			#smallCity{
			  border-top:1px solid #CCCCCC;
			}
			#cancel{
			  position:absolute;
			  width:20px;
			  height:20px;
			  cursor:pointer;
			  top:0px;
			  right:0px;
			  border:1px solid #333;
			  text-align:center;
			  font-size:16px;
			  line-height:20px;
			  background-color:#ddd;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
							var ws=<%=(List)request.getAttribute("ws")%>;
							if(<%=request.getSession().getAttribute("user")%>!=null){
								if(ws==null){
									$('#myModal001').modal('show');
								}
							}
						});
		</script>
	</head>
	<body>
		<div class="container" style="background-image: url(<%=request.getContextPath() %>/img/004.jpg); height: 300px;width: 1518px; " >
			<div class="row">
			<div class="col-md-1 col-md-offset-1" style="height: 80px; width: 120px; margin: 20px 0px 0px 50px; ">
			  	<img src="<%=request.getContextPath() %>/img/001.png" class="img-responsive" alt="Responsive image" style="width:100%;height:100%; ">
			</div>
			<div class="col-md-3" style="font-size: 40px; text-align: center; font-weight: bold; color: white ; margin: 30px 0px 0px 0px; ">高 校 就 业 平 台</div>
			
			
			<div class="col-md-6 " style="margin:50px 0px 0px 200px ; ">
				<div class="row">
					<div class="col-md-1" style="margin:5px 0px 0px 200px ; "align="right">
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="height: 50px ; width: 50px;"></span>
					</div>
					
					<div id="address" class="col-md-4">
						河北
					</div>
					<div class="col-md-4" id="address01">
						<a style="color: blue;">切换城市</a>
					</div>
				</div>
				
			
			</div>
			
			
			<!-- Split button -->
			
				<div class=" btn-group col-md-1 " style="margin: 0px 0px 0px 1300px; bottom: 70px;  ">
				<c:set var="map" scope="session" value="${sessionScope.user}"></c:set>
			<c:choose>
				
				<c:when test="${!empty map}">
				  <button type="button" class="btn btn-default">我的</button>
				  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    <span class="caret"></span>
				    <span class="sr-only">Toggle Dropdown</span>
				  </button>
				
				  <ul class="dropdown-menu">
				    <li><a href="wd.html">个人信息</a></li>
				    <br />
				    <li><a href="#">个人中心</a></li>
				    <br />
				    <li><a href="<%=request.getContextPath() %>/users/logein.do?method=out">退出</a></li>
				  </ul>
				  </c:when>
				 <c:otherwise>
					  <a href="<%=request.getContextPath() %>/users/index.do?method=loginpage" type="button" class="btn btn-default">登录</a>
				 </c:otherwise>
				 </c:choose>
				 
				</div>
				
			
				
							    				
				<!-- 引导个人信息的填写 -->
					<div class="modal fade" id="myModal001" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" style=" margin: 250px 0px 0px 0px;">
					  <div class="modal-dialog modal-sm" role="document">
					    <div class="modal-content">
					      
					      <div class="modal-body">
					      	 <br />
					      	 <h4 class="modal-title" id="myModalLabel">请完善个人信息:</h4>
					      	 <br />
					        <h5 class="modal-title" id="myModalLabel">步骤：点击右上角我的---------->完善个人基本信息的填写</h5>
					       	<br />
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal" style="margin: 0px 95px 0px 0px;">稍后填写</button>
					        <a class="btn btn-primary" ">立即填写</a>
					      </div>
					    </div>
					  </div>
					</div>
			
			
			
			
			<div  style="border:2px solid #E5E5E5;  height: 80px ; width: 650px; margin: 210px 400px 0px  346px; font-size: 40px; font: '宋体'; ">
				
					<form class="navbar-form navbar-left" role="search" action="<%=request.getContextPath() %>/logein.do?" method="post">
						
					  <div class="form-group" >
					  	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >全文 <span class="caret"></span></button>
								        <ul class="dropdown-menu">
								          <li><a href="#">全文</a></li>
								        </ul>
								        
					    <input type="text" class="form-control" placeholder="请输入关键字" style="height: 40px; width: 400px; ">
					  </div>
					  <button type="submit" class="btn btn-default" style=" background-color: #E38D13; color: white; ">&nbsp;&nbsp;&nbsp;&nbsp;搜 索&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</form>
				
			</div>
			
			<div class="col-md-3" style="border:2px solid #E5E5E5;  height: 160px; width: 180px;  bottom:150px; left: 998px;">
				
				<div class=" " style="margin: 0px 0px 0px 140px;">
					<img src="<%=request.getContextPath() %>/img/006.png" alt="..." class="img-rounded" style=" height: 15px; width: 15px; ">
				</div>
				
				<img src="<%=request.getContextPath() %>/img/034.jpg" alt="..." class="img-circle" style=" height: 40px; width: 40px;">
				<span style="font-size: 13px; font: arial; font-weight: 550;">我的简历</span>
				<br />
				
				
				

				<table style=" border-collapse: separate; border-spacing: 6px; font: arial;">
					<tr>
						<td>
							<button type="button" class="btn btn-primary btn-sm" style="background-color: #E38D13 ; color: white;">刷新简历</button>
						</td>
						<td>
							<button type="button" class="btn btn-default btn-sm" style="color: #E38D13;">编辑简历</button>
						</td>
					</tr>
					<tr align="center" style="font-size: 20px;">
						<td>0</td>
						<td>0</td>
					</tr>
					<tr  align="center" style="font-size: 13px; font-weight: 500;">
						<td>我的收藏</td>
						<td>申请记录</td>
					</tr>
				</table>
				
			</div>
			
			<div id="citys"  style="display:none ; margin: 0px 0px 0px 1180px; bottom: 150px;">
				  <span>请选择省份:</span>
				  <ul id="bigCity">
				  	 <li><a href="#" class="city">北京</a></li>
					 <li><a href="#" class="city">河北</a></li>
					 <li><a href="#" class="city">上海</a></li>
					 <li><a href="#" class="city">天津</a></li>
				
				  </ul>
				  <ul id="province">
				  	<li><a id="hb" class="province" href="#">河北</a></li>
					<li><a id="zj" class="province" href="#">浙江</a></li>
					 <li><a id="ah" class="province" href="#">安徽</a></li>
					 <li><a id="sc" class="province" href="#">四川</a></li>
					 <li><a id="gz" class="province" href="#">贵州</a></li>
					 <li><a id="yn" class="province" href="#">云南</a></li>
					 <li><a id="hn" class="province" href="#">湖南</a></li>
					 <li><a id="gd" class="province" href="#">广东</a></li>
					 <li><a id="sd" class="province" href="#">山东</a></li>
				 
				  </ul>
				  <ul id="smallCity" style="display:none">
				 <!--浙江-->
				 <li><a class="zjCity" href="#">宁波</a></li>
				  <li><a class="zjCity" href="#">杭州</a></li>
				  <li><a class="zjCity" href="#">温州</a></li>
				  <li><a class="zjCity" href="#">台州</a></li>
				  <li><a class="zjCity" href="#">绍兴</a></li>
				  <!--广东-->
				  <li><a class="gdCity" href="#">广州</a></li>
				  <li><a class="gdCity" href="#">深圳</a></li>
				  <li><a class="gdCity" href="#">中山</a></li>
				  <li><a class="gdCity" href="#">珠海</a></li>
				  <li><a class="gdCity" href="#">汕头</a></li>
				  <li><a class="gdCity" href="#">东莞</a></li>
				  <li><a class="gdCity" href="#">梅州</a></li>
				  <!--安徽-->
				  <li><a class="ahCity" href="#">合肥</a></li>
				  <li><a class="ahCity" href="#">芜湖</a></li>
				  <li><a class="ahCity" href="#">宣城</a></li>
				  <li><a class="ahCity" href="#">池州</a></li>
				  <li><a class="ahCity" href="#">六安</a></li>
				  <!--四川-->
				  <li><a class="scCity" href="#">成都</a></li>
				  <li><a class="scCity" href="#">雅安</a></li>
				  <li><a class="scCity" href="#">广安</a></li>
				  <!--贵州-->
				  <li><a class="gzCity" href="#">贵阳</a></li>
				  <li><a class="gzCity" href="#">遵义</a></li>
				  <!--云南-->
				  <li><a class="ynCity" href="#">昆明</a></li>
				  <li><a class="ynCity" href="#">丽江</a></li>
				  <!--湖南-->
				  <li><a class="hnCity" href="#">长沙</a></li>
				  <li><a class="hnCity" href="#">株洲</a></li>
				  <li><a class="hnCity" href="#">常德</a></li>
				  <!--山东-->
				  <li><a class="sdCity" href="#">济南</a></li>
				  <li><a class="sdCity" href="#">青岛</a></li>
				  <!--河北-->
				  <li><a class="hbCity" href="#">石家庄</a></li>
				  <li><a class="hbCity" href="#">保定</a></li>
				  <li><a class="hbCity" href="#">秦皇岛</a></li>
				  <li><a class="hbCity" href="#">邢台</a></li>
				  <li><a class="hbCity" href="#">唐山</a></li>
				  <li><a class="hbCity" href="#">邯郸</a></li>
				  <li><a class="hbCity" href="#">张家口</a></li>
				  <li><a class="hbCity" href="#">承德</a></li>
				  <li><a class="hbCity" href="#">沧州</a></li>
				  <li><a class="hbCity" href="#">廊坊</a></li>
				  <li><a class="hbCity" href="#">衡水</a></li>
				  </ul>
				  <p id="cancel">×</p>
				</div>
			
			
			</div>
		</div>
		
		
		
		<div class="container-fluid" style=" box-shadow:0 0 6px 3px #c3c3c3;   align-content: center; width: 860px; ">
		  	<div class="row" >
		  		
		  		<div class="table-responsive col-md-12">
		  		<form action="<%=request.getContextPath() %>/logein.do?method=loge" method="post">
				  <table class="table " style="font-family: arial;">
				    	<thead  class="active"  style="font-size: 15PX;">
				    		
				    		<th>
				    		<div class="btn-group btn-group-justified" role="group" aria-label="...">
				    			
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" id="xzyq01" onclick="xs01()">薪资要求</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" id="xzyq02" onclick="xs02()">学历要求</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" id="xzyq03" onclick="xs03()">工作经验</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" id="xzyq04" onclick="xs04()">职位类型</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" id="xzyq05" onclick="xs05()">公司性质</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" id="xzyq06" onclick="xs06()">公司规模</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" onclick="xs07()">清空筛选条件</button>
							  </div>
							  
							</div>
							</th>
							
				    	</thead>
				    	
				    	<tbody style="font-family: arial;" align="center">
				    		
				    		<tr>
				    			<td colspan="7">
					    			<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="xzyq">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gxnr01()">3K以下</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gxnr02()">3K-5K</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gxnr03()">5K-10K</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gxnr04()">10K-20K</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gxnr05()">40-60K</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gxnr06()">60K以上</button>
									  </div>

									  
				
									  
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="xlyq">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="xlyq01()">初中及以下</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="xlyq02()">高中</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="xlyq03()">大专</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="xlyq04()">本科</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="xlyq05()">硕士</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="xlyq06()">博士</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="xlyq07()">MBA/EMBA</button>
									  </div>
				
									  
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="gzjy">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gzjy01()">应届生</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gzjy02()">实习生</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gzjy03()">1年以内</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gzjy04()">1-3年</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gzjy05()">3-5年</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gzjy06()">5-10年</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gzjy07()">10年以上</button>
									  </div>
				
									</div>
									
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="zwlx">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx01()">JAVA</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx02()">Python</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx03()">PHP</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx04()">UED</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx05()">AI</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx06()">前端</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx07()">运维</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx08()">产品设计</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="zwlx09()">其他</button>
									  </div>
				
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="gsxz">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsxz01()">国有企业</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsxz02()">民营企业</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsxz03()">外资企业</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsxz04()">合伙企业</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsxz05()">有限责任公司</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsxz06()">股份有限公司</button>
									  </div>
				
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="gsgm">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsgm01()">20人以下</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsgm02()">20-99人</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsgm03()">100-299人</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsgm04()">500-999人</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsgm05()">1000-9999人</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsgm06()">万人以上</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default" onclick="gsgm07()">不限</button>
									  </div>
									  
									</div>
									
									
								</td>
				    		</tr>
				    		
				 
				    		
				    		<tr >
				    			<td colspan="7">
				    				<a href="fym.html" style="color: black;">
						    		<div class="well well-lg" style=" width: 800px; height: 180px;  ">
						    			<div>
							    			<span  style="font-size: 25px; font-weight: bold; ">Java开发工程师</span>
							    			
							    			<span  style="margin: 0px 0px 0px 360px; " >北京京云万峰信息技术有限公司</span>
						    			</div>
						    			
						    			
						    			<div align="left">
							    			<span style="font-size: 24px; color: red; ">1.5万-3万 .13薪</span>
							    			<span style="margin: 0px 0px 0px 50px; font-size: 20px;">北京.海淀区</span>
							    			<span style="margin: 0px 0px 0px 20px; ">| 1-3年 本科</span>
						    			</div>
						    			<br />
						    			
						    			
						    			<div class="row">
											  
											<div class="col-md-1 " style="width: 100px; height: 20px; border:1px solid #000; " align="center">java</div>
											<div class="col-md-1 " style="width: 100px; height: 20px; border:1px solid #000; margin: 0px 0px 0px 20px; " align="center">HTMD/CSS</div>
											<div class="col-md-1 " style="width: 100px; height: 20px; border:1px solid #000; margin: 0px 0px 0px 20px;" align="center">javaScript</div>
											<div class="col-md-1 " style="width: 100px; height: 20px; border:1px solid #000; margin: 0px 0px 0px 20px;" align="center">jQuery</div>
						    			</a>
						    				<div class="col-md-4 " style="margin: 0px 0px 0px 520px;" >
						    					<div class="col-md-7 " id=shoucang01 onclick="shoucang(true)">
							    					<img src="<%=request.getContextPath() %>/img/005.png" alt="..." class="..." style=" height: 35px; width: 38px;">
													<span style="font-size: 16px; font: arial; ">收藏&nbsp;&nbsp;</span>
												</div>
												<div class="col-md-7 " id=shoucang02 " style="display: none;">
							    					<img src="<%=request.getContextPath() %>/img/收藏-已收藏.png" alt="..." class="..." style=" height: 35px; width: 38px;">
													<span style="font-size: 16px; font: arial; ">已收藏&nbsp;&nbsp;</span>
												</div>
												
							    				<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal" id="sqzw">申 请 职 位</button>
							    				<button type="button" class="btn btn-primary"   style="display: none" id="sqzw01">等 待 审 核</button>
							    				
							    				<!-- Modal模态框 -->
													<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
													  <div class="modal-dialog" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													        <h4 class="modal-title" id="myModalLabel">您所要申请的是北京京云万峰信息技术有限公司</h4>
													        <h5 class="modal-title" id="myModalLabel">JAVA开发工程师</h5>
													      </div>
													      <div class="modal-body">
													        <img src="<%=request.getContextPath() %>/img/008.jpg" alt="..." class="img-thumbnail">
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-default" data-dismiss="modal" style="margin: 0px 430px 0px 0px;">再想想</button>
													        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal01">确 定</button>
													        
													      </div>
													    </div>
													  </div>
													</div>
													
													<!-- Small modal -->
													<div class="modal fade" id="myModal01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
													  <div class="modal-dialog" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
														        <h4 class="modal-title" id="myModalLabel">您所要申请的是北京京云万峰信息技术有限公司</h4>
														        <h5 class="modal-title" id="myModalLabel">JAVA开发工程师</h5>
														      </div>
														      <div class="modal-body">
														      	<h4 class="modal-title" id="myModalLabel">上传简历成功</h4>
														      </div>
														      <div class="modal-footer" align="center">
														        <button type="button" class="btn btn-primary" data-toggle="modal" style="margin: 0px 250px 0px 0px;" onclick="tiaozhuan()">确定</button>
														        
														      </div>
														</div>
													    </div>
													  </div>
													</div>
													
							    			</div>
							    			
						    			
						    			</div>
						    			
						    		</div>
						    		
					    		</td>
					    	</tr>
					    	
					    	
				    	</tbody>
				    	
				    	
				  </table>
				  </form>

				  
				</div>
		  	
			</div>
		</div>
		
		
	</body>
</html>
