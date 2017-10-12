package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.entity.Clazz;
import com.tao.entity.College;
import com.tao.entity.Info;
import com.tao.entity.Major;
import com.tao.page.PageBean;
import com.tao.service.InfoService;

@Service
public class InfoServiceImpl extends BaseServiceImpl<Info> implements InfoService{

	public int updatepwd(Info info) {
        System.out.println("----------BaseServiceImpl-------update---------------");
        return infoMapper.updatepwd(info);
    }


	@Override
	public List<Major> selectMajorList(Major m) {
		// TODO Auto-generated method stub
		return infoMapper.selectMajorList(m);
	}



	@Override
	public List<College> selectCollegeList() {
		// TODO Auto-generated method stub
		return infoMapper.selectCollegeList();
	}


	@Override
	public List<Clazz> selectClazzList(Clazz clazz) {
		// TODO Auto-generated method stub
		return infoMapper.selectClazzList(clazz);
	}


}
