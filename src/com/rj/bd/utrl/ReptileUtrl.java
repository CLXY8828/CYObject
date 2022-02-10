//package com.rj.bd.utrl;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.openqa.selenium.WebDriver;
//
//import com.rj.bd.object.Pc;
//import com.rj.bd.object.PcException;
//import com.rj.bd.object.PcUtrl;
//
//import net.bytebuddy.asm.Advice.This;
//
///**
// * @desc 爬虫工具类，用来爬取数据
// * @author mengjinfu
// */
//public class ReptileUtrl {
//	private static Pc pcUtrl = new PcUtrl();
//	private static WebDriver driver;
//	
//	/**
//	 * @desc 获取WebDriver对象
//	 * @return
//	 */
//	public static WebDriver getDriver() {
//		return driver;
//	}
//
//	/**
//	 * @desc 获取所有需要的数据
//	 * @param urlmethod
//	 * @return
//	 * @throws PcException
//	 * @throws InterruptedException 
//	 */
//	public static List<String> getAllByUrl(String urlmethod) throws PcException, InterruptedException{
//		
//		String url = "https://aiqicha.baidu.com/s?q="+urlmethod+"&t=0";//综合网址
//		
//		((PcUtrl) pcUtrl).setUrl(url);//通过强转设置url;
//		return getAll(driver);
//	}
//	
//	/**
//	 * @desc 不关闭查询其他
//	 * @param otherurlmethod
//	 * @return
//	 * @throws PcException
//	 * @throws InterruptedException 
//	 */
//	public static List<String> getOtherAllByUrl(String otherurlmethod) throws PcException, InterruptedException{
//		String otherurl="https://aiqicha.baidu.com/s?q="+otherurlmethod+"&t=0";
//		driver=pcUtrl.goOtherHtmlpageByJs(driver,otherurl);
//		return getAll(driver);
//	}
//	
//	/**
//	 * @desc 关闭页面
//	 */
//	public static void close(){
//		driver.quit();
//	}
//	
//	/**
//	 * @desc 爬取需要的数据
//	 * @param driver
//	 * @return
//	 * @throws PcException
//	 * @throws InterruptedException 
//	 */
//	private static List<String> getAll(WebDriver driver) throws PcException, InterruptedException {
//		List<String> list= new ArrayList<String>();
//		driver = pcUtrl.goindextByClass("item-inner", "comp-item-val-link");//页面跳转
//		String name = pcUtrl.docClassTextByDriver(driver, "name", 0);//获取公司名
//		list.add(name);
//		String id=pcUtrl.docClassTextByDriver(driver, "social-credit-code-text", 0);//获取组织机构代码
//		list.add(id);
//		String address=pcUtrl.docClassTextByDriver(driver, "child-addr-poptip", 0);//获取地址
//		list.add(address);
//		return list;
//	}
//	
//	
//}
