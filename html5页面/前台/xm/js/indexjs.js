function hiddenEle()
		{
			var box=$("#box");
				box.hide();
				
			var box=$("#box01");
				box.show();
		}
		
function  showEle()
{
	var box=$("#box01");
		box.hide();
		
	var box=$("#box");
		box.show();
}

//生成一个n到m之间的随机整数
function rand(n,m){
    return n+parseInt(Math.random()*(m-n+1));
}
//传入元素id,返回指定id元素
function $id(id)
{
    return document.getElementById(id)
    
}
//生成验证码
 function createCode(length) {
    var code = "";
    var codeLength = parseInt(length); //验证码的长度
    var checkCode = document.getElementById("checkCode");
    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
    //循环组成验证码的字符串
    for (var i = 0; i < codeLength; i++)
    {
        //获取随机验证码下标
        var charNum = Math.floor(Math.random() * 62);
        //组合成指定字符验证码
        code += codeChars[charNum];
    }
    if (checkCode)
    {
        //为验证码区域添加样式名
        checkCode.className = "code";
        //将生成验证码赋值到显示区
        checkCode.innerHTML = code;
    }
}

	window.onload = function ()
	{
		createCode(4); 
		
		
	}
		
function yanzheng()
	{

		var a=$id('checkCode').innerHTML
		var bj=document.getElementById("txt").value
		
		
		var xh=document.getElementById("exampleInputEmail1").value
		var regexp=new RegExp("^[0-9]*[1-9][0-9]*$");
		
		var mm=document.getElementById("exampleInputEmail2").value
		
		if(!$("#exampleInputEmail1").val().trim())
		{
			exception("学号不能为空！",1)
			return false
		}
		if(regexp.test(xh))
		{
			if(!xh.length==9)
			{
				exception("请输入正确的学号！",1)
				return false
			}
			

		}
		else
		{
			exception("请输入正确的学号！",1)
			return false
		}
		
		if(!$("#exampleInputEmail2").val().trim())
		{
			exception("密码不能为空，请输入密码！",1)
			return false
		}
		
		if(!$("#txt").val().trim())
		{	
			exception("验证码为空,请输入验证码!",1)
			return false
		}
		if(bj.toLowerCase()==a.toLowerCase())
		{
			return true;
		}
		else
		{
			exception("验证码输入错误，请重新输入!",1)
			return false

		}
		
		

		
	}
	
	
function yanzheng01()
{
	
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
	
	
	if(!$("#inp_id008").val().trim())
	{
		exception("验证码不能为为空，请输入验证码!",0)
		return false
	}
	else
	{
		return true;
	}
			
}
				function exception (e,index) {
						$(".ex").text(e);
						$(".ex")[index].classList.remove("hidden");
						
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
	        	var b=document.getElementById("inp_id007").value;
				var regexp=new RegExp("^1[58379]\\d{9}$");
				
				if(!$("#inp_id007").val().trim())
				{
					alert("手机号不能为为空，请输入手机号！")
					return false
				}
				if(!regexp.test(b))
				{
					alert("请输入正确的手机号")
					return false
				}
	        	
	            var btn = $(this);  
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
	        });  
	   
	    });  