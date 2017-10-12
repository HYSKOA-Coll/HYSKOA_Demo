package com.tao.dao;

import com.tao.entity.Questionp;

public interface QuestionpMapper extends BaseMapper<Questionp>{

	public int delete(int packet_id);
	
	public Integer questionId(String question_name);
	
}
