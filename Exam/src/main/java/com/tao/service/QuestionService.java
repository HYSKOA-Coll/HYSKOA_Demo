package com.tao.service;

import java.util.List;

import com.tao.entity.Question;

public interface QuestionService extends BaseService<Question>{

	public List<Question> questionList(int packet_id);
	
}
