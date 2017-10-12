package com.tao.service;

import java.util.List;
import java.util.Map;

import com.tao.entity.College;

public interface CollegeService extends BaseService<College>{

	public List<Map> select_list(College college);
	public List<Map> selectbymid(int major_id);

}