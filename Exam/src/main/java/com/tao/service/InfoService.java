package com.tao.service;

import java.util.List;

import com.tao.entity.Clazz;
import com.tao.entity.College;
import com.tao.entity.Info;
import com.tao.entity.Major;
import com.tao.page.PageBean;

public interface InfoService extends BaseService<Info>{

	public int updatepwd(Info info);

	public List<Major> selectMajorList(Major m);

	public List<Clazz> selectClazzList(Clazz clazz);


	public List<College> selectCollegeList(); 
	
	
}
