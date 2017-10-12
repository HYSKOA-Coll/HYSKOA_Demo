package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.dao.BaseMapper;
import com.tao.entity.Question;
import com.tao.service.QuestionService;

@Service
public class QuestionServiceImpl extends BaseServiceImpl<Question> implements QuestionService{

	@Override
	public List<Question> questionList(int packet_id) {
		
		return questionMapper.questionList(packet_id);
	}

}
