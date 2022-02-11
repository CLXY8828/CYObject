<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/index.css"/>
		<script src="<%=request.getContextPath() %>/js/index.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(document).ready(function () {
				if(<%=request.getAttribute("list")==null%>){//
					<%Map user=(Map)request.getSession().getAttribute("user");%>
					window.location.href=encodeURI("<%=request.getContextPath()%>/users/index.do?method=query");
				}
				if(<%=request.getSession().getAttribute("user")==null%>){
					modaltt("#logeink");
					
				}
				else{
					if(<%=(Map)request.getSession().getAttribute("ws")==null%>){
						modaltt("#okxx");
					}
				}
				var action=mqueryform()
				$("#mqueryform").attr('action',action); 
				$('#sqzw').on('hidden.bs.modal', function (e) {
					eid="";
					okid="";
					})
				$('#sqzwok').on('hidden.bs.modal', function (e) {
					eid="";
					okid="";
					})
				});
			function mqueryform() {
				var select=$("#select").val();
				return '<%=request.getContextPath() %>/users/index.do?method=mquery&type=1&select='+select;
			}
			function mquerya(type,values) {
					$(type).text(values);
					var xxz=$("#xxz").text();
					var xl=$("#xl").text();
					var jy=$("#jy").text();
					var zw=$("#zw").text();
					var xz=$("#xz").text();
					var gm =$("#gm").text();
					window.location.href=encodeURI("<%=request.getContextPath()%>"+"/users/index.do?method=mquery&type=2&xl="+xl+"&jy="+jy+"&zw="+zw+"&gm="+gm+"&xxz="+xxz+"&xz="+xz);
			}
			function scok(img,text,type,userid,eid) {
				if(<%=(Map)request.getSession().getAttribute("ws")==null%>){
					modaltt("#okxx");
				}
				else{
					if (type==0) {
						if($("#"+text).text()!="已收藏"){
							var url ="<%=request.getContextPath()%>/users/index.do?method=sc";
							$.post(url,{userid:userid,eid:eid},function(data)
							{	
								var count =$("#sc-count").text();
								$("#sc-count").text(Number(count)+1);
								$("#"+img).attr("src","<%=request.getContextPath() %>/img/sc-s.png");
								$("#"+text).text("已收藏")
							});
						}
						else {
							var url ="<%=request.getContextPath()%>/users/index.do?method=qsc";
							$.post(url,{userid:userid,eid:eid},function(data)
							{
								var count =$("#sc-count").text();
								$("#sc-count").text(Number(count)-1);
								$("#"+img).attr("src","<%=request.getContextPath() %>/img/sc.png");
								$("#"+text).text("收藏")
							});
						}
					}
					else if(type==1){
						if($("#"+text).text()!="收藏"){
							var count =$("#sc-count").text();
							$("#sc-count").text(Number(count)-1);
							var url ="<%=request.getContextPath()%>/users/index.do?method=qsc";
							$.post(url,{userid:userid,eid:eid},function(data)
							{
								$("#"+img).attr("src","<%=request.getContextPath() %>/img/sc.png");
								$("#"+text).text("收藏")
							});
						}
						else {
							var url ="<%=request.getContextPath()%>/users/index.do?method=sc";
							$.post(url,{userid:userid,eid:eid},function(data)
							{
								var count =$("#sc-count").text();
								$("#sc-count").text(Number(count)+1);
								$("#"+img).attr("src","<%=request.getContextPath() %>/img/sc-s.png");
								$("#"+text).text("已收藏")
							});
						}
						
					}
				}
			}
			function sqok(userid) {
				if(<%=(Map)request.getSession().getAttribute("ws")==null%>){
					$("#sqzw").modal('hide');
					modaltt("#okxx");
				}
				else {
					var eid=geteid();
					var okid=getokid();
					var count= $("#sq-count").text();
					$("#sqzw-sub").button('loading');
					var url ="<%=request.getContextPath()%>/users/index.do?method=sq";
					$.post(url,{userid:userid,eid:eid},function(data)
					{
						if(data=="no"){
							$("#sqzw").modal('hide');
							$("#sqzw-sub").button('reset');
							modaltt("#sqzwno");
							return;
						}
						$("#sqzw-sub").button('reset');
						sqzwok ();
						$("#sq-count").text(Number(count)+1);
						$("#"+okid).removeAttr("onclick");
						$("#"+okid).attr("disabled","disabled");
						$("#"+okid).html('已申请')
					});
				}
			}
		</script>
	</head>
	<!--
    	作者：1977455153@qq.com
    	时间：2022-01-24
    	描述：导航栏
    -->
    <c:set var="user" scope="session" value="${sessionScope.user}"></c:set>
	<nav id="top" class="navbar navbar-default navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	    	 <button id="button-top" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
	      <a class="navbar-brand" href="#">
	      	<div id="lg-top-padding">
	      		
	      	</div>
	        <img id="loge" class="img-responsive" alt="Responsive image" src="<%=request.getContextPath() %>/img/001.png">
	      </a>
	      <p class="navbar-text"><strong>高校就业平台</strong></p>
	    </div>
	     <div class="collapse navbar-collapse " id="top-text">
	     	 <ul class="nav visible-lg-block navbar-nav navbar-right">
	     	 <c:choose>
	     	 	<c:when test="${!empty user}">
		        <li id="address"><span class="glyphicon glyphicon-map-marker" aria-hidden="true">保定<a href="#">[切换城市]</a></span></li>
		        <li class="dropdown" id="mine">
		          <a style="color: white; width: 159px; font-size: 16px;background-color:#011536;" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		          	<c:if test="${empty ws}">
		            <li class="text-center"><a href="<%=request.getContextPath() %>/users/index.do?method=perfactpage">个人信息</a></li>
		            </c:if>
		           <c:if test="${!empty ws}">
		           <li class="text-center"><a href="<%= request.getContextPath() %>/users/perfect.do?method=perfactlist ">个人信息</a></li>
		            </c:if>
		            <c:if test="${empty ws}">
		            <li class="text-center"><a href="#" onclick="modaltt('#okxx')">安全中心</a></li>
		            </c:if>
		            <c:if test="${!empty ws}">
		            <li class="text-center"><a href="<%=request.getContextPath() %>/users/index.do?method=securitypage">安全中心</a></li>
		            </c:if>
		            <li class="text-center"><a href="<%=request.getContextPath() %>/users/logein.do?method=out">退出</a></li>
		          </ul>
		        </li>
		        </c:when>
		        
                <c:otherwise>
                <!--
                	作者：1977455153@qq.com
                	时间：2022-01-24
                	描述：未登录
                -->
		        <li id="mine">
		          <a href="<%=request.getContextPath() %>/users/index.do?method=loginpage" style="color: white; width: 159px; font-size: 16px;background-color:#011536;" class="text-center">登录</a>
		        </li>
		        </c:otherwise>
		       </c:choose>
		      </ul>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    	<c:choose>
	    	<c:when test="${!empty user}">
	     	 <ul class="nav visible-xs-block navbar-nav">
		        <li><a href="#"style="color: white;">切换城市</a>	</li>
	            <li><a class="top-text" href="#" style="color: white;">个人信息</a></li>
	            <li><a class="top-text" href="#" style="color: white;">安全中心</a></li>
	            <li><a class="top-text" href="<%=request.getContextPath() %>/users/resume.do?method=page" style="color: white;">上传简历</a></li>
	            <li><a class="top-text" href="<%=request.getContextPath() %>/users/resume.do?method=list" style="color: white;">历史简历</a></li>
	            <li><a class="top-text" href="#" style="color: white;">我的收藏</a></li>
	            <li><a class="top-text" href="#" style="color: white;">申请记录</a></li>
	            <li><a class="top-text" href="<%=request.getContextPath() %>/users/logein.do?method=out" style="color: white;">退出</a></li>
		      </ul>
		      </c:when>
		      <c:otherwise>
		      <ul class="nav visible-xs-block navbar-nav">
		      <li><a class="top-text" href="<%=request.getContextPath() %>/users/index.do?method=loginpage" style="color: white;">登录</a></li>
		        <li><a href="#"style="color: white;">切换城市</a></li>
		      </ul>
		      </c:otherwise>
			</c:choose>
	    </div>
	    
	  </div>
	</nav>
	<body>
		<div class="container-fluid">
		  <div class="row">
		  	<div class="col-lg-8 col-xs-12  col-lg-offset-1">
		  		<!--
                  	作者：1977455153@qq.com
                  	时间：2022-01-24
                  	描述：搜索表单
                  -->
                <div class="row">
                	<div class="col-lg-12 col-xs-12">
                		<form class="form" id="mqueryform" action="ss" method="post">
				  			<div class="form-group">
						  		<div class="input-group input-group-lg">
							      <div class="input-group-btn">
							        <button type="button" class="btn btn-default dropdown-toggle" name="select" value="职位" id="select" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">职位<span class="caret"></span></button>
							        <ul class="dropdown-menu">
							          <li id="select-li"><a onclick="selectqh('公司')">公司</a></li>
							        </ul>
							      </div><!-- /btn-group -->
							       <input type="text" class="form-control" aria-label="...">
							        <span class="input-group-btn">
							        <button type="submit" class="btn btn-primary btn-lg" type="button" id="query-btn">
							        	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索
							        </button>
							      </span>
						  		</div>
					  		</div>
		  				</form>
                	</div>
                </div>
                <c:set var="tj" scope="request" value="${requestScope.tj}"></c:set>
                <div class="row">
                	<div class="col-lg-12 visible-lg-block">
                		<table border="0"cellspacing="0" cellpadding="0">
                			<tr>
                				<td>
			                		<div class="btn-group">
									  <button id="xxz" type="button" class="btn btn-default dropdown-toggle btn-nobor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${empty tj?"薪资要求":tj.xxz } <span class="caret"></span>
									  </button>
									  <ul class="dropdown-menu">
									    <li><a class="sx-lg-text" onclick="mquerya('#xxz','3k以下')">3k以下</a></li>
									    <li><a class="sx-lg-text" onclick="mquerya('#xxz','3k-5k')">3k-5k</a></li>
									    <li><a class="sx-lg-text" onclick="mquerya('#xxz','5k-10k')">5k-10k</a></li>
									    <li><a class="sx-lg-text" onclick="mquerya('#xxz','10k-20k')">10k-20k</a></li>
									    <li><a class="sx-lg-text" onclick="mquerya('#xxz','40k-60')">40k-60k</a></li>
									    <li><a class="sx-lg-text" onclick="mquerya('#xxz','60k以上')">60k以上</a></li>
									    <li><a class="sx-lg-text" onclick="mquerya('#xxz','')">不限</a></li>
									  </ul>
				                	</div>
                				</td>
                				<td style="padding-left: 18px;">
                					<div class="col-lg-1">
				                		<div class="btn-group">
										  <button type="button" id="xl" class="btn btn-default dropdown-toggle btn-nobor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${empty tj?"学历要求":tj.xl }<span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li><a class="sx-lg-text" onclick="mquerya('#xl','初中及以下')">初中及以下</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xl','高中')">高中</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xl','大专')">大专</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xl','本科')">本科</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xl','硕士')">硕士</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xl','博士')">博士</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xl','MBA/EMBA')">MBA/EMBA</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xl','')">不限</a></li>
										  </ul>
										</div>
				                	</div>
                				</td>
                				<td>
                					<div class="col-lg-1">
				                		<div class="btn-group">
										  <button type="button" id="jy" class="btn btn-default dropdown-toggle btn-nobor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${empty tj?"工作经验":tj.jy }<span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li><a class="sx-lg-text" onclick="mquerya('#jy','应届生')">应届生</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#jy','实习生')">实习生</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#jy','1年以内')">1年以内</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#jy','1-3年')">1-3年</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#jy','3-5年')">3-5年</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#jy','5-10年')">5-10年</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#jy','10年以上')">10年以上</a></li>
											<li><a class="sx-lg-text" onclick="mquerya('#jy','')">不限</a></li>
										  </ul>
										</div>
				                	</div>
                				</td>
                				<td>
                					<div class="col-lg-1">
				                		<div class="btn-group">
										  <button type="button" id="zw" class="btn btn-default dropdown-toggle btn-nobor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${empty tj?"职位类型":tj.zw }<span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','JAVA')">JAVA</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','Python')">Python</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','PHP')">PHP</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','UED')">UED</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','AI')">AI</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','前端')">前端</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','运维')">运维</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','产品设计')">产品设计</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','其他')">其他</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#zw','')">不限</a></li>
										  </ul>
										</div>
				                	</div>
                				</td>
                				<td>
                					<div class="col-lg-1">
				                		<div class="btn-group">
										  <button type="button" id="xz" class="btn btn-default dropdown-toggle btn-nobor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${empty tj?"公司性质":tj.xz } <span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li><a class="sx-lg-text" onclick="mquerya('#xz','国有企业')">国有企业</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xz','民营企业')">民营企业</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xz','外资企业')">外资企业</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xz','合伙企业')">合伙企业</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xz','有限责任公司')">有限责任公司</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xz','股份有限公司')">股份有限公司</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#xz','')">不限</a></li>
										  </ul>
										</div>
				                	</div>
                				</td>
                				<td>
                					<div class="col-lg-1">
				                		<div class="btn-group">
										  <button type="button" id="gm" class="btn btn-default dropdown-toggle btn-nobor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${empty tj?"公司规模":tj.gm } <span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li><a class="sx-lg-text" onclick="mquerya('#gm','20人以下')">20人以下</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#gm','20-99人')">20-99人</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#gm','100-299人')">100-299人</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#gm','500-999人')">500-999人</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#gm','1000-9999人')">1000-9999人</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#gm','万人以上')">万人以上</a></li>
										    <li><a class="sx-lg-text" onclick="mquerya('#gm','')">不限</a></li>
										  </ul>
										</div>
				                	</div>
                				</td>
                				<td>
                					
                				</td>
                				<td>
                					<div class="col-lg-1">
                						<a href="<%=request.getContextPath()%>/users/index.do?method=query" type="button" class="btn btn-default btn-nobor">清空筛选条件</a>
				                	</div>
                				</td>
                			</tr>
                		</table>
                	</div>
                	<div class="col-xs-12 visible-xs-block">
                		<div  style="border: 1px solid #C0C0C0;">
	                		<table>
	                			<tr>
	                				<td>
				                		<div class="btn-group">
										  <button type="button" class="btn btn-default dropdown-toggle btn-nobor-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">薪资<span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li class="${tj.xxz=='3k以下'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xxz','3k以下')">3k以下</a></li>
										    <li class="${tj.xxz=='3k-5k'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xxz','3k-5k')">3k-5k</a></li>
										    <li class="${tj.xxz=='5k-10k'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xxz','5k-10k')">5k-10k</a></li>
										    <li class="${tj.xxz=='10k-20k'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xxz','10k-20k')">10k-20k</a></li>
										    <li class="${tj.xxz=='40k-60k'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xxz','40k-60k')">40k-60k</a></li>
										    <li class="${tj.xxz=='60k以上'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xxz','60k以上')">60k以上</a></li>
										    <li class="${tj.xxz=='不限'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xxz','')">不限</a></li>
										  </ul>
					                	</div>
	                				</td>
	                				<td>
				                		<div class="btn-group">
										  <button type="button" class="btn btn-default dropdown-toggle btn-nobor-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">学历<span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li class="${tj.xl=='初中及以下'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xl','初中及以下')">初中及以下</a></li>
										    <li class="${tj.xl=='高中'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xl','高中')">高中</a></li>
										    <li class="${tj.xl=='大专'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xl','大专')">大专</a></li>
										    <li class="${tj.xl=='本科'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xl','本科')">本科</a></li>
										    <li class="${tj.xl=='硕士'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xl','硕士')">硕士</a></li>
										    <li class="${tj.xl=='博士'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xl','博士')">博士</a></li>
										    <li class="${tj.xl=='MBA/EMBA'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xl','MBA/EMBA')">MBA/EMBA</a></li>
										    <li class="${tj.xl=='不限'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#xl','')">不限</a></li>
										  </ul>
										</div>
	                				</td>
	                				<td>
				                		<div class="btn-group">
										  <button type="button" class="btn btn-default dropdown-toggle btn-nobor-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">工作<span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li class="${tj.jy=='应届生'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#jy','应届生')">应届生</a></li>
										    <li class="${tj.jy=='实习生'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#jy','实习生')">实习生</a></li>
										    <li class="${tj.jy=='1年以内'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#jy','1年以内')">1年以内</a></li>
										    <li class="${tj.jy=='1-3年'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#jy','1-3年')">1-3年</a></li>
										    <li class="${tj.jy=='3-5年'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#jy','3-5年')">3-5年</a></li>
										    <li class="${tj.jy=='5-10年'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#jy','5-10年')">5-10年</a></li>
										    <li class="${tj.jy=='10年以上'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#jy','10年以上')">10年以上</a></li>
											<li class="${tj.jy=='不限'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#jy','')">不限</a></li>
										  </ul>
										</div>
	                				</td>
	                				<td>
				                		<div class="btn-group">
										  <button type="button" class="btn btn-default dropdown-toggle btn-nobor-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">职位<span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li class="${tj.zw=='JAVA'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','JAVA')">JAVA</a></li>
										    <li class="${tj.zw=='Python'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','Python')">Python</a></li>
										    <li class="${tj.zw=='PHP'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','PHP')">PHP</a></li>
										    <li class="${tj.zw=='UED'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','UED')">UED</a></li>
										    <li class="${tj.zw=='AI'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','AI')">AI</a></li>
										    <li class="${tj.zw=='前端'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','前端')">前端</a></li>
										    <li class="${tj.zw=='运维'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','运维')">运维</a></li>
										    <li class="${tj.zw=='产品设计'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','产品设计')">产品设计</a></li>
										    <li class="${tj.zw=='其他'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','其他')">其他</a></li>
										    <li class="${tj.zw=='不限'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#zw','')">不限</a></li>
										  </ul>
										</div>
	                				</td>
	                				<td>
				                		<div class="btn-group">
										  <button type="button" class="btn btn-default dropdown-toggle btn-nobor-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">规模<span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										    <li class="${tj.gm=='20人以下'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#gm','20人以下')">20人以下</a></li>
										    <li class="${tj.gm=='20-99人'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#gm','20-99人')">20-99人</a></li>
										    <li class="${tj.gm=='100-299人'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#gm','100-299人')">100-299人</a></li>
										    <li class="${tj.gm=='500-999人'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#gm','500-999人')">500-999人</a></li>
										    <li class="${tj.gm=='1000-9999人'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#gm','1000-9999人')">1000-9999人</a></li>
										    <li class="${tj.gm=='万人以上'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#gm','万人以上')">万人以上</a></li>
										    <li class="${tj.gm=='不限'?'disabled':'' }"><a class="sx-xs-text" onclick="mquerya('#gm','')">不限</a></li>
										  </ul>
										</div>
	                				</td>
	                				<td>
	                					
	                				</td>
	                				<td>
	            						<a href="<%=request.getContextPath()%>/users/index.do?method=query" type="button" class="btn btn-default btn-nobor-xs">清空</a>
	                				</td>
	                			</tr>
	                		</table>
	                	</div>
                	</div>
                </div>
               <c:forEach var="map" items="${list}" varStatus="i">
               <div class="row">
               	<div class="col-lg-12 col-xs-12">
					<div class="panel panel-default">
					  <div class="panel-body">
					  	<!--
                          	作者：1977455153@qq.com
                          	时间：2022-01-26
                          	描述：数据第一行
                          -->
                        <a href="<%=request.getContextPath() %>/users/index.do?method=details&eid=${map.eid}">
					  	<div class="row">
					  		<div class="col-lg-5 col-xs-6">
					  			<div class="col-lg-6 visible-lg-block">
					  				<h4>${map.employment_name}</h4>
					  			</div>
					  			<h4 class="visible-xs-block">${map.employment_name}</h4>
					  			<div class="col-lg-6 visible-lg-block">
					  				<h4><small>
					  				 ${fn:substring(map.subtime,fn:indexOf(map.subtime,"-")+1, -1)}发布  
					  				</small></h4>
					  			</div>
					  			
					  		</div>
					  		<div class="col-lg-3 col-xs-6 col-lg-push-1 col-xs-push-1 pull-right" >
						  			<div class="col-lg-9 col-lg-pull-3 visible-lg-block">
						  				<h4 class="gsname text-right"><small>${map.gsname}</small></h4>
						  			</div>
						  			<div class="col-xs-12">
						  				<h5 class="visible-xs-block gsname" style="color: red;">${fn:split(map.salary, ".")[1]=="12"?fn:split(map.salary, ".")[0]:map.salary}${fn:split(map.salary, ".")[1]=="12"?"":"薪"}</h5>
						  			</div>
					  		</div>
					  	</div>
					  	</a>
					  	<!--
                          	作者：1977455153@qq.com
                          	时间：2022-01-26
                          	描述：数据第二行
                          -->
					  	<div class="row">
					  		<div class="col-lg-12 visible-lg-block">
					  			<div class="col-lg-2">
					  				<h4 class="gsname" style="color: red;">${fn:split(map.salary, ".")[1]=="12"?fn:split(map.salary, ".")[0]:map.salary}${fn:split(map.salary, ".")[1]=="12"?"":"薪"}</h4>
					  			</div>
					  			<div class="col-lg-2">
					  				<h4 class="gsname">${map.address}</h4>
					  			</div>
					  			<div class="col-lg-3">
					  				<div class="col-lg-4 gsname">
					  					<h5>|${map.experience}</h5>
					  					
					  				</div>
					  				<div class="col-lg-5 gsname">
					  					<h5>${map.education}</h5>
					  				</div>
					  			</div>
					  		</div>
					  		<div class="col-xs-12 visible-xs-block">
					  			<div class="col-xs-3" style="padding-left: 0px;">
					  				<h5 class="gsname">${map.address}</h5>
					  			</div>
					  			<div class="col-xs-6">
					  				<h5 class="gsname">${map.gsname}</h5>
					  			</div>
					  		</div>
					  	</div>
					  	<!--
                          	作者：1977455153@qq.com
                          	时间：2022-01-28
                          	描述：数据第三行
                          -->
					  	<div class="row visible-lg-block">
					  		<div class="col-lg-7" style="padding-top: 10px;">
					  			<c:forTokens items="${map.welfare}" delims="#" var="name">
					  			<span class="label label-default">${name}</span>
					  			</c:forTokens>
					  		</div>
					  		<div class="col-lg-5">
					  		<c:choose>
					  			<c:when test="${map.Collectionstate==1&&!empty user}">
					  			
					  			<div class="col-lg-6 col-lg-push-2 col-lg-offset-1">
					  				<a onclick="scok('sc-lg-img${i.count}','sc-lg-text${i.count}',1,'${user.UUID}','${map.eid}')">
						  				<div class="col-lg-4">
						  					<img id="sc-lg-img${i.count}" src="<%=request.getContextPath() %>/img/sc-s.png" class="img-responsive"/>
						  				</div>
						  				<div class="col-lg-8 col-lg-pull-2">
						  					<p id="sc-lg-text${i.count}" class="sc-text">已收藏</p>
						  				</div>
					  				</a>
					  			</div>
					  			</c:when>
					  			<c:otherwise>
						  			<div class="col-lg-6 col-lg-push-2 col-lg-offset-1 " style="padding-top: 6px;">
						  				<c:if test="${!empty user }">
						  				<a onclick="scok('sc-lg-img${i.count}','sc-lg-text${i.count}',0,'${user.UUID}','${map.eid}')">
							  				<div class="col-lg-4" >
							  					<img id="sc-lg-img${i.count}" src="<%=request.getContextPath() %>/img/sc.png" class="img-responsive"/>
							  				</div>
							  				<div class="col-lg-8 col-lg-pull-2">
							  					<p id="sc-lg-text${i.count}" class="sc-text">收藏</p>
							  				</div>
						  				</a>
						  				</c:if>
						  				<c:if test="${empty user }">
						  				<a onclick="modaltt('#logeink');">
							  				<div class="col-lg-4" >
							  					<img id="sc-lg-img${i.count}" src="<%=request.getContextPath() %>/img/sc.png" class="img-responsive"/>
							  				</div>
							  				<div class="col-lg-8 col-lg-pull-2">
							  					<p id="sc-lg-text${i.count}" class="sc-text">收藏</p>
							  				</div>
						  				</a>
						  				</c:if>
						  			</div>
					  			</c:otherwise>
					  			</c:choose>
					  			<c:choose>
					  			<c:when test="${map.applystate==1&&!empty user}">
					  			<div class="col-lg-3">
					  				<div class="col-lg-12">
					  					<a type="button" class="btn btn-primary" disabled="disabled">已申请</a>
					  				</div>
					  			</div>
					  			</c:when>
					  			<c:otherwise>
					  			<div class="col-lg-3">
					  				<c:if test="${!empty user}">
					  				<div class="col-lg-12">
					  					<a type="button" id="sq-a${i.count}" class="btn btn-primary" onclick="sqzwtt('#sqzw','${map.gsname}','${map.employment_name}','${map.eid}','sq-a${i.count}')">申请职位</a>
					  				</div>
					  				</c:if>
					  				<c:if test="${empty user}">
					  				<div class="col-lg-12">
					  					<a type="button" id="sq-a${i.count}" class="btn btn-primary" onclick="modaltt('#logeink')">申请职位</a>
					  				</div>
					  				</c:if>
					  			</div>
					  			</c:otherwise>
					  			</c:choose>
					  		</div>
					  	</div>
					  	<div class="row visible-xs-block">
					  		<div class="col-xs-11">
					  			<span class="label label-default">${map.experience}</span>
					  			<span class="label label-default">${map.education}</span>
					  			<c:forTokens items="${map.welfare}" delims="#" var="name">
					  			<span class="label label-default">${name}</span>
					  			</c:forTokens>
					  		</div>
					  	</div>
					  	<!--
                          	作者：1977455153@qq.com
                          	时间：2022-01-28
                          	描述：数据第四行
                          -->
                          <div class="row visible-xs-block" style="padding-top: 6px;">
                          <c:choose>
                          	<c:when test="${map.Collectionstate==1&&!empty user}">
					  			<div class="col-xs-6" style="padding-left: 0px; padding-top: 6px;">
					  				<a onclick="scok('sc-xs-img${i.count}','sc-xs-text${i.count}',1,'${user.UUID}','${map.eid}')">
 						  				<div class="col-xs-4">
						  					<img id="sc-xs-img${i.count}" src="<%=request.getContextPath() %>/img/sc-s.png" class="img-responsive"/>
						  				</div>
						  				<div class="col-xs-8 col-xs-pull-2">
						  					<p id="sc-xs-img${i.count}" class="sc-text${i.count}">已收藏</p>
						  				</div>
					  				</a>
					  			</div>
					  		</c:when>
					  		<c:otherwise>
						  		<div class="col-xs-6" style="padding-left: 0px; padding-top: 6px;">
						  				<c:if test="${!empty user}">
						  				<a onclick="scok('sc-xs-img${i.count}','sc-xs-text${i.count}',0,'${user.UUID}','${map.eid}')">
							  				<div class="col-xs-4">
							  					<img id="sc-xs-img${i.count}" src="<%=request.getContextPath() %>/img/sc.png" class="img-responsive"/>
							  				</div>
							  				<div class="col-xs-8 col-xs-pull-2">
							  					<p id="sc-xs-text${i.count}" class="sc-text${i.count}">收藏</p>
							  				</div>
						  				</a>
						  				</c:if>
						  				<c:if test="${empty user}">
						  					<a onclick="modaltt('#logeink');">
							  				<div class="col-xs-4">
							  					<img id="sc-xs-img${i.count}" src="<%=request.getContextPath() %>/img/sc.png" class="img-responsive"/>
							  				</div>
							  				<div class="col-xs-8 col-xs-pull-2">
							  					<p id="sc-xs-text${i.count}" class="sc-text${i.count}">收藏</p>
							  				</div>
						  					</a>
						  				</c:if>
						  			</div>
					  		</c:otherwise>
					  		</c:choose>
                          	<div class="col-xs-3 col-xs-push-2">
                          		<c:if test="${!empty user}">
					  				<a type="button" id="sq-xs-a${i.count}" class="btn btn-primary" onclick="sqzwtt('#sqzw','${map.gsname}','${map.employment_name}','${map.eid}','sq-xs-a${i.count}')">申请职位</a>
					  			</c:if>
					  			<c:if test="${empty user}">
					  				<a type="button" id="sq-xs-a${i.count}" class="btn btn-primary" onclick="modaltt('#logeink');">申请职位</a>
					  			</c:if>
					  			</div>
					  			<div class="col-xs-3 hidden">
					  				<a type="button" class="btn btn-primary" disabled="disabled">已申请</a>
					  			</div>
                          	
                          </div>
					  	
					  </div>
					</div>	               		
               	</div>
               </div>
               </c:forEach>
               
		  		
		  	</div>
		  	<div class="col-lg-2 visible-lg-block">
		  		<!--
                  	作者：1977455153@qq.com
                  	时间：2022-01-24
                  	描述：我的简历
                  -->
		  		<div class="row">
		  			<div class="col-lg-12">
				  		<div class="panel panel-default">
				  		<c:choose>
				  			<c:when test="${!empty user}">
						  <div class="panel-body">
						    <div id="userimg" class="row">
						    	<div class="col-lg-5 col-lg-offset-1">
						    		<img src="<%= request.getContextPath()%>/img/usertx.png" class="img-responsive" alt="Responsive image">
						    	</div>
						    	<div class="col-lg-6 col-lg-pull-2">
						    		<h4>我的简历</h4>
						    	</div>
						    </div>
						    <div class="row">
						    	<br />
						    	<div class="col-lg-6">
						    		<a type="button" href="<%=request.getContextPath() %>/users/resume.do?method=page" class="btn btn-primary">上传简历</a>
						    	</div>
						    	<div class="col-lg-6">
						    		<a type="button" href="<%=request.getContextPath() %>/users/resume.do?method=list" class="btn btn-primary">历史简历</a>
						    	</div>
						    </div>
						    <div class="row">
						    	<div class="col-lg-6 text-center">
						    		<h3 class="user-text-h3" id="sc-count">${sessionScope.sc}</h3>
						    		<a href="<%=request.getContextPath() %>/users/index.do?method=minesc&userid=${user.UUID}"><p>我的收藏</p></a>
						    	</div>
						    	<div class="col-lg-6 text-center">
						    		<h3 class="user-text-h3" id="sq-count">${sessionScope.sq}</h3>
						    		<a href="<%=request.getContextPath() %>/users/index.do?method=minesq&userid=${user.UUID}"><p>申请记录</p></a>
						    	</div>
						    </div>
						  </div>
						  </c:when>
						  <c:otherwise>
						  <!--
	                      	作者：1977455153@qq.com
	                      	时间：2022-01-24
	                      	描述：未登录
	                      -->
						  <div class="panel-body text-center">
						    <a style="font-size: 15px;" href=""><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> 登录，解锁更多功能</a>
						  </div>
						  </c:otherwise>
						  </c:choose>
						</div>
		  			</div>
				</div>
				<!--
                	作者：1977455153@qq.com
                	时间：2022-01-28
                	描述：热门推荐
                -->
               	<div class="row visible-lg-block">
               		<div class="col-lg-12">
               			<h5>热门职业</h5>
               			
               			<table class="table">
               			<c:forEach items="${list}" var="map" end="4">
               				<tr>
               					<td>
               					<a href="<%=request.getContextPath() %>/users/index.do?method=details&eid=${map.eid}">
               						<div class="row">
               							<div class="col-lg-6 visible-lg-block">
					  					<h6 class="yc" title="${map.employment_name}">${map.employment_name}</h6>
							  			</div>
							  			<div class="col-lg-6 visible-lg-block">
							  				<h6><small>01-02发布</small></h6>
							  			</div>
               						</div>
               						<div class="row">
               							<div class="col-lg-8 col-lg-push-5">
               								<h6 class="gsname" title="${map.gsname}">${map.gsname}</h6>
               							</div>
               						</div>
               						<div class="row">
               							<div class="col-lg-6">
               								<h6 class="gsname" style="color: red;">${fn:split(map.salary, ".")[1]=="12"?fn:split(map.salary, ".")[0]:map.salary}${fn:split(map.salary, ".")[1]=="12"?"":"薪"}</h6>
               							</div>
               							<div class="col-lg-5">
               								<h6 class="yc" title="${map.address}">${map.address}</h6>
               							</div>
               						</div>
               						</a>
               					</td>
               				</tr>
               				</c:forEach>
               			</table>
               		</div>
               	</div>
		  	</div>
		  </div>
		  
		</div>
		<!--
        	作者：1977455153@qq.com
        	时间：2022-01-28
        	描述：登录模态框
        -->
        <div class="modal fade" tabindex="-1" role="dialog" id="logeink" style="margin-top: 250px;">
		  <div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content">
		      <div class="modal-body text-center">
		        <h4>请先进行登录</h4>
		      </div>
		      <div class="modal-footer">
		      	<div class="row">
		      		<div class="col-lg-4 col-xs-4">
		      		<button type="button" class="btn btn-default" data-dismiss="modal">稍后登录</button>
			      	</div>
			      	<div class="col-lg-8 col-xs-8">
			      		<a href="<%=request.getContextPath() %>/users/index.do?method=loginpage" type="button" class="btn btn-primary">立即登录</a>
			      	</div>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		<!--
        	作者：1977455153@qq.com
        	时间：2022-01-28
        	描述：完善信息
        -->
		<div class="modal fade" tabindex="-1" role="dialog" id="okxx" style="margin-top: 250px;">
		  <div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content">
		    	<div class="modal-header">
		    		  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title">请完善个人信息</h4>
		    	</div>
		      <div class="modal-body">
		        <p>步骤:点击"立即填写"直接跳转，或点击右上角"我的"---->"个人信息"</p>
		      </div>
		      <div class="modal-footer">
		      	<div class="row">
		      		<div class="col-lg-4 col-xs-4">
		      		<button type="button" class="btn btn-default" data-dismiss="modal">稍后填写</button>
			      	</div>
			      	<div class="col-lg-8 col-xs-8">
			      		<a href="<%=request.getContextPath() %>/users/index.do?method=perfactpage" type="button" class="btn btn-primary">立即填写</a>
			      	</div>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		<!--
        	作者：1977455153@qq.com
        	时间：2022-01-28
        	描述：申请职位
        -->
		<div class="modal fade" tabindex="-1" role="dialog" id="sqzw" style="margin-top: 150px;">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		    	<div class="modal-header text-center">
		    		  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title modal-sqzw-h4"></h4>
       					 <h5 class="modal-title modal-sqzw-h5"></h5>
		    	</div>
		      <div class="modal-body" align="center">
		      		<img src="<%=request.getContextPath() %>/img/008.jpg" class="img-responsive"/>
		      </div>
		      <div class="modal-footer">
		      		<div class="col-lg-2 col-xs-2">
		      		<button type="button" class="btn btn-default" data-dismiss="modal">再想想</button>
			      	</div>
			      	<div class="col-lg-10 col-xs-10">
			      		<a type="button" id="sqzw-sub" class="btn btn-primary" onclick="sqok('${user.UUID}')">确&nbsp;定</a>
			      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		<!--
        	作者：1977455153@qq.com
        	时间：2022-01-28
        	描述：申请确定
        -->
		<div class="modal fade" tabindex="-1" role="dialog" id="sqzwok" style="margin-top: 150px;">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		    	<div class="modal-header text-center">
		    		  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title modal-sqzw-h4" ></h4>
       					 <h5 class="modal-title modal-sqzw-h5"></h5>
		    	</div>
		      <div class="modal-body" align="center">
		      		<h4>上传简历成功</h4>
		      </div>
		      <div class="modal-footer" align="center">
		      	<div class="row">
		      		<div class="col-lg-7 col-xs-8">
		      			<a type="button" class="btn btn-primary" data-dismiss="modal" style="width: 100px;">确定</a>
		      		</div>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" tabindex="-1" role="dialog" id="sqzwno" style="margin-top: 150px;">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		    	<div class="modal-header text-center">
		    		  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title modal-sqzw-h4" ></h4>
       					 <h5 class="modal-title modal-sqzw-h5"></h5>
		    	</div>
		      <div class="modal-body" align="center">
		      		<h4>您还没有上传简历，请上传后再操作</h4>
		      </div>
		      <div class="modal-footer" align="center">
		      	<div class="row">
		      		<div class="col-lg-7 col-xs-8">
		      			<a type="button" class="btn btn-primary" data-dismiss="modal" style="width: 100px;">确定</a>
		      		</div>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>
