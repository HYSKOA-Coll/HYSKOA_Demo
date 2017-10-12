package com.tao.dao;


import java.util.List;

import com.tao.entity.Clazz;
import com.tao.entity.College;
import com.tao.entity.Info;
import com.tao.entity.Major;
import com.tao.page.PageBean;

public interface InfoMapper extends BaseMapper<Info>{

	public int updatepwd(Info info);
	
	public List<Major> selectMajorList(Major m);

	public List<Clazz> selectClazzList(Clazz clazz); 
	
	public List<College> selectCollegeList();
	
	
}
