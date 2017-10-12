package com.tao.service;

import java.util.List;
import java.util.Map;

import com.tao.entity.Major;

public interface MajorService extends BaseService<Major>{
	public List<Map> select_id(Major major);
	public List<Map> selectbyid(int college_id);
}
