//基本信息的表单验证
function jbxx()
{
	nameyz();
	sexyz();
	qqyz();
	emailyz();
	xhyz();
	sfjyyz();
	sfzhyz()
	phoneyz()
	xjzdyz()
	gzjyyz01()
	
	
	var name=nameyz();//姓名
	var sex=sexyz();//性别
	var qq=qqyz();//QQ
	var email=emailyz()//邮箱
	var xh=xhyz()//学号
	var sfjy=sfjyyz()//是否就业
	var sfjy01 = $('input:radio[name="sfjy"]:checked').val();
	var sfzh=sfzhyz()//身份证号码
	var phone=phoneyz()//电话号码
	var xjzd=xjzdyz()//现居住地
	var gzjy01=gzjyyz01()//工作经验
	
	if((name==1) && (sex==1)  &&(qq=1) && (email==1) && (xh==1) && (sfjy==1) && (sfzh==1) && (phone==1) && (xjzd==1) && (gzjy01==1) )
	{
		//3代表着已经就业，跳转到公司详情页，这块写ajax就可
		if(sfjy01==3)
		{
			$('#gsxx02').tab('show');
			return true;
		}
		else
		{
			$('#gsxx01').tab('show');
			return true;
		}
		
	}
	else
	{
		//清空错误选项
		if(qq==3)
		{
			$("#jbxx03").val("");
		}
		if(email==3)
		{
			$("#jbxx04").val("");
		}
		if(xh==3)
		{
			$("#jbxx05").val("");
		}
		if(sfzh==3)
		{
			$("#jbxx07").val("");
		}
		if(phone==3)
		{
			$("#jbxx08").val("");
			
		}
		return false
	}
	
	//$('#gsxx02').tab('show');
}
//验证姓名
function nameyz()
{
	var name=$("#jbxx01").val();
	//验证姓名
	if(!name.trim())
	{
		$("#error01").html("请输入姓名");
		$("#error01").show();
		$("#jbxx-error01").show();
		$("#jbxx-success01").hide();
		return 2;
		
	}
	else
	{
		$("#error01").hide();
		$("#jbxx-error01").hide();
		$("#jbxx-success01").show();
		return 1;
	}
}
//验证性别
function sexyz()
{
	var sex = $('input:radio[name="sex"]:checked').val();
	
	if(sex==null)
	{
		$("#error02").html("请选择性别");
		$("#error02").show();
		$("#jbxx-error02").show();
		$("#jbxx-success02").hide();
		return 2;
	}
	else
	{
		$("#error02").hide();
		$("#jbxx-error02").hide();
		$("#jbxx-success02").show();
		return 1;
	}
	
}

