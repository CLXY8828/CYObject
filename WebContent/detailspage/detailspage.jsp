<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>公司详情页面</title>
		<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/detailspage.css"/>
		<script type="text/javascript">
			function modaltt (a) {
				$(a).modal('show')
			}
			function sqzwtt (id,a,b) {
				a="你所要申请的是"+a;
				$(".modal-sqzw-h4").text(a)
				$(".modal-sqzw-h5").text(b)
				modaltt(id);
			}
			function sqzwok () {
				$("#sqzw").modal('hide');
				$("#sqzwok").modal('show');
				
			}
			function sqok(userid) {
				if(<%=(Map)request.getSession().getAttribute("user")==null%>){
					$("#sqzw").modal('hide');
					modaltt("#logeink");
				}
				else if(<%=(Map)request.getSession().getAttribute("ws")==null%>){
					$("#sqzw").modal('hide');
					modaltt("#okxx");
				}
				else {
					<%Map map=(Map)request.getAttribute("map");%>	
					var eid="<%=map.get("eid")%>";
					var count= $("#sq-count").text();
					var url ="<%=request.getContextPath()%>/users/index.do?method=sq";
					$.post(url,{userid:userid,eid:eid},function(data)
					{
						sqzwok ();
						$(".sq").each(function () {
							$(this).removeAttr("onclick");
							$(this).attr("disabled","disabled");
							$(this).html('已申请')
						})
						
					});
				}
			}
			function scok(img,text,type,userid,eid) {
				if(<%=(Map)request.getSession().getAttribute("user")==null%>){
					modaltt("#logeink");
				}
				else if(<%=(Map)request.getSession().getAttribute("ws")==null%>){
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
		</script>
		
	</head>
	
	<!--
    	作者：1977455153@qq.com
    	时间：2022-01-24
    	描述：导航栏
    -->
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
		        <li id="address"><a href="<%=request.getContextPath()%>/users/index.do?method=query">点击返回上一页</a></li>
		     </ul>   
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     	 <ul class="nav visible-xs-block navbar-nav">
		        <li><a href="<%=request.getContextPath()%>/users/index.do?method=query"style="color: white;">点击返回上一页</a>	</li>
		      </ul>
		      
	    </div>
	    
	  </div>
	  
	  <!--
      	作者：1148969471@qq.com
      	时间：2022-01-29
      	描述：下面置顶的一行
      -->
	  <div class="container-fluid">
			<!--
            	作者：1148969471@qq.com
            	时间：2022-01-29
            	描述：第一行显示头部java开发工程师的元素
            -->
		  <div class="row" style="background-color: #ebeff7">
		  	<div class="row">
		  		<div class="col-lg-10 col-xs-6 col-lg-offset-1">
		  			<h3>${map.employment_name}</h3>
		  		</div>
		  		<div class="col-xs-6 visible-xs-block">
		  			<h3 style="color: red;">${fn:split(map.salary, ".")[1]=="12"?fn:split(map.salary, ".")[0]:map.salary}${fn:split(map.salary, ".")[1]=="12"?"":"薪"}</h3>	  
		  		</div>
		  	</div>
		  	<div class="row ">
		  		<div class="col-lg-5 col-xs-12 col-lg-offset-1">
		  			<h4>${map.gsname}</h4>
		  		</div>
		  		<div class="col-lg-5 col-lg-push-3 visible-lg-block" style="padding-left: 60px;" >
		  			<h3 style="color: red;">${fn:split(map.salary, ".")[1]=="12"?fn:split(map.salary, ".")[0]:map.salary}${fn:split(map.salary, ".")[1]=="12"?"":"薪"}</h3>	  		
		  		</div>
		  	</div>
		  	<div class="row ">
		  		<div class="col-lg-5 col-lg-offset-1 visible-lg-block" >
		  			<span class="label label-default" style="padding-left: 0px;">${map.address}</span>
		  			<span class="label label-default">| ${map.experience}</span>
		  			<span class="label label-default">| ${map.education}</span>
		  			<span class="label label-default">| 招${map.recrultsNumb}人</span>
		  			<span class="label label-default">| ${fn:substring(map.subtime,fn:indexOf(map.subtime,"-")+1, -1)}发布  </span>		  		
		  		</div>
		  		<!--
                  	作者：1148969471@qq.com
                  	时间：2022-01-29
                  	描述：手机端显示的第三行
                  -->
		  		<div class=" col-xs-12  visible-xs-block" >
		  			<span class="label label-default02" style="padding-left: 0px;">${map.address}</span>
		  			<span class="label label-default02">| ${map.experience}</span>
		  			<span class="label label-default02">| ${map.education}</span>
		  			<span class="label label-default02">| 招${map.recrultsNumb}人</span>
		  			<span class="label label-default02">| ${fn:substring(map.subtime,fn:indexOf(map.subtime,"-")+1, -1)}发布</span>		  		
		  		</div>
		  	</div>
		  	<div class="row ">
		  		<div class="col-lg-4  col-lg-offset-1 visible-lg-block" style="padding-top: 10px;">
		  		<c:forTokens items="${map.welfare}" delims="#" var="name">
					 <span class="label label-default01">${name}</span>
				</c:forTokens>
		  		</div>
		  		<div class="col-lg-4 col-lg-push-4   visible-lg-block" style="padding-top: 5px;">
		  		<c:choose>
		  			<c:when test="${map.Collectionstate==1&&!empty user}">
		  			<!--
                      	作者：1148969471@qq.com
                      	时间：2022-01-29
                      	描述：已收藏
                      -->
		  			<div class="col-lg-5">
		  				<a href="#" onclick="scok('sc-lg-img','sc-lg-text',1,'${user.UUID}','${map.eid}')">
			  				<div class="col-lg-4">
			  					<img id="sc-lg-img" src="<%=request.getContextPath() %>/img/sc-s.png" class="img-responsive"/>
			  				</div>
			  				<div class="col-lg-8 col-lg-pull-1">
			  					<p id="sc-lg-text" class="sc-text">已收藏</p>
			  				</div>
		  				</a>
		  			</div>
		  			</c:when>
		  			<c:otherwise>
  			  		<div class="col-lg-5 " >
  			  		<c:if test="${!empty user }">
		  				<a href="#" onclick="scok('sc-lg-img','sc-lg-text',0,'${user.UUID}','${map.eid}')">
			  				<div class="col-lg-4" >
			  					<img id="sc-lg-img" src="<%=request.getContextPath() %>/img/sc.png" class="img-responsive"/>
			  				</div>
			  				<div class="col-lg-8 col-lg-pull-1">
			  					<p id="sc-lg-text" class="sc-text">收藏</p>
			  				</div>
		  				</a>
		  			</c:if>
		  			<c:if test="${empty user }">
		  			<a href="#" onclick="modaltt('#logeink');">
			  				<div class="col-lg-4" >
			  					<img id="sc-lg-img" src="<%=request.getContextPath() %>/img/sc.png" class="img-responsive"/>
			  				</div>
			  				<div class="col-lg-8 col-lg-pull-1">
			  					<p id="sc-lg-text" class="sc-text">收藏</p>
			  				</div>
		  				</a>
		  			</c:if>
		  			</div>
		  			</c:otherwise>
		  			</c:choose>
		  		</div>
		  		
		  		<div class="col-lg-3 col-lg-push-1 visible-lg-block">
	  				<div class="col-lg-12">
	  				<c:choose>
					 <c:when test="${map.applystate==1&&!empty user}">
					 	<a type="button" class="btn btn-primary" disabled="disabled">已申请</a>
	  				 </c:when>
	  				 <c:otherwise>
	  				 <c:if test="${!empty user}">
	  				 	<a type="button" class="btn btn-primary sq" onclick="sqzwtt('#sqzw','北京京云万峰信息技术有限公司','Java开发工程师')">申 请 职 位</a>
	  				 </c:if>
	  				 <c:if test="${empty user}">
	  				 	<a type="button" class="btn btn-primary sq" onclick="modaltt('#logeink')">申 请 职 位</a>
	  				 </c:if>
	  				 </c:otherwise>
	  				 </c:choose>
	  				</div>
	  			</div>
		  		<!--
                  	作者：1148969471@qq.com
                  	时间：2022-01-29
                  	描述：手机端显示的第四行
                  -->
		  		<div class=" col-xs-12  visible-xs-block" style="padding-top: 5px;">
		  		<c:forTokens items="${map.welfare}" delims="#" var="name">
					 <span class="label label-default01">${name}</span>
				</c:forTokens>
		  		</div>
		  	</div>
		  	<!--
              	作者：1148969471@qq.com
              	时间：2022-01-29
              	描述：手机端第五行，显示薪资收藏和申请按钮
              -->
              <div class="row visible-xs-block" style="padding-top: 6px;">
              <c:choose>
		  			<c:when test="${map.Collectionstate==1&&!empty user}">
		  			<!--
                      	作者：1148969471@qq.com
                      	时间：2022-01-29
                      	描述：已收藏
                      -->
                      <div class="col-xs-6" style=" padding-top: 6px;">
		  				<a href="#" onclick="scok('sc-xs-img','sc-xs-text',1,'${user.UUID}','${map.eid}')">
			  				<div class="col-xs-4">
			  					<img id="sc-xs-img" src="<%=request.getContextPath() %>/img/sc-s.png" class="img-responsive"/>
			  				</div>
			  				<div class="col-xs-8 col-xs-pull-2">
			  					<p id="sc-xs-text" class="sc-text">已收藏</p>
			  				</div>
		  				</a>
		  			</div>
		  			</c:when>
		  			<c:otherwise>
		  			<div class=" col-xs-6" style=" padding-top: 6px;">
		  			<c:if test="${!empty user }">
		  			<a href="#" onclick="scok('sc-xs-img','sc-xs-text',0,'${user.UUID}','${map.eid}')">
		  				<div class="col-xs-4">
		  					<img id="sc-xs-img" src="<%=request.getContextPath() %>/img/sc.png" class="img-responsive"/>
		  				</div>
		  				<div class="col-xs-8 col-xs-pull-2">
		  					<p id="sc-xs-text" class="sc-text">收藏</p>
		  				</div>
		  			</a>
		  			</c:if>
		  			<c:if test="${empty user }">
		  			<a href="#" onclick="modaltt('#logeink');">
		  				<div class="col-xs-4">
		  					<img id="sc-xs-img" src="<%=request.getContextPath() %>/img/sc.png" class="img-responsive"/>
		  				</div>
		  				<div class="col-xs-8 col-xs-pull-2">
		  					<p id="sc-xs-text" class="sc-text">收藏</p>
		  				</div>
		  			</a>
		  			</c:if>
		  				
		  			</div>
		  			</c:otherwise>
		  			</c:choose>
		  			
              	<div class="col-xs-3 col-xs-push-2">
              	<c:choose>
					 <c:when test="${map.applystate==1&&!empty user}">
					 	<a type="button" class="btn btn-primary" disabled="disabled">已申请</a>
	  				 </c:when>
	  				 <c:otherwise>
	  				 <c:if test="${!empty user}">
	  				 	<a type="button" class="btn btn-primary sq" onclick="sqzwtt('#sqzw','${map.gsname}','${map.employment_name}')">申 请 职 位</a>
	  				 </c:if>
	  				 <c:if test="${empty user}">
	  				 	<a type="button" class="btn btn-primary sq" onclick="modaltt('#logeink')">申 请 职 位</a>
	  				 </c:if>
	  				 </c:otherwise>
	  				 </c:choose>
		  			</div>
              	
              </div>
		  </div>
		  
		
		  
		</div>
	  
	</nav>
	
	<body>
		<!--
        	作者：1148969471@qq.com
        	时间：2022-01-29
        	描述：职位信息和公司信息，一行row分两半
        -->
		 <div class="container-fluid">
		  <div class="row">
		  	<!--
              	作者：1148969471@qq.com
              	时间：2022-01-29
              	描述：左边
              -->
		    <div class="col-lg-8 col-xs-12 col-lg-offset-1">
		    	<!--
                	作者：1148969471@qq.com
                	时间：2022-01-29
                	描述：职位信息
                -->
		    	<div class="row">
		    		<h3 style="color: #2A2A5E;">
		    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
		    			职位信息
		    		</h3>
		    	</div>
		    	<div class="row">
		    		<div class="col-lg-12 col-xs-12">
			    		<h4>职位职责：</h4>
			    		<div class="col-lg-5 col-xs-12">
			    			<h5>${map.employment_describe}</h5>
			    		</div>
		    		</div>
		    	</div>
		    	<div class="row">
		    		<div class="col-lg-12 col-xs-12">
		    		<h4>任职要求：</h4>
		    		<div class="col-lg-8 col-xs-12">
		    		<p>${map.demand}</p>
		    		</div>
		    		</div>
		    		
		    	</div>
		    	<div class="row">
			    	<div class="col-lg-12 col-xs-12">
			    		<div class="col-lg-2 col-xs-4">
			    			<h3><small>职位类别：</small></h3>
			    		</div>
			    		<div class="col-lg-2 col-lg-pull-1 col-xs-4">
			    			<h3><small>${map.zwtype}</small></h3>
			    		</div>
			    	</div>
			    	<hr  style="border: 1px solid #E3E3E3; background-color:#E3E3E3; " / >
			    </div>
		    	
		    	<div class="row">
		    		<h3 style="color: #2A2A5E;">
		    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
		    			联系方式
		    		</h3>
		    	</div>
		    	<div class="row">
			    	<div class="col-lg-12 col-xs-12">
			    	<h4>${map.phone}</h4>
			    	</div>
		    		<hr style="border: 1px solid #E3E3E3; background-color:#E3E3E3;"/ >
		    		
		    	</div>
		    	
		    	<div class="row">
		    		<h3 style="color: #2A2A5E;">
		    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
		    			公司信息
		    		</h3>
		    	</div>
		    	<div class="row">
		    	<div class="col-lg-12 col-xs-12">
			    	<p>${map.introduce}</p>
			    	</div>
		    		<br />
		    		<br />
		    	</div>
		    	
		    </div>
		    <!--
            	作者：1148969471@qq.com
            	时间：2022-01-29
            	描述：右边
            -->
		    <div class="col-lg-2 visible-lg-block ">
		    	<!--
                	作者：1148969471@qq.com
                	时间：2022-01-29
                	描述：公司信息
                -->
		    	<div class="row">
		  			<div class="col-lg-12">
				  		<div class="panel panel-default" style="background-color: #f6f6f8;">
						  <div class="panel-body  ">
						    <div class="row">
						    	<h4 >公司信息</h4>
						  		<hr / style="border: 2px solid #CCCCCC; padding-top: 0px; margin-top: 10px;">
						    	<h5>${map.gsname}</h5>
						    </div>
						    <br />
						    <div class="row">
						    	<div class="col-lg-2" style="padding-top: 5px;">
						    		<img src="<%=request.getContextPath() %>/img/gsxx-1.png" alt="..." class="img-rounded" style="background-color: #f6f6f8;">
						    	</div>
						    	<div class="col-lg-6">
						    		<h6>${map.nature_name}</h6>
						    	</div>
						    </div>
						    <div class="row">
						    	<div class="col-lg-2" style="padding-top: 5px;">
						    		<img src="<%=request.getContextPath() %>/img/gsxx-2.png" alt="..." class="img-rounded">
						    	</div>
						    	<div class="col-lg-5">
						    		<h6>${map.scale}</h6>
						    	</div>
						    </div>
						    <div class="row">
						    	<div class="col-lg-2" style="padding-top: 5px;">
						    		<img src="<%=request.getContextPath() %>/img/gsxx-3.png" alt="..." class="img-rounded">
						    	</div>
						    	<div class="col-lg-10">
						    		<h6>${map.gstype}</h6>
						    	</div>
						    </div>
						    
						  </div>
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
		  
		  <div class="row">
				<nav class="navbar navbar-default ">
				  <div class="container">
				    <div style="font:12px Tahoma;margin:0px auto;text-align:center;">
					 <div><hr size="1" />
					COPYRIGHT &copy;&nbsp;&nbsp;2003-2050&nbsp;&nbsp; <a href="index.htm">北京市贵天影视有限公司</a> ALL RIGHT RESERVED<br />
					 热线：400-66-741741 Email:service@prd.com<br />
					 ICP：<a href="#">沪ICP备05021104号</a><br />
					 </div><!--copyright end-->
					</div><!--footer end-->
				  </div>
				</nav>
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
			      		<a href="#" type="button" class="btn btn-primary" onclick="sqok('${user.UUID}')">确&nbsp;定</a>
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
			      		<a href="#" type="button" class="btn btn-primary">立即填写</a>
			      	</div>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
	</body>
</html>
