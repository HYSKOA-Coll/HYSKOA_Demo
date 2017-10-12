package com.tao.dao;

import java.util.List;
import java.util.Map;

import com.tao.entity.College;

public interface CollegeMapper extends BaseMapper<College>{

	public List<Map> select_list(College college);
}
