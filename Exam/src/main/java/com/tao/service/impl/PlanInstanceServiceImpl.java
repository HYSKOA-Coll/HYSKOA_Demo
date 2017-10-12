package com.tao.service.impl;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Service;

import com.tao.entity.PlanInstance;
import com.tao.entity.Questionp;
import com.tao.page.PageBean;
import com.tao.service.PlanInstanceService;

@Service
public class PlanInstanceServiceImpl extends BaseServiceImpl<PlanInstance> implements PlanInstanceService{

	@Override
	public List<Questionp> selectquestionp(int plan_id) {
		
		return planInstanceMapper.selectquestionp(plan_id);
	}

	@Override
	public List<PlanInstance> stuclazzend(int info_id) {
		// TODO Auto-generated method stub
		return planInstanceMapper.stuclazzend(info_id);
	}
	

}
