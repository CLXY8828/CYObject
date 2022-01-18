$(".checkCity").mouseenter(function () {
	$(".outerCityBox").css("display", "block")
	$(".positionIcon").css("background", "#FFF")
	$(".positionIcon span").css("color", "#05A4FF")
	console.log($(".topCityBox").height(),'............')
})
$(".positionIcon").mouseleave(function () {
	$(".outerCityBox").css("display", "none")
	$(".positionIcon").css("background", "none")
	$(".positionIcon span").css("color", "#FFF")
})
$(".cityBox").mouseenter(function(){
//将改变后的实际高度重新赋值给outerCityBox
	$(".outerCityBox").height($(".topCityBox").height())
})
// 点击热门城市
$(".hotCity p b").click(function () {
	var province = ""
	for(var i=0;i<area.length;i++){
		for(var j=0;j<area[i].data.length;j++){
			if(area[i].data[j].name == $(this).text().trim()){
				province = area[i].name
			}
		}
	}
	updateCity(province,$(this).text().trim())
	// $(".currentCity").text($(this).text().trim())
	$(this).addClass('active')
		.parent()
		.siblings()
		.find('b')
		.removeClass('active')
	$(".boxBottom p b").removeClass('active')
})
// 渲染省份数据
var tmpProStr = ''
for(var i=0;i<area.length;i++){
	tmpProStr += "<p><b>" + area[i].name + "</b></p>"
}
$(".provinceBox").html(tmpProStr)
// 点击省份
$("body").on("click",".provinceBox p b",function(){
	console.log($(".topCityBox").height())
	//点击省份后将topCityBox的高赋值给outerCityBox
	$(".outerCityBox").height($(".topCityBox").height())
	$(".selectProvince").text($(this).text().trim())
	$(this).addClass('active')
		.parent()
		.siblings()
		.find('b')
		.removeClass('active')
	$(".hotCity p b").removeClass('active')
	$(".selectCity").text("请选择市")
	for (var key=0;key<area.length;key++) {
		if ($(this).text().trim() == area[key].name) {
			var tmpCityList = area[key].data
			var tmpCityStr = ''
			for (var i = 0; i < tmpCityList.length; i++) {
				tmpCityStr += "<p><b>" + tmpCityList[i].name + "</b></p>"
			}
			$(".cityBox").html(tmpCityStr)
		}
	}
	$(".topCityBox").css("display", "block")
	$(".cityBox").css("display", "block")
	$(".provinceBox").css("display", "none")
	$(".selectCity").addClass("inputActive")
	$(".selectProvince").removeClass("inputActive")
	// $(".positionIcon").unbind("mouseleave")
})
$(".selectProvince").click(function () {
	$(".provinceBox").css("display", "block")
	$(".cityBox").css("display", "none")
	$(this).addClass("inputActive").siblings().removeClass("inputActive")
})
$(".selectCity").click(function () {
	$(".cityBox").css("display", "block")
	$(".provinceBox").css("display", "none")
	$(this).addClass("inputActive").siblings().removeClass("inputActive")
})
// 点击市
$("body").on("click", ".cityBox p b", function () {
	$(".selectCity").text($(this).text().trim())
	$(this).addClass('active')
		.parent()
		.siblings()
		.find('b')
		.removeClass('active')
	$(".hotCity p b").removeClass('active')
	updateCity($(".selectProvince").text().trim(),$(this).text().trim())
	$(".selectCity").addClass("inputActive")
	$(".selectProvince").removeClass("inputActive")
})
// var userIp = returnCitySN.cip
if(window.localStorage.getItem("userCity")){
	$(".currentCity").text(window.localStorage.getItem("userCity"))
}else{
	getCity()
}

function getCity() {
	$.ajax({
		url: '/api/city/getCity',
		type: 'post',
		// data:userIp,
		contentType: 'application/json',
		success: function (result) {
			var res = JSON.parse(result)
			if (res.code == 200) {
				var userCity = res.data.city
				$('.currentCity').text(userCity)
				window.localStorage.setItem("userCity",userCity)
			}
		}, error: function () {
		}
	})
}

function updateCity(province,city) {
	var params = {
		// ip:userIp,
		province:province,
		city:city
	}
	$.ajax({
		url: 'api/city/updateCity',
		type: 'post',
		data: JSON.stringify(params),
		// data:city,
		contentType: 'application/json',
		success: function (result) {
			var res = JSON.parse(result)
			if (res.code == 200) {
				var userCity = res.data.city
				$('.currentCity').text(userCity)
				window.localStorage.setItem("userCity",userCity)
			}
		}, error: function () {
		}
	})
}
