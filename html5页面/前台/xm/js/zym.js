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

//选择之后改变薪资要求的内容
function gxnr01()
{
	document.getElementById("xzyq01").innerHTML="3K以下";
}

function gxnr02()
{
	document.getElementById("xzyq01").innerHTML="3K-5K";
}

function gxnr03()
{
	document.getElementById("xzyq01").innerHTML="5K-10K";
}

function gxnr04()
{
	document.getElementById("xzyq01").innerHTML="10K-20K";
}

function gxnr05()
{
	document.getElementById("xzyq01").innerHTML="40-60K";
}

function gxnr06()
{
	document.getElementById("xzyq01").innerHTML="60K以上";
}

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
   
//选择之后改变学历要求的内容
function xlyq01()
{
	document.getElementById("xzyq02").innerHTML="初中及以下";
}
function xlyq02()
{
	document.getElementById("xzyq02").innerHTML="高中";
}function xlyq03()
{
	document.getElementById("xzyq02").innerHTML="大专";
}function xlyq04()
{
	document.getElementById("xzyq02").innerHTML="本科";
}function xlyq05()
{
	document.getElementById("xzyq02").innerHTML="硕士";
}function xlyq06()
{
	document.getElementById("xzyq02").innerHTML="博士";
}function xlyq07()
{
	document.getElementById("xzyq02").innerHTML="MBA/EMBA";
}


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
   
//选择之后改变学历要求的内容
function gzjy01()
{
	document.getElementById("xzyq03").innerHTML="应届生";
}
function gzjy02()
{
	document.getElementById("xzyq03").innerHTML="实习生";
}function gzjy03()
{
	document.getElementById("xzyq03").innerHTML="1年以内";
}function gzjy04()
{
	document.getElementById("xzyq03").innerHTML="1-3年";
}function gzjy05()
{
	document.getElementById("xzyq03").innerHTML="3-5年";
}function gzjy06()
{
	document.getElementById("xzyq03").innerHTML="5-10年";
}function gzjy07()
{
	document.getElementById("xzyq03").innerHTML="10年以上";
}

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
  
//选择之后改变职位类型的内容
function zwlx01()
{
	document.getElementById("xzyq04").innerHTML="JAVA";
}
function zwlx02()
{
	document.getElementById("xzyq04").innerHTML="Python";
}function zwlx03()
{
	document.getElementById("xzyq04").innerHTML="PHP";
}function zwlx04()
{
	document.getElementById("xzyq04").innerHTML="UED";
}function zwlx05()
{
	document.getElementById("xzyq04").innerHTML="AI";
}function zwlx06()
{
	document.getElementById("xzyq04").innerHTML="前端";
}function zwlx07()
{
	document.getElementById("xzyq04").innerHTML="运维";
}function zwlx08()
{
	document.getElementById("xzyq04").innerHTML="产品设计";
}function zwlx09()
{
	document.getElementById("xzyq04").innerHTML="其他";
}


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

//选择之后改变公司性质的内容
function gsxz01()
{
	document.getElementById("xzyq05").innerHTML="国有企业";
}
function gsxz02()
{
	document.getElementById("xzyq05").innerHTML="民营企业";
}function gsxz03()
{
	document.getElementById("xzyq05").innerHTML="外资企业";
}function gsxz04()
{
	document.getElementById("xzyq05").innerHTML="合伙企业";
}function gsxz05()
{
	document.getElementById("xzyq05").innerHTML="有限责任公司";
}function gsxz06()
{
	document.getElementById("xzyq05").innerHTML="股份有限公司";
}

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
 //选择之后改变公司规模的内容   
function gsgm01()
{
	document.getElementById("xzyq06").innerHTML="20人以下";
}
function gsgm02()
{
	document.getElementById("xzyq06").innerHTML="20-99人";
}function gsgm03()
{
	document.getElementById("xzyq06").innerHTML="100-299人";
}function gsgm04()
{
	document.getElementById("xzyq06").innerHTML="500-999人";
}function gsgm05()
{
	document.getElementById("xzyq06").innerHTML="1000-9999人";
}function gsgm06()
{
	document.getElementById("xzyq06").innerHTML="万人以上";
}function gsgm07()
{
	document.getElementById("xzyq06").innerHTML="不限";
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
