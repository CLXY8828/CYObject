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