//验证qq号
function qqyz()
{
	
	var qq=$("#jbxx03").val();
	var qqregexp=new RegExp("[1-9]([0-9]{4,10})");
	
	
	//验证qq
	if(!qq.trim())
	{
		$("#error03").html("请填写QQ号");
		$("#error03").show();
		$("#jbxx-error03").show();
		$("#jbxx-success03").hide();
		return 2;
	}
	else
	{
		if(!qqregexp.test(qq))
		{
			$("#error03").html("请输入正确的QQ号");
			$("#error03").show();
			$("#jbxx-error03").show();
			$("#jbxx-success03").hide();
			return 3;
		}
		else
		{
			$("#error03").hide();
			$("#jbxx-error03").hide();
			$("#jbxx-success03").show();
			return 1;
		}
		
	}
}
//验证邮箱
function emailyz()
{
	var email=$("#jbxx04").val();
	var emailregexp=new RegExp("^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
	
	if(!email.trim())
	{
		$("#error04").html("请填写邮箱");
		$("#error04").show();
		$("#jbxx-error04").show();
		$("#jbxx-success04").hide();
		return 2;
	}
	else
	{
		if(!emailregexp.test(email))
		{
			$("#error04").html("请输入正确的邮箱");
			$("#error04").show();
			$("#jbxx-error04").show();
			$("#jbxx-success04").hide();
			return 3;
		}
		else
		{
			$("#error04").hide();
			$("#jbxx-error04").hide();
			$("#jbxx-success04").show();
			return 1;
		}
	}
}
//验证学号
function xhyz()
{
	var xs=$("#jbxx05").val();
	
	if(!xs.trim())
	{
		$("#error05").html("请填写学号");
		$("#error05").show();
		$("#jbxx-error05").show();
		$("#jbxx-success05").hide();
		return 2;
	}
	else
	{
		if(xs.length!=9)
		{
			$("#error05").html("请输入正确的学号");
			$("#error05").show();
			$("#jbxx-error05").show();
			$("#jbxx-success05").hide();
			return 3;
		}
		else
		{
			$("#error05").hide();
			$("#jbxx-error05").hide();
			$("#jbxx-success05").show();
			return 1;
		}
	}
}
//是否就业
function sfjyyz()
{
	var sfjy = $('input:radio[name="sfjy"]:checked').val();
	//验证性别
	if(sfjy==null)
	{
		$("#error06").html("请选择就业情况");
		$("#error06").show();
		$("#jbxx-error06").show();
		$("#jbxx-success06").hide();
		return 2;
	}
	else
	{
		$("#error06").hide();
		$("#jbxx-error06").hide();
		$("#jbxx-success06").show();
		return 1;
	}
}
//身份证号码验证
function sfzhyz()
{
	var sfzh=$("#jbxx07").val();
	var sfzhregexp=new RegExp("^([0-9]){7,18}(x|X)?$ 或 ^\d{8,18}|[0-9x]{8,18}|[0-9X]{8,18}?$");
	
	if(!sfzh.trim())
	{
		$("#error07").html("请填写身份证号码");
		$("#error07").show();
		$("#jbxx-error07").show();
		$("#jbxx-success07").hide();
		return 2;
	}
	else
	{
		if(!sfzhregexp.test(sfzh))
		{
			$("#error07").html("请输入正确的身份证号");
			$("#error07").show();
			$("#jbxx-error07").show();
			$("#jbxx-success07").hide();
			return 3;
		}
		else
		{
			$("#error07").hide();
			$("#jbxx-error07").hide();
			$("#jbxx-success07").show();
			return 1;
		}
	}
}
//电话号码
function phoneyz()
{
	var phone=$("#jbxx08").val();
	var phoneregexp=new RegExp("[0-9-()（）]{7,18}");
	
	if(!phone.trim())
	{
		$("#error08").html("请填写电话号码");
		$("#error08").show();
		$("#jbxx-error08").show();
		$("#jbxx-success08").hide();
		return 2;
	}
	else
	{
		if(!phoneregexp.test(phone))
		{
			$("#error08").html("请输入正确的电话号码");
			$("#error08").show();
			$("#jbxx-error08").show();
			$("#jbxx-success08").hide();
			return 3;
		}
		else
		{
			$("#error08").hide();
			$("#jbxx-error08").hide();
			$("#jbxx-success08").show();
			return 1;
		}
	}
}
//现居住地
function xjzdyz()
{
	var xzjd=$("#jbxx09").val();
	
	if(!xzjd.trim())
	{
		$("#error09").html("请填写居住地址");
		$("#error09").show();
		$("#jbxx-error09").show();
		$("#jbxx-success09").hide();
		return 2;
	}
	else
	{
		$("#error09").hide();
		$("#jbxx-error09").hide();
		$("#jbxx-success09").show();
		return 1;
	}
}
//工作经验
function gzjyyz01()
{
	var gzjy=$('#jbxx10 option:selected').val()
	if(!gzjy.trim())
	{
		$("#error10").html("请选择工作经验");
		$("#error10").show();
		$("#jbxx-error10").show();
		$("#jbxx-success10").hide();
		return 2;
	}
	else
	{
		$("#error10").hide();
		$("#jbxx-error10").hide();
		$("#jbxx-success10").show();
		return 1;
	}
}

//////////////////////////////////////////////////////////////////////////////////////////
//一个模块一个分割线

//公司信息模块的验证
function gsxx02()
{
	byqxyz()
	dwmcyz()
	dwxzyz()
	dwszdyz()
	dwhyyz()
	gzzwlbyz()
	dwlxryz()
	lxrdhyz()
	lxrsjyz()
	lxryxyz()
	dwdzyz()
	
	var byqx=byqxyz()//毕业去向
	var dwmc=dwmcyz()//单位名称
	var dwxz=dwxzyz()//单位性质
	var dwszd=dwszdyz()//单位所在地
	var dwhy=dwhyyz()//单位行业
	var gzzwlb=gzzwlbyz()//工作职位类别
	var dwlxr=dwlxryz()//单位联系人
	var lxrdh=lxrdhyz()//联系人电话
	var lxrsj=lxrsjyz()//联系人手机
	var lxryx=lxryxyz()//联系人邮箱
	var dwdz=dwdzyz()//单位地址
	
	if( (byqx==1) && (dwmc==1) && (dwxz==1) && (dwszd==1) && (dwhy==1) && (gzzwlb==1) && (dwlxr==1) && (lxrdh==1) && (lxrsj==1) && (lxryx==1) && (dwdz==1) )
	{
		return true
	}
	else
	{
		if(lxrdh==3)
		{
			$("#gsxx008").val("");
		}
		if(lxrsj==3)
		{
			$("#gsxx009").val("");
		}
		if(lxryx==3)
		{
			$("#gsxx010").val("");
		}
		return false;
	}
	
}

//毕业去向验证
function byqxyz()
{
	var byqx=$('#gsxx001 option:selected').val()
	if(byqx=='请选择')
	{
		$("#gsxx-cwts01").html("请选择毕业去向");
		$("#gsxx-cwts01").show();
		$("#gsxx-error01").show();
		$("#gsxx-success01").hide();
		return 2;
	}
	else
	{
		$("#gsxx-cwts01").hide();
		$("#gsxx-error01").hide();
		$("#gsxx-success01").show();
		return 1;
	}
}
//单位去向的验证
function dwmcyz()
{
	var dwmc=$("#gsxx002").val();
	
	if(dwmc=='请选择')
	{
		$("#gsxx-cwts02").html("请填写单位名称");
		$("#gsxx-cwts02").show();
		$("#gsxx-error02").show();
		$("#gsxx-success02").hide();
		return 2;
	}
	else
	{
		$("#gsxx-cwts02").hide();
		$("#gsxx-error02").hide();
		$("#gsxx-success02").show();
		return 1;
	}
}

//单位性质验证
function dwxzyz()
{
	var dwxz=$('#gsxx003 option:selected').val()
	if(dwxz=='请选择')
	{
		$("#gsxx-cwts03").html("请选择单位性质");
		$("#gsxx-cwts03").show();
		$("#gsxx-error03").show();
		$("#gsxx-success03").hide();
		return 2;
	}
	else
	{
		$("#gsxx-cwts03").hide();
		$("#gsxx-error03").hide();
		$("#gsxx-success03").show();
		return 1;
	}
}

//单位所在地
function dwszdyz()
{
	var dwszd=$('#gsxx004 option:selected').val()
	if(dwszd=='请选择')
	{
		$("#gsxx-cwts04").html("请选择单位所在地");
		$("#gsxx-cwts04").show();
		$("#gsxx-error04").show();
		$("#gsxx-success04").hide();
		return 2;
	}
	else
	{
		$("#gsxx-cwts04").hide();
		$("#gsxx-error04").hide();
		$("#gsxx-success04").show();
		return 1;
	}
}
//单位行业
function dwhyyz()
{
	var dwhy=$("#gsxx005").val();
	
	if(dwhy=='请选择')
	{
		$("#gsxx-cwts05").html("请填写单位行业");
		$("#gsxx-cwts05").show();
		$("#gsxx-error05").show();
		$("#gsxx-success05").hide();
		return 2;
	}
	else
	{
		$("#gsxx-cwts05").hide();
		$("#gsxx-error05").hide();
		$("#gsxx-success05").show();
		return 1;
	}
}
//工作职位类别
function gzzwlbyz()
{
	var gzzwlb=$("#gsxx006").val();
	
	if(gzzwlb=='请选择')
	{
		$("#gsxx-cwts06").html("请填写工作职位类别");
		$("#gsxx-cwts06").show();
		$("#gsxx-error06").show();
		$("#gsxx-success06").hide();
		return 2;
	}
	else
	{
		$("#gsxx-cwts06").hide();
		$("#gsxx-error06").hide();
		$("#gsxx-success06").show();
		return 1;
	}
}
//单位联系人
function dwlxryz()
{
	var dwlxr=$("#gsxx007").val();
	
	if(!dwlxr.trim())
	{
		$("#gsxx-cwts07").html("请填写单位联系人");
		$("#gsxx-cwts07").show();
		$("#gsxx-error07").show();
		$("#gsxx-success07").hide();
		return 2;
	}
	else
	{
		$("#gsxx-cwts07").hide();
		$("#gsxx-error07").hide();
		$("#gsxx-success07").show();
		return 1;
	}
}
//联系人电话
function lxrdhyz()
{
	var lxrdh=$("#gsxx008").val();
	var lxrdhregexp=new RegExp("[0-9-()（）]{7,18}");
	
	if(!lxrdh.trim())
	{
		$("#gsxx-cwts08").html("请填写联系人电话");
		$("#gsxx-cwts08").show();
		$("#gsxx-error08").show();
		$("#gsxx-success08").hide();
		return 2;
	}
	else
	{
		if(!lxrdhregexp.test(lxrdh))
		{
			$("#gsxx-cwts08").html("请填写正确的联系人电话");
			$("#gsxx-cwts08").show();
			$("#gsxx-error08").show();
			$("#gsxx-success08").hide();
			return 2;
		}
		else
		{
			$("#gsxx-cwts08").hide();
			$("#gsxx-error08").hide();
			$("#gsxx-success08").show();
			return 1;
		}
		
	}
}
//联系人手机
function lxrsjyz()
{
	var lxrsj=$("#gsxx009").val();
	var lxrsjregexp=new RegExp("[0-9-()（）]{7,18}");
	
	if(!lxrsj.trim())
	{
		$("#gsxx-cwts09").html("请填写联系人手机");
		$("#gsxx-cwts09").show();
		$("#gsxx-error09").show();
		$("#gsxx-success09").hide();
		return 2;
	}
	else
	{
		if(!lxrsjregexp.test(lxrsj))
		{
			$("#gsxx-cwts09").html("请填写正确的联系人手机");
			$("#gsxx-cwts09").show();
			$("#gsxx-error09").show();
			$("#gsxx-success09").hide();
			return 2;
		}
		else
		{
			$("#gsxx-cwts09").hide();
			$("#gsxx-error09").hide();
			$("#gsxx-success09").show();
			return 1;
		}
		
	}
}
//联系人邮箱
function lxryxyz()
{
	var lxryx=$("#gsxx010").val();
	var lxryxregexp=new RegExp("^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
	
	if(!lxryx.trim())
	{
		$("#gsxx-cwts10").html("请填写联系人邮箱");
		$("#gsxx-cwts10").show();
		$("#gsxx-error10").show();
		$("#gsxx-success10").hide();
		return 2;
	}
	else
	{
		if(!lxryxregexp.test(lxryx))
		{
			$("#gsxx-cwts10").html("请填写正确的联系人邮箱");
			$("#gsxx-cwts10").show();
			$("#gsxx-error10").show();
			$("#gsxx-success10").hide();
			return 2;
		}
		else
		{
			$("#gsxx-cwts10").hide();
			$("#gsxx-error10").hide();
			$("#gsxx-success10").show();
			return 1;
		}
		
	}
}
//单位地址
function dwdzyz()
{
	var dwdz=$("#gsxx011").val()
	
	if(!dwdz.trim())
	{
		$("#gsxx-cwts11").html("请填写单位地址");
		$("#gsxx-cwts11").show();
		$("#gsxx-error11").show();
		$("#gsxx-success11").hide();
		return 2;
	}
	else
	{
		$("#gsxx-cwts11").hide();
		$("#gsxx-error11").hide();
		$("#gsxx-success11").show();
		return 1;
	}
}

//////////////////////////////////////////////////////////////////////////////////////////
//一个模块一个分割线

//工作经验模块的验证
function gzjy()
{
	sfcjggzyz()
	gzjyyz()
	
	var sfcjggz=sfcjggzyz()//是否参加过工作
	var gzjy=gzjyyz()//请填写工作经验
	
	if((sfcjggz==1) && (gzjy==1))
	{
		$('#zxqk').tab('show');
		return true
	}
	else
	{
		return false;
	}
}

//是否参加过工作
function sfcjggzyz()
{
	var sfcjggz = $('input:radio[name="sfcjgz"]:checked').val();
	
	if(sfcjggz==null)
	{
		$("#gzjy-cwts01").html("请选择是否参加过工作");
		$("#gzjy-cwts01").show();
		$("#gzjy-error01").show();
		$("#gzjy-success01").hide();
		return 2;
	}
	else
	{
		$("#gzjy-cwts01").hide();
		$("#gzjy-error01").hide();
		$("#gzjy-success01").show();
		return 1;
	}
}
//请填写工作经验
function gzjyyz()
{
	var gzjy=$("#gzjy02").val()
	
	if(!gzjy.trim())
	{
		$("#gzjy-cwts02").html("请填写工作经验");
		$("#gzjy-cwts02").show();
		$("#gzjy-error02").show();
		$("#gzjy-success02").hide();
		return 2;
	}
	else
	{
		$("#gzjy-cwts02").hide();
		$("#gzjy-error02").hide();
		$("#gzjy-success02").show();
		return 1;
	}
}


//////////////////////////////////////////////////////////////////////////////////////////
//一个模块一个分割线

//在校情况模块
function zxqk()
{
	sfhdgjzyz() 
	sfhdgshxsyz()
	sfdrbwyz()
	sfcjghdyz()
	grhqdryyz()
	
	var sfhdgjz=sfhdgjzyz()//是否获得过奖状
	var sfhdgshxs=sfhdgshxsyz()//是否获得过三好学生
	var sfdrbw=sfdrbwyz()//是否担任班委
	var sfcjghd=sfcjghdyz()//是否参加过活动
	var grhqdry=grhqdryyz()//个人获取的荣誉
	
	if((sfhdgjz==1) && (sfhdgshxs==1) && (sfdrbw==1) && (sfcjghd==1) && (grhqdry==1) )
	{
		$('#jntc').tab('show');
		return true
	}
	else
	{
		return false;
	}
}
//是否获得过奖状
function sfhdgjzyz()
{
	var sfhdgjz = $('input:radio[name="zxqk01"]:checked').val();
	
	if(sfhdgjz==null)
	{
		$("#zxqk-cwts01").html("请选择是否获得过奖状");
		$("#zxqk-cwts01").show();
		$("#zxqk-error01").show();
		$("#zxqk-success01").hide();
		return 2;
	}
	else
	{
		$("#zxqk-cwts01").hide();
		$("#zxqk-error01").hide();
		$("#zxqk-success01").show();
		return 1;
	}
}
//是否获得过三好学生
function sfhdgshxsyz()
{
	var sfhdgshxs = $('input:radio[name="zxqk02"]:checked').val();
	
	if(sfhdgshxs==null)
	{
		$("#zxqk-cwts02").html("请选择是否获得过三好学生");
		$("#zxqk-cwts02").show();
		$("#zxqk-error02").show();
		$("#zxqk-success02").hide();
		return 2;
	}
	else
	{
		$("#zxqk-cwts02").hide();
		$("#zxqk-error02").hide();
		$("#zxqk-success02").show();
		return 1;
	}
}
//在校期间是否担任班委
function sfdrbwyz()
{
	var sfdrbw = $('input:radio[name="zxqk03"]:checked').val();
	
	if(sfdrbw==null)
	{
		$("#zxqk-cwts03").html("请选择是否担任班委");
		$("#zxqk-cwts03").show();
		$("#zxqk-error03").show();
		$("#zxqk-success03").hide();
		return 2;
	}
	else
	{
		$("#zxqk-cwts03").hide();
		$("#zxqk-error03").hide();
		$("#zxqk-success03").show();
		return 1;
	}
}
//是否参加过活动
function sfcjghdyz()
{
	var sfcjghd = $('input:radio[name="zxqk04"]:checked').val();
	
	if(sfcjghd==null)
	{
		$("#zxqk-cwts04").html("请选择是参加过活动");
		$("#zxqk-cwts04").show();
		$("#zxqk-error04").show();
		$("#zxqk-success04").hide();
		return 2;
	}
	else
	{
		$("#zxqk-cwts04").hide();
		$("#zxqk-error04").hide();
		$("#zxqk-success04").show();
		return 1;
	}
}
//个人获取的荣誉
function grhqdryyz()
{
	var grhqdry=$("#zxqk05").val()
	
	if(!grhqdry.trim())
	{
		$("#zxqk-cwts05").html("请填写个人获取的荣誉");
		$("#zxqk-cwts05").show();
		$("#zxqk-error05").show();
		$("#zxqk-success05").hide();
		return 2;
	}
	else
	{
		$("#zxqk-cwts05").hide();
		$("#zxqk-error05").hide();
		$("#zxqk-success05").show();
		return 1;
	}
}

//////////////////////////////////////////////////////////////////////////////////////////
//一个模块一个分割线

//技能特长模块的验证
function jntc()
{
	scdjnyz()
	zsysyz()
	
	var scdjn=scdjnyz()//擅长的技能
	var zsys=zsysyz()//自身的优势
	
	if((scdjn==1) && (zsys==1)  )
	{
		$('#zwpj').tab('show');
		return true
	}
	else
	{
		return false;
	}
	
}
//请填写擅长的技能
function scdjnyz()
{
	var scdjn=$("#jntc01").val()
	
	if(!scdjn.trim())
	{
		$("#jntc-cwts01").html("请填写擅长的技能");
		$("#jntc-cwts01").show();
		$("#jntc-error01").show();
		$("#jntc-success01").hide();
		return 2;
	}
	else
	{
		$("#jntc-cwts01").hide();
		$("#jntc-error01").hide();
		$("#jntc-success01").show();
		return 1;
	}
}
//请填写自身的优势
function zsysyz()
{
	var zsys=$("#jntc02").val()
	
	if(!zsys.trim())
	{
		$("#jntc-cwts02").html("请填写擅长的技能");
		$("#jntc-cwts02").show();
		$("#jntc-error02").show();
		$("#jntc-success02").hide();
		return 2;
	}
	else
	{
		$("#jntc-cwts02").hide();
		$("#jntc-error02").hide();
		$("#jntc-success02").show();
		return 1;
	}
}

//////////////////////////////////////////////////////////////////////////////////////////
//一个模块一个分割线

//自我评价模块的验证
function zwpj()
{
	grahyz()
	zsydbzyz()
	zwpjyz()
	
	var grah=grahyz()//个人爱好
	var zsydbz=zsydbzyz()//自身有的不足
	var zwpj01=zwpjyz()//自我评价
	
	if((grah==1) && (zsydbz==1) &&(zwpj01==1)  )
	{
		return true
		
	}
	else
	{
		return false;
	}
}
//个人爱好
function grahyz()
{
	var grah=$("#zwpj01").val()
	
	if(!grah.trim())
	{
		$("#zwpj-cwts01").html("请填写个人爱好");
		$("#zwpj-cwts01").show();
		$("#zwpj-error01").show();
		$("#zwpj-success01").hide();
		return 2;
	}
	else
	{
		$("#zwpj-cwts01").hide();
		$("#zwpj-error01").hide();
		$("#zwpj-success01").show();
		return 1;
	}
}
//自身有的 不足
function zsydbzyz()
{
	var zsydbz=$("#zwpj02").val()
	
	if(!zsydbz.trim())
	{
		$("#zwpj-cwts02").html("请填写自身的不足");
		$("#zwpj-cwts02").show();
		$("#zwpj-error02").show();
		$("#zwpj-success02").hide();
		return 2;
	}
	else
	{
		$("#zwpj-cwts02").hide();
		$("#zwpj-error02").hide();
		$("#zwpj-success02").show();
		return 1;
	}
}
//自我评价
function zwpjyz()
{
	var zwpj=$("#zwpj03").val()
	
	if(!zwpj.trim())
	{
		$("#zwpj-cwts03").html("请填写自我评价");
		$("#zwpj-cwts03").show();
		$("#zwpj-error03").show();
		$("#zwpj-success03").hide();
		return 2;
	}
	else
	{
		$("#zwpj-cwts03").hide();
		$("#zwpj-error03").hide();
		$("#zwpj-success03").show();
		return 1;
	}
}
