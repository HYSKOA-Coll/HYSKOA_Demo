package com.tao.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tao.dao.daoimpl.PublishDaoImpl;

@WebServlet("/delpub")
public class DeletePublishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PublishDaoImpl pdi = new PublishDaoImpl();
    public DeletePublishServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		//获取当前删除操作id 和 用户名
		System.out.println("----DeletePublishServlet-----doGet------");
		String pubId = request.getParameter("id");
		String pubUser = request.getParameter("user");
		System.out.println(pubId+"-------"+pubUser);
	
		//从session拿出用户名进行比较
		Object user = request.getSession().getAttribute("user");
		System.out.println(user);
		
		if(user == null || user.equals("")) {
			
			response.getWriter().write("nologin");
			
		}else {
		
		
		//如果相同 ，可以删除
		if(user.equals(pubUser)) {
			System.out.println("user相同");
			try {
				
			int count = pdi.deletePublish(pubId);
			System.out.println("count---"+count);
			
			
			if(count == 1) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("repeat") ;
			}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}else {  //用户名不相同 返回提示
			
			response.getWriter().write("fail") ; 
		}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
