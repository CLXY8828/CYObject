package com.rj.bd.messageutrl;

public class Parameters {
	 //发送验证码的请求路径URL
    private static String SERVERURL = "https://api.netease.im/sms/sendcode.action";
    //网易云信分配的账号 						
    private static String APPKEY = "12e3fb39413fef24f02300a9bfc53de6";
    //网易云信分配的密钥
    private static String APPSECRET = "7da5ebaa6960";
    //随机数
    private static String NOCE = "123456";
    //短信模板ID
    private static String TEMPLATEID = "19505168";
    //验证码长度，范围4～10，默认为4
    private static String CODELEN = "4";
    
	public static String getSERVERURL() {
		return SERVERURL;
	}
	public static void setSERVERURL(String sERVERURL) {
		SERVERURL = sERVERURL;
	}
	public static String getAPPKEY() {
		return APPKEY;
	}
	public static void setAPPKEY(String aPPKEY) {
		APPKEY = aPPKEY;
	}
	public static String getAPPSECRET() {
		return APPSECRET;
	}
	public static void setAPPSECRET(String aPPSECRET) {
		APPSECRET = aPPSECRET;
	}
	public static String getNOCE() {
		return NOCE;
	}
	public static void setNOCE(String nOCE) {
		NOCE = nOCE;
	}
	public static String getTEMPLATEID() {
		return TEMPLATEID;
	}
	public static void setTEMPLATEID(String tEMPLATEID) {
		TEMPLATEID = tEMPLATEID;
	}
	public static String getCODELEN() {
		return CODELEN;
	}
	public static void setCODELEN(String cODELEN) {
		CODELEN = cODELEN;
	}
    
}
