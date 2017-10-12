package com.tao.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Question;
import com.tao.entity.Questionp;
import com.tao.page.PageBean;
import com.tao.service.QuestionpService;

@Controller
public class QuestionpAction extends ActionSupport implements ModelDriven<Questionp>{

	@Resource
	private QuestionpService questionpservice;
	private Questionp questionp= new Questionp();
	
	@Override
	public Questionp getModel() {
		return questionp;
	}
	
	//json
	private String ResponseJSON;
	public String getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(String responseJSON) {
		ResponseJSON = responseJSON;
	}
	
	/**
	 * 添加题库与题库下子题
	 * @return
	 * @throws JSONException 
	 */

	private String question;
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String addquestionp() throws JSONException {
		System.out.println("----QuestionpAction-----delquestion--添加题库--"+ question);
		
		/*
		 * 获取题目包信息，set进questionp对象
		 */
		Object obj = JSONUtil.deserialize(question);
		ArrayList arrlists = (ArrayList) obj;
		ArrayList packetlist =(ArrayList) arrlists.get(0);
		for (Object packetmap : packetlist) {
			HashMap packmap = (HashMap) packetmap;
			questionp.setInfo_id(Integer.parseInt(packmap.get("info_id").toString()));
			questionp.setMedia_id(Integer.parseInt(packmap.get("media_id").toString()));
			questionp.setPacket_name(packmap.get("packet_name").toString());
			questionp.setPacket_type(packmap.get("packet_type").toString());
			questionp.setPacket_level(packmap.get("packet_level").toString());
			questionp.setPacket_prompt(packmap.get("packet_prompt").toString());
			
		}
		
		/*
		 * 获取题目信息，set进question对象
		 * question对象，add进list集合
		 */
		int size = arrlists.size();
		List<Question> list = new ArrayList<Question>();
		for (int i = 1; i < size; i++) {
			Question question = new Question();
			ArrayList questionlists = (ArrayList) arrlists.get(i);
			for (Object questionmaps : questionlists) {
				HashMap questionmap = (HashMap) questionmaps;
				question.setInfo_id(questionp.getInfo_id());
				question.setMedia_id(questionp.getMedia_id());
				question.setQuestion_name(questionmap.get("question_name").toString());
				question.setQuestion_type(Integer.parseInt(questionmap.get("question_type").toString()));
				question.setQuestion_option(questionmap.get("question_option").toString());
				question.setQuestion_correct(questionmap.get("question_correct").toString());
				question.setQuestion_prompt(questionmap.get("question_prompt").toString());
				list.add(question);
			}
		}
		System.out.println("---"+list);
		
		int count = questionpservice.insert(questionp, list);
		
		if(count != 1) {
			setResponseJSON("repeat");
			return "success";
		}
		
		setResponseJSON("success");
		return "success";
	}
	
	
	/**
	 * 删除题库
	 * @return
	 */
	
	public String delquestion() {
		System.out.println("----QuestionpAction-------delquestion--删除题库--"+questionp);
		
		int count = questionpservice.delete(questionp.getPacket_id());
		System.out.println("count-----------"+count);
		setResponseJSON("success");
		return "success";
	}
	
	/**
	 * 分页查询题库
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
	private String name_type;
	public String getName_type() {
		return name_type;
	}
	public void setName_type(String name_type) {
		this.name_type = name_type;
	}
	public String getquestionp() {
		System.out.println("---QuestionAction----getquestion_packet--分页查询题库-"+questionp +"==="+name_type);
		PageBean<Questionp> pageBean = new PageBean<Questionp>();
		pageBean.setPageNow(pageNow);
		
		Map<String,Object> nmap=new HashMap<String,Object>();
		nmap.put("info_id", questionp.getInfo_id());
		nmap.put("packet_level", questionp.getPacket_level());
		nmap.put("name_type", name_type);
		pageBean.setParams(nmap);
		System.out.println("nmap-------"+nmap);
		System.out.println(pageBean.getParams());
		
		questionpservice.selectPage(pageBean);
		
		String term = "&info_id="+questionp.getInfo_id()+"&packet_level="+questionp.getPacket_level()
		+"&name_type="+name_type;
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		System.out.println("pageBean---------"+pageBean);
		map.put("qppb", pageBean);
		map.put("term", term);
		return "success";
	}
	
	public String stuquestionp() {
		System.out.println("---QuestionAction----getquestion_packet--stu分页查询题库-"+questionp +"==="+name_type);
		PageBean<Questionp> pageBean = new PageBean<Questionp>();
		pageBean.setPageNow(pageNow);
		
		Map<String,Object> nmap=new HashMap<String,Object>();
		nmap.put("info_id", questionp.getInfo_id());
		nmap.put("packet_level", questionp.getPacket_level());
		nmap.put("name_type", name_type);
		pageBean.setParams(nmap);
		System.out.println("nmap-------"+nmap);
		System.out.println(pageBean.getParams());
		
		questionpservice.selectPage(pageBean);
		
		String term = "&info_id="+questionp.getInfo_id()+"&packet_level="+questionp.getPacket_level()
		+"&name_type="+name_type;
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		System.out.println("pageBean---------"+pageBean);
		map.put("stuqppb", pageBean);
		map.put("term", term);
		return "success";
	}

}
