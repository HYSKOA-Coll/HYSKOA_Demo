package com.tao.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tao.bean.User;
import com.tao.dao.daoimpl.UserDaoImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private User use = new User();
	private UserDaoImpl udi = new UserDaoImpl();
	

	public User getUse() {
		return use;
	}

	public void setUse(User use) {
		this.use = use;
	}

	public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		//从请求中拿到用户名和密码
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		
		System.out.println(user + "   " + pwd);
		
		try {
			
			//从数据库查询验证登陆
			use = (User) udi.checkLogin(user);
			if(use != null && use.getPwd().equals(pwd)) {
			
			request.getSession().setAttribute("user", user);
			response.getWriter().print("success");
				
			//已用ajax替代
//			request.getRequestDispatcher("main.jsp").forward(request, response);
				
			}else {
				response.getWriter().print("repeat");
				
				//已用ajax替代
//			response.getWriter().write("<script language='javascript'>alert('你的输入有伍，清重新输入')</script>");
//			request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
