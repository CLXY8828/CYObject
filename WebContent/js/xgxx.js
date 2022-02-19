//修改信息页面的js验证
function xgxx()
{
	xgxx01()
	xgxx03()
	xgxx06()
	xgxx08()
	xgxx09()
	xgxx10()
	xgxx11()
	xgxx12()
	xgxx13()
	xgxx14()
	xgxx15()
	xgxx16()

	
	var qq=xgxx01()//QQ
	var email=xgxx03()//邮箱
	var dwmc=xgxx06()//单位名称
	var dwszd=xgxx08()//单位所在地
	var dwhy=xgxx09()//单位行业
	var gzzwlb=xgxx10()//工作职位类别
	var dwlxr=xgxx11()//单位联系人
	var xlrdh=xgxx12()//联系人电话
	var xlrsj=xgxx13()//联系人手机
	var xlremail=xgxx14()//联系人邮箱
	var dwdz=xgxx15()//单位地址
	var xzdz=xgxx16()//现居住址

	
	//判断是否就业然后进行非空验证
	var sfjy = $('input:radio[name="sfjy"]:checked').val();
	if(sfjy==1)
	{
		if((qq==1) && (email==1) && (dwmc==1) && (dwszd==1) && (dwhy==1) && (gzzwlb==1) && (dwlxr==1) && (xlrdh==1) && (xlrsj==1) && (xlremail==1) && (dwdz==1) && (xzdz==1)  )
		{
			return true
		}
		else
		{
			return false;
		}
	}
	else
	{
		if((qq==1) && (email==1) && (xzdz==1) && (grxh==1) && (zsbz==1) && (zwpj==1) && (zsys==1) && (grry==1) && (gzjy==1) )
		{
			return true
		}
		else
		{
			return false;
		}
	}
	
	
	
}
//QQ验证
function xgxx01()
{
	var qq=$("#xgxx01").val();
	var qqregexp=new RegExp("[1-9]([0-9]{4,10})");
	
	
	//验证qq
	if(!qq.trim())
	{
		$("#error01").html("请填写QQ号");
		$("#error01").show();
		$("#xgxx-error01").show();
		$("#xgxx-success01").hide();
		return 2;
	}
	else
	{
		if(!qqregexp.test(qq))
		{
			$("#error01").html("请输入正确的QQ号");
			$("#error01").show();
			$("#xgxx-error01").show();
			$("#xgxx-success01").hide();
			return 3;
		}
		else
		{
			$("#error01").hide();
			$("#xgxx-error01").hide();
			$("#xgxx-success01").show();
			return 1;
		}
		
	}
}
//邮箱验证
function xgxx03()
{
	var email=$("#xgxx03").val();
	var emailregexp=new RegExp("[1-9]([0-9]{4,10})");
	
	
	if(!email.trim())
	{
		$("#error03").html("请填写邮箱");
		$("#error03").show();
		$("#xgxx-error03").show();
		$("#xgxx-success03").hide();
		return 2;
	}
	else
	{
		if(!emailregexp.test(email))
		{
			$("#error03").html("请输入正确的邮箱");
			$("#error03").show();
			$("#xgxx-error03").show();
			$("#xgxx-success03").hide();
			return 3;
		}
		else
		{
			$("#error03").hide();
			$("#xgxx-error03").hide();
			$("#xgxx-success03").show();
			return 1;
		}
		
	}
}
//单位名称
function xgxx06()
{
	var dwmc=$("#xgxx06").val();
	
	if(!dwmc.trim())
	{
		$("#error06").html("请填写单位名称");
		$("#error06").show();
		$("#xgxx-error06").show();
		$("#xgxx-success06").hide();
		return 2;
	}
	else
	{
		$("#error06").hide();
		$("#xgxx-error06").hide();
		$("#xgxx-success06").show();
		return 1;
	}
}
//单位所在地
function xgxx08()
{
	var dwszd=$("#xgxx08").val();
	
	if(!dwszd.trim())
	{
		$("#error08").html("请填写单位所在地");
		$("#error08").show();
		$("#xgxx-error08").show();
		$("#xgxx-success08").hide();
		return 2;
	}
	else
	{
		$("#error08").hide();
		$("#xgxx-error08").hide();
		$("#xgxx-success08").show();
		return 1;
	}
}
//单位行业
function xgxx09()
{
	var dwhy=$("#xgxx09").val();
	
	if(!dwhy.trim())
	{
		$("#error09").html("请填写单位行业");
		$("#error09").show();
		$("#xgxx-error09").show();
		$("#xgxx-success09").hide();
		return 2;
	}
	else
	{
		$("#error09").hide();
		$("#xgxx-error09").hide();
		$("#xgxx-success09").show();
		return 1;
	}
}
//工作职位类别
function xgxx10()
{
	var gzzwlb=$("#xgxx10").val();
	
	if(!gzzwlb.trim())
	{
		$("#error10").html("请填写工作职位类别");
		$("#error10").show();
		$("#xgxx-error10").show();
		$("#xgxx-success10").hide();
		return 2;
	}
	else
	{
		$("#error10").hide();
		$("#xgxx-error10").hide();
		$("#xgxx-success10").show();
		return 1;
	}
}
//单位联系人
function xgxx11()
{
	var dwlxr=$("#xgxx11").val();
	
	if(!dwlxr.trim())
	{
		$("#error11").html("请填写单位联系人");
		$("#error11").show();
		$("#xgxx-error11").show();
		$("#xgxx-success11").hide();
		return 2;
	}
	else
	{
		$("#error11").hide();
		$("#xgxx-error11").hide();
		$("#xgxx-success11").show();
		return 1;
	}
}
//联系人电话
function xgxx12()
{
	var lxrdh=$("#xgxx12").val();
	var lxrdhregexp=new RegExp("[0-9-()（）]{7,18}");
	
	
	if(!lxrdh.trim())
	{
		$("#error12").html("请填写联系人电话");
		$("#error12").show();
		$("#xgxx-error12").show();
		$("#xgxx-success12").hide();
		return 2;
	}
	else
	{
		if(!lxrdhregexp.test(lxrdh))
		{
			$("#error12").html("请输入正确的联系人电话");
			$("#error12").show();
			$("#xgxx-error12").show();
			$("#xgxx-success12").hide();
			return 3;
		}
		else
		{
			$("#error12").hide();
			$("#xgxx-error12").hide();
			$("#xgxx-success12").show();
			return 1;
		}
		
	}
}
//联系人手机
function xgxx13()
{
	var lxrsj=$("#xgxx13").val();
	var lxrsjregexp=new RegExp("[0-9-()（）]{7,18}");
	
	
	if(!lxrsj.trim())
	{
		$("#error13").html("请填写联系人手机");
		$("#error13").show();
		$("#xgxx-error13").show();
		$("#xgxx-success13").hide();
		return 2;
	}
	else
	{
		if(!lxrsjregexp.test(lxrsj))
		{
			$("#error13").html("请输入正确的联系人手机");
			$("#error13").show();
			$("#xgxx-error13").show();
			$("#xgxx-success13").hide();
			return 3;
		}
		else
		{
			$("#error13").hide();
			$("#xgxx-error13").hide();
			$("#xgxx-success13").show();
			return 1;
		}
		
	}
}
//联系人电子邮箱
function xgxx14()
{
	var lxremail=$("#xgxx14").val();
	var lxremailregexp=new RegExp("[1-9]([0-9]{4,10})");
	
	
	if(!lxremail.trim())
	{
		$("#error14").html("请填写联系人邮箱");
		$("#error14").show();
		$("#xgxx-error14").show();
		$("#xgxx-success14").hide();
		return 2;
	}
	else
	{
		if(!lxremailregexp.test(lxremail))
		{
			$("#error14").html("请输入正确的邮箱");
			$("#error14").show();
			$("#xgxx-error14").show();
			$("#xgxx-success14").hide();
			return 3;
		}
		else
		{
			$("#error14").hide();
			$("#xgxx-error14").hide();
			$("#xgxx-success14").show();
			return 1;
		}
		
	}
}
//单位地址
function xgxx15()
{
	var dwdz=$("#xgxx15").val();
	
	if(!dwdz.trim())
	{
		$("#error15").html("请填写单位地址");
		$("#error15").show();
		$("#xgxx-error15").show();
		$("#xgxx-success15").hide();
		return 2;
	}
	else
	{
		$("#error15").hide();
		$("#xgxx-error15").hide();
		$("#xgxx-success15").show();
		return 1;
	}
}
//现居住址
function xgxx16()
{
	var xzdz=$("#xgxx16").val();
	
	if(!xzdz.trim())
	{
		$("#error16").html("请填写现居住址");
		$("#error16").show();
		$("#xgxx-error16").show();
		$("#xgxx-success16").hide();
		return 2;
	}
	else
	{
		$("#error16").hide();
		$("#xgxx-error16").hide();
		$("#xgxx-success16").show();
		return 1;
	}
}
