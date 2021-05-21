package cn.edu.usts.cs2018.test;

import cn.edu.usts.cs2018.entity.Tour;
import cn.edu.usts.cs2018.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.*;

public class TestTourMapper
{
    public static void main(String[] args) {
        String resources = "spring/mybatis-config.xml";

        //创建流
        Reader reader = null;

        try {
            //读取mybatis config.xml到reader对象中
            reader = Resources.getResourceAsReader(resources);
        }catch (IOException e){
            e.printStackTrace();
        }

        //初始化mybatis，创建SqlSessionFactory
        SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);

        //创建Session实例
        SqlSession session = sqlMapper.openSession();
//        Tour tour=new Tour(4,"秋游","uchiha","xjl","秋天去玩",new Date(2020-1900,11-1,12),new Date(2020-1900,11-1,12));
        User user=new User(12,"cth","程天宏","cth123","0000000000","男","军阀");
//        session.insert("insertTour",tour);
        session.commit();
        Map<String,String> map=new HashMap<String, String>();
        map.put("username","cth");
        map.put("tourname","秋游");
        session.delete("deleteTourByUsernameTourname",map);
        session.commit();
    }
}
