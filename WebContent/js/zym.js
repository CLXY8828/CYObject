//薪资要求的隐藏和显示
function xs01()
{
	//$("#zhengque01").hide();
	$("#xzyq").show();
}

$(document).bind('click', function(e) {
      var e = e || window.event; //浏览器兼容性 
      var elem = e.target || e.srcElement;
      if (elem.id && (elem.id == 'xzyq' || elem.id == 'xzyq01')) {
        return;
      }
      $("#xzyq").css("display", "none");
    });



//学历要求的隐藏和显示
function xs02()
{
	//$("#zhengque01").hide();
	$("#xlyq").show();
}

$(document).bind('click', function(e) {
      var e = e || window.event; //浏览器兼容性 
      var elem = e.target || e.srcElement;
      if (elem.id && (elem.id == 'xlyq' || elem.id == 'xzyq02')) {
        return;
      }
      $("#xlyq").css("display", "none");
    });
   



//工作经验的隐藏和显示
function xs03()
{
	//$("#zhengque01").hide();
	$("#gzjy").show();
}

$(document).bind('click', function(e) {
      var e = e || window.event; //浏览器兼容性 
      var elem = e.target || e.srcElement;
      if (elem.id && (elem.id == 'gzjy' || elem.id == 'xzyq03')) {
        return;
      }
      $("#gzjy").css("display", "none");
    });
   


//职位类型的隐藏和显示
function xs04()
{
	//$("#zhengque01").hide();
	$("#zwlx").show();
}

$(document).bind('click', function(e) {
      var e = e || window.event; //浏览器兼容性 
      var elem = e.target || e.srcElement;
      if (elem.id && (elem.id == 'zwlx' || elem.id == 'xzyq04')) {
        return;
      }
      $("#zwlx").css("display", "none");
    });
  



//公司性质的隐藏和显示
function xs05()
{
	//$("#zhengque01").hide();
	$("#gsxz").show();
}

$(document).bind('click', function(e) {
      var e = e || window.event; //浏览器兼容性 
      var elem = e.target || e.srcElement;
      if (elem.id && (elem.id == 'gsxz' || elem.id == 'xzyq05')) {
        return;
      }
      $("#gsxz").css("display", "none");
    });




//公司规模的隐藏和显示
function xs06()
{
	//$("#zhengque01").hide();
	$("#gsgm").show();
}


$(document).bind('click', function(e) {
      var e = e || window.event; //浏览器兼容性 
      var elem = e.target || e.srcElement;
      if (elem.id && (elem.id == 'gsgm' || elem.id == 'xzyq06')) {
        return;
      }
      $("#gsgm").css("display", "none");
    });
 

//清空筛选条件，把选择条件全部清空还原
function xs07()
{
	document.getElementById("xzyq01").innerHTML="薪资要求";
	document.getElementById("xzyq02").innerHTML="学历要求";
	document.getElementById("xzyq03").innerHTML="工作经验";
	document.getElementById("xzyq04").innerHTML="职位类型";
	document.getElementById("xzyq05").innerHTML="公司性质";
	document.getElementById("xzyq06").innerHTML="公司规模";
}


//收藏的显示和隐藏
//页面加载就执行,传出来是true,显示已经收藏,否则就是未收藏
$(document).ready(function()
		{
//			var url="<%=request.getContextPath()%>/manager.do?method=queryAjax";
//				$.post(url,{manager_name:gname},function(data)
//						{
//							如果等于true，然后就显示已收藏

//							
//					
//						});
			function shoucang(data)
				{
					if(zt==true)
					{
						$("#shoucang01").hide();
						$("#shoucang02").show();
					}
					else
					{
						$("#shoucang02").hide();
						$("#shoucang01").show();
					}
					
				}
		});




/*
*  选择城市
*  made by keimon
*  2013-03-21
*/
$(function(){

  $("#address01").click(function(){
    $("#citys").show();
  });
  
  
  $("#cancel").click(function(){
    $("#citys").hide();
  });
  $(".province").click(function(){
    $("#smallCity").show()
                .find("li").hide();
 $("."+this.id + "City").parent("li").show();
 $("."+this.id + "City").click(function(){
   $("#address").html($(this).html())
                .siblings("#citys").hide();
 });
  })
  $("#bigCity a").click(function(){
 $("#address").html($(this).html())
              .siblings("#citys").hide();
 })
})


//上传简历成功之后跳转回主页面
//传一个参数，如果这个参数等于true，然后就把等待公司审核这个按钮显示出来
//并且这个等待公司审核按钮是禁止点击的
function tiaozhuan()
{
	window.location.href = "zym.html";
}
$(document).ready(function()
		{
//			var url="<%=request.getContextPath()%>/manager.do?method=queryAjax";
//				$.post(url,{manager_name:gname},function(data)
//						{
//							如果等于true，然后就显示等待审核

//							
//					
//						});

			function shoucang(data)
				{
					if(data==true)
					{
						$("#sqzw").hide();
						$("#sqzw01").show();
						document.getElementById("sqzw01").disabled=false;
					}
					else
					{
						$("#sqzw01").hide();
						$("#sqzw").show();
					}
					
				}
		});
