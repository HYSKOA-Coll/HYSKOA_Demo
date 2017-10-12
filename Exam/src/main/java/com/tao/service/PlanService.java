package com.tao.service;

import java.util.List;

import com.tao.entity.Plan;
import com.tao.entity.Questionp;

public interface PlanService extends BaseService<Plan>{

	public List<Plan> planIdName();
	
}
