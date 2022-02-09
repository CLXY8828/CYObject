package com.rj.bd.utrl;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;

public class PcUtrl implements Pc {
	
	private String url=null;

	WebDriver driver;
	
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @desc 创建一个连接
	 * @return
	 */
	public WebDriver getDriver(){
		
		System.setProperty("webdriver.chrome.driver", "./chromedriver.exe");
		FirefoxOptions options = new FirefoxOptions();
		options.addArguments("-headless");
		options.addArguments("text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9");
		WebDriver driver = new FirefoxDriver(options);
		return driver;
	}
	
	@Override
	public WebDriver goindextByClass(String classname1, String classname2) throws PcException, InterruptedException {
		if (driver==null) {
			driver=this.getDriver();
			if (url!=null) {
				driver.get(url);
			}
			else {
				throw new PcException("url地址为空！");
			}
		}
		Thread.sleep(3000);
		driver.findElements(By.className(classname1)).get(0).click();
		this.editTargetByClass(driver, "comp-item-val-link");
		driver.findElements(By.className(classname2)).get(0).click();
		return driver;
		
	}

	@Override
	public void editTargetByClass(WebDriver driver, String classname) {
		String js="document.getElementsByClassName('"+classname+"')[0].target='_parent';";
		JavascriptExecutor jse=((JavascriptExecutor) driver);
		jse.executeScript(js);
	}

	@Override
	public String docClassTextByDriver(WebDriver driver,String classname,int indext) throws PcException {
		Document doc = Jsoup.parse(driver.getPageSource());
		Elements tages = doc.getElementsByClass(classname);
		while (tages.size()==0||tages==null) {
			doc = Jsoup.parse(driver.getPageSource());
			tages = doc.getElementsByClass(classname);
		}
		return tages.get(indext).text();
	}

	@Override
	public WebDriver goOtherHtmlpageByJs(WebDriver driver,String otherurl) {
		String js="window.open('"+otherurl+"', '_parent');";
		JavascriptExecutor jse=((JavascriptExecutor) driver);
		jse.executeScript(js);
		return driver;
		
	}

	@Override
	public void close() {
		driver.quit();
	}
	


	
	


}
