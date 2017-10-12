package com.tao.dao;

import java.util.List;
import java.util.Map;

import com.tao.entity.Clazz;

public interface ClazzMapper extends BaseMapper<Clazz>{
	public List<Map> select_mid(Clazz clazz);
	public List<Map> selectmid(int major_id);
	
	/**
	 * 上课模块引用clazz
	 */
	public List<Clazz> clazzIdName();
}
