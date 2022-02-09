package com.rj.bd.utrl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;


/**
 * @desc   properties配置文件的处理工具类
 * @author mengjinfu
 *
 */
public class PropertyUtils {
public static Map<String, Object> getPropertyInfo(String propertyPath) throws IOException
{
	 Map<String, Object> map=new HashMap<String, Object>();
	 Properties prop=new Properties();
     InputStream inputFile=PropertyUtils.class.getClassLoader().getResourceAsStream(propertyPath);
     BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputFile,"utf-8")); 
     prop.load(bufferedReader);
     Iterator<String> it=prop.stringPropertyNames().iterator();
     while(it.hasNext())
     {
         String key=it.next();
         System.out.println(key+":"+prop.getProperty(key));
         map.put(key, prop.getProperty(key));
         
     }
     inputFile.close();
     
	return map;
	
}



}
