package com.tao.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.InstanceAnswer;
import com.tao.entity.PlanInstance;
import com.tao.entity.Question;
import com.tao.entity.Teacher;
import com.tao.page.PageBean;
import com.tao.service.InstanceAnswerService;
import com.tao.service.PlanInstanceService;
import com.tao.service.QuestionService;

public class InstanceAnswerAction extends ActionSupport implements ModelDriven<InstanceAnswer>{

	@Resource
	private InstanceAnswerService instanceAnswerservice;
	@Resource
	private PlanInstanceService planinstanceservice;
	private InstanceAnswer instanceAnswer = new InstanceAnswer();
	
	@Override
	public InstanceAnswer getModel() {
		return instanceAnswer;
	}

	//json
	private Object responseJSON;
	public Object getResponseJSON() {
		return responseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		this.responseJSON = responseJSON;
	}
	
	
	public String addInstanceAnswer() {
		System.out.println("----InstanceAnswerAction-------addInstanceAnswer---"+instanceAnswer);
		
		int count = instanceAnswerservice.addinstanceAnswer(instanceAnswer);
		System.out.println("count--------"+count);
		
		setResponseJSON("success");
		return "success";
	}
	
	private int pageNow;
	private int instance_judge;
	public int getInstance_judge() {
		return instance_judge;
	}
	public void setInstance_judge(int instance_judge) {
		this.instance_judge = instance_judge;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public String selectAnswer() {
		System.out.println("---InstanceAnswerAction------selectAnswer----------"+instanceAnswer);
		
		PageBean<PlanInstance> pageBean = new PageBean<PlanInstance>();
		pageBean.setPageNow(pageNow);
		
		Map<String,Object> pmap=new HashMap<String,Object>();
		pmap.put("info_id", instanceAnswer.getInfo_id());
		pmap.put("instance_judge", instance_judge);
		pageBean.setParams(pmap);
		planinstanceservice.selectPage(pageBean);
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		System.out.println("pageBean---------"+pageBean);
		map.put("endlist", pageBean);
		
		return "success";
	}
	
	/**
	 * 学生查询正在上的课
	 * @return
	 */	
	public String selectClazz() {
		System.out.println("---instanceAnswer--------selectClazz--------------"+instanceAnswer);
		
		instanceAnswer =  instanceAnswerservice.select(instanceAnswer);
		System.out.println("instanceAnswer---"+instanceAnswer);
		
		if(instanceAnswer == null) {
			System.out.println("未上课");
			setResponseJSON("repeat");
			return "success";
		}
		
		System.out.println("instanceAnswer ----packet---------"+instanceAnswer.getPacket_id());
		
		setResponseJSON(instanceAnswer);
		return "success";
	}
	
	/**
	 * 通过packet_id查询题目
	 * @return
	 */
	@Resource
	private QuestionService questionservice;
	
	public String packetIdselect() {
		System.out.println("---instanceAnswer----packetIdselect-----"+instanceAnswer);
		
		PageBean<Question> pageBean = new PageBean<Question>();
		pageBean.setPageNow(1);
		pageBean.setPageCount(1);
		Map<String,Object> stuqmap=new HashMap<String,Object>();
		stuqmap.put("packet_id", instanceAnswer.getPacket_id());
		pageBean.setParams(stuqmap);
		
		questionservice.selectPage(pageBean);
		
		System.out.println("pageBean------"+pageBean);
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		map.put("stuqlist", pageBean);
		return "success";
	}
	
}
