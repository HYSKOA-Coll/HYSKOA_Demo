package com.tao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.tao.dao.AdminMapper;
import com.tao.dao.BaseMapper;
import com.tao.page.PageBean;
import com.tao.service.BaseService;

import javax.annotation.PostConstruct;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;

public class BaseServiceImpl<T> implements BaseService<T> {

    protected BaseMapper<T> baseMapper;

    @Autowired(required=false)
    protected AdminMapper adminMapper;

    @PostConstruct //在构造方法之后  初始化方法之前执行
    private void initBaseMapper() throws Exception{
        System.out.println("------------initBaseMapper---------------");
        //this关键字指对象本身，这里指的是调用此方法的实现类
        System.out.println("-----this:"+this);
        System.out.println("-----父类基本信息:"+this.getClass().getSuperclass());
        ParameterizedType type = (ParameterizedType)this.getClass().getGenericSuperclass();
        System.out.println("-----父类和泛型的基本信息:"+type);
        //获得第一个参数的class
        Class clazz = (Class) type.getActualTypeArguments()[0];
        System.out.println("clazz------"+clazz);
        //转化为属性名(相关的Mapper子类的引用名) Supplier ----- supplierMapper
        String localField = clazz.getSimpleName().substring(0,1).toLowerCase()
                +clazz.getSimpleName().substring(1)+"Mapper";
        System.out.println("-----localField:"+localField);
        //getDeclaredField 不包括父类
        Field field = this.getClass().getSuperclass().getDeclaredField(localField);
        System.out.println("------field:"+field);
        System.out.println("------field对应的对象："+field.get(this));

        Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");
        System.out.println("=======baseField:"+baseField);
        System.out.println("=======baseField对应的对象:"+baseField.get(this));

        //field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中
        baseField.set(this, field.get(this));
        System.out.println("========baseField对应的对象:"+baseMapper);
    }


    public int insert(T entity) {
        System.out.println("----------BaseServiceImpl-------insert---------------");
        return baseMapper.insert(entity);
    }

    public int update(T entity) {
        System.out.println("----------BaseServiceImpl-------update---------------");
        return baseMapper.update(entity);
    }

    public int delete(T entity) {
        System.out.println("----------BaseServiceImpl-------delete---------------");
        return baseMapper.delete(entity);
    }

    public int deleteList(String[] pks) {
        System.out.println("----------BaseServiceImpl-------deleteList---------------");
        return baseMapper.deleteList(pks);
    }

    public T select(T entity) {
        System.out.println("----------BaseServiceImpl-------select---------------");
        return baseMapper.select(entity);
    }

    public PageBean<T> selectPage(PageBean<T> page) {
        System.out.println("----------BaseServiceImpl-------selectPage---------------");
        page.setTotalRows(baseMapper.selectTotalRows(page));
        page.setDatas(baseMapper.selectPageList(page));
        return page;
    }

    public int selectMaxId() {
        System.out.println("----------BaseServiceImpl-------selectMaxId---------------");
        return baseMapper.selectMaxId();
    }
}
