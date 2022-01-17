package com.rj.bd.messageutrl;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: auth
 * @description: 短信验证码
 **/
public final class SmsCodeUtil {

    public SmsCodeUtil() {
    }

    //发送验证码的请求路径URL
    private static final String serverUrl =Parameters.getSERVERURL();
    //网易云信分配的账号 						
    private static final String appKey = Parameters.getAPPKEY();
    //网易云信分配的密钥
    private static final String appSecret = Parameters.getAPPSECRET();
    //随机数
    private static final String nonce = Parameters.getNOCE();
    //短信模板ID
    private static final String templateid = Parameters.getTEMPLATEID();
    //验证码长度，范围4～10，默认为4
    private static final String codelen = Parameters.getCODELEN();

    public static String sendSmsCode(String phone) throws ClientProtocolException, IOException, SmsCodeException {

        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(serverUrl);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);

        String checkSum = getCheckSum(appSecret, nonce, curTime);

        // 设置请求的header
        httpPost.addHeader("AppKey", appKey);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        /*
         * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档”
         * 2.参数格式是jsonArray的格式，例如 "['13888888888','13666666666']"
         * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
         */
        nvps.add(new BasicNameValuePair("templateid", templateid));
        nvps.add(new BasicNameValuePair("mobile", phone));
        nvps.add(new BasicNameValuePair("codeLen", codelen));

        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);
        String result = EntityUtils.toString(response.getEntity(), "utf-8");
        /*
         * 1.打印执行结果，打印结果一般会200、315、403、404、413、414、500
         * 2.具体的code有问题的可以参考官网的Code状态表
         */

        //获取发送状态码
        String obj = JSON.parseObject(result).getString("obj");
        String code = JSON.parseObject(result).getString("code");
        if (!code.equals("200")) {
			throw new SmsCodeException("验证码发送异常！发送失败");
		}
		return obj;
    }

    // 计算并获取CheckSum
    private static String getCheckSum(String appSecret, String nonce, String curTime) {
        return encode("sha1", appSecret + nonce + curTime);
    }

    private static String encode(String algorithm, String value) {
        if (value == null) {
            return null;
        }
        try {
            MessageDigest messageDigest
                    = MessageDigest.getInstance(algorithm);
            messageDigest.update(value.getBytes());
            return getFormattedText(messageDigest.digest());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static String getFormattedText(byte[] bytes) {
        int len = bytes.length;
        StringBuilder buf = new StringBuilder(len * 2);
        for (int j = 0; j < len; j++) {
            buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buf.toString();
    }

    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5',
            '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public static final boolean verifyCode(String mobile, String code) throws IOException {
        HttpPost httpPost = new HttpPost("https://api.netease.im/sms/verifycode.action");
 
        String currentTime = String.valueOf(new Date().getTime()/1000L);
        String checkSum = getCheckSum(appSecret,nonce,currentTime);
 
        //set header
        httpPost.setHeader("AppKey",appKey);
        httpPost.setHeader("CurTime",currentTime);
        httpPost.setHeader("Nonce",nonce);
        httpPost.setHeader("CheckSum",checkSum);
        httpPost.setHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
 
        //set data
        List<NameValuePair> nameValuePairList = new ArrayList<NameValuePair>();
        nameValuePairList.add(new BasicNameValuePair("code",code));
        nameValuePairList.add(new BasicNameValuePair("mobile",mobile));
        httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairList,"utf-8"));
 
        //start request
        CloseableHttpClient closeableHttpClient = HttpClients.createDefault();
        HttpResponse httpResponse = closeableHttpClient.execute(httpPost);
        String responseResult = EntityUtils.toString(httpResponse.getEntity(),"utf-8");
        System.out.println("responseResult:"+responseResult);
 
        String stateCode = JSON.parseObject(responseResult).getString("code");
        if(stateCode.equals("200")){
            return true;
        }
        return false;
    }

}

