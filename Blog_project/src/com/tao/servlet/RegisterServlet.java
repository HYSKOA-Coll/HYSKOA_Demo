package com.tao.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tao.bean.User;
import com.tao.dao.daoimpl.UserDaoImpl;

@WebServlet("/reg")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDaoImpl udi = new UserDaoImpl();

public RegisterServlet() {
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
		
		//创建一个用户来接受用户名和密码 封装成用户对象
		User use = new User(user, pwd);
		
		try {
			
			//拿到添加返回的值 进行判断
			int count = udi.checkRegister(use);
			System.out.println("--RegisterServlet-------doPost-------"+count);
			
			if(count == 1) {
				response.getWriter().write("success");
				
			}else {
				response.getWriter().write("repeat");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
