<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/loge.css"/>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/loge.js"></script>
		<script src="<%=request.getContextPath() %>/js/codes.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		$().ready(function (){
			var err="<%=(String)request.getAttribute("err")==null?"":(String)request.getAttribute("err")%>";
			var errindex="<%=(Integer)request.getAttribute("errindex")==null?"":(Integer)request.getAttribute("errindex")%>";
			if(err!=""){
				if(errindex==1){
					hiddenBtn(1);
				}
				exception(err,errindex);
			}
		})
			$(function(){  
		        /*点击改变按钮状态，已经简略掉ajax发送短信验证的代码*/  
		        $('#lg-get').click(function()
		        {
		        	var inputphone=$("#lg-inputphone").val();
		        	var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
		        	if (inputphone=="") {
						exception("手机号不能为空!",0)
						return false;
						
					}
		        	if(!pattern.test(inputphone)){
						exception("手机号输入不正确!",0)
						return false;
					}
		            var btn = $(this);  
		            var count = 60;  
		            var resend = setInterval(function(){  
		                count--;  
		                if (count > 0){  
		                    btn.val(count+"秒");  
		                    $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});  
		                }else {  
		                    clearInterval(resend);  
		                    btn.val("获取验证码").removeAttr('disabled style');  
		                }  
		            }, 1000);  
		            btn.attr('disabled',true).css('cursor','not-allowed');  
		            $.ajax({
			    	    url: "<%=request.getContextPath()%>/users/logein.do?method=logephone",
			    	    data: {name: inputphone},
			    	    type: "POST",
			    	    dataType: "json",
			    	    success: function(data) {
			    	    }
			    	});
		        });  
		   		$('#sm-get').click(function()
		        {
		   			var inputphone=$("#sm-inputphone").val();
		   			var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
		        	if (inputphone=="") {
						exception("手机号不能为空!",0)
						return false;
					}
		        	if(!pattern.test(inputphone)){
						exception("手机号输入不正确!",0)
						return false;
					}
		            var btn = $(this);  
		            var count = 60;  
		            var resend = setInterval(function(){  
		                count--;  
		                if (count > 0){  
		                    btn.val(count+"秒");  
		                    $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});  
		                }else {  
		                    clearInterval(resend);  
		                    btn.val("获取验证码").removeAttr('disabled style');  
		                }  
		            }, 1000);  
		            btn.attr('disabled',true).css('cursor','not-allowed'); 
		            $.ajax({
			    	    url: "<%=request.getContextPath()%>/users/logein.do?method=logephone",
			    	    data: {name: inputphone},
			    	    type: "POST",
			    	    dataType: "json",
			    	    success: function(data) {
			    	    }
			    	});
		        }); 
		    });

		</script>
	</head>
	
	<body>
		<div class="container-fluid">
			<div class="row">
			  <div class="col-sm-12 col-lg-12">
			  	<nav id="top" class="navbar navbar-default navbar-fixed-top">
					  <div class="container-fluid">
					    <div class="navbar-header">
					      <a class="navbar-brand" href="#">
					        <img id="loge" class="img-responsive" alt="Responsive image" src="<%=request.getContextPath() %>/img/001.png">
					      </a>
					      <p class="navbar-text"><strong>高校就业平台</strong></p>
					    </div>
					  </div>
				</nav>
			  </div>
			</div>
			<div class="row">
	  			<div class="col-sm-12 visible-sm-block" id="sm-top-padding">
	  				<br />
	  			</div>
			</div>
			<div id="row-body" class="row">
				<div class="col-sm-10  col-lg-10 col-lg-offset-1 col-sm-offset-1">
					<div class="panel panel-default">
					  <div class="panel-body">
					  	<div class=" visible-lg-block col-lg-7">
					  		 <img id="tp" class="img-responsive" alt="Responsive image" src="<%=request.getContextPath() %>/img/003.jpg">
					  	</div>
					  	<div class="visible-sm-block col-sm-12">
					  		<img  class="img-responsive" alt="Responsive image" src="<%=request.getContextPath() %>/img/003.jpg">
					  	</div>
					  	<div class="col-sm-12 col-lg-5">
					  		<div class="row visible-lg-block">
					  			<h2 class="text-center"><strong>欢迎登录就业服务平台</strong></h2>
					  			<p class="text-center"><small id="h1-text"><em>为高校应届毕业生就业工作助力</em></small></p>
					  			<br />
					  		</div>
					  		
					  		<div class="row">
					  			<div class="panel panel-default" id="phone-form">
					  				<div class="panel-body">
					  					<div class="row">
					  						<div class="col-lg-12 col-sm-12" align="center">
													<button type="button" class="btn btn-primary btn-lg logintypebtn" onclick="hiddenBtn(0)">手机登录</button>
						  							<button type="button" class="btn btn-default btn-lg logintypebtn" onclick="hiddenBtn(1)">学号登录</button>					  							
					  						</div>
					  					</div>
					  					<div class="row">
					  						<hr />
					  					</div>
					  					<div class="alert fade in ex text-center alert-warning hidden alert-dismissible" role="alert">
											  <button type="button" class="close" aria-label="Close" onclick="removeException()"><span aria-hidden="true">&times;</span></button>
				  							</div>
					  					<div class="row">
					  						<div class="col-lg-12 visible-lg-block">
					  							<!--
                                                  	作者：1977455153@qq.com
                                                  	时间：2022-01-21
                                                  	描述：pc手机登录表单
                                                  -->
						  						<form class="form-horizontal" action="<%=request.getContextPath()%>/users/logein.do?method=logep" method="post"  onsubmit="return nonull('pc','phone')">
							  						<div class="form-group">
							  							<label for="lg-inputphone" class="col-sm-1 col-lg-1 control-label"></label>
													    <div class="col-lg-11">
													    	<div class="input-group">
														      <div class="input-group-btn">
														        <button type="button" class="btn btn-default  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">+86<span class="caret"></span></button>
														        <ul class="dropdown-menu">
														          <li><a href="#">+86</a></li>
														        </ul>
														      </div>
														      <input type="text" name="phonenumber" class="form-control" id="lg-inputphone" placeholder="请输入手机号">
														    </div>
													    </div>
							  						</div>
							  						<div class="input-pudding form-group">
							  							<label for="code" class="col-sm-1 col-lg-1 control-label"></label>
													    <div class="col-lg-9">
													    	<div class="input-group">
													    		<span class="input-group-addon">验证码:</span>
															      <input type="text" class="form-control" id="lg-inputcode" name="code" placeholder="请输入验证码">
															      <span class="input-group-btn">
															         <input type="button"  class="btn btn-default "id="lg-get" value="获取验证码" style="color: #269ABC">
															      </span>
													    	</div>
 													    </div>
							  						</div>
							  						<div class="form-group">
							  							<div class="col-lg-4 sub-padding">
							  								<button type="submit" class="sub btn btn-lg btn-primary">登录</button>
							  							</div>
							  						</div>
						  						</form>
					  						</div>
					  						<div class="col-sm-12 visible-xs-block">
					  							<!--
                                                  	作者：1977455153@qq.com
                                                  	时间：2022-01-21
                                                  	描述：phone手机登录表单
                                                  -->
						  						<form class="form-horizontal" action="<%=request.getContextPath()%>/users/logein.do?method=logep" method="post" onsubmit="return nonull('phone','phone')">
							  						<div class="form-group">
							  							<label for="sm-inputphone" class="col-sm-1 control-label"></label>
													    <div class="col-sm-11">
													    	<div class="input-group">
														      <div class="input-group-btn">
														        <button type="button" class="btn input-from btn-default  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">+86<span class="caret"></span></button>
														        <ul class="dropdown-menu">
														          <li><a href="#">+86</a></li>
														        </ul>
														      </div>
														      <input type="text" class="form-control" name="phonenumber" id="sm-inputphone" placeholder="请输入手机号">
														    </div>
													    </div>
							  						</div>
							  						<div class="input-pudding form-group">
							  							<label for="code" class="col-sm-1 control-label"></label>
													    <div class="col-sm-9">
													    	<div class="input-group">
													    		<span class="input-group-addon">验证码:</span>
															      <input type="text" class="form-control" id="sm-inputcode" name="code" placeholder="请输入验证码">
															      <span class="input-group-btn">
															         <input type="button"  class="btn btn-default "id="sm-get" value="获取验证码" style="color: #269ABC">
															      </span>
													    	</div>
													    </div>
							  						</div>
							  						<div class="form-group">
							  							<div class="col-lg-4 sub-padding">
							  								<button type="submit" class="subsm btn btn-lg btn-primary">登录</button>
							  							</div>
							  						</div>
						  						</form>
					  						</div>
					  					</div>
					  				</div>
					  			</div>
					  			<div class="panel panel-default" id="xh-form">
								  <div class="panel-body">
								  	<div class="row">
				  						<div class="col-lg-12 col-sm-12" align="center">
											<button type="button" class="btn btn-default btn-lg logintypebtn"  onclick="hiddenBtn(0)">手机登录</button>
				  							<button type="button" class="btn btn-primary  btn-lg logintypebtn"  onclick="hiddenBtn(1)">学号登录</button>					  							
				  						</div>
					  				</div>
					  				<div class="row">
				  						<hr />
				  						<div class="col-lg-10 col-sm-10 col-sm-offset-1 col-lg-offset-1">
				  							<div class="alert fade in ex text-center alert-warning hidden alert-dismissible" role="alert">
											  <button type="button" class="close" aria-label="Close" onclick="removeException()"><span aria-hidden="true">&times;</span></button>
										</div>
				  						</div>
				  					</div>
				  					<div class="row">
				  						<!--
                                          	作者：1977455153@qq.com
                                          	时间：2022-01-22
                                          	描述：pc学号登录表单
                                          -->
					  						<div class="col-lg-12 visible-lg-block">
					  							<form class="form-horizontal" action="<%=request.getContextPath()%>/users/logein.do?method=loge" method="post" onsubmit="return nonull('pc','xh')">
					  								<div class="form-group">
													    <label class="col-sm-1 col-lg-1 control-label" for="exampleInputAmount"></label>
													    <div class="col-lg-11">
														    <div class="input-group">
														      <div class="input-group-addon">学号</div>
														      <input type="text" class="form-control" name="sid" id="input-all-xh-lg" placeholder="请输入学号">
														    </div>
														 </div>
													</div>
													<div class="form-group">
														<label class="col-sm-1 col-lg-1 control-label" for="exampleInputAmount"></label>
														<div class="col-lg-11">
														    <div class="input-pudding input-group">
														      <div class="input-group-addon">密码</div>
														      <input type="password" class="form-control" name="password" id="input-all-pass-lg" placeholder="请输入密码">
														    </div>
														 </div>
													</div>
													<div class="form-group">
														<label class="col-sm-1 col-lg-1 control-label" for="exampleInputAmount"></label>
														<div class="col-md-11">
															<div class="row row-no-gutters">
																<div class="col-lg-6">
																	<div class="input-pudding input-group">
															      <div class="input-group-addon">验证码</div>
															      <input type="text" class="form-control" id="input-all-code-lg" placeholder="请输入验证码">
																</div>
																</div>
															     <div class="col-lg-6">
															     	<canvas class="input-pudding" id="canvas" width="100" height="40" style="margin-left: 20px;"></canvas>
	  																<a href="#" id="changeImg" style="font-size: 5px;">看不清,换一张</a>
															     </div>
															    
														    </div>
														 </div>
													 </div>
													 <div class="input-pudding-sub form-group">
													 	 <label class="col-sm-1 col-lg-1 control-label" for="exampleInputAmount"></label>
													 	<div class="row" >
													 		<div style="margin-top: 23px;" class="col-lg-4">
													 			<a href="<%=request.getContextPath()%>/users/logein.do?method=nopassword"  ><strong>忘记密码</strong></a>
													 		</div>
													 		<div class="col-lg-6">
													 			<button type="submit" class="pull-right btn btn-primary btn-lg sub-all-lg">登录</button>
													 		</div>
													 	</div>
													 </div>
					  							</form>
					  						</div>
					  						<div class="col-sm-12 visible-xs-block">
					  							<!--
                                                  	作者：1977455153@qq.com
                                                  	时间：2022-01-22
                                                  	描述：phone学号登录表单
                                                  -->
					  							<form class="form-horizontal" action="<%=request.getContextPath()%>/users/logein.do?method=loge" method="post" onsubmit="return nonull('phone','xh')">
					  								<div class="form-group">
													    <label class="col-sm-1 control-label" for="exampleInputAmount"></label>
													    <div class="col-sm-11">
														    <div class="input-group">
														      <div class="input-group-addon" style="font-size: 18px;">学号</div>
														      <input type="text" class="form-control" name="sid" id="input-all-xh-sm" placeholder="请输入学号">
														    </div>
														 </div>
													</div>
													<div class="form-group">
														<label class="col-sm-1 control-label" for="exampleInputAmount"></label>
														<div class="col-sm-11">
														    <div class="input-pudding input-group">
														      <div class="input-group-addon" style="font-size: 18px;">密码</div>
														      <input type="password" class="form-control" name="password" id="input-all-pass-sm" placeholder="请输入密码">
														    </div>
														 </div>
													</div>
													<div class="form-group">
														<label class="col-sm-1 control-label" for="exampleInputAmount"></label>
														<div class="col-sm-11">
															<div class="row row-no-gutters">
																<div class="col-sm-6">
																	<div class="input-pudding input-group">
															      <div class="input-group-addon" style="font-size: 18px;">验证码</div>
															      <input type="text" class="form-control" id="input-all-code-sm" placeholder="请输入验证码">
																</div>
																</div>
															     <div class="col-xs-7">
															     	<canvas class="input-pudding" id="canvas2" width="100" height="40" style="margin-left: 20px;"></canvas>
	  																<a href="#" id="changeImg2" style="font-size: 5px;">看不清,换一张</a>
															     </div>
															    
														    </div>
														 </div>
													 </div>
													 <div class="input-pudding-sub form-group">
													 	<div class="row" >
													 		<div style="margin-top: 23px;" class="col-xs-4">
													 			<a style=" margin-left: 18px;" ><strong>忘记密码</strong></a>
													 		</div>
													 		<div class="col-xs-7">
													 			<button type="submit" class="pull-right btn btn-primary btn-lg sub-all-lg">登录</button>
													 		</div>
													 	</div>
													 </div>
					  							</form>
					  						</div>
					  				</div>
								  </div>
								</div>
					  			
					  			
					  			
					  		</div>
					  		
					  	</div>
					  	</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="row">
				<nav class="navbar navbar-default navbar-fixed-bottom">
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
	</body>
</html>
 	