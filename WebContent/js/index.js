var eid="";
var okid="";
function geteid() {
	return eid;
}
function getokid() {
	return okid;
}
function selectqh (type) {
	if (type=='公司') {
		$("#select").val(type)
		$("#select").html(type+'<span class="caret"></span>')
		$("#select-li").html("<a onclick="+"selectqh("+"'"+"职位"+"'"+")>职位</a>")
	}
	else{
		$("#select").val(type)
		$("#select").html(type+'<span class="caret"></span>')
		$("#select-li").html("<a onclick="+"selectqh("+"'"+"公司"+"'"+")>公司</a>")
	}
}
function modaltt (a) {
	$(a).modal('show')
}
function sqzwtt (id,a,b,eids,okids) {
	eid=eids;
	okid=okids
	a="你所要申请的是"+a;
	$(".modal-sqzw-h4").text(a)
	$(".modal-sqzw-h5").text(b)
	modaltt(id);
}
function sqzwok () {
	$("#sqzw").modal('hide');
	$("#sqzwok").modal('show');
}