package com.tao.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tao.entity.Clazz;
import com.tao.entity.Major;
import com.tao.service.ClazzService;

@Service
public class ClazzServiceImpl extends BaseServiceImpl<Clazz> implements ClazzService{

	@Override
	public List<Map> select_mid(Clazz clazz) {
		// TODO Auto-generated method stub
		System.out.println("------ClazzServiceImpl--------select_mid-------");
		
		return clazzMapper.select_mid(clazz);
	}

	@Override
	public List<Map> selectmid(int clazz_id) {
		// TODO Auto-generated method stub
		return clazzMapper.selectmid(clazz_id);
		}

	@Override
	public List<Clazz> clazzIdName() {
		// TODO Auto-generated method stub
		return clazzMapper.clazzIdName();
	}
	}


