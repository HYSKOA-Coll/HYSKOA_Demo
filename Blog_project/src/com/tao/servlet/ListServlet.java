package com.tao.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tao.bean.PageBean;
import com.tao.bean.Publish;
import com.tao.dao.daoimpl.PublishDaoImpl;
@WebServlet("/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PublishDaoImpl pdi = new PublishDaoImpl();
    public ListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("----------------list servlet");
		try {
			
			List<Publish> list = pdi.selectPublish();
			request.setAttribute("list", list);
			/*System.out.println(list);*/
			
			Object publist = request.getAttribute("list");
//			System.out.println(publist);

			
			PageBean<Publish> pb = new PageBean<Publish>();
			
			
		/*	 * 5.3
			 * 直接访问getAll  点击首页------->默认显示第一页，没有pageNow这个参数传过来
			 * 点击上一页  下一页  尾页  ----->需要传入pageNow参数
			 * 获取pageNow参数时，有时候存在  有时候不存在
			 * 所以需要进行判断*/
			 
			String pageNow = request.getParameter("pageNow");
			System.out.println("pageNow"+pageNow);
			
			if(pageNow!=null && !"".equals(pageNow)){
				//如果可以获取到当前需要显示的页数，就修改pb的pageNow属性
				pb.setPageNow(Integer.parseInt(pageNow));
			}	
			
			//5.1
			pdi.getByPage(pb);

			request.setAttribute("pb", pb);
			
			request.getRequestDispatcher("list.jsp").forward(request, response);
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	public Object getAll(HttpServletRequest request) {
		return request;
		
		/*System.out.println("_--------getAll---------------");
				//5.2 默认封装的pageNow=1  pageNum=3
				PageBean<Publish> pb = new PageBean<Publish>();
		
				
				
				 * 5.3
				 * 直接访问getAll  点击首页------->默认显示第一页，没有pageNow这个参数传过来
				 * 点击上一页  下一页  尾页  ----->需要传入pageNow参数
				 * 获取pageNow参数时，有时候存在  有时候不存在
				 * 所以需要进行判断
				 
				String pageNow = request.getParameter("pageNow");
				if(pageNow!=null && !"".equals(pageNow)){
					//如果可以获取到当前需要显示的页数，就修改pb的pageNow属性
					pb.setPageNow(Integer.parseInt(pageNow));
				}	
				
				//5.1
				pdi.getByPage(pb);

				request.setAttribute("pb", pb);
				System.out.println();
				return request.getRequestDispatcher("main.jsp");
		*/
	}
}
