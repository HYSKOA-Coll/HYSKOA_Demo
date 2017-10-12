package com.tao.dao;

import java.util.List;
import java.util.Map;

import com.tao.entity.Major;

public interface MajorMapper extends BaseMapper<Major>{

	public List<Map> select_id(Major major);
	public List<Map> selectbymid(int college_id);
}
