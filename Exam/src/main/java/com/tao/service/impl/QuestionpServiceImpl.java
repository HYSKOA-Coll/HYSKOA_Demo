package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.entity.Question;
import com.tao.entity.Questionp;
import com.tao.service.QuestionpService;

@Service
public class QuestionpServiceImpl extends BaseServiceImpl<Questionp> implements QuestionpService{

	@Override
	public int delete(int packet_id) {
		//同时删除题目库和题目，在sevice定义同时调用两个sql，两个成功则成功，其一失败则回滚失败（事务机制）
			questionMapper.delete(packet_id);
			questionpMapper.delete(packet_id);
		return 0;
	}

/*
 * 	(non-Javadoc)
 * @see com.tao.service.QuestionpService#insert(com.tao.entity.Questionp, java.util.List)
 * 	questionpMapper.questionId 查询数据库是否存在该packet_name 存在返回0
 * 	super.insert(questionp);	插入题库信息
 */
	@Override
	public int insert(Questionp questionp, List<Question> questionlist) {
		Integer id = questionpMapper.questionId(questionp.getPacket_name());
		if(id !=null && id>0) {
			return 0;
		}
		
		super.insert(questionp);
		
		for (Question question : questionlist) {
			System.out.println("-----QuestionpServiceImpl-----------"+questionp.getPacket_id());
			
			question.setPacket_id(questionp.getPacket_id());
			
			questionMapper.insertlist(question);
			
		}
		
		return 1;
	}

	
}
