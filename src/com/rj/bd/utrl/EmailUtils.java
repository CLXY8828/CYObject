package com.rj.bd.utrl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;


/**
 * @desc 发送邮件工具类
 * @author mengjinfu
 *
 */
public class EmailUtils {
	//自己的邮箱
	 public static String sendEmailAccount;
	 //邮箱授权码
	 public static String sendEmailPwd;
	 //发件人
	 public  static String sendMail;
	 //标签
	 public static String emailRole;

	static
    {
    	try 
    	{
			Map<String, Object> map = PropertyUtils.getPropertyInfo("mail.properties");
			sendEmailAccount=(String) map.get("emailFrom");
			sendEmailPwd=(String) map.get("emialFromAuthorization");
			sendMail=(String)map.get("sendMail");
			emailRole=(String)map.get("emailRole");
		} 
    	catch (IOException e) 
    	{
			System.out.println("mail.properties获取属性配置文件中的内容异常，且异常信息为:"+e.getMessage());
		}
    	
    }
	
	private static Map<String, String> codesMap = new HashMap<String, String>();
	 
	
	/**
	 * @desc 验证验证码
	 * @param receiveMail
	 * @param code
	 * @return
	 */
	public static boolean TestCode(String receiveMail,String code){
		if (codesMap.containsKey(receiveMail)) {
			if (codesMap.get(receiveMail).equals(code)) {
				codesMap.remove(receiveMail);
				return true;
			}
		}
		return false;
	}
	
    /**
	 * @desc 创建一个发送验证码邮箱的方法
	 * @param sendMail
	 * @param receiveMail
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	 */
	public static void createMimeMessage(String receiveMail,String code) throws UnsupportedEncodingException, MessagingException{
		
		if (codesMap.containsKey(receiveMail)) {
			codesMap.remove(receiveMail);
		}
		
		Session session = getSession();
		 //创建一封邮件
		 MimeMessage message = new MimeMessage(session);
		 
		 //发件人
		 message.setFrom(new InternetAddress(sendMail,emailRole,"utf-8"));
		 
		// To: 收件人（可以增加多个收件人、抄送、密送）
		 // CC:抄送人，BCC:密送
		 
		 message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "我是收件人昵称", "UTF-8"));
		 //message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress("xxxx@qq.com", "XX用户", "UTF-8"));

		
		 //Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
		 message.setSubject("验证码", "UTF-8");
		 
		 //Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
		 message.setContent("<h2>高校就业平台</h2><h3>您的验证码为:<h3 style='color:red'>"+code+"</h3></h3>", "text/html;charset=utf-8");
		 
		 saveMessage(session, message);
		 codesMap.put(receiveMail, code);
		 
	 }
	
/**
 * @desc 纯文本文件
 * @param receiveMail
 * @param emailSubject
 * @param emailText
 * @throws UnsupportedEncodingException
 * @throws MessagingException
 */
public static void createMimeMessage(String receiveMail,String emailSubject,String emailText) throws UnsupportedEncodingException, MessagingException{
		
		
		Session session = getSession();
		 //创建一封邮件
		 MimeMessage message = new MimeMessage(session);
		 
		 //发件人
		 message.setFrom(new InternetAddress(sendMail,emailRole,"utf-8"));
		 
		// To: 收件人（可以增加多个收件人、抄送、密送）
		 // CC:抄送人，BCC:密送
		 
		 message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "我是收件人昵称", "UTF-8"));
		 //message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress("xxxx@qq.com", "XX用户", "UTF-8"));

		
		 //Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
		 message.setSubject(emailSubject, "UTF-8");
		 
		 //Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
		 message.setContent(emailText, "text/html;charset=utf-8");
		 
		 saveMessage(session, message);
		 
	 }
	

	/**
	 * @desc 获取session
	 * @return
	 */
	private static Session getSession() {
		Properties props= new Properties();
		 props.setProperty("mail.transport.protocol","smtp");// 使用的协议（JavaMail规范要求）
		 props.setProperty("mail.smtp.host","smtp.163.com"); // 发件人的邮箱的 SMTP 服务器地址
		 props.setProperty("mail.smtp.auth", "true"); // 需要请求认证
		 
		 //根据配置创建会话对象, 用于和邮件服务器交互
		 Session session = Session.getInstance(props);
		 session.setDebug(true); // 设置为debug模式, 可以查看详细的发送 log、
		return session;
	}
	
	/**
	 * @desc 发送带有附件的邮件
	 * @param sendMail
	 * @param receiveMail
	 * @param filePath
	 * @throws MessagingException 
	 * @throws IOException 
	 */
	public static void enclosureMessage(String receiveMail,String emailSubject,String emailText,String filePath) throws MessagingException, IOException{
		Session session=getSession();
		//创建邮件
		MimeMessage message = new MimeMessage(session);
		//设置发件人
		message.setFrom(new InternetAddress(sendMail,"高校就业服务平台", "utf-8"));
		
		
		//设定接收人
		 message.setRecipient(RecipientType.TO, new InternetAddress(receiveMail, "接收人", "utf-8"));
		//设定主题
		  message.setSubject(emailSubject,"UTF-8");  
		// Content: 邮件正文
		  MimeBodyPart txt = new MimeBodyPart();
		  txt.setContent(emailText, "text/html;charset=UTF-8");
		  MimeBodyPart attachment = new MimeBodyPart();
		// 读取本地文件
		  DataHandler dh2 = new DataHandler(new FileDataSource(filePath));
		  // 将附件数据添加到"节点"
		  attachment.setDataHandler(dh2);
		  // 设置附件的文件名（需要编码）
		  attachment.setFileName(MimeUtility.encodeText(emailSubject+"-简历.pdf"));       
		   
		  //设置（文本+图片）和 附件 的关系（合成一个大的混合"节点" / Multipart ）
		  MimeMultipart mm = new MimeMultipart();
		  mm.addBodyPart(txt);
		  mm.addBodyPart(attachment);     // 如果有多个附件，可以创建多个多次添加
		  mm.setSubType("mixed");         // 混合关系

		  // 11. 设置整个邮件的关系（将最终的混合"节点"作为邮件的内容添加到邮件对象）
		  message.setContent(mm);
		  System.out.println(message.getContent());
		  saveMessage(session, message);
	}
	
	/**
	 * @desc 保存邮件
	 * @param session
	 * @param message
	 * @throws MessagingException
	 * @throws NoSuchProviderException
	 */
	private static void saveMessage(Session session, MimeMessage message)
			throws MessagingException, NoSuchProviderException {
		//设置发件时间
		 message.setSentDate(new Date());
		 
		 //保存设置
		 message.saveChanges();
		 
		 //根据 Session 获取邮件传输对象
		 Transport transport = session.getTransport();
		 
		 //连接SMTP服务器
		 transport.connect(sendEmailAccount, sendEmailPwd);
		 
		 //发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
		 transport.sendMessage(message,message.getAllRecipients());
		 
		 transport.close();
	}
	public static void main(String[] args) throws MessagingException, IOException {
//		createMimeMessage("1977455153@qq.com","123123");
//		enclosureMessage("1977455153@qq.com", "张三-公司名-java", "", "D:/123.pdf");
	}
	 
}
