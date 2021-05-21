package cn.edu.usts.cs2018.test;

import cn.edu.usts.cs2018.dao.mapper.UsersMapper;
import cn.edu.usts.cs2018.entity.Activity;
import cn.edu.usts.cs2018.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

public class TsetUserMapper
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

        User user=session.selectOne("findUserById",24);

        List<Activity> ls=session.selectList("findActivity",user);
        System.out.println(ls.size());
        session.commit();

    }
}
