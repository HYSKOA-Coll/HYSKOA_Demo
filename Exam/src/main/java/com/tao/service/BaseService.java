package com.tao.service;

import com.tao.page.PageBean;

public interface BaseService <T>{

    //修改单个对象
    public int update(T entity);

    //删除单个对象
    public int delete(T entity);

    //通过主键（数组）批量删除
    public int deleteList(String[] pks);

    //查询单个对象
    public T select(T entity);
    
    //分页查询
    PageBean<T> selectPage(PageBean<T> page);

    //获取最大id值
    int selectMaxId();
}
