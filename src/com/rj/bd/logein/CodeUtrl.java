package com.rj.bd.logein;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;

import com.rj.bd.messageutrl.SmsCodeException;
import com.rj.bd.messageutrl.SmsCodeUtil;

public class CodeUtrl {
	
	SmsCodeUtil util = new SmsCodeUtil();
	
	public String createPhoneCode(String phonecode) throws ClientProtocolException, IOException, SmsCodeException{
		
//		String code = util.sendSmsCode(phonecode);
		
		String code = "1234";
		System.out.println(code);
		return code ;
	}
	
	public boolean testPhoneCode(String phonecode,String code) throws IOException{
//		boolean test = util.verifyCode(phonecode, code);
		System.out.println(true);
		return false;
	}
	
	
}
