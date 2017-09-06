package com.tao.dao.daoimpl;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.tao.bean.PageBean;
import com.tao.bean.Publish;
import com.tao.bean.User;
import com.tao.dao.table.PublishTable;

public class PublishDaoImpl implements PublishTable{

	DataSource datas = new ComboPooledDataSource();
	QueryRunner runner = new QueryRunner(datas);
	
	//查询数据  封装成集合
	public List<Publish> selectPublish() throws SQLException{
		
		List<Publish> list = runner.query(select, new BeanListHandler<Publish>(Publish.class));
		
		return list;
	}
	
	/**
	 * 分页：第二步   将这个方法搭建起来----分析参数及返回值
	 * PageBean
	 * 需要传什么参数
	 *   pageNow  当前显示第几页    
	 *   pageNum  每一页显示多少条记录
	 * 需要返回什么值
	 *   data 查询到的数据集合
	 *   totalNum  总共有多少条记录
	 *   totalPage 总共有多少页  totalNum pageNum
	 * @return
	 * @throws SQLException 
	 */
	
	public void getByPage(PageBean<Publish> pb){
		
		/*
		 * 分页：第四步
		 * 方法中具体内容：
		 *  1、查询总记录数，设置给pb
		 *  2、判断pageNow是否在合理的范围内    1~totalPage
		 *  3、分页查询数据，将查询到的结果集合设置给pb
		 */
		
		String sql = "SELECT COUNT(*) FROM Publish";
		

		try {
			Long count = runner.query(sql, new ScalarHandler<Long>());
		
			System.out.println(count);
			
			//给pb设置属性   totalNum
			pb.setTotalNum(count.intValue());
		
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		
		//判断pageNow是否在合理的范围内    1~totalPage
				if(pb.getPageNow()<1){
					pb.setPageNow(1);
				}else if(pb.getPageNow()>pb.getTotalPage()){
					pb.setPageNow(pb.getTotalPage());
				}
				
				/**
				 * 每页显示3条记录
				 * 第一个？指的是从哪一条开始(0)
				 * 第一页：0,3
				 * 第二页：3,3
				 * 第三页：6,3
				 * (pageNow-1)*pageNum
				 */
				int start = (pb.getPageNow()-1)*pb.getPageNum();
				sql = "SELECT * FROM Publish LIMIT ?,?";
				try {
					List<Publish> data = runner.query(sql, new BeanListHandler<Publish>(Publish.class), start,pb.getPageNum());
				    pb.setData(data);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		
	}
	
	//通过id查询
	public List<Publish> IdSelectPublish(String pubId) throws SQLException{
		System.out.println("----PublishDaoImpl------IdSelectPublish------");
		List<Publish> list = runner.query(onselect, new BeanListHandler<Publish>(Publish.class), pubId);
		System.out.println(list);
		return list;
	}
	
	//添加数据
	public int insertPublish(Publish publish) throws SQLException {
		
		int count = runner.update(insert,publish.getTitle(),publish.getContent(),publish.getUser(),publish.getTime());
	
		return count;
}
	
	//id删除数据
	public int deletePublish(String id) throws SQLException {
		
		int count = runner.update(delete, id); 
		
		return count;
	}
	
}