package com.tao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.tao.dao.UserMapper;
import com.tao.dao.BaseMapper;
import com.tao.dao.ClazzMapper;
import com.tao.dao.CollegeMapper;
import com.tao.dao.InfoMapper;
import com.tao.dao.InstanceAnswerMapper;
import com.tao.dao.MajorMapper;
import com.tao.dao.MediaMapper;
import com.tao.dao.PlanInstanceMapper;
import com.tao.dao.PlanMapper;
import com.tao.dao.QuestionMapper;
import com.tao.dao.QuestionpMapper;
import com.tao.dao.TeacherMapper;
import com.tao.page.PageBean;
import com.tao.service.BaseService;

import javax.annotation.PostConstruct;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public class BaseServiceImpl<T> implements BaseService<T> {

    protected BaseMapper<T> baseMapper;


    @Autowired
    protected UserMapper userMapper;
    @Autowired
    protected TeacherMapper teacherMapper;
    @Autowired
    protected InfoMapper infoMapper;
    @Autowired
    protected CollegeMapper collegeMapper;
    @Autowired
    protected MajorMapper majorMapper;
    @Autowired
    protected ClazzMapper clazzMapper;
    @Autowired
    protected MediaMapper mediaMapper;
    @Autowired
    protected QuestionpMapper questionpMapper;
    @Autowired
    protected QuestionMapper questionMapper;
    @Autowired
    protected PlanMapper planMapper;
    @Autowired
    protected PlanInstanceMapper planInstanceMapper;
    @Autowired
    protected InstanceAnswerMapper instanceAnswerMapper;

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

    public int updatePwd(T entity) {
        System.out.println("----------BaseServiceImpl-------update---------------");
        return baseMapper.updatePwd(entity);
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
    
    public T selectpwd(T entity) {
        System.out.println("----------BaseServiceImpl-------selectpwd---------------");
        return baseMapper.selectpwd(entity);
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
    
	@Override
	public List<T> selectList(List<T> list) {
		// TODO Auto-generated method stub
		System.out.println();
		return baseMapper.selectList(list);
	}

}
