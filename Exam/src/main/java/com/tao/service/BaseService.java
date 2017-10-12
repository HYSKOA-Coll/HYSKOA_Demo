package com.tao.service;

import java.util.List;

import com.tao.page.PageBean;

public interface BaseService <T>{

    //添加单个对象
    public int insert(T entity);
	
    //修改单个对象
    public int update(T entity);
    
    //修改单个对象
    public int updatePwd(T entity);

    //删除单个对象
    public int delete(T entity);

    //通过主键（数组）批量删除
    public int deleteList(String[] pks);

    //查询单个对象
    public T select(T entity);
    
    //查询单个对象
    public T selectpwd(T entity);
    
    //分页查询
    PageBean<T> selectPage(PageBean<T> page);

    //获取最大id值
    int selectMaxId();
    
    //查询全部对象
    List<T> selectList(List<T> list);
}
