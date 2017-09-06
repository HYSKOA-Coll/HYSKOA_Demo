package com.tao.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tao.dao.daoimpl.ReplyDaoImpl;
@WebServlet("/delrep")
public class DeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReplyDaoImpl rdi = new ReplyDaoImpl();
       
    public DeleteReplyServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//获取删除评论请求里的 评论REP_id  和 user
		System.out.println("----DeleteReplyServlet----doget----");
		String rep_id = request.getParameter("rep_id");
		String rep_user = request.getParameter("user");
		System.out.println("----DeleteReplyServlet----doget----rep_id:"+rep_id +"user:"+rep_user);
		
		//获取session的user
		Object user = request.getSession().getAttribute("user");
		System.out.println(user);
		if(user==null || user.equals("")) {
			
			response.getWriter().write("fail");
		}
		else {
			
			if(rep_user.equals(user)) {
				try {
					
					int count = rdi.iddeleteReply(rep_id);
					System.out.println("----DeleteReplyServlet----doget----count"+count);
					
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
 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
