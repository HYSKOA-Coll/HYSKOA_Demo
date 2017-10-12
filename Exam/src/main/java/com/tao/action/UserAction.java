package com.tao.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.User;
import com.tao.service.UserService;

@Controller
public class UserAction extends ActionSupport implements ModelDriven<User>{

	@Resource
	private UserService userService;
	private User user = new User();
	
	@Override
	public User getModel() {
		return user;
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
	public String checklogin() {
		 
		System.out.println("----ManageAction-------department-------------"+user);
		String admin_name = user.getAdmin_name();
		String admin_pwd = user.getAdmin_pwd();
		
		/* 管理员登录*/
		if(user.getAdmin_name().equals("admin")){
			user = userService.select(user);

			if(admin_name != null && user != null && user.getAdmin_pwd().equals(admin_pwd)) {
				Map<String, Object> map = ActionContext.getContext().getSession();
				map.put("admin_name", admin_name);
				
				System.out.println("----------admin-------session测试-----"+map.get("admin_name"));
				setResponseJSON("admin");
				return "success";
			}
		}
		
		/* 教师登录登录*/
		user.setInfo_num(Integer.parseInt(admin_name));
		user.setAdmin_name("");
		System.out.println("user--------"+user);
		user = userService.select(user);
		if(user.getInfo_judge()==0 && user.getInfo_pwd().equals(admin_pwd)) {
			Map<String, Object> map = ActionContext.getContext().getSession();
			map.put("teacher_name", user.getInfo_name());
			map.put("teacher_id", user.getInfo_id());
			System.out.println("----------teacher_name-------session测试-----"+map.get("teacher_name"));
			setResponseJSON("teacher");
			return "success";
		}else if(user.getInfo_judge()==1 && user.getInfo_pwd().equals(admin_pwd)) {
			Map<String, Object> map = ActionContext.getContext().getSession();
			map.put("student_name", user.getInfo_name());
			map.put("student_id", user.getInfo_id());
			System.out.println("----------student_name-------session测试-----"+map.get("student_name"));
			setResponseJSON("student");
			return "success";
			
		}

		setResponseJSON("repeat");
		return "success";
	}
	
	
	/**
	 * admin密码修改
	 * @return
	 */
	private String newpwd;
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	
	public String editauser() {
		
		System.out.println("--UserAction-----editadmin------admin密码修改--"+user);
		
		user = userService.selectpwd(user);
		System.out.println("admin----"+user);
		if(user != null) {
			user.setAdmin_pwd(newpwd);
			user.setAdmin_id(1);
			int count = userService.update(user);
			
			if(count != 1) {
			setResponseJSON("fail");
			return "success";
			}
			
			setResponseJSON("success");
			return "success";
		}
		
		setResponseJSON("repeat");
		return "success";
	}
	
	
	/**
	 * student查询和密码修改
	 * @return
	 */
	private String infonewpwd;
	public String getInfonewpwd() {
		return infonewpwd;
	}
	public void setInfonewpwd(String infonewpwd) {
		this.infonewpwd = infonewpwd;
	}
	public String editstudent() {
		System.out.println("--UserAction-----editstudent------student密码修改"+infonewpwd);
		
		if(infonewpwd == "" || infonewpwd == null) {
			
			user = userService.select(user);
			Map<String, Object> map = ActionContext.getContext().getContextMap();
			map.put("user", user);
			
		}else if(infonewpwd != "" || infonewpwd != null) {
			user.setInfo_pwd(infonewpwd);
			int count = userService.update(user);
			System.out.println(count);
		}
		
		
		return "success";
	}
	
	
	/**
	 * 用户退出
	 * @return
	 */
	
	public String checkout() {
		
		System.out.println("--UserAction-----checkout------用户退出--"+user);
		
		if(user.getAdmin_name()!= null && user.getAdmin_name().equals("admin")) {
			ActionContext ac = ActionContext.getContext();
			Map session = ac.getSession();
			session.remove("admin_name");
			System.out.println("----------admin_name-------session测试-----"+session.get("admin_name"));
			return "success";
		}
		if (user.getInfo_name()!= null && user.getInfo_name().equals("teacher")) {
			System.out.println("----------teacher_name-------session测试-----");
			ActionContext ac = ActionContext.getContext();
			Map session = ac.getSession();
			session.remove("teacher_name");
			session.remove("teacher_id");
			System.out.println("----------teacher_name-------session测试-----"+session.get("teacher_name"));
			return "success";
		}
		
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
