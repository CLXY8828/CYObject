package com.rj.bd.utrl;

import org.jsoup.nodes.Document;
import org.openqa.selenium.WebDriver;

public interface Pc {
	public WebDriver goindextByClass(String classname1,String classname2) throws PcException, InterruptedException;
	public void editTargetByClass(WebDriver driver,String classname);
	public String docClassTextByDriver(WebDriver driver,String classname,int indext) throws PcException;
	public WebDriver goOtherHtmlpageByJs(WebDriver driver,String otherurl);
	public void close();
}
