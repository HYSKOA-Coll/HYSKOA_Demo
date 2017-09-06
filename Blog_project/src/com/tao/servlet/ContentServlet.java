package com.tao.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tao.bean.PageBean;
import com.tao.bean.Publish;
import com.tao.bean.Reply;
import com.tao.dao.daoimpl.PublishDaoImpl;
import com.tao.dao.daoimpl.ReplyDaoImpl;


@WebServlet("/content")
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public PublishDaoImpl pdi = new PublishDaoImpl(); 
	public ReplyDaoImpl rdi = new ReplyDaoImpl();
    public ContentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//拿到帖子的id
		System.out.println("-----ContentServlet---------");
    String pubId	=	request.getParameter("id");
    System.out.println("==========="+pubId);
    	try {
    		//帖子的id查询帖子的内容
			List<Publish> contentlist = pdi.IdSelectPublish(pubId);
			request.setAttribute("contentlist", contentlist);
			
			//帖子的id查询帖子的评论
			List<Reply> replylist = rdi.idselectReply(pubId);
			request.setAttribute("replylist", replylist);
			System.out.println(replylist);
			
			//跳转到内容页
			request.getRequestDispatcher("content.jsp").forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
		    	
	}


}
