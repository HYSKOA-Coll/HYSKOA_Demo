package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.entity.Plan;
import com.tao.entity.Questionp;
import com.tao.service.PlanService;

@Service
public class PlanServiceImpl extends BaseServiceImpl<Plan> implements PlanService{

	@Override
	public List<Plan> planIdName() {
		// TODO Auto-generated method stub
		return planMapper.planIdName();
	}

}
