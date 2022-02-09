package com.rj.bd.utrl;


import org.openqa.selenium.WebDriver;

import com.sun.jndi.cosnaming.IiopUrl.Address;

public class Test {

	public static void main(String[] args) throws PcException, InterruptedException {
		PcUtrl pcUtrl = new PcUtrl();
		String url="https://aiqicha.baidu.com/s?q=百度&t=0";
		String otherurl="https://aiqicha.baidu.com/s?q=腾讯&t=0";
		pcUtrl.setUrl(url);
		WebDriver driver = pcUtrl.goindextByClass("item-inner", "comp-item-val-link");
		String name = pcUtrl.docClassTextByDriver(driver, "name", 0);
		String id=pcUtrl.docClassTextByDriver(driver, "social-credit-code-text", 0);
		System.out.println(name+","+id);
		driver=pcUtrl.goOtherHtmlpageByJs(driver,otherurl);
		pcUtrl.goindextByClass("item-inner", "comp-item-val-link");
		name = pcUtrl.docClassTextByDriver(driver, "name", 0);
		id=pcUtrl.docClassTextByDriver(driver, "social-credit-code-text", 0);
		System.out.println(name+","+id);
		pcUtrl.close();
	}

}
