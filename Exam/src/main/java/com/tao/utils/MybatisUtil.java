package com.tao.utils;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MybatisUtil {
    private static final String XML_PATH = "mybatis_config.xml";
    private static SqlSessionFactory factory;

    static{
        Reader reader = null;
        try {
            reader = Resources.getResourceAsReader(XML_PATH);
            factory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    public static SqlSessionFactory getFactory(){
        return factory;
    }

    public static SqlSession getSqlSession(){
        return factory.openSession();
    }

    public static void closeSqlSession(SqlSession session){
        if (session!=null){
            session.close();
        }
    }
}
