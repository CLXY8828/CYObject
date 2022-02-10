<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.css"/>
	<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <title>后台我的</title>
</head>
<style type="text/css">
    *{
		padding: 0;
		margin: 0;
		cursor: default;
    }        
    li{
		list-style: none;
		width: 100%;
    }
    
    .content_left{
		width: 22%;
		height: 1000px;
		border: 0px solid #000000;
		float: left;
		background-color: #e2e2e2;
    }
    .content_right{
		width: 78%;
		height: 1000px;
		float: left;
		margin-top: 0px;
    }
    .nav_title{
		height: 50px;
		width: 100%;
		text-align: center;
		line-height: 50px
    }
    .menu{
		width: 100%;
		text-align: center;
		margin-top:-3%;
		margin-bottom: 30px;
    }
    .menu-title{
		height: 25px;
		width: 100%;
		cursor: pointer;
		font-size: 30px;
		margin-top: 20px;
    }
    .menu-content{
		margin-top: 14px;
		font-size: 25px;
		display: block;
    }
    .menu-content li:hover{
		background-color: #efefef;
		cursor: pointer;
    }
	.top{
		position: absolute;
		left:7% ;
		top: 5%;
		width: 7%;
		height:14% ;
	}
	.top-title{
		color: white;
		position: absolute;
		top:10%;
		left: 14%;
		font-size: 35px;
		font-weight: bolder;
	}
	.container{
		width: 80%;
	}
	
	.nav-icon{
		width: 32px;
		height: 32px;
	}
	.nav-info1{
		margin-right: 130px;
		font-size: 20px;
	}
	.glyphicon-menu-up{
		display: none;
	}
	.norhr{
		margin-top: -5px;
		width: 70%;
		margin-left: 25px;
		border:0px;
		border-bottom:2px solid #5c5c3d;
	}
	.container-fluid{
		width: 100%;
	}
