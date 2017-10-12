package com.tao.action;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.Reflection;

import com.mysql.fabric.Response;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.dao.CollegeMapper;
import com.tao.entity.College;
import com.tao.entity.Major;
import com.tao.page.PageBean;
import com.tao.service.CollegeService;

public class CollegeAction extends ActionSupport implements ModelDriven<College>{
	
	@Resource
	private CollegeService collegeService;
	College college=new College();
	@Override
	public College getModel() {
		// TODO Auto-generated method stub
		return college;
	}
	
private String ResponseJSON;


	
	public String getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(String responseJSON) {
		ResponseJSON = responseJSON;
	}
	
	public String addcollege(){
		System.out.println("-----CollegeAction------addcollege-----"+college);
		
		int count = collegeService.insert(college);
		System.out.println("count--------"+count);
		setResponseJSON("success");
		return "success";
	}

	//删除学院
	private String college_ids;
	public String getCollege_ids(){
		return college_ids;
	}
	public void setCollege_ids(String college_ids){
		this.college_ids=college_ids;
	}
	public String deletecollege(){
		System.out.println("------CollegeAction----deletecollege------"+college_ids.toString());
		String[] idAll=college_ids.split(",");
		int count = collegeService.deleteList(idAll);
		System.out.println("del------------count"+count);
		setResponseJSON("success");
		return "success";
	}
	/**
	 * 分页查询teacher
	 * 
	 * @return
	 */
	private int pageNow;

	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
		System.out.println("-------setPageNow---");
	}
	private String name_num;
	public String getName_num() {
		return name_num;
	}
	public void setName_num(String name_num) {
		this.name_num = name_num;
	}

	public String getlist(){
		
		PageBean<College> pageBean = new PageBean<College>();
		pageBean.setPageNow(pageNow);
		PageBean<College> datas=collegeService.selectPage(pageBean);
		System.out.println("pagebean--------------"+pageBean);
		List<College> clists = pageBean.getDatas();
		System.out.println("clists--------"+clists);
		for (College clist : clists) {
			System.out.println("clist------------"+clist);
			List<Major> mlists = clist.getMajorList();
			/*String major_name = ((Major) mlists).getMajor_name();
			pageBean.setMajor_name(major_name);*/
/*			System.out.println("major_name---------"+major_name);
*/			for (Major mlist : mlists) {
				System.out.println("mlist-----"+mlist);
				String major_name = mlist.getMajor_name();
				int major_id=mlist.getMajor_id();
				System.out.println("major_id----------------"+major_id);
				pageBean.setMajor_name(major_name);
				System.out.println("major_name---------"+major_name);
			}
		}
		System.out.println("pageBean.getMajor_name" +pageBean.getMajor_name());
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		map.put("tpb", pageBean);
		
//		map.put("", mlists);
		
		return "success";	
	}
}
