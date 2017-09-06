package com.tao.dao.daoimpl;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.tao.bean.Publish;
import com.tao.bean.Reply;
import com.tao.dao.table.ReplyTable;

public class ReplyDaoImpl implements ReplyTable{

	DataSource datas = new ComboPooledDataSource();
	QueryRunner runner = new QueryRunner(datas);
	
	//添加数据
	
	public int insertReply(Reply reply) throws SQLException {
		
		int count = runner.update(insert,reply.getId(),reply.getReplies(),reply.getUser(),reply.getTime());
		return count;
	}
	
	//id查询数据
	public List<Reply> idselectReply(String id) throws SQLException{
		List<Reply> replylist = runner.query(idselect, new BeanListHandler<Reply>(Reply.class), id);
		
		return replylist;
	}
	
	//id删除数据
	public int iddeleteReply(String rep_id) throws SQLException{
		
		int count = runner.update(iddelete, rep_id);
		System.out.println("iddeleteReply"+count);
		return count;
	}
	
	//查询数据
	public List<Reply> selectReply() throws SQLException{
		
		List<Reply> list = runner.query(select, new BeanListHandler<Reply>(Reply.class));
		
		return list;
	}
}
