package com.tao.dao;

import java.util.List;

import com.tao.page.PageBean;

public interface BaseMapper<T> {

	//添加单个对象
		public int insert(T entity);
		
		//修改单个对象
		public int update(T entity);
		
		//删除单个对象
		public int delete(T entity);
		
		//通过主键（数组）批量删除
		public int deleteList(String[] pks);
		
		//查询单个对象
		public T select(T entity);
		
		//分页查询数据集
		List<T> selectPageList(PageBean<T> page);
		
		//用于分页查询总记录数
		int selectTotalRows(PageBean<T> page);
		
		//获取最大id值
		int selectMaxId();
		
}
