package com.tao.dao;

import java.util.List;

import com.tao.entity.Plan;
import com.tao.entity.Questionp;

public interface PlanMapper extends BaseMapper<Plan>{

	/**
	 * 上课模块引用plan
	 * 
	 * @return
	 */
	public List<Plan> planIdName();

}
