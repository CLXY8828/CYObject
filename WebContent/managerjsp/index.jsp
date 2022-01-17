<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    .content{            
		width: 100%;
		height: 100%;
    }
    .content_left{
		width: 19%;
		height: 1000px;
		border: 0px solid #000000;
		float: left;
		background-color: #DFF0D8;
    }
    .content_right{
		width: 80.8%;
		height: 1000px;
		float: left;
		margin-top: 0px;
    }
    .nav_title{
		height: 50px;
		width: 100%;
		text-align: center;
		line-height: 50px;
    }
    .menu{
		width: 100%;
		text-align: center;
		margin-top:10px;
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
		margin-top: 20px;
		font-size: 25px;
		display: block;
    }
    .menu-content li:hover{
		background-color: azure;
		cursor: pointer;
    }
    .menu-content-third{
		margin-left: 20px;
		font-size: 20px;
		display:none;
    }
	.top{
		position: absolute;
		left:140px ;
		top: 50px;
		width: 115px;
		height:115px ;
	}
	.top-title{
		color: white;
		position: absolute;
		top: 80px;
		left: 272px;
		font-size: 50px;
		font-weight: bolder;
	}
	.container{
		width: 1680px;
		left: 120px;
	}
	.nav-icon{
		width: 30px;
		height: 30px;
	}
	.nav-info1{
		margin-right: 130px;
	}
	.nav-info2{
		
	}
	.glyphicon-menu-up{
		display: none;
	}
	.norhr{
		border: #000000 1px solid;
		margin-top: -5px;
		width: 70%;
		margin-left: 30px;
	}
	.container-fluid{
		width: 100%;
	}
