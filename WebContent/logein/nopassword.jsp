<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>忘记密码</title>
		
		 <!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		
		<!--2.引入基本的bootstrap的样式和js文件 -->
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="../jquery/jquery.min.js" ></script>
		<script src="../jquery/jquery.cookie.js" ></script>
		<script type="text/javascript">
			var dlcode=false;
			function yanzheng()
			{

	   			if(!$("#exampleInputEmail1").val().trim())
	   			{
	   				$("#zhengque01").hide();
	   				$("#cuowu01").show();
	   				return false;
	   			}
	   			if(!$("#inp_id008").val().trim())
	   			{
	   				$("#zhengque02").hide();
	   				$("#cuowu02").show();
	   				return false;
	   			}
	   			if(!$("#yanzhengma").val().trim())
	   			{
	   				$("#zhengque03").hide();
	   				$("#cuowu03").show();
	   				return false;
	   			}
	   			if(!dlcode)
	   			{	
	   				alert(dlcode);
	   				$("#zhengque03").hide();
	   				$("#cuowu03").show();
	   				return false;
	   			}
	   			if(!$("#pass01").val().trim())
	   			{
	   				$("#zhengque04").hide();
	   				$("#cuowu04").show();
	   				return false;
	   			}
	   			if(!$("#pass02").val().trim())
	   			{
	   				$("#zhengque05").hide();
	   				$("#cuowu05").show();
	   				return false;
	   			}
	   			else
	   			{
	   				return true;
	   			}
	   			
			}
		
				
			$(function(){  
	        /*仿刷新：检测是否存在cookie*/  
	        if($.cookie("captcha"))
	        {
	        	
	        	
	        	
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
	        $('#getting').click(function()
	        {
	        	var phone=$("#inp_id008").val();
	        	var url="<%=request.getContextPath()%>/users/nopassword.do?method=phonecode";
				$.post(url,{phone:phone},function(data)
            			{
			    	    	if(data=="yes"){
			    	    		$("#zhengque03").hide();
				   				$("#cuowu03").show();
			    	   			var btn = $('#getting');  
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
			    	    	else if(data=="no"){
			    	    		tianxie(data);
			    	    		$("#zhengque03").hide();
			    	   			$("#cuowu03").show();
			    	    	}
            			}); 
	             
	        });  
	   
	    });  
	    
	    function yz01()
	   	{
	   		var gname=$("#exampleInputEmail1").val();
			
			if(gname=="")
			{
				var data="tj01";
				tianxie(data);
	   			$("#zhengque01").hide();
	   			$("#cuowu01").show();
			}
			else
			{
				$("#zhengque01").show();
	   			$("#cuowu01").hide();
				
				
			}
			
	   	}
	   	
	   	function yz02()
	   	{
	   		var gname=$("#exampleInputEmail1").val();
	   		var phone=$("#inp_id008").val();
			var regexp=new RegExp("^1[58379]\\d{9}$");
			
				

			
			if(!$("#inp_id008").val().trim())
			{
				var data="tj0201";
				tianxie(data);
	   			$("#zhengque02").hide();
	   			$("#cuowu02").show();
			}
			if(!regexp.test(phone))
			{
				var data="tj0202";
				tianxie(data);
	   			$("#zhengque02").hide();
	   			$("#cuowu02").show();
			}
			else
			{ 
				var url="<%=request.getContextPath()%>/users/nopassword.do?method=yz";
				$.post(url,{gname: gname,phone:phone},function(data)
            			{
							var a=1;
			    	    	if(data=="yes"){
			    	    		$("#zhengque02").show();
			    	   			$("#cuowu02").hide();
			    	    		document.getElementById("getting").disabled=false;
			    	    	}
			    	    	else if(data=="no"){
			    	    		tianxie(data);
			    	    		$("#zhengque02").hide();
			    	   			$("#cuowu02").show();
			    	    	}
            			}); 
			}
			
			

			
			
			
	   	}
	   	
	   	function yz03()
	   	{
	   		var gpass=$("#yanzhengma").val();
	   		var phone=$("#inp_id008").val();
	   		
	   		if(gpass=="")
	   		{
	   			var data="tj03";
				tianxie(data);
	   			$("#zhengque03").hide();
	   			$("#cuowu03").show();
	   		}
	   		else
	   		{	
	   			var url="<%=request.getContextPath()%>/users/nopassword.do?method=codeyz";
	   			$.post(url,{code: gpass,phone:phone},function(data)
            			{
			    	    	if(data=="yes1"){
			    	    		$("#zhengque03").show();
			    	   			$("#cuowu03").hide();
			    	   			dlcode=true;
			    	    	}
			    	    	else if(data=="nocode"){
			    	    		tianxie(data);
			    	    		$("#zhengque03").hide();
				   				$("#cuowu03").show();
			    	   			alert(dlcode)
			    	    	}
            			}); 
	   			
	   		}
	   	}
	   	
	   	function yz04()
	   	{
	   		var gpass=$("#pass01").val();
	   		
	   		if(gpass=="")
	   		{
	   			$("#zhengque04").hide();
	   			$("#cuowu04").show();
	   		}
	   		else
	   		{
	   			$("#zhengque04").show();
	   			$("#cuowu04").hide();
	   		}
	   	}
	   	
	   	function yz05()
	   	{
	   		var gpass01=$("#pass01").val();
	   		var gpass02=$("#pass02").val();
	   		
	   		if(gpass01==gpass02)
	   		{
	   			$("#zhengque05").show();
	   			$("#cuowu05").hide();
	   		}
	   		else
	   		{
	   			var data="tj05";
				tianxie(data);
	   			$("#zhengque05").hide();
	   			$("#cuowu05").show();
	   		}
	   	}
	   	
	   	function tianxie(flag) 
		{
			if(flag=="tj01")
			{
				$("#cuowu01").html("请填写学号");
			}
			
			if(flag=="tj0201")
			{
				$("#cuowu02").html("请输入手机号");
			}
			if(flag=="tj0202")
			{
				$("#cuowu02").html("手机号不正确");
				document.getElementById("getting").disabled=true;
			}
			
			
			if(flag=="tj03")
			{
				$("#cuowu03").html("验证码为空");
			}
			
			if(flag=="tj05")
			{
				$("#cuowu05").html("两次输入不同");
			}
			
			if(flag=="no")
			{
				$("#cuowu02").html("手机号与学号不匹配");
				document.getElementById("getting").disabled=true;
			}
			if(flag=="nocode")
			{
				$("#cuowu03").html("验证码错误");
			}
			
		}
		
		$(document).ready(function()
		{
			document.getElementById("getting").disabled=true;
		});
		
		</script>
		
		<style type="text/css">
			.box{
				  display: flex;
				}
			
		</style>
		
		
		
	</head>
	<body >
		
		
		
	<div class="panel panel-default  " style="background: #122B40;">
	  <div class="panel-body">
	    <div class="col-md-2 col-md-offset-1" style="height: 70px; width: 120px; ">
		  	<img src="../img/001.png" class="img-responsive" alt="Responsive image" style="width:100%;height:100%; ">
		  	
		  </div>
		  <div class="col-md-3  " style="font-size: 35px; text-align: center; font-weight: bold; color: white; top: 10px; left: 30px; width: 300px; height: 100px;">高 校 就 业 平 台</div>
	  </div>
	</div>
	

	
	<div class="container-fluid ">
  
  		<div class="container" style=" box-shadow:0 0 6px 3px #c3c3c3;   align-content: center; width: 1300px; height: 520px;   ">
		  <div class="row" >
		  	
		  	<div class="col-md-2 visible-lg" style="height: 430px; width: 700px; top: 30px; ">
		  		<img src="../img/003.jpg" class="img-responsive" alt="Responsive image" style="width:100%;height:100%; ">
		 	 </div>
			
			<div class=" col-md-offset-1 " >
				
				<h2 align="center" style="font-weight: bold; margin: 30px  0px  0px  0px; ">欢 迎 登 录 就 业 服 务 平 台</h2>
				<h4 style=" color: #C0C0C0; font-style: italic; text-align: center;  font-family: '宋体';">为高校应届毕业生就业工作助力</h4>				
					
					
		<div class=" class=" col-md-5  " style="margin: 0px  0px  0px  80px;    display: inline-flex; " id="box" >
			<div class="form-info" >

				<form action="<%=request.getContextPath()%>/users/nopassword.do?method=sub" method="post" onsubmit="return yanzheng()">
					<table>
						<tr >
							<td colspan="2"><label for="exampleInputEmail1" >学号 : </label></td>
						</tr>
						<tr>
							<td><input type="text" name="sid" class="form-control" id="exampleInputEmail1" placeholder="请输入学号" style="width: 400px;" onblur="yz01()"></td>
							<td>
								<span class="glyphicon glyphicon-ok" aria-hidden="true" style="color: green; display: none;" id="zhengque01"></span>
								<span class="glyphicon glyphicon-remove" aria-hidden="true" style="color: red; display: none;" id="cuowu01"></span>
							</td>
						</tr>
						<tr >
							<td ><label for="exampleInputEmail1" >请输入手机号 : </label></td>
						</tr>
						<tr>
							<td>
							<div class="input-group ">
						      <input type="text" name="phone" class="form-control" id="inp_id008" placeholder="请输入手机号" onkeyup="yz02()">
						      <span class="input-group-btn">
						        <input type="button"  class="btn btn-default "id="getting" value="获取验证码" style="color: #269ABC">  
						      </span>
						    </div>
						    </td>
						    <td>
								<span class="glyphicon glyphicon-ok" aria-hidden="true" style="color: green; display: none;" id="zhengque02"></span>
								<span class="glyphicon glyphicon-remove" aria-hidden="true" style="color: red; display: none;" id="cuowu02"></span>
							</td>
						</tr>
						<tr >
							<td ><label for="exampleInputEmail1" >验证码 : </label></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" id="yanzhengma" aria-describedby="basic-addon3" placeholder="请输入验证码" onblur="yz03()"></td>
							<td>
								<span class="glyphicon glyphicon-ok" aria-hidden="true" style="color: green; display: none;" id="zhengque03"></span>
								<span class="glyphicon glyphicon-remove" aria-hidden="true" style="color: red; display: none;" id="cuowu03"></span>
							</td>
						</tr>
						<tr >
							<td ><label for="exampleInputEmail1" >请输入新密码 : </label></td>
						</tr>
						<tr>
							<td><input type="password" class="form-control" id="pass01" onblur="yz04()"></td>
							<td>
								<span class="glyphicon glyphicon-ok" aria-hidden="true" style="color: green; display: none;" id="zhengque04"></span>
								<span class="glyphicon glyphicon-remove" aria-hidden="true" style="color: red; display: none;" id="cuowu04"></span>
							</td>
						</tr>
						<tr >
							<td ><label for="exampleInputEmail1" >再次输入密码 : </label></td>
						</tr>
						<tr>
							<td><input type="password" class="form-control" name="password" id="pass02" onblur="yz05()"></td>
							<td>
								<span class="glyphicon glyphicon-ok" aria-hidden="true" style="color: green; display: none;" id="zhengque05"></span>
								<span class="glyphicon glyphicon-remove" aria-hidden="true" style="color: red; display: none;" id="cuowu05"></span>
							</td>
						</tr>
						
						<br />
						<tr align="center">
							<td>
								<br />
								<button type="submit" class="btn btn-primary btn-lg btn-block">确 定</button>
							<br />
							</td>
						</tr>
						
						
						
					</table>


				</form>
			</div>
		</div>
		
		
					
			</div>

		  </div>
		</div>
  		
	</div>
		
	</body>
</html>
