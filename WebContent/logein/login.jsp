	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>登录界面</title>
	<!--1.移动设备积极响应的语句 -->
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
			
			<!--2.引入基本的bootstrap的样式和js文件 -->
			
			<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
			<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<script src="../jquery/jquery.min.js" ></script>
			<script src="../jquery/jquery.cookie.js" ></script>
			<script src="../js/indexjs.js"></script>
			<style>
		    .code
		    {	
		    	-webkit-user-select: none;
				-moz-user-select: none;
				-ms-user-select: none;
				user-select: none;
		         font-family:Arial;
		         font-style:italic;
		         color:blue;
		         font-size:20px;
		         border:1px;
		         padding:2px 3px;
		         letter-spacing:3px;
		         font-weight:bolder;            
		         cursor:pointer;
		         width:150px;
		         height:50px;
		         line-height:10px;
		         text-align:center;
		         vertical-align:middle;
		         background-color:#D8B7E3;
		     }
		     #spans {
		        text-decoration:none;
		        font-size:12px;
		        color:#288bc4;
		        padding-left:10px;
		    }
		 
		    #span:hover {
		        text-decoration:underline;
		        cursor:pointer;
		    }
		   
		</style>
			<script type="text/javascript">
			$().ready(function (){
				var err="<%=(String)request.getAttribute("err")==null?"":(String)request.getAttribute("err")%>";
				var errindex="<%=(Integer)request.getAttribute("errindex")==null?"":(Integer)request.getAttribute("errindex")%>";
				if(err!=""){
					if(errindex==1){
						hiddenEle();
					}
					exception(err,errindex);
				}
			})
			$(function(){  
			    /*仿刷新：检测是否存在cookie*/  
			    if($.cookie("captcha")){  
			        var count = $.cookie("captcha");  
			        var btn = $('#getting');  
			        btn.val(count+'秒后可重新获取').attr('disabled',true).css('cursor','not-allowed');  
			        var resend = setInterval(function(){  
			            count--;  
			            if (count > 0){  
			                btn.val(count+'秒后可重新获取').attr('disabled',true).css('cursor','not-allowed');  
			                $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});  
			            }else {  
			                clearInterval(resend);  
			                btn.val("获取验证码").removeClass('disabled').removeAttr('disabled style');  
			            }  
			        }, 1000);  
			    }  

			    /*点击改变按钮状态，已经简略掉ajax发送短信验证的代码*/  
			    $('#getting').click(function(){
			    	var phonecode =$("#inp_id007").val();
	    	    	hq(this);
			    	$.ajax({
			    	    url: "<%=request.getContextPath()%>/users/logein.do?method=logephone",
			    	    data: {name: phonecode},
			    	    type: "POST",
			    	    dataType: "json",
			    	    success: function(data) {
			    	    }
			    	});
			        
			    });  
					
			});  
			function hq (a){
				var b=document.getElementById("inp_id007").value;
				var regexp=new RegExp("^1[58379]\\d{9}$");
				
				if(!$("#inp_id007").val().trim())
				{
					exception("手机号不能为为空，请输入手机号!",0)
					return false
				}
				if(!regexp.test(b))
				{
					exception("请输入正确的手机号!",0)
					return false
				}
				
			    var btn = $(a);  
			    var count = 60;  
			    var resend = setInterval(function(){  
			        count--;  
			        if (count > 0){  
			            btn.val(count+"秒后可重新获取");  
			            $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});  
			        }else {  
			            clearInterval(resend);  
			            btn.val("获取验证码").removeAttr('disabled style');  
			        }  
			    }, 1000);  
			    btn.attr('disabled',true).css('cursor','not-allowed');  
			   }
			</script>
			<style type="text/css">
				.box{
					  display: flex;
					}
				
			</style>
	</head>
	<body>
	
		
		<div class="panel panel-default  " style="background: #122B40;">
		  <div class="panel-body">
		    <div class="col-md-2 col-md-offset-1" style="height: 70px; width: 120px; ">
			  	<img src="../img/001.png" class="img-responsive" alt="Responsive image" style="width:100%;height:100%; ">
			  	
			  </div>
			  <div class="col-md-3  " style="font-size: 35px; text-align: center; font-weight: bold; color: white; top: 10px; left: 30px; width: 300px; height: 100px;">高 校 就 业 平 台</div>
		  </div>
		</div>
		
	
		
		<div class="box ">
	  
	  		<div class="container" style=" box-shadow:0 0 6px 3px #c3c3c3;   align-content: center; width: 1300px; height: 520px;   ">
			  <div class="row" >
			  	
			  	<div class="col-md-2 visible-lg" style="height: 430px; width: 700px; top: 30px; ">
			  		<img src="../img/003.jpg" class="img-responsive" alt="Responsive image" style="width:100%;height:100%; ">
			 	 </div>
				
				<div class=" col-md-offset-1 " >
					
					<h2 align="center" style="font-weight: bold; margin: 30px  0px  0px  0px; ">欢 迎 登 录 就 业 服 务 平 台</h2>
					<h4 style=" color: #C0C0C0; font-style: italic; text-align: center;  font-family: '宋体';">为高校应届毕业生就业工作助力</h4>				
						
						
			<div class=" col-md-5  " style="margin: 20px  0px  0px  50px;  box-shadow:0 0 6px 3px #c3c3c3; padding: 20px;" id="box">
				<div class="form-info" align="center">
				
					<p align="center">
					  <button type="button" class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;手 机 登 录&nbsp;&nbsp;&nbsp;&nbsp;</button>
					  <button type="button" class="btn btn-default btn-lg"  onclick="hiddenEle()">&nbsp;&nbsp;&nbsp;&nbsp;学 号 登 录&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</p>
					
					<div class="alert alert-danger text-center hidden ex" role="alert"></div>
					<form name="loginForm" action="<%=request.getContextPath()%>/users/logein.do?method=logep" method="post" onsubmit="return yanzheng01()">
						<div class="form-group">
							<hr />
	
							 <div class="col-md-12">
							    <div class="input-group">
							      <div class="input-group-btn">
							        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">+86 <span class="caret"></span></button>
							        <ul class="dropdown-menu">
							          <li><a href="#">+86</a></li>
							        </ul>
							      </div><!-- /btn-group -->
							      <input type="text" class="form-control" name="phonenumber" aria-label="..." placeholder="请输入手机号" id="inp_id007">
							    </div><!-- /input-group -->
							  </div>
							  
						</div>
						<br />
						<br />
						<br />
						<div class="form-group">
							
							 <div class="col-md-12 ">
							    <div class="input-group ">
							    	<span class="input-group-addon" id="basic-addon3">验证码：</span>
							      <input type="text" class="form-control" id="inp_id008" name="code" placeholder="请输入验证码">
							      <span class="input-group-btn">
							         <input type="button"  class="btn btn-default "id="getting" value="获取验证码" style="color: #269ABC">
							      </span>
							    </div>
							  </div>
								
							
						</div>
						<br />
						<br />
						<br />
						<div class="submit" align="center">
							<button type="submit" class="btn btn-primary btn-lg btn-block">登      录</button>
	
						</div>
						<br />
					</form>
				</div>
			</div>
			
			<div class="container-fluid col-md-5 col-md-offset-1" style="margin: 20px  0px  0px  50px;  box-shadow:0 0 6px 3px #c3c3c3; padding: 20px; display: none;" id="box01">
				<div class="form-info">
					<p align="center">
					  <button type="button" class=" btn btn-default btn-lg" onclick="showEle()">&nbsp;&nbsp;&nbsp;&nbsp;手 机 登 录&nbsp;&nbsp;&nbsp;&nbsp;</button>
					  <button type="button" class=" btn btn-primary btn-lg"  >&nbsp;&nbsp;&nbsp;&nbsp;学 号 登 录 &nbsp;&nbsp;&nbsp;&nbsp;</button>
					</p>
					
					<div class="alert alert-danger text-center hidden ex" role="alert"></div>
					<form name="loginForm01" action="<%=request.getContextPath()%>/users/logein.do?method=loge" method="post" onsubmit="return yanzheng()">
						<table style=" border-collapse: separate; border-spacing: 10px;" >
							<tr >
								<td><label for="exampleInputEmail1" >学号 : </label></td>
								<%String sid = (String)request.getAttribute("sid"); %>
								<td><input type="text" class="form-control" name="sid" id="exampleInputEmail1" placeholder="请输入学号" <%=sid==null?"":"value="+sid %>></td>
							</tr>
							<hr />
							<tr >
								
								<div class="form-group" >
								<td><label for="exampleInputEmail1" >密码 : </label></td>
								<td><input type="password" class="form-control" name="password" id="exampleInputEmail2" placeholder="请输入密码"></td>
								
								</div>
							</tr>
							
							<tr >
								<td align="right"  style="font-weight: bold;">验证码:</td>
								<td>
									<input id="txt" type="text" placeholder="请输入验证码"/>
									<div style=" background-color: white; -10px -15px;width:80px; 
									font-style: italic; height: 20px;
									display: inline-block;" id="checkCode" class="code"  onclick="createCode(4)" ></div>
									<span id="spans" onclick="createCode(4)">看不清换一张</span>		
								
								</td>
							</tr>
	
						</table>
						<br />
						<div class="submit" style=" float: right;">
							
							<button type="submit" class="btn btn-primary btn-lg ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登    录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
						
						</div>
						<div style=" margin: 26px 0 0 0; float: left;">
								<a href="<%=request.getContextPath()%>/users/logein.do?method=nopassword"  style="font-weight: bold;  ">忘记密码</a>
							</div>
	
					</form>
				</div>
			</div>
						
				</div>
	
			  </div>
			</div>
	  		
		</div>
	
	</body>
	</html>