</style>
<body>
	<div class="hidden-sm hidden-xs hidden-md" style="width: 100%;">
		<div class="navbar-header" style="width: 100%;">
			<div class="">
				<img src="../img/title.jpg" alt="高校就业平台" style="width: 100%;">
				<img src="../img/logo.png" class="top" >
			</div>
			<div class="top-title">
				<span>高校就业平台</span>
			</div>
			<div id="welcome" style="position: absolute;top:160px; right: 350px;" class="h2">
				欢迎<span id="username">**</span>登录
			</div>
			<span class="h2" style="position: absolute; top: 140px; right: 200px;">
				<a href="/*" class="btn btn-info" style="height: 50px;width:130px;font-size: 32px;">我的</a>
			</span>
		</div>
	</div>
    <div class="container">
		<div id="body" class="container-fluid">
			<div class="content">
				<div class="content_left">
					<div class="nav_title">
						<h2>高校就业管理信息平台</h2>
					</div>
					<hr style="width: 100%; border: #000000 1.5px solid;margin-top: -5px;" />
					<!-- 每一个菜单项 -->
					<div class="menu">       
						<div class="menu-title"><img src="../img/working.png" class="nav-icon"><span class="nav-info1">就业</span><span class="glyphicon glyphicon-menu-down"></span><span class="glyphicon glyphicon-menu-up"></span></div>                
							<ul class="menu-content">
								<li style="text-align: left; padding-left:60px;"><a href="#gradeset" style="width: 100%;" tabindex="-1" aria-controls="gradeset" role="tab" data-toggle="tab" onclick="gradesetpage()"><span class="nav-info2">年纪设定</span></a></li>								
								<li class="eighteen"><span style="margin-right: 70px;text-align: left; padding-left:5px;">18级就业</span><span class="glyphicon glyphicon-menu-down"></span><span class="glyphicon glyphicon-menu-up"></span></li >
									<ul class="menu-content-third"><!--在这里跳转-->
										<li style="text-align: left; padding-left:50px;"><a href="#eighteenworkinfo" tabindex="-1" aria-controls="eighteenworkinfo" role="tab" data-toggle="tab" onclick="eighteenworkinfopage()"><span class="third-span">就业详细信息</span></a></li>
										<li style="text-align: left; padding-left:50px;"><a href="/*" tabindex="-1" aria-controls="gradeset" role="tab" data-toggle="tab"><span class="third-span">未就业学生信息</span></a></li>
									</ul>
								<li class="nineteen"><span style="margin-right: 70px;text-align: left; padding-left:5px;">19级就业</span><span class="glyphicon glyphicon-menu-down"></span><span class="glyphicon glyphicon-menu-up"></span></li >
									<ul class="menu-content-third">
										<li style="text-align: left; padding-left:50px;"><a href="/*" data-toggle="tab" tabindex="-1"><span class="third-span">就业详细信息</span></a></li>
										<li style="text-align: left; padding-left:50px;"><a href="/*" data-toggle="tab" tabindex="-1"><span class="third-span">未就业学生信息</span></a></li>
									</ul>
							</ul>
					</div>
					<hr class="norhr"/>
					<div class="menu">
						<div class="menu-title"><img src="../img/postinfo.png" class="nav-icon"><span class="nav-info1">岗位</span><span class="glyphicon glyphicon-menu-down"></span><span class="glyphicon glyphicon-menu-up"></span></div>
							<ul class="menu-content">
								<li style="text-align: left; padding-left:60px;"><a href="#postinfo" tabindex="-1" aria-controls="postinfo" role="tab" data-toggle="tab" onclick="postinfopage()"><span class="nav-info2"">岗位信息</span></a></li>
								<li style="text-align: left; padding-left:60px;"><a href="#" data-toggle="tab"><span  style="margin-right: -10px;">学生急需岗位信息</span></a></li>
							</ul>
					</div>
					<hr class="norhr" />
					<div class="menu">
						<div class="menu-title"><img src="../img/warningsystem.png" class="nav-icon"><span class="nav-info1"  style="margin-right: 70px;">预警系统</span><span class="glyphicon glyphicon-menu-down"></span><span class="glyphicon glyphicon-menu-up"></span></div>
							<ul class="menu-content">
								<li style="text-align: left; padding-left:60px;"><a href="#stuworkwarn" tabindex="-1" aria-controls="stuworkwarn" role="tab" data-toggle="tab" onclick="stuworkwarnpage()"><span>学生就业预警</span></a></li>
								<li style="text-align: left; padding-left:60px;"><a href="#postfillwarn" tabindex="-1" aria-controls="gradeset" role="tab" data-toggle="tab" onclick="postfillwarnpage()"><span>岗位招满预警</span></a></li>
								<li style="text-align: left; padding-left:60px;"><a href="#postoverdue" tabindex="-1" aria-controls="gradeset" role="tab" data-toggle="tab" onclick="postoverduepage()"><span>岗位过期预警</span></a></li>
							</ul>
					</div>
					<hr class="norhr" />
					<div class="menu">
						<div class="menu-title"><img src="../img/stuinfo.png" class="nav-icon"><span class="nav-info1" style="margin-right: 10px;">学生信息管理</span><span class="glyphicon glyphicon-menu-down"></span><span class="glyphicon glyphicon-menu-up"></span></div>
							<ul class="menu-content">
								<li style="text-align: left; padding-left:60px;"><a href="#"><span>批量注册</span></a></li>
								<li style="text-align: left; padding-left:60px;"><a href="#"><span>批量删除</span></a></li>
							</ul>
					</div>
					<hr class="norhr" />
					<div class="menu">
						<div class="menu-title"><img src="../img/authority.png" class="nav-icon"><span class="nav-info1"  style="margin-right: 70px;">权限管理</span><span class="glyphicon glyphicon-menu-down"></span><span class="glyphicon glyphicon-menu-up"></span></div>
							<ul class="menu-content">
								<li><span class="nav-info2">1111</span></li>
							</ul>
					</div>
				</div>
				<div class="content_right tab-content" style="box-shadow: 1 0 3px 3px gray;">
					<div id="default" class="tab-pane active" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath() %>/managerjsp/default.jsp" width="100%" height="100%"></iframe>
					</div>
					<div id="gradeset" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="gradesetting.jsp" width="100%" height="100%"></iframe>
					</div>
					<div id="eighteenworkinfo" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="eighteenworkinfo/eighteenworkinfo.jsp" width="100%" height="100%"></iframe>
					</div>
					<div id="postinfo" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="<%=request.getContextPath()%>/postinfo/postin.do?method=query" width="100%" height="100%"></iframe>
					</div>
					<div id="stuworkwarn" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="postwaring/stuworkwarn.jsp" width="100%" height="100%"></iframe>
					</div>
					<div id="postfillwarn" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="postwaring/postfillwarn.jsp" width="100%" height="100%"></iframe>
					</div>
					<div id="postoverdue" class="tab-pane" style="width: 100%;height: 100%;">
						<iframe src="postwaring/postoverdue.jsp" width="100%" height="100%"></iframe>
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
			$(".eighteen").click(function(){
				
				$(".eighteen").next().slideToggle();
				
			});
			$(".nineteen").click(function(){
				$(".nineteen").next().slideToggle();    
			});
        });
		function gradesetpage(){
			$('#gradeset').attr("class","tab-pane active");
			$('#eighteenworkinfo').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
		}
		function eighteenworkinfopage(){
			$('#gradeset').attr("class","tab-pane");
			$('#eighteenworkinfo').attr("class","tab-pane active");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
		}
		function postinfopage(){
			$('#gradeset').attr("class","tab-pane");
			$('#eighteenworkinfo').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane active");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
		}
		function stuworkwarnpage(){
			$('#gradeset').attr("class","tab-pane");
			$('#eighteenworkinfo').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane active");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane");
		}
		function postfillwarnpage(){
			$('#gradeset').attr("class","tab-pane");
			$('#eighteenworkinfo').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane active");
			$('#postoverdue').attr("class","tab-pane");
		}
		function postoverduepage(){
			$('#gradeset').attr("class","tab-pane");
			$('#eighteenworkinfo').attr("class","tab-pane");
			$('#postinfo').attr("class","tab-pane");
			$('#stuworkwarn').attr("class","tab-pane");
			$('#postfillwarn').attr("class","tab-pane");
			$('#postoverdue').attr("class","tab-pane active");
		}
    </script>
</body>
</html>



