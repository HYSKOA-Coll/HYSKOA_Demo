package com.tao.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tao.bean.Reply;
import com.tao.dao.daoimpl.ReplyDaoImpl;

@WebServlet("/reply")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReplyDaoImpl rdi = new ReplyDaoImpl();
    public ReplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		//拿到内容的id 和 评论
		System.out.println("------ReplyServlet-------doget-------");
		String replies = request.getParameter("replies");
		int id = Integer.parseInt(request.getParameter("id"));
		
		//拿到当前操作的用户名
		String user = (String) request.getSession().getAttribute("user");
		System.out.println(replies+"---回复-+用户名----"+user+"id--"+id);
		
		//r如果没用登陆跳转到登陆页面
		if(user == null || user.equals("")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}else {

		try {
			//添加一条评论
			//获取当前服务器时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = sdf.parse(sdf.format(new Date()));
			
			Reply reply = new Reply(0, id, replies, user, date);
			
			int count = rdi.insertReply(reply);
			System.out.println(count);
			
			request.getRequestDispatcher("content").forward(request, response);
			
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		}
	}

}
