package com.tao.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.College;
import com.tao.entity.Major;
import com.tao.service.MajorService;

public class MajorAction extends ActionSupport implements ModelDriven<Major>{
	
	@Resource
	private MajorService majorService;
	private Major major=new Major();
	@Override
	public Major getModel() {
		// TODO Auto-generated method stub
		return major;
	}
	
	private String ResponseJSON;


	
	public String getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(String responseJSON) {
		ResponseJSON = responseJSON;
	}
	public String addmajor(){
		System.out.println("-------MajorAction------addmajor-----------"+major);	
		int count=majorService.insert(major);
//		System.err.println("count+++++++++"+count);
		setResponseJSON("success");
		return "success";
	}
	public String deletemajor(){
		System.out.println("---------majorAction--------deletemajor-----"+major);
		
		int count=majorService.delete(major);
		if (count != 0) {
			setResponseJSON("success");
			return "success";
		}
		setResponseJSON("repeat");
		return "success";
	}
	
	/*public String selectlist(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpSession session=request.getSession();
		List<Major> list=new ArrayList<Major>();
		List<Major> count=majorService.selectList(list);
		System.out.println("list----------------" + list);
		session.setAttribute("list", list);
		return "success";
		
	}*/
}
