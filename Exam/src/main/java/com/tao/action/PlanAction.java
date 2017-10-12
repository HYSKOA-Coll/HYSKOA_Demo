package com.tao.action;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Plan;
import com.tao.entity.Questionp;
import com.tao.page.PageBean;
import com.tao.service.PlanService;

public class PlanAction extends ActionSupport implements ModelDriven<Plan>{

	@Resource
	private PlanService planService;
	Plan plan=new Plan();
	@Override
	public Plan getModel() {
		// TODO Auto-generated method stub
		return plan;
	}

	private Object ResponseJSON;
	public Object getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
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

	public String getplan(){
		System.out.println("--------getplan-----------"+plan);
		
		PageBean<Plan> pageBean = new PageBean<Plan>();
		if(pageNow < 1){
			pageNow = 1;
		}
		pageBean.setPageNow(pageNow);
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String plan_name=request.getParameter("plan_name");
		String info_id=request.getParameter("info_id");
		System.out.println("plan_name--------------"+plan_name);
		System.out.println("info_id----------------"+info_id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (plan_name != null || plan_name !="" || plan_name != "null") {
			map.put("plan_name", plan_name);
		}
		if (info_id == null || info_id =="" || info_id == "null") {
			info_id ="0";
		}
		
		map.put("info_id", info_id);
		map.put("tpb", pageBean);
		pageBean.setConditions2(map);
		System.out.println("map-------------------------------------"+map);		
		PageBean<Plan> datas=planService.selectPage(pageBean);
		System.out.println("datas----------" + datas);
		System.out.println("pagebean--------------"+pageBean);
		request.setAttribute("qqq", datas);
		return "success";	
	}
	public String addplan(){
		System.out.println("-----PlanAction------addplan-----"+plan);
		int count=planService.insert(plan);
		System.out.println("count--------"+count);
		setResponseJSON("success");
		return "success";
	}
	
	public String deleteplan(){
		System.out.println("---------PlanAction--------deleteplan-----"+plan);
		
		int count=planService.delete(plan);
		if (count != 0) {
			setResponseJSON("success");
			return "success";
		}
		setResponseJSON("repeat");
		return "success";
	}
	
}


