package com.tao.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Clazz;
import com.tao.entity.College;
import com.tao.entity.Major;
import com.tao.page.PageBean;
import com.tao.service.ClazzService;
import com.tao.service.CollegeService;
import com.tao.service.MajorService;
import com.tao.service.impl.MajorServiceImpl;

@Controller
public class ClazzAction extends ActionSupport implements ModelDriven<Clazz>{

	private static final long serialVersionUID = 1L;
	@Resource
	private ClazzService clazzService;
	@Resource
	private CollegeService collegeService;
	@Resource
	private MajorService majorService;
	
	private Clazz clazz = new Clazz();
	private Major major = new Major();
	private College college = new College();
	
	
	@Override
	public Clazz getModel() {
		// TODO Auto-generated method stub
		return clazz;
	}
	private Object responseJSON;
	
	public Object getResponseJSON() {
			return responseJSON;
		}

		public void setResponseJSON(Object responseJSON) {
			this.responseJSON = responseJSON;
		}

	//添加班级
		
	public String addclazz(){
		System.out.println("--------addclazz---------");
		System.out.println(clazz);
		
			int count = clazzService.insert(clazz);
			if (count != 0) {
				setResponseJSON("success");
				return "success";
			}
		
		setResponseJSON("repeat");
		return "success";
	}
	
	//修改
	public String updataclazz(){
		System.out.println("--------updataclazz---------"+clazz);
		int  clazz_id = clazz.getClazz_id();
		System.out.println("clazz_id"+clazz_id);
			int i2 = clazzService.update(clazz);
		
		if(i2 != 1){
			
			setResponseJSON("repeat");
			return "success";
		}	
		System.out.println(i2);
		setResponseJSON("success");
		return "success";
	}
	
	//删除
		public String deleteclazz(){
			int  clazz_id = clazz.getClazz_id();
			System.out.println("-------deleteclazz----------");
		int a3 = 	clazzService.delete(clazz);
		if(a3 != 1){
			
			setResponseJSON("repeat");
			return "success";
		}	
		System.out.println(a3);
		setResponseJSON("success");
		return "success";
	}
		
		
		//批量删除
		private String info_ids;

		public String getInfo_ids() {
			return info_ids;
		}

		public void setInfo_ids(String info_ids) {
			this.info_ids = info_ids;
		}

		public String deleteclazzs() {
			System.out.println("----InfoAction-------deleteclazzs-------------" + info_ids.toString());
			System.out.println(info_ids);
			String[] numall=info_ids.split(",");
			int count = clazzService.deleteList(numall);
			System.out.println("delt----------count" + count);
			if(count !=1){
				setResponseJSON("success");
				return "success";
			}
			setResponseJSON("repeat");
			return "success";
		}
	//查询全部
	public String selectclazz(){
			System.out.println("--------selectclazz--------");
			
			List list =  (List) clazzService.select(clazz);
			List list2 =	  (List) collegeService.select(college);
		System.out.println(list);
//			setResponseJSON(list);
			return "success";
		}
	//查询全部
	//查询
		private PageBean pageBean=new PageBean();
//		private String name_num;
		private int pageNow;
		/*public String getName_num() {
			return name_num;
		}
		public void setName_num(String name_num) {
			this.name_num = name_num;
		}*/
		
		public int getPageNow() {
			return pageNow;
		}
		public void setPageNow(int pageNow) {
			this.pageNow = pageNow;
		}
		public String select(){
			System.out.println("**********ClazzAction********selectPageList*****");
			pageBean.setPageNow(pageNow);
			//将查询的参数,封装在PageBean的params参数中.
			//分页查询
			PageBean<Clazz> pb=clazzService.selectPage(pageBean);
			/*List list =	  (List) collegeService.select(college);
			List<Major> list2 =(List<Major>) majorService.select(major);
			System.out.println("list2"+list2);
			System.out.println("list college"+list);*/
			System.out.println(pb);
			ActionContext.getContext().getContextMap().put("pb",pb);
			return "success";
		}
		
		
		public String getAll() {
System.out.println("进入getall");

			HttpServletRequest request = ServletActionContext.getRequest();
			String pageN = request.getParameter("pageNow");
			System.out.println(pageN);
			if (pageN == null || pageN.equals("")) {
				pageN = "1";
			}
			int pageNow = Integer.parseInt(pageN);
			if (pageNow < 1) {
				pageNow = 1;
			}
			PageBean<Clazz> page = new PageBean<Clazz>();
			
			page.setPageNow(pageNow);
			
			
			System.out.println(page + "------page------");

			/* System.out.println(page + "------page------"); */
			PageBean<Clazz> clazzs = clazzService.selectPage(page);
			System.out.println(clazzs + "clazz--------------------------");
			/*
			 * List<Student> list = student.getDatas(); int pageNow1 =
			 * student.getPageNow(); int TOtalPages = student.getTotalPages();
			 */
			request.setAttribute("page", clazzs);
			return "success";
		}
		public String selectClazz() {
			System.out.println("--------通过班级条件查询所有----    selectClazz--------");
			
			HttpServletRequest request = ServletActionContext.getRequest();
			System.out.println(request.getParameter("clazz_name"));
			/*String names = request.getParameter("clazz_name");

			System.out.println("---------输入框里面的value---------------" + names);

			clazz.setClazz_name(names);*/
			PageBean<Clazz> page =new PageBean<Clazz>();
		Object param1 = request.getParameter("dname");
			Object param2 = request.getParameter("major_id");
			Object param3 = request.getParameter("clazz_name");
			
			String pageN = request.getParameter("pageNow");
			System.out.println("param1 (college_id)= "+param1 +" , param2(major_id) ="+param2+" ,param3(clazz_name) ="+param3);
			if (pageN == null || pageN.equals("")) {
				pageN = "1";
			}
			int pageNow = Integer.parseInt(pageN);
			if (pageNow < 1) {
				pageNow = 1;
			}
			
			
		   if(param1 != null && !param1.equals("--请选择学院--")){
			   System.out.println(param1.toString());
			 page.getParams().put("college_id", param1.toString());
				System.out.println("success");
			}
		   if(param2 != null && !param2.equals("--请选择专业--")){
				 page.getParams().put("major_id", Integer.parseInt(param2.toString()));
					
				}
		   if(param3 != null && !param3.equals("")){
				 page.getParams().put("clazz_name",param3.toString());
					
				}
		   page.setPageNow(pageNow);
		   PageBean<Clazz> clazzs = clazzService.selectPage(page);
		
//			System.out.println(", params =" +params);

			System.out.println("page ------"+page);
			
			clazzService.selectPage(page);
			
			
			request.setAttribute("page", page);

		   request.setAttribute("page", clazzs);
			return "success";
		}
		public String selectAll(){
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaa");
			List<Map> list =collegeService.select_list(college);
				setResponseJSON(list);
				System.out.println("College List"+list);
				
				return "success";
				
			}

			public String selectMajor(){
				HttpServletRequest request = ServletActionContext.getRequest();

				String id = request.getParameter("id");
				System.out.println("---selectMajor   id =----"+id);
				int major_id = (Integer.parseInt(id));
				
				List<Map> list =majorService.selectbyid(major_id);
				System.out.println("Major List"+list);
			   setResponseJSON(list);
					
				return "success";
					
			}

}
