package com.tao.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Admin;
import com.tao.service.AdminService;

@Controller
public class UserAction extends ActionSupport implements ModelDriven<Admin>{

	@Resource
	private AdminService adminService;
	private Admin admin = new Admin();
	
	@Override
	public Admin getModel() {
		return admin;
	}
	
	private String ResponseJSON;
	public String getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(String responseJSON) {
		ResponseJSON = responseJSON;
	}
	
	/**
	 * 用户登陆查询
	 */
	public String adminlogin() {
		 
		System.out.println("----ManageAction-------department-------------"+admin);
		
		String admin_name = admin.getAdmin_name();
		String admin_pwd = admin.getAdmin_pwd();
		
		admin = adminService.select(admin);
		
		if(admin_name != null && admin != null && admin.getAdmin_pwd().equals(admin_pwd)) {
			Map<String, Object> map = ActionContext.getContext().getSession();
			map.put("admin_name", admin_name);
			
			System.out.println("----------admin-------session测试-----"+map.get("admin_name"));
			setResponseJSON("success");
			return "success";
		}

		setResponseJSON("repeat");
		return "success";
	}
	
	
	public String department() {
		
		System.out.println("----ManageAction-------department-------------学院查询列表");
		
		return "success";
	}
	
	public String teacher() {
		
		System.out.println("----ManageAction-------teacher-------------学院查询列表");
		
		return "success";
	}
	
	public String student() {
		
		System.out.println("----ManageAction-------student-------------学院查询列表");
		
		return "success";
	}
	
	public String mclass() {
		
		System.out.println("----ManageAction-------mclass-------------学院查询列表");
		
		return "success";
	}

}
