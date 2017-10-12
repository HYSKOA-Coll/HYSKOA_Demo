package com.tao.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tao.entity.Major;
import com.tao.service.MajorService;

@Service
public class MajorServiceImpl extends BaseServiceImpl<Major> implements MajorService{


	@Override
	public List<Map> select_id(Major major) {
		// TODO Auto-generated method stub
		System.out.println("------MajorServiceImpl--------select_id-------");
		
		return majorMapper.select_id(major);
	}

	@Override
	public List<Map> selectbyid(int college_id) {
		// TODO Auto-generated method stub
		System.out.println("------MajorServiceImpl--------selectbyid-------");
		
		return majorMapper.selectbymid(college_id);
	}

}
