package cn.edu.usts.cs2018.test;

import cn.edu.usts.cs2018.entity.Activity;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test
{
    public static void main(String[] args) {
        Activity activity=new Activity("1","1","1","1");
        System.out.println(activity.getId());
    }
}
