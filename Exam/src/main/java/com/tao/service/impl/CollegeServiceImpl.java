package com.tao.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tao.entity.College;
import com.tao.service.CollegeService;

@Service
public class CollegeServiceImpl extends BaseServiceImpl<College> implements CollegeService{

	@Override
	public List<Map> select_list(College college) {
		System.out.println("------ServiceImpl--------select_list-------");
		return collegeMapper.select_list(college);
	}

	@Override
	public List<Map> selectbymid(int major_id) {
		// TODO Auto-generated method stub
		return majorMapper.selectbymid(major_id);
	}
}
