<%@page import="java.util.Map"%>
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
			if(<%=request.getAttribute("list")==null%>){//
				<%Map user=(Map)request.getSession().getAttribute("user");%>
				window.location.href=encodeURI("<%=request.getContextPath()%>/users/index.do?method=query");
			}
			if(<%=request.getSession().getAttribute("user")==null%>){
				$('#login').modal('show');
				
			}
			else{
				if(<%=(List)request.getAttribute("ws")==null%>){
					$('#myModal001').modal('show');
				}
			}
			});
		function sc(userid,eid) {
			var url ="<%=request.getContextPath()%>/users/index.do?method=sc";
				$.post(url,{userid:userid,eid:eid},function(data)
				{
					
				});
		}
		function sq(userid,eid,id,mid) {
			var url ="<%=request.getContextPath()%>/users/index.do?method=sq";
				$.post(url,{userid:userid,eid:eid},function(data)
				{
					shenqing(id,true,mid);
				});
		}
		function qsc(userid,eid) {
			var url ="<%=request.getContextPath()%>/users/index.do?method=qsc";
				$.post(url,{userid:userid,eid:eid},function(data)
				{
					
				});
		}
		
		function login () {
					if(<%=request.getSession().getAttribute("user")==null%>){
						$('#login').modal('show');
					}
					
				}
		
		//筛选
		//选择之后改变薪资要求的内容
		function gxnr01(xxz)
		{
			var xl=$("#xzyq02").text();
			var jy=$("#xzyq03").text();
			var zw=$("#xzyq04").text();
			var xz=$("#xzyq05").text();
			var gm =$("#xzyq06").text();
			
			document.getElementById("xzyq01").innerHTML=xxz;
			window.location.href=encodeURI("<%=request.getContextPath()%>"+"/users/index.do?method=mquery&type=2&xl="+xl+"&jy="+jy+"&zw="+zw+"&gm="+gm+"&xxz="+xxz+"&xz="+xz);
		}
		//选择之后改变学历要求的内容
		function xlyq01(xl)
		{
			
			var xxz=$("#xzyq01").text();
			var jy=$("#xzyq03").text();
			var zw=$("#xzyq04").text();
			var xz=$("#xzyq05").text();
			var gm =$("#xzyq06").text();
			document.getElementById("xzyq02").innerHTML=xl;
			window.location.href=encodeURI("<%=request.getContextPath()%>"+"/users/index.do?method=mquery&type=2&xl="+xl+"&jy="+jy+"&zw="+zw+"&gm="+gm+"&xxz="+xxz+"&xz="+xz);
		}
		
		//选择之后改变学历要求的内容
		function gzjy01(jy)
		{	
			var xxz=$("#xzyq01").text();
			var xl=$("#xzyq02").text();
			var zw=$("#xzyq04").text();
			var xz=$("#xzyq05").text();
			var gm =$("#xzyq06").text();
			document.getElementById("xzyq03").innerHTML=jy;
			window.location.href=encodeURI("<%=request.getContextPath()%>"+"/users/index.do?method=mquery&type=2&xl="+xl+"&jy="+jy+"&zw="+zw+"&gm="+gm+"&xxz="+xxz+"&xz="+xz);
		}
		//选择之后改变职位类型的内容
		function zwlx01(zw)
		{
			var xxz=$("#xzyq01").text();
			var xl=$("#xzyq02").text();
			var jy=$("#xzyq03").text();
			var xz=$("#xzyq05").text();
			var gm =$("#xzyq06").text();
			document.getElementById("xzyq04").innerHTML=zw;
			window.location.href=encodeURI("<%=request.getContextPath()%>"+"/users/index.do?method=mquery&type=2&xl="+xl+"&jy="+jy+"&zw="+zw+"&gm="+gm+"&xxz="+xxz+"&xz="+xz);
		}
		//选择之后改变公司性质的内容
		function gsxz01(xz)
		{
			var xxz=$("#xzyq01").text();
			var xl=$("#xzyq02").text();
			var jy=$("#xzyq03").text();
			var zw=$("#xzyq04").text();
			var gm=$("#xzyq06").text();
			document.getElementById("xzyq05").innerHTML=xz;
			window.location.href=encodeURI("<%=request.getContextPath()%>"+"/users/index.do?method=mquery&type=2&xl="+xl+"&jy="+jy+"&zw="+zw+"&gm="+gm+"&xxz="+xxz+"&xz="+xz);		}
		//选择之后改变公司规模的内容   
		function gsgm01(gm)
		{
			var xxz=$("#xzyq01").text();
			var xl=$("#xzyq02").text();
			var jy=$("#xzyq03").text();
			var zw=$("#xzyq04").text();
			var xz=$("#xzyq05").text();
			document.getElementById("xzyq06").innerHTML=gm;
			window.location.href=encodeURI("<%=request.getContextPath()%>"+"/users/index.do?method=mquery&type=2&xl="+xl+"&jy="+jy+"&zw="+zw+"&gm="+gm+"&xxz="+xxz+"&xz="+xz);
		}
		//清空筛选条件，把选择条件全部清空还原
		function xs07()
		{
			document.getElementById("xzyq01").innerHTML="薪资要求";
			document.getElementById("xzyq02").innerHTML="学历要求";
			document.getElementById("xzyq03").innerHTML="工作经验";
			document.getElementById("xzyq04").innerHTML="职位类型";
			document.getElementById("xzyq05").innerHTML="公司性质";
			document.getElementById("xzyq06").innerHTML="公司规模";
			window.location.href=encodeURI("<%=request.getContextPath()%>/users/index.do?method=query");
		}
		function shenqing(id,data,mid)
		{
			if(data==true)
			{	
				$("#"+id).html("已申请");
				$("#"+id).attr("disabled","disabled");
				$('#'+mid).modal('hide');
			}
		}
		
	</script>
	</head>
	<body style="background-color: #F8F8F8">
	<script type="text/javascript">

	
	</script>
		<div class="container" style="background-image: url(<%=request.getContextPath() %>/img/004.jpg); height: 300px;width: 1518px; " >
			<div class="row">
			<div class="col-md-1 col-md-offset-1" style="height: 80px; width: 120px; margin: 20px 0px 0px 50px; ">
			  	<img src="<%=request.getContextPath() %>/img/001.png" class="img-responsive" alt="Responsive image" style="width:100%;height:100%; ">
			</div>
			<div class="col-md-3" style="font-size: 40px; text-align: center; font-weight: bold; color: white ; margin: 30px 0px 0px 0px; ">高 校 就 业 平 台</div>
			
			
			<div class="col-md-6 " style="margin:50px 0px 0px 200px ; ">
					<div id="address" class="col-md-4 col-md-offset-4">
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true">河北</span>
					</div>
			</div>
			
			
				<div class=" btn-group col-md-1 " style="margin: 0px 0px 0px 1300px; bottom: 70px;  ">
				<c:set var="user" scope="session" value="${sessionScope.user}"></c:set>
			<c:choose>
				
				<c:when test="${!empty user}">
				  <button type="button" class="btn btn-success">我的</button>
				  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
					  <a href="<%=request.getContextPath() %>/users/index.do?method=loginpage" style="width: 70px;font-size: 15px" type="button" class="btn btn-primary">登录</a>
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
			
			
			
			
			<div  style="  height: 80px ; width: 1000px; margin: 210px 0px 0px  230px; font-size: 40px; font: '宋体'; ">
				
					<form class="navbar-form navbar-left" role="search" action="<%=request.getContextPath() %>/users/index.do?method=mquery&type=1" method="post">
						
					  <div class="form-group" >
					  
					  	<select class="form-control" name="select">
	          					<option value="全文">全文</option>
	          					<option value="公司">公司</option>
	          			</select>
						<div class="input-group" >		        
						    <input type="text" name="text" class="form-control" placeholder="请输入关键字" style="height: 40px; width: 538px; ">
						  	<span class="input-group-btn">
					        	<button class="btn btn-default" type="button" style="height: 40px;">河北</button>
					      	</span>
				      	</div>
					  </div>
					  <button type="submit" class="btn btn-default" style=" background-color: #E38D13; color: white; ">&nbsp;&nbsp;&nbsp;&nbsp;搜 索&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</form>
				
			</div>
			
			<div class="col-md-3" onclick="login()" style="border:2px solid #E5E5E5;  height: 160px; width: 180px;  bottom:150px; left: 1070px;">
				
				<div class=" " style="margin: 0px 0px 0px 140px;">
					<img src="<%=request.getContextPath() %>/img/006.png" alt="..." class="img-rounded" style=" height: 15px; width: 15px; ">
				</div>
				
				<img src="<%=request.getContextPath() %>/img/034.jpg" alt="..." class="img-circle" style=" height: 40px; width: 40px;">
				<span style="font-size: 13px; font: arial; font-weight: 550;">我的简历</span>
				<br />
				
				
				

				<table style=" border-collapse: separate; border-spacing: 6px; font: arial;">
					<tr>
						<td>
							<button type="button" class="btn btn-primary btn-sm" style="background-color: #E38D13 ; color: white;">上传简历</button>
						</td>
						<td>
							<button type="button" class="btn btn-default btn-sm" style="color: #E38D13;">历史简历</button>
						</td>
					</tr>
					<tr align="center" style="font-size: 20px;">
						<td>${sessionScope.sc}</td>
						<td>${sessionScope.sq}</td>
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
		
		
		
		<div class="container-fluid" style=" box-shadow:0 0 0px 0px #c3c3c3;   align-content: center; width: 1150px; ">
		  	<div class="row" >
		  		<c:set var="tj" scope="request" value="${requestScope.tj}"></c:set>
		  		<div class="table-responsive col-md-12">
		  		<form action="<%=request.getContextPath() %>/logein.do?method=loge" method="post">
				  <table style="font-family: arial;" border="0">
				    	<thead  class="active"  style="font-size: 15PX;">
				    		
				    		<th>
				    		<div class="btn-group btn-group-justified" role="group" aria-label="...">
				    			
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default btn-lg" id="xzyq01" onclick="xs01()">${empty tj?"薪资要求":tj.xxz }</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default btn-lg" id="xzyq02" onclick="xs02()">${empty tj?"学历要求":tj.xl }</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default btn-lg" id="xzyq03" onclick="xs03()">${empty tj?"工作经验":tj.jy }</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default btn-lg" id="xzyq04" onclick="xs04()">${empty tj?"职位类型":tj.zw }</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default btn-lg" id="xzyq05" onclick="xs05()">${empty tj?"公司性质":tj.xz }</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default btn-lg" id="xzyq06" onclick="xs06()">${empty tj?"公司规模":tj.gm }</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default btn-lg" onclick="xs07()">清空筛选条件</button>
							  </div>
							  
							</div>
							</th>
							
				    	</thead>
				    	
				    	<tbody style="font-family: arial;" align="center">
				    		
				    		<tr>
				    			<td colspan="7">
					    			<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="xzyq">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gxnr01('3K以下')">3K以下</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gxnr01('3K-5K')">3K-5K</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gxnr01('5K-10K')">5K-10K</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gxnr01('10K-20K')">10K-20K</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gxnr01('40-60K')">40-60K</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gxnr01('60K以上')">60K以上</button>
									  </div>

									  
				
									  
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="xlyq">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="xlyq01('初中及以下')">初中及以下</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="xlyq01('高中')">高中</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="xlyq01('大专')">大专</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="xlyq01('本科')">本科</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="xlyq01('硕士')">硕士</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="xlyq01('博士')">博士</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="xlyq01('MBA/EMBA')">MBA/EMBA</button>
									  </div>
				
									  
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="gzjy">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gzjy01('应届生')">应届生</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gzjy01('实习生')">实习生</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gzjy01('1年以内')">1年以内</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gzjy01('1-3年')">1-3年</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gzjy01('3-5年')">3-5年</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gzjy01('5-10年')">5-10年</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gzjy01('10年以上')">10年以上</button>
									  </div>
				
									</div>
									
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="zwlx">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('JAVA')">JAVA</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('Python')">Python</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('PHP')">PHP</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('UED')">UED</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('AI')">AI</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('前端')">前端</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('运维')">运维</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('产品设计')">产品设计</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="zwlx01('其他')">其他</button>
									  </div>
				
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="gsxz">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsxz01('国有企业')">国有企业</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsxz01('民营企业')">民营企业</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsxz01('外资企业')">外资企业</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsxz01('合伙企业')">合伙企业</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsxz01('有限责任公司')">有限责任公司</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsxz01('股份有限公司')">股份有限公司</button>
									  </div>
				
									</div>
									
									<div class="btn-group btn-group-justified" role="group" aria-label="..." style="display: none " id="gsgm">
					    			
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsgm01('20人以下')">20人以下</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsgm01('20-99人')">20-99人</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsgm01('100-299人')">100-299人</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsgm01('500-999人')">500-999人</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsgm01('1000-9999人')">1000-9999人</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsgm01('万人以上')">万人以上</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="button" class="btn btn-default btn-lg" onclick="gsgm01('不限')">不限</button>
									  </div>
									  
									</div>
									
									<br />
								</td>
				    		</tr>
				    		
				 			<c:set value="1" var="i"></c:set>
				    		<c:forEach var="map" items="${requestScope.list}">
				    		<tr onclick="login()">
				    			<td colspan="7">
				    			<div class="panel panel-info" style=" width: 1116px; height: 160px;">
						    		<div class="panel-body">
						    		<div class="row row-no-gutters">
						    		<div class="col-xs-12 col-md-10 col-md-offset-1">
				    				<a href="fym.html" style="color: black;">
						    			
						    			<div class="row" style="white-space: nowrap;">
							    			<span class="pull-left"  style="font-size: 25px; font-weight: bold;">${map.employment_name}</span>
							    			<span class="pull-right"  style="text-overflow: ellipsis;" >${map.gsname}</span>
						    			</div>
						    			
						    			
						    			<div class="row">
						    				<div class="pull-left">
							    			<span  style="font-size: 24px; color: red; ">${map.salary}</span>
							    			<span style="margin: 0px 0px 0px 50px;">${map.address}</span>
							    			<span style="margin: 0px 0px 0px 0px; ">| ${map.experience} ${map.education}</span>
							    			</div>
						    			</div>
									    <br />		
						    			</a>
						    		</div>
						    		</div>
						    			
						    			<div class="row">
						    			<div class="col-md-4 col-md-offset-1" style=" padding: 0px 0px 0px 0px;">
						    				<div class="pull-left" style="padding: 0px 0px 0px 0px;">
											 <c:forTokens items="${map.welfare}" delims="#" var="name">
											<span class="label label-info">${name}</span>
						    				</c:forTokens>
						    				</div>
						    			</div>
						    			
						    				<div class="col-md-4 col-md-offset-3" style="" >
							    				<c:choose>
						    					<c:when test="${empty user}">
						    					<a>
						    					<div class="col-md-7 ">
						    						
							    					<img src="<%=request.getContextPath() %>/img/005.png" alt="..." class="..." style=" height: 35px; width: 38px;">
													<span style="font-size: 16px; font: arial;">收藏&nbsp;&nbsp;</span>
												</div>
												</a>
												<button type="button" class="btn btn-primary" onclick="login()">申 请 职 位</button>
												</c:when>
												<c:otherwise>
												<c:if test="${map.Collectionstate==1}">
												<a href=""  onclick="qsc('${map.UUID}','${map.eid}')">
												<div class="col-md-7 "  >
							    					<img  id="shoucang" src="<%=request.getContextPath() %>/img/收藏-已收藏.png" alt="..." class="..." style=" height: 35px; width: 38px;">
													<span id="shoucang01" style="font-size: 16px; font: arial; ">已收藏&nbsp;&nbsp;</span>
												</div>
												</a>
												</c:if>
												<c:if test="${map.Collectionstate==0}">
												<a href=""  onclick="sc('${map.UUID}','${map.eid}')">
												<div class="col-md-7 ">
							    					<img id="shoucang" src="<%=request.getContextPath() %>/img/005.png" alt="..." class="..." style=" height: 35px; width: 38px;">
													<span id="shoucang01" style="font-size: 16px; font: arial;">收藏&nbsp;&nbsp;</span>
												</div>
												</a>
												</c:if>
												<c:if test="${map.applystate==1}">
												
												<button id="sq${i}" disabled="disabled" type="button" class="btn btn-primary">已申请</button>
												</c:if>
												<c:if test="${map.applystate==0}">
												<button type="button" id="sq${i}" class="btn btn-primary"  data-toggle="modal" data-target="#myModa${i}">申 请 职 位</button>
												</c:if>
												</c:otherwise>
												</c:choose>
							    				
							    				
							    				<!-- Modal模态框 -->
													<div class="modal fade" id="myModa${i}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
													  <div class="modal-dialog" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													        <h4 class="modal-title" id="myModalLabel">您所要申请的是${map.gsname}</h4>
													        <h5 class="modal-title" id="myModalLabel">${map.employment_name}</h5>
													      </div>
													      <div class="modal-body">
													        <img src="<%=request.getContextPath() %>/img/008.jpg" alt="..." class="img-thumbnail">
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-default" data-dismiss="modal" style="margin: 0px 430px 0px 0px;">再想想</button>
													        <button type="button"  onclick="sq('${map.UUID}','${map.eid}','sq${i}','myModa${i}')" class="btn btn-primary" data-toggle="modal" data-target="#myModal${i}">确 定</button>
													        
													      </div>
													    </div>
													  </div>
													</div>
													
													<!-- Small modal -->
													<div class="modal fade" id="myModal${i}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
													  <div class="modal-dialog" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
														        <h4 class="modal-title" id="myModalLabel">您所要申请的是${map.gsname}</h4>
														        <h5 class="modal-title" id="myModalLabel">${map.employment_name}</h5>
														      </div>
														      <div class="modal-body">
														      	<h4 class="modal-title" id="myModalLabel">上传简历成功</h4>
														      </div>
														      <div class="modal-footer" align="center">
														        <button type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" style="margin: 0px 250px 0px 0px;">确定</button>
														        
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
					    	<c:set var="i" value="${i+1}"></c:set>
					    	</c:forEach>
				    	</tbody>
				    	
				    	
				  </table>
				  </form>

				  
				
		  	
			</div>
		</div>
		<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" style=" margin: 250px 0px 0px 0px;">
		  <div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content">
		      
		      <div class="modal-body" align="center">
		      	 <br />
		      	 <br />
		      	 <h4 class="modal-title" id="myModalLabel">请先进行登录</h4>
		      	 <br />
		       	<br />
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal" style="margin: 0px 95px 0px 0px;">稍后登录</button>
		        <a class="btn btn-primary" href="<%=request.getContextPath()%>/users/index.do?method=loginpage">立即登录</a>
		      </div>
		    </div>
		  </div>
		</div>

	</body>
</html>
