package com.tao.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.tao.entity.PageBean;
import com.tao.entity.Publish;
import com.tao.util.jdbcUtils;

/**
 * 
 * @author hyskoa
 *		发布房源Dao层
 */
public class PublishDao {

	public QueryRunner runner = new QueryRunner(jdbcUtils.getDataSource());
	
/*	
	 * 查询Publish  所有的list
	 
	
	public List<Publish> selectlist(String sql) throws SQLException{
		
		List<Publish> list = runner.query(sql,  new BeanListHandler<Publish>(Publish.class));
		
		return list;
	}*/
	
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
	
	public List<Publish> getByPage(PageBean<Publish> pb,int rentmin,int rentmax,int room) throws SQLException{
		
		/**
		 * 分页：第四步
		 * 方法中具体内容：
		 *  1、查询总记录数，设置给pb
		 *  2、判断pageNow是否在合理的范围内    1~totalPage
		 *  3、分页查询数据，将查询到的结果集合设置给pb
		 */
		
		String sql = "SELECT COUNT(*) FROM Publish";
		

		try {
			Long count = runner.query(sql, new ScalarHandler<Long>());
		
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
			 /*String sql = "select id, name,aname,hroom,hhall,hwei,hrice,fthis,fall,rent,title,hsay, picture,time,position,divice,genre from Publish where 1=1";*/	
				
				sql = "SELECT * FROM Publish where 1=1";
				
				if(rentmin != 0) {
					
					sql += " and rent >="+rentmin;
					System.out.println(sql);
					}
					if(rentmax != 0) {
						
						sql +=" and rent <"+rentmax;
						System.out.println(sql);
					}
					if(room != 0) {
						sql += " and hroom="+room;
						System.out.println(sql);
						
					}
					
					sql += " LIMIT ?,?";
					System.out.println(sql);
		
				return runner.query(sql, new BeanListHandler<Publish>(Publish.class), start,pb.getPageNum());
		
	}
	
	
	/*
	 * 通过id查询详情页
	 */
	
	public Publish selectid(int id) throws SQLException {
	
		String sql = "select * from Publish where id=?";
		
		Publish publish = runner.query(sql, new BeanHandler<Publish>(Publish.class), id);
		
		return publish;
	}
	
	
	//添加Publish list

	public int insertlist(Object[] param) throws SQLException {
		
		String sql = "insert into Publish (name,aname,hroom,hhall,hwei,hrice,fthis,fall,rent,title,hsay,picture,time,position,divice,genre) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		return runner.update(sql, param);
	}
	
}