</style>
<body>
	<div class="hidden-sm hidden-xs hidden-md" style="width: 100%;height: 10%;">
		<div class="navbar-header" style="width: 100%;background-color:#011536;">
			<div style="margin-left: 10%;">
				<img src="../img/logo.png" style="width: 4%;height: 4%;padding-top: 0.5%;padding-bottom: 0.5%;">
				<span style="color: white;margin-top: 10%;margin-left: 0.5%;" class="h3"><strong>高校就业平台</strong></span>
				<span style="color: white; margin-left: 59.8%;padding-top: 50%;">欢迎<span><%=((Map)session.getAttribute("user")).get("admin_name")%></span>登陆</span>
				<div class="h2 btn-group" style="font-size:28px;margin-top:0.6%;">
					<button class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 80px;">我的</button>
					<ul class="dropdown-menu">
					    <!--<li><a href="userinfo/selfinfo.html">个人中心</a></li>-->
					    <li><a href="<%=request.getContextPath() %>/users/logein.do?method=out">退出</a></li>
					  </ul>
				</div>
			</div>
		</div>
	</div>
    <div class="container">
		<div id="body">
			<div class="content">
				<div class="content_left hidden-sm hidden-xs hidden-md">
					<div class="nav_title">
						<span style="font-size: 25px;">高校就业管理信息平台</span>
					</div>
					<hr style="width:100%; border: #000000 1.5px solid;margin-top: -5px;" />
					<!-- 每一个菜单项 -->
					<div class="menu">       
						<div class="menu-title inacitve"><img src="../img/working.png" class="nav-icon"><span style="font-size:22px;margin-right:110px;">就业</span><span class="glyphicon glyphicon-menu-down"></span></div>                
						<ul class="menu-content">
						<%if(((Map)session.getAttribute("user")).get("admin_have").equals(2)){%>
							<li style="margin-bottom: -8%;"><a href="#classset" tabindex="-1" aria-controls="classset" role="tab" data-toggle="tab" onclick="classsetpage()"><span style="margin-right: 26%;font-size: 20px;">班级就业</span></a></li>	
						<% }else{ %>
							<li><a href="#gradeset" tabindex="-1" aria-controls="gradeset" role="tab" data-toggle="tab" onclick="gradesetpage()"><span style="margin-right: 26%;font-size: 20px;">年级就业</span></a></li>								
							<li style="margin-bottom: -8%;"><a href="#classset" tabindex="-1" aria-controls="classset" role="tab" data-toggle="tab" onclick="classsetpage()"><span style="margin-right: 26%;font-size: 20px;">班级就业</span></a></li>	
						<% } %>
						</ul>
					</div>
					<hr class="norhr"/>
					<div class="menu">
						<div class="menu-title inacitve"><img src="../img/postinfo.png" class="nav-icon"><span style="font-size:22px;margin-right:110px;">岗位</span><span class="glyphicon glyphicon-menu-down"></span></div>
						<ul class="menu-content">
							<li style="margin-bottom: -8%;"><a href="#postinfo" tabindex="-1" aria-controls="postinfo" role="tab" data-toggle="tab" onclick="postinfopage()"><span style="margin-right: 26%;font-size: 20px;">岗位信息</span></a></li>
						</ul>
					</div>
					<hr class="norhr"/>
					<div class="menu">
						<div class="menu-title inacitve"><img src="../img/warningsystem.png" class="nav-icon"><span style="font-size:22px;margin-right:65px;">预警系统</span><span class="glyphicon glyphicon-menu-down"></span></div>
						<ul class="menu-content">
							<li><a href="#stuworkwarn" tabindex="-1" aria-controls="stuworkwarn" role="tab" data-toggle="tab" onclick="stuworkwarnpage()"><span style="margin-right: 11%;font-size: 20px;">学生就业预警</span></a></li>
							<li><a href="#postfillwarn" tabindex="-1" aria-controls="gradeset" role="tab" data-toggle="tab" onclick="postfillwarnpage()"><span style="margin-right: 11%;font-size: 20px;">岗位招满预警</span></a></li>
							<li style="margin-bottom: -8%;"><a href="#postoverdue" tabindex="-1" aria-controls="gradeset" role="tab" data-toggle="tab" onclick="postoverduepage()"><span style="margin-right: 11%;font-size: 20px;">岗位过期预警</span></a></li>
						</ul>
					</div>
					<%if(!(((Map)session.getAttribute("user")).get("admin_have").equals(2))){%>
					<hr class="norhr" />
					<div class="menu">
						<div class="menu-title inacitve"><img src="../img/stuinfo.png" class="nav-icon"><span style="font-size:22px;margin-right:20px;">学生信息管理</span><span class="glyphicon glyphicon-menu-down"></span></div>
						<ul class="menu-content">
							<li><a href="#bareg" tabindex="-1" aria-controls="bareg" role="tab" data-toggle="tab" onclick="baregpage()"><span style="margin-right: 26%;font-size: 20px;">批量注册</span></a></li>
							<li style="margin-bottom: -8%;"><a href="#badel" tabindex="-1" aria-controls="badel" role="tab" data-toggle="tab" onclick="badelpage()"><span style="margin-right: 26%;font-size: 20px;">批量删除</span></a></li>
						</ul>
					</div>
					<%}%>
					<%if(((Map)session.getAttribute("user")).get("admin_have").equals(0)){%>
					<hr class="norhr" />
					<div class="menu">
						<div class="menu-title"><img src="../img/authority.png" class="nav-icon"><a href="#author" tabindex="-1" aria-controls="author" role="tab" data-toggle="tab" onclick="authorpage()" style="font-size:22px;margin-right:90px;">权限管理</a></div>
					</div>
					<%}%>
				</div>
				<div class="content_right tab-content" style="box-shadow: 1 0 3px 3px gray;">
					<div id="default" class="tab-pane active" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/stuanalyze/stu.do?method=query" width="100%" height="100%"></iframe>
					</div>
					<div id="gradeset" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/grade/grade.do?method=query&page=1" width="100%" height="100%"></iframe>
					</div>
					<div id="classset" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/classs/set.do?method=query&page=1" width="100%" height="100%"></iframe>
					</div>
					<div id="postinfo" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/postinfo/postin.do?method=query&page=1" width="100%" height="100%"></iframe>
					</div>
					<div id="stuworkwarn" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/waring/stu.do?method=query&page=1" width="100%" height="100%"></iframe>
					</div>
					<div id="postfillwarn" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/waring/fill.do?method=query&page=1" width="100%" height="100%"></iframe>
					</div>
					<div id="postoverdue" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/waring/over.do?method=query&page=1" width="100%" height="100%"></iframe>
					</div>
					<div id="bareg" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/student/info.do?method=queryinfo&page=1" width="100%" height="100%"></iframe>
					</div>
					<div id="badel" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/student/info.do?method=querydelete&page=1" width="100%" height="100%"></iframe>
					</div>
					<div id="author" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath() %>/management/authority.do?method=query&page=1" width="100%" height="100%"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script>
        $(function(){
			//第一步，隐藏子菜单项//找到每一个菜单项，用each循环    
			$(".menu").each(function(){
				$(this).children(".menu-content").hide();
			});
			//给所有的主标题添加点击事件
			$(".menu-title").each(function(){
				$(this).click(function(){
				//弹出当前主标题下的子标题列表
					var mList=$(this).parents(".menu").children(".menu-content");
					//展开、收起导航栏
					
					mList.slideToggle();
					
				});
			});        
			//找到二级标签，给他注册点击事件，收展它下面的三级标题组  
			
        });
        function gradesetpage(){
			$('#gradeset').attr("class","tab-pane active");
			$('#classset').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
			$('#bareg').attr("class","tab-pane");
			$('#badel').attr("class","tab-pane");
			$('#author').attr("class","tab-pane");
		}
		function classsetpage(){
			$('#gradeset').attr("class","tab-pane");
			$('#classset').attr("class","tab-pane  active");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
			$('#bareg').attr("class","tab-pane");
			$('#badel').attr("class","tab-pane");
			$('#author').attr("class","tab-pane");
		}
		function postinfopage(){
			$('#gradeset').attr("class","tab-pane");
			$('#classset').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane active");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
			$('#bareg').attr("class","tab-pane");
			$('#badel').attr("class","tab-pane");
			$('#author').attr("class","tab-pane");
		}
		function stuworkwarnpage(){
			$('#gradeset').attr("class","tab-pane");
			$('#classset').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane active");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
			$('#bareg').attr("class","tab-pane");
			$('#badel').attr("class","tab-pane");
			$('#author').attr("class","tab-pane");
		}
		function postfillwarnpage(){
			$('#gradeset').attr("class","tab-pane");
			$('#classset').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane active");
			$('#postoverdue').attr("class","tab-pane");
			$('#bareg').attr("class","tab-pane");
			$('#badel').attr("class","tab-pane");
			$('#author').attr("class","tab-pane");
		}
		function postoverduepage(){
			$('#gradeset').attr("class","tab-pane");
			$('#classset').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane active");
			$('#bareg').attr("class","tab-pane");
			$('#badel').attr("class","tab-pane");
			$('#author').attr("class","tab-pane");
		}
		function baregpage(){
			$('#gradeset').attr("class","tab-pane");
			$('#classset').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
			$('#bareg').attr("class","tab-pane active");
			$('#badel').attr("class","tab-pane");
			$('#author').attr("class","tab-pane");
		}
		function badelpage(){
			$('#gradeset').attr("class","tab-pane");
			$('#classset').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
			$('#bareg').attr("class","tab-pane");
			$('#badel').attr("class","tab-pane active");
			$('#author').attr("class","tab-pane");
		}
		function authorpage(){
			$('#gradeset').attr("class","tab-pane");
			$('#classset').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
			$('#bareg').attr("class","tab-pane");
			$('#badel').attr("class","tab-pane");
			$('#author').attr("class","tab-pane active");
		}
    </script>
</body>
</html>



