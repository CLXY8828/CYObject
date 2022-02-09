package com.rj.bd.utrl;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

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
		return true;
	}
	
	/**
	 * @desc 自动创建一个随机的验证码
	 * @return
	 */
	public static String createCode()
	{
		String[] beforeShuffle = new String[] { "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }; 
		List<String> list=Arrays.asList(beforeShuffle);
	
		Collections.shuffle(list);
	
		StringBuilder sb=new StringBuilder();
	
		for(int i =0;i<list.size();i++)
		{
			sb.append(list.get(i));
		}
	
		String resultStr = sb.toString();
		String result = resultStr.substring(5,9);
		System.out.println(result);
		return result;
	}

	
}
