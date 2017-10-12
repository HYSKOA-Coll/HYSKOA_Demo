package com.tao.dao;

import java.util.List;

import com.tao.entity.Info;
import com.tao.entity.InstanceAnswer;

public interface InstanceAnswerMapper extends BaseMapper<InstanceAnswer>{

	public List<Info> selectInfo(int clazz_id);
	
	public int addAnswer(InstanceAnswer instanceAnswer);
}
