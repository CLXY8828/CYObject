package com.rj.bd.perfect;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;
import com.rj.bd.managerall.utils.Dates;


public class PerfectService {
	Dao dao = new DaoImpl();

	/**
	 * @param string 
	 * @desc 保存基本信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void savejb(String userid, String name, String sex, String qq, String email, String sid, String numbID,
			String phonecode, String address, String gzjy, String examid,String id) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql="insert into students values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int[] types = new int[33];
		Object[] values = new Object[33];
		types[0]=Types.INTEGER;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.NULL;
		types[5]=Types.NULL;
		types[6]=Types.NULL;
		types[7]=Types.NULL;
		types[8]=Types.NULL;
		types[9]=Types.NULL;
		types[10]=Types.NULL;
		types[11]=Types.NULL;
		types[12]=Types.VARCHAR;
		types[13]=Types.NULL;
		types[14]=Types.NULL;;
		types[15]=Types.VARCHAR;
		types[16]=Types.VARCHAR;
		types[17]=Types.VARCHAR;
		types[18]=Types.NULL;
		types[19]=Types.NULL;
		types[20]=Types.INTEGER;
		types[21]=Types.INTEGER;
		types[22]=Types.INTEGER;
		types[23]=Types.NULL;
		types[24]=Types.NULL;
		types[25]=Types.NULL;
		types[26]=Types.NULL;
		types[27]=Types.NULL;
		types[28]=Types.NULL;
		types[29]=Types.NULL;
		types[30]=Types.VARCHAR;
		types[31]=Types.NULL;
		types[32]=Types.VARCHAR;
		
		values[0]=0;
		values[1]=userid;
		values[2]=examid;
		values[3]=numbID;
		values[4]=userid;
		values[5]=userid;
		values[6]=userid;
		values[7]=userid;
		values[8]=userid;
		values[9]=userid;
		values[10]=userid;
		values[11]=userid;
		values[12]=sex;
		values[13]=userid;
		values[14]=userid;
		values[15]=email;
		values[16]=Dates.CurrentYMDTime();
		values[17]=qq;
		values[18]=userid;
		values[19]=userid;
		values[20]=0;
		values[21]=0;
		values[22]=0;
		values[23]=userid;
		values[24]=userid;
		values[25]=userid;
		values[26]=userid;
		values[27]=userid;
		values[28]=userid;
		values[29]=userid;
		values[30]=address;
		values[31]=userid;
		values[32]=gzjy;
		
		dao.executeUpdate(sql, types, values);
		dao.executeUpdate("update import set data_state=0 where data_id='"+id+"'");
		dao.executeUpdate("update account set name=?,sid=? where UUID=?", new int[]{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR}, new Object[]{name,sid,userid});
	}

	/**
	 * @desc 查询import内容
	 * @param numbID
	 * @param name
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map<String, Object> queryimp( String numbID, String name) throws ClassNotFoundException, SQLException {
		String sql="select * from import where data_IDnumber=? and data_sname=?";
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR,Types.VARCHAR}, new Object[]{numbID,name});
	}

	/**
	 * @desc 查询信息是否完善
	 * @param sid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map<String, Object> queryws(String sid) throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap("select * from students,account where sid=? and students.UUID=account.UUID", new int[]{Types.VARCHAR}, new Object[]{sid});
	}

	/**
	 * @desc 完善公司信息
	 * @param userid
	 * @param sid
	 * @param destination_id
	 * @param gsname
	 * @param nature_id
	 * @param companyaddress_id
	 * @param industry_id
	 * @param cell_phone
	 * @param sphone
	 * @param contact_email
	 * @param company_address
	 * @param positiontype_id
	 * @param contact_person
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws InterruptedException
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public void savegs(String userid, String sid,String destination_id, String gsname, String nature_id, String companyaddress_id,
			String industry_id, String cell_phone, String sphone, String contact_email, String company_address,
			String positiontype_id, String contact_person) throws ClassNotFoundException, SQLException, InterruptedException, FileNotFoundException, IOException {
		String sql1="select * from companymessage where company_name=?";
		Map<String, Object> map = dao.executeQueryForMap(sql1, new int[]{Types.VARCHAR}, new Object[]{gsname});
		if (map==null) {
			System.setProperty("webdriver.gecko.driver", "geckodriver.exe");
			FirefoxOptions options = new FirefoxOptions();
			options.addArguments("-headless");
			options.addArguments("text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9");
			WebDriver driver = new FirefoxDriver(options);
			String url="https://aiqicha.baidu.com/s?q="+gsname+"&t=0";
			String js="document.getElementsByClassName('comp-item-val-link')[0].target='_parent';";
			options.addArguments("headless");
			driver.get(url);
			Thread.sleep(3000);
			driver.findElements(By.className("item-inner")).get(0).click();
			JavascriptExecutor jse=((JavascriptExecutor) driver);
			jse.executeScript(js);
			driver.findElements(By.className("comp-item-val-link")).get(0).click();
			WebDriverWait wait = new WebDriverWait(driver, 5);
			wait.until(ExpectedConditions.presenceOfElementLocated(By.className("name")));
			Document doc = Jsoup.parse(driver.getPageSource());
			Elements names = doc.getElementsByClass("name");
			String name = names.get(0).text();
			Elements ids = doc.getElementsByClass("social-credit-code-text");
			String id = ids.get(0).text();
			driver.quit();
			gsname=UUID.randomUUID().toString();
			String sql="insert into companymessage values(?,?,?,?,?,?,?)";
			dao.executeUpdate(sql,new int[]{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR}, new Object[]{gsname,name,id,"","","",""});
			
		}
		else {
			gsname=(String) map.get("company_id");
		}
		String sql = "update students set destination_id=?,company_id=?,nature_id=?,companyaddress_id=?,industry_id=?,cell_phone=?,"
				+ "sphone=?,contact_email=?,company_address=?,positiontype_id=?,contact_person=? where UUID=?";
		int [] types = new int[12];
		Object[] values= new Object[12];
		
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		types[6]=Types.VARCHAR;
		types[7]=Types.VARCHAR;
		types[8]=Types.VARCHAR;
		types[9]=Types.VARCHAR;
		types[10]=Types.VARCHAR;
		types[11]=Types.VARCHAR;
		
		values[0]=destination_id;
		values[1]=gsname;
		values[2]=nature_id;
		values[3]=companyaddress_id;
		values[4]=industry_id;
		values[5]=cell_phone.trim();
		values[6]=sphone.trim();
		values[7]=contact_email;
		values[8]=company_address;
		values[9]=positiontype_id;
		values[10]=contact_person;
		values[11]=userid;
		dao.executeUpdate(sql, types, values);
		dao.executeUpdate("update import set data_state=1 where data_id='"+sid+"'");
		dao.executeUpdate("update account set processdate=1 where UUID=?",new int[]{Types.VARCHAR} , new Object[]{userid});
	}
	/**
	 * @desc 查询信息是否完善
	 * @param sid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map<String, Object> queryws(Map user) throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap("select * from students where UUID=?", new int[]{Types.VARCHAR}, new Object[]{(String)user.get("UUID")});
	}

	/**
	 * @desc 查询展示页需要的数据
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map<String, Object> querylist(String userid) throws ClassNotFoundException, SQLException {
		Map<String, Object> map = dao.executeQueryForMap("select * from account where UUID=? and processdate='1'", new int[]{Types.VARCHAR}, new Object[]{userid});
		if (map==null) {
			String sql ="select * from students,import WHERE students.examinee_id=import.data_examid and UUID=?";
			return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR}, new Object[]{userid});
		}
		String sql = "select * from students,import,destination,companyaddress,positiontype,companynature,companyindustry,companymessage where data_examid=examinee_id and students.destination_id=destination.destination_id and students.companyaddress_id =companyaddress.companyaddress_id and students.positiontype_id=positiontype.positiontype_id and companynature.nature_id=students.nature_id and companyindustry.industry_id=students.industry_id and companymessage.company_id=students.company_id and UUID=?";
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR},new Object[]{userid});
		
	}
	/**
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @desc 查询毕业去向
	 */
	public List<Map<String, Object>> querybyqx() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from destination");
		
	}

	/**
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @desc 查询单位性质
	 */
	public List<Map<String, Object>> querydwxz() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from companynature");
		
	}

	/**
	 * @desc 查询公司地址
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> querydwdz() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from companyaddress");
		
	}

	/**
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @desc 查询单位行业
	 */
	public List<Map<String, Object>> querydwhy() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from companyindustry");
		
	}

	/**
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @desc 查询职位类别
	 */
	public List<Map<String,Object>> queryzwlb() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from positiontype");
		
	}

	/**
	 * @desc 保存全部信息
	 * @param qq
	 * @param student_jy
	 * @param email
	 * @param processdate
	 * @param destination_id
	 * @param gname
	 * @param nature_id
	 * @param companyaddress_id
	 * @param industry_id
	 * @param positiontype_id
	 * @param contact_person
	 * @param cell_phone
	 * @param sphone
	 * @param contact_email
	 * @param company_address
	 * @param sutdent_address
	 * @param schooljz
	 * @param schoolsh
	 * @param schoolbw
	 * @param schoolhd
	 * @param hobby
	 * @param insufficient
	 * @param evaluate
	 * @param advantage
	 * @param honor
	 * @param feeling
	 * @param userid 
	 * @throws InterruptedException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public void saveall(String qq, String student_jy, String email, String processdate, String destination_id,
			String gsname, String nature_id, String companyaddress_id, String industry_id, String positiontype_id,
			String contact_person, String cell_phone, String sphone, String contact_email, String company_address,
			String sutdent_address, String schooljz, String schoolsh, String schoolbw, String schoolhd, String hobby,
			String insufficient, String evaluate, String advantage, String honor, String feeling, String userid) throws InterruptedException, ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		
		String sql1="select * from companymessage where company_name=?";
		Map<String, Object> map = dao.executeQueryForMap(sql1, new int[]{Types.VARCHAR}, new Object[]{gsname});
		System.out.println(map);
		if (map==null&&(gsname!=null||!gsname.equals(""))) {
			System.setProperty("webdriver.gecko.driver", "geckodriver.exe");
			FirefoxOptions options = new FirefoxOptions();
			options.addArguments("-headless");
			options.addArguments("text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9");
			WebDriver driver = new FirefoxDriver(options);
			String url="https://aiqicha.baidu.com/s?q="+gsname+"&t=0";
			String js="document.getElementsByClassName('comp-item-val-link')[0].target='_parent';";
			options.addArguments("headless");
			driver.get(url);
			Thread.sleep(3000);
			driver.findElements(By.className("item-inner")).get(0).click();
			JavascriptExecutor jse=((JavascriptExecutor) driver);
			jse.executeScript(js);
			driver.findElements(By.className("comp-item-val-link")).get(0).click();
			WebDriverWait wait = new WebDriverWait(driver, 5);
			wait.until(ExpectedConditions.presenceOfElementLocated(By.className("name")));
			Document doc = Jsoup.parse(driver.getPageSource());
			Elements names = doc.getElementsByClass("name");
			String name = names.get(0).text();
			Elements ids = doc.getElementsByClass("social-credit-code-text");
			String id = ids.get(0).text();
			driver.quit();
			gsname=UUID.randomUUID().toString();
			String sql="insert into companymessage values(?,?,?,?,?,?,?)";
			dao.executeUpdate(sql,new int[]{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR}, new Object[]{gsname,name,id,"","","",""});
			
		}
		else {
			if (gsname==null) {
				gsname="";
			}
			else {
				gsname=(String) map.get("company_id");
			}
		}
		
		String sql = "update students set sqq=?,student_jy=?,email=?,destination_id=?,company_id=?,nature_id=?,companyaddress_id=?,industry_id=?,positiontype_id=?,"
				+ "contact_person=?,cell_phone=?,sphone=?,contact_email=?,company_address=?,sutdent_address=?,`school-jz`=?,`school-sh`=?,`school-bw`=?,`school-hd`=?,hobby=?,"
				+ "insufficient=?,evaluate=?,advantage=?,honor=?,feeling=? where UUID=?";
		
		int[] types = new int[26];
		Object[] values= new Object[26];
		
		values[0]=qq;
		values[1]=student_jy;
		values[2]=email;
		values[3]=destination_id;
		values[4]=gsname;
		values[5]=nature_id;
		values[6]=companyaddress_id;
		values[7]=industry_id;
		values[8]=positiontype_id;
		values[9]=contact_person;
		values[10]=cell_phone;
		values[11]=sphone;
		values[12]=contact_email;
		values[13]=company_address;
		values[14]=sutdent_address;
		values[15]=schooljz;
		values[16]=schoolsh;
		values[17]=schoolbw;
		values[18]=schoolhd;
		values[19]=hobby;
		values[20]=insufficient;
		values[21]=evaluate;
		values[22]=advantage;
		values[23]=honor;
		values[24]=feeling;
		values[25]=userid;
		
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		if (processdate.trim().equals("0")) {
			types[3]=Types.NULL;
			types[4]=Types.NULL;
			types[5]=Types.NULL;
			types[6]=Types.NULL;
			types[7]=Types.NULL;
			types[8]=Types.NULL;
			types[9]=Types.NULL;
			types[10]=Types.NULL;
			types[11]=Types.NULL;
			types[12]=Types.NULL;
			types[13]=Types.NULL;
			types[14]=Types.NULL;
		}
		else {
			types[3]=Types.INTEGER;
			types[4]=Types.VARCHAR;
			types[5]=Types.VARCHAR;
			types[6]=Types.VARCHAR;
			types[7]=Types.VARCHAR;
			types[8]=Types.VARCHAR;
			types[9]=Types.VARCHAR;
			types[10]=Types.VARCHAR;
			types[11]=Types.VARCHAR;
			types[12]=Types.VARCHAR;
			types[13]=Types.VARCHAR;
			types[14]=Types.VARCHAR;
			
		}
		types[15]=Types.INTEGER;
		types[16]=Types.INTEGER;
		types[17]=Types.INTEGER;
		types[18]=Types.INTEGER;
		types[19]=Types.VARCHAR;
		types[20]=Types.VARCHAR;
		types[21]=Types.VARCHAR;
		types[22]=Types.VARCHAR;
		types[23]=Types.VARCHAR;
		types[24]=Types.VARCHAR;
		types[25]=Types.VARCHAR;
		
		dao.executeUpdate(sql, types, values);
	}

	
	
}
