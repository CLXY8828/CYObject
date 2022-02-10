<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>上传简历</title>
		<!--1.移动设备积极响应的语句 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<!--2.引入基本的bootstrap的样式和js文件 -->
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		
		<style type="text/css">
			#loge{
				width: 50px;
				height: 45px;
			}
			#top{
				height: 70px;
				border-color: #011536;;
				background-color: #011536;
			}
			#tp{
				height: 450px;
			}
			.navbar-brand
			{
				padding-top: 13px;
				padding-left: 80px;
				padding-right: 0px;
			}
			#lg-top-padding{
				width: 30px;
				height: 1px;
			}
			.navbar-text
			{
				padding-top:5px;
				font-size: 25px;
				letter-spacing: 3px;
				
			}
			.navbar-text strong
			{
				color: white;
			}
			.top-text{
				color: white;
			}
			body{
				padding-top: 70px;
				background-color: #f6f6f8;
			}

			#address{
				padding-right: 52px;
			}
			#button-top{
				margin-top: 18px;
				border-color: #011536;
				background-color: #011536;
			}
			#bs-example-navbar-collapse-1{
				border-color: #011536;;
				background-color: #011536;
			}
			#mine{
				padding-top: 19px;
				padding-right: 40px;
			}
			#top-text{
				padding-right:30px;
			}
			#address{
				margin-top: 13px;
				font-size: 16px;
				color: white;
			}
			#address a{
				font-size: 16px;
				color: white;
			}
			#query-btn{
				letter-spacing: 2px;
			}
			#userimg img{
				width: 40px;
			}
			p{
				color: black;
				font-family: "微软雅黑";
				font-size: 16px;
			}
			#scjl
			{
				
				padding-top: 50px;
			}
			
		</style>
		
		<script type="text/javascript">
		function imgPreview(fileDom)
		 {
			   //alert("fileDom");
			 
				if(window.FileReader)
				{
					var fileReader=new FileReader();
				}
				else
				{
			    	//alert("您设备不支持预览的功能，请升级.....");
			    	$('#error').modal('show')
					$("#errornr").html("您设备不支持预览的功能，请升级.....");
				    return false;
				}
				//2.通过js的组合选择器获取到文件域
				var file=fileDom.files[0];
				//alert("file:"+file);
			 //3.验证是否为pdf格式的文件
			var	imgFileElement=document.getElementById("imgFile");
			var fileData=imgFileElement.files[0];
			var filename=fileData.name;
			var suffix= filename.split('.').pop().toLowerCase()
			
			if(suffix!="pdf")
			{
				$('#error').modal('show')
				$("#errornr").html("请选择pdf格式的文件");
				document.getElementById("spid").innerHTML="<input type=\"file\" name=\"image\"  onchange=\"imgPreview(this)\"   id=\"imgFile\"  />";
				//alert("文件选择清空了.....");
				return false;
			}
			fileReader.onload = function() //当文件域中读取完成之后才触发图片标签
		    {
		        //获取图片dom
		        var img = document.getElementById("preview");
		        //图片路径设置为读取的图片
		        //alert("this--->"+this);//从弹框可以看出是FileReader对象
		        //alert("this.result--->"+this.result);//this.result可以看出是一个data开头的字符串，这段字符串的实质就是 Data URL
		        img.src = this.result;//相当于是为图片标签设置了src的url值
		    };
		    fileReader.readAsDataURL(file);//将文件域标签中的内容显示在图片标签的位置
			
		 }
		
		function chechForm()
		 {
			 //alert("1.文件域的非空校验");
			 var imgFile=document.getElementById("imgFile").value;
			 if(imgFile=="")
			 {
				 $('#error').modal('show')
				 $("#errornr").html("请先选择本次上传的pdf文件");
				 return false;
			 }
			 
		    //alert("2.图片大小的校验");
		    var	imgFileElement=document.getElementById("imgFile");
		    var fileData=imgFileElement.files[0];
		    //alert(fileData.size);
		    var size=fileData.size; 
		    if(size>15*1024*1024)
			{
				$('#error').modal('show')
				$("#errornr").html("您本次上传的图片超过15MB了,请选择一个小点的再上传.....");
				document.getElementById("spid").innerHTML="<input type=\"file\" name=\"image\"  onchange=\"imgPreview(this)\"   id=\"imgFile\"  />";
				//alert("文件选择清空了.....");
				return false;
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
	        <img id="loge" class="img-responsive" alt="Responsive image" src="img/001.png">
	      </a>
	      <p class="navbar-text"><strong>高校就业平台</strong></p>
	    </div>
	     <div class="collapse navbar-collapse " id="top-text">
	     	 <ul class="nav visible-lg-block navbar-nav navbar-right">
		        <li id="address"><a href="<%=request.getContextPath()%>/users/index.do?method=query">点击返回上一页</a></li>
		        
		        
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     	 <ul class="nav visible-xs-block navbar-nav">
		        <li><a href="<%=request.getContextPath()%>/users/index.do?method=query"style="color: white;">点击返回上一页</a>	</li>
	            
		      </ul>
		      
	    </div>
	    
	  </div>
	</nav>
	<body >
		<div class="container-fluid">
			<!--
            	作者：1148969471@qq.com
            	时间：2022-02-09
            	描述：电脑端显示
            -->
		  <div class="row " id="scjl" >
		   <div class="row">
		   	<div class="col-lg-8 col-xs-12 col-lg-offset-2">
		   		<div class="panel panel-default">
				  <div class="panel-body">
				  	<form onsubmit="return chechForm()" method="post" action="<%=request.getContextPath() %>/users/resume.do?method=up" enctype="multipart/form-data">
				  	<div class="row">
				  		<div class="col-lg-8 col-xs-12 col-lg-offset-1">
				  			<h3 >
				    			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
				    			请上传您的简历
				    		</h3>
				  		</div>
				  	</div>
				  	<div class="row">
				  		<div class="col-lg-10 col-xs-12 col-lg-offset-1">
				  			<iframe id="preview" src="<%=request.getContextPath()%>/pdfjs/web/viewer.html?file="img/001.pdf" style="height: 300px; width: 100%;"></iframe>
				  		</div>
				  	</div>
				  	
				  	<div class="row">
				  		<div class="col-lg-8 col-xs-12 col-lg-offset-2">
				  			<h3 ><small>仅支持PDF格式的简历文件</small></h3>
				  		</div>
				  	</div>
				  	<div class="row">
				  		<div class="col-lg-8 col-xs-12 col-lg-offset-2" id="spid">
				  			<input type="file" name="image"  onchange="imgPreview(this)"   id="imgFile">
				  		</div>
				  	</div>
				  	<br />
				  	<div class="row">
				  		<div class="col-lg-8 col-xs-12 col-lg-offset-2">
				  			<button type="submit" class="btn btn-primary btn-lg btn-block">立即上传</button>
				  		</div>
				  	</div>
				  	</form>
				    <br />
				  </div>
				</div>
		   	</div>
		   </div>
		  </div>
		</div>
		
		<!--
        	作者：1977455153@qq.com
        	时间：2022-01-28
        	描述：错误提示
        -->
		<div class="modal fade" tabindex="-1" role="dialog" id="error" style="margin-top: 250px;">
		  <div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content" >
		    	<div class="modal-header">
		    		  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       					 <h4 class="modal-title">错误提示</h4>
		    	</div>
		      <div class="modal-body" align="center">
		        <p id="errornr"></p>
		      </div>
		      <div class="modal-footer" align="center">
		      	<div class="row" align="center">
			      	<div class="col-lg-12 col-xs-12">
			      		<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
			      	</div>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>
