package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.entity.Info;
import com.tao.entity.InstanceAnswer;
import com.tao.service.InstanceAnswerService;

@Service
public class InstanceAnswerServiceImpl extends BaseServiceImpl<InstanceAnswer> implements InstanceAnswerService{

	@Override
	public int addinstanceAnswer(InstanceAnswer instanceAnswer) {
		
		List<Info> listInfo = instanceAnswerMapper.selectInfo(instanceAnswer.getClazz_id());
		System.out.println("listInfo------"+listInfo);
		
		for (Info info : listInfo) {
		instanceAnswer.setInfo_id(info.getInfo_id());
		int count = instanceAnswerMapper.addAnswer(instanceAnswer);
		System.out.println("count--------"+count);
		}
		
		return 0;
	}

}
