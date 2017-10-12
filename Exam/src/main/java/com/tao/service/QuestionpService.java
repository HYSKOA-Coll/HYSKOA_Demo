package com.tao.service;

import java.util.List;

import com.tao.entity.Question;
import com.tao.entity.Questionp;

public interface QuestionpService extends BaseService<Questionp>{

	public int delete(int packet_id);
	
	public int insert(Questionp questionp,List<Question> questionlist);
	
}
