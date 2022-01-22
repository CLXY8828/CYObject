$(document).ready(
		function () {
			$("#xh-form").hide();
		}
	)
function removeException () {
	$(".ex").addClass("hidden")
}
function hiddenBtn (index) {
	
	if (index==0) {
		$("#phone-form").show();
		$("#xh-form").hide();
	} else{
		$("#xh-form").show();
		$("#phone-form").hide();
	}
}
function nonull (mod,type) {
	if (mod=="pc") {
		if (type=="phone") {
			var inputphone=$("#lg-inputphone").val();
			var inputcode=$("#lg-inputcode").val();
			var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
			if (inputphone=="") {
				exception("手机号不能为空!",0)
				return false;
				
			}
			if(!pattern.test(inputphone)){
					exception("手机号输入不正确!",0)
					return false;
			}
			if (inputcode=="") {
				exception("验证码不能为空!",0)
					return false;
			}
			return true;
		}
		else if(type=="xh"){
			var inputsid=$("#input-all-xh-lg").val();
			var inputpassword=$("#input-all-pass-lg").val();
			var inputcode=$("#input-all-code-lg").val()
			if (inputsid=="") {
				exception("学号不能为空!",1)
				return false;
			}
			if (inputpassword=="") {
				exception("密码不能为空!",1)
				return false;		
			}
			if (iscode(inputcode)) {
				exception("验证码不正确!",1)
				return false;
			}
			return true;
		}
	}
	else if(mod="phone"){
		if (type=="phone") {
			var inputphone=$("#sm-inputphone").val();
			var inputcode=$("#sm-inputcode").val();
			var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
			if (inputphone=="") {
				exception("手机号不能为空!",0)
				return false;
				
			}
			if(!pattern.test(inputphone)){
					exception("手机号输入不正确!",0)
					return false;
			}
			if (inputcode=="") {
				exception("验证码不能为空!",0)
					return false;
			}
			return true;
		}
		else if(type=="xh"){
			var inputsid=$("#input-all-xh-sm").val();
			var inputpassword=$("#input-all-pass-sm").val();
			var inputcode=$("#input-all-code-sm").val()
			if (inputsid=="") {
				exception("学号不能为空!",1)
				return false;
			}
			if (inputpassword=="") {
				exception("密码不能为空!",1)
				return false;		
			}
			if (iscode(inputcode)) {
				exception("验证码不正确!",1)
				return false;
			}
			return true;
		}
	}
}
function exception (e,index) {
			$(".ex").html(e)
			$(".ex").append('<button type="button" class="close" aria-label="Close" onclick="removeException()"><span aria-hidden="true">&times;</span></button>')
			$(".ex")[index].classList.remove("hidden");
			
		}