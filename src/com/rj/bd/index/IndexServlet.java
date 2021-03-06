package com.rj.bd.index;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rj.bd.utrl.EmailUtils;

@SuppressWarnings("serial")
public class IndexServlet extends HttpServlet {
	IndexService service = new IndexService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q = request.getParameter("method");
		
		try {
			if ("loginpage".equals(q)) {
				loginpage(request,response);
			}
			else if ("query".equals(q)) {
				query(request,response);
			}
			else if ("sc".equals(q)) {
				saveSC(request,response);
			}
			else if ("sq".equals(q)) {
				saveSQ(request,response);
			}
			else if ("qsc".equals(q)) {
				saveqSC(request,response);
			}
			else if ("mquery".equals(q)){
				mquery(request,response);
			}
			else if ("minesc".equals(q)) {
				minesc(request,response);
			}
			else if ("minesq".equals(q)) {
				minesq(request,response);
			}
			else if ("details".equals(q)) {
				detailspage(request,response);
			}
			else if ("securitypage".equals(q)) {
				securitypage(request,response);
			}
			else if ("perfactpage".equals(q)) {
				perfactpage(request,response);
			}
		} catch (ClassNotFoundException | SQLException | ParseException | MessagingException e) {
			System.out.println(e.getMessage());
		}
		
	}

	
	/**
	 * @desc 跳转信息完善页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void perfactpage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {

		List<Map<String, Object>> byqx = service.querybyqx();
		List<Map<String, Object>> dwxz = service.querydwxz();
		List<Map<String, Object>> dwdz = service.querydwdz();
		List<Map<String, Object>> dwhy = service.querydwhy();
		List<Map<String, Object>> zwlb = service.queryzwlb();
		request.setAttribute("byqx", byqx);
		request.setAttribute("dwxz", dwxz);
		request.setAttribute("dwdz", dwdz);
		request.setAttribute("dwhy", dwhy);
		request.setAttribute("zwlb", zwlb);
		request.getRequestDispatcher("/perfect/perfectpage.jsp").forward(request, response);
		
	}


	/**
	 * @desc 跳转安全中心
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void securitypage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/security.jsp").forward(request, response);
		
	}


	/**
	 * @desc 跳转详情页
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void detailspage(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		String eid = request.getParameter("eid");
		Map user = (Map)request.getSession().getAttribute("user");
		List<Map<String, Object>> list=service.query(user==null?null:(String)user.get("UUID"));
		List<Integer> random=randomForlist(list.size());
		Map<String, Object> map = service.detailquery(user,eid);
		System.out.println(map);
		request.setAttribute("randomsum",random);
		request.setAttribute("map", map);
		request.setAttribute("list",list);
		request.getRequestDispatcher("/detailspage/detailspage.jsp").forward(request, response);
	}


	private void minesq(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		String userid = request.getParameter("userid");
		List<Map<String, Object>> list = service.queryminesq(userid);
		request.setAttribute("list", list);
		int sc=service.scquery(userid);
		int sq=service.sqquery(userid);
		request.getSession().setAttribute("sc", sc);
		request.getSession().setAttribute("sq", sq);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}


	/**
	 * @desc 用户查询已收藏职业
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void minesc(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		String userid = request.getParameter("userid");
		List<Map<String, Object>> list = service.queryminesc(userid);
		request.setAttribute("list", list);
		int sc=service.scquery(userid);
		int sq=service.sqquery(userid);
		request.getSession().setAttribute("sc", sc);
		request.getSession().setAttribute("sq", sq);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}


	/**
	 * @desc 申请职位
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 * @throws ParseException 
	 * @throws MessagingException 
	 */
	private void saveSQ(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ParseException, MessagingException {
		Map user = (Map)request.getSession().getAttribute("user");
		String userid = request.getParameter("userid");
		String eid = request.getParameter("eid");
		List<Map<String, Object>> jl = service.queryjl(userid);
		if (jl==null||jl.size()<=0) {
			PrintWriter print = response.getWriter();
			print.write("no");
			print.close();
			return;
		}
		if (userid!=null&&!userid.equals("")) {
			service.saveSQ(userid,eid);
			emailto(userid,user,eid);
		}
	}


	private void emailto(String userid, Map user, String eid) throws ClassNotFoundException, SQLException, ParseException, MessagingException, IOException {
		List<Map<String, Object>> list = service.queryjl(userid);
		String time=(String)(list.get(0).get("resume_time"));
		System.out.println(time);
		String id=(list.get(0).get("resume_id"))+"";
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		 Date date1 = sdf.parse(time);
		 for (Map<String, Object> map : list) {
	        Date date2 = sdf.parse((String)map.get("resume_time"));
	        System.out.println((String)map.get("resume_time"));
	        if (date2.after(date1)) {
	        	date1=date2;
	        	id=map.get("resume_id")+"";
	        }
		}
		 Map<String, Object> map = service.queryjlmap(id);
	     Map<String, Object> emap = service.queryeid(eid);
		 EmailUtils.enclosureMessage("1977455153@qq.com",user.get("name")+"-"+emap.get("gsname")+"-"+emap.get("employment_name"), "", "D:/tools/"+map.get("resume_one"));
	}


	/**
	 * @desc 筛选条件模糊查询
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ServletException
	 * @throws IOException
	 */
	private void mquery(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		String userid = (String) request.getSession().getAttribute("userid");
		String type = request.getParameter("type");
		if ("1".equals(type)) {
			System.out.println(1111);
			String select = request.getParameter("select");
			System.out.println(select);
			String text = request.getParameter("text");
			if ("职位".equals(select)) {
				List<Map<String, Object>> list =service.mqueryByQW(text,userid);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
			else if ("公司".equals(select)) {
				List<Map<String, Object>> list =service.mqueryByGS(text,userid);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
		}
		else if ("2".equals(type)) {
			String xxz = request.getParameter("xxz").trim();
			String xl = request.getParameter("xl").trim();
			String jy = request.getParameter("jy").trim();
			String zw = request.getParameter("zw").trim();
			String xz = request.getParameter("xz").trim();
			String gm = request.getParameter("gm").trim();
			
			List<Map<String, Object>> list =service.mqueryBytwo(userid,xxz,xl,jy,zw,xz,gm);
			Map<String, String> tj= new HashMap<String, String>();
			tj.put("xxz", xxz==""?"不限":xxz);
			tj.put("xl", xl==""?"不限":xl);
			tj.put("jy", jy==""?"不限":jy);
			tj.put("zw", zw==""?"不限":zw);
			tj.put("xz", xz==""?"不限":xz);
			tj.put("gm", gm==""?"不限":gm);
			request.setAttribute("list", list);
			request.setAttribute("tj", tj);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
	}


	/**
	 * @desc 用户取消收藏
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	private void saveqSC(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String userid = request.getParameter("userid");
		String eid = request.getParameter("eid");
		service.saveqSC(userid,eid);
		
	}


	/**
	 * @desc 用户收藏
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	private void saveSC(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String userid = request.getParameter("userid");
		String eid = request.getParameter("eid");
		service.saveSC(userid,eid);
		
	}


	/**
	 * @desc 查询展示
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
			String userid = (String) request.getSession().getAttribute("userid");
			List<Map<String, Object>> list=service.query(userid);
			List<Integer> random=randomForlist(list.size());
			int sc=service.scquery(userid);
			int sq=service.sqquery(userid);
			request.getSession().setAttribute("sc", sc);
			request.getSession().setAttribute("sq", sq);
			request.setAttribute("randomsum",random);
			System.out.println(random);
			request.setAttribute("list", list);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}


	private List<Integer> randomForlist(int size) {
		Random ra = new Random();
		List<Integer> ran=new ArrayList<Integer>();
		for (int i = 0; i < 4; i++) {
			int c = ra.nextInt(size);
			if (ran.contains(c)) {
				i--;
				continue;
			}
			ran.add(c);
		}
		return ran;
	}


	/**
	 * @desc 跳转登录界面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void loginpage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/logein/login.jsp").forward(request, response);
		
	}
	
}
