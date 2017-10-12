package com.tao.dao;

import java.util.List;

import com.tao.entity.Question;

public interface QuestionMapper extends BaseMapper<Question>{

	public List<Question> questionList(int packet_id);
	
	public int delete(int packet_id);
	
	public int insertlist(Question question);
	
}
