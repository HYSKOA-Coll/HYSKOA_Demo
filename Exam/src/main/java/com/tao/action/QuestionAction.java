package com.tao.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Question;
import com.tao.page.PageBean;
import com.tao.service.QuestionService;

@Controller
public class QuestionAction extends ActionSupport implements ModelDriven<Question>{

	@Resource
	private QuestionService questionservice;
	private Question question= new Question();
	
	@Override
	public Question getModel() {
		return question;
	}
	
	//json
	private Object ResponseJSON;
	public Object getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
	}


	/**
	 * packet_id查询试题
	 * @return
	 */
	public String getquestion() {
		System.out.println("---QuestionAction----getquestion-------"+question);
		
		List<Question> qlist = questionservice.questionList(question.getPacket_id());
		
		System.out.println("qlist-------"+qlist);
		setResponseJSON(qlist);
		return "success";
	}

}
