package com.tao.service;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;

import com.tao.entity.PlanInstance;
import com.tao.entity.Questionp;
import com.tao.page.PageBean;

public interface PlanInstanceService extends BaseService<PlanInstance>{

		public List<Questionp> selectquestionp(int plan_id);
		
		public List<PlanInstance> stuclazzend(int info_id);
		
}
