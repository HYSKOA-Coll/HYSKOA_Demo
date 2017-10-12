package com.tao.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Clazz;
import com.tao.entity.Plan;
import com.tao.entity.PlanInstance;
import com.tao.entity.Questionp;
import com.tao.service.ClazzService;
import com.tao.service.PlanInstanceService;
import com.tao.service.PlanService;

@Controller
public class PlanInstanceAction extends ActionSupport implements ModelDriven<PlanInstance>{

	@Resource
	private PlanInstanceService planinstanceservice;
	@Resource
	private PlanService planService;
	@Resource
	private ClazzService clazzService;
	private PlanInstance instance = new PlanInstance();
	
	@Override
	public PlanInstance getModel() {
		return instance;
	} 
	
	//json
	private Object responseJSON;
	public Object getResponseJSON() {
		return responseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		this.responseJSON = responseJSON;
	}

	/**
	 * 添加实例
	 * @return
	 * @throws ParseException
	 */
	public String stat_instance() throws ParseException {
		System.out.println("-----PlanInstanceAction----------stat_instance-----------"+instance);
		
		//获取uid
		String token = UUID.randomUUID().toString().replace("-","");
		//获取当前服务器时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date start_time = sdf.parse(sdf.format(new Date()));
		instance.setToken(token);
		instance.setStart_time(start_time);
		instance.setInstance_judge(1);
		
		System.out.println("instance------"+instance);
		
		int count = planinstanceservice.insert(instance);
		
		if(count != 1) {
			setResponseJSON("repeat");
			return "success";
		}
		setResponseJSON(token);
		return "success";
	}

	
	/**
	 * 上课模块引用plan
	 * 
	 * @return
	 */
	
	public String planIdName() {
		System.out.println("------plan------------引用-------");
		
		List<Plan> planlist = planService.planIdName();
		
		System.out.println("------plan----planlist-------"+planlist);
		setResponseJSON(planlist);
		return "success";
	}
	
	
	/**
	 * 上课模块引用clazz
	 */
	public String clazzIdName() {
		
		System.out.println("----------clazzaction--------引用-----");
		
		List<Clazz> clazzlist = clazzService.clazzIdName();
		
		System.out.println("---------clazzlist-------------"+clazzlist);
		setResponseJSON(clazzlist);
		return "success";
	}
	
	
	/**
	 * plan_id查询question_packet
	 * @return
	 */
private String clazz_name;
private String plan_name;
	public String getPlan_name() {
	return plan_name;
}
public void setPlan_name(String plan_name) {
	this.plan_name = plan_name;
}
	public String getClazz_name() {
		return clazz_name;
	}
	public void setClazz_name(String clazz_name) {
		this.clazz_name = clazz_name;
	}
	public String selectPacket() {
		System.out.println("-----PlanInstanceAction------selectPacket---------"+instance+"---"+clazz_name+"---"+instance.getToken());
		System.out.println("clazz_id------"+instance.getClazz_id());
		List<Questionp> packetlist = planinstanceservice.selectquestionp(instance.getPlan_id());
		System.out.println("packetlist----"+packetlist);
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		map.put("packetlist", packetlist);
		map.put("clazz_name", clazz_name);
		map.put("clazz_id", instance.getClazz_id());
		map.put("plan_name", plan_name);
		map.put("token", instance.getToken());
		return "success";
	}
	
	/**
	 * 结束上课修改 instance_judge 字段
	 * @return
	 */
	public String end_instance() {
		System.out.println("-----PlanInstanceAction-------end_instance----------"+instance);
		int count = planinstanceservice.update(instance);
		System.out.println("count --------"+count);
		
		setResponseJSON("success");
		return "success";
	} 
	
}
