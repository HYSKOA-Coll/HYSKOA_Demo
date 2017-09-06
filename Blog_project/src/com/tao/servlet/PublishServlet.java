package com.tao.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tao.bean.Publish;
import com.tao.dao.daoimpl.PublishDaoImpl;

/**
 * Servlet implementation class PublishServlet
 */
@WebServlet("/publish")
public class PublishServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private PublishDaoImpl pdi = new PublishDaoImpl();
	
	public PublishServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		//获取标题内容和用户
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String user = (String) request.getSession().getAttribute("user");
		
		System.out.println(title+"---------"+content+"----"+user);
		
		//如果用户没用登陆 ，返回repeat
		if(user == null || user.equals("")) {
			response.getWriter().write("fail");
			return;
		}else {
			try {
				//获取当前服务器时间
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date = sdf.parse(sdf.format(new Date()));
				
				
				Publish publish = new Publish(0, title, content, user, date);
				int count = pdi.insertPublish(publish);
				
				if(count == 1) {
					response.getWriter().write("success");
					
				}else {
					response.getWriter().write("repeat");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
