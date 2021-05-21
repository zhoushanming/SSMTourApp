/*
package test.cn.edu.usts.cs2018.dao;

import cn.edu.usts.cs2018.dao.UserDaoImpl;
import cn.edu.usts.cs2018.dao.mapper.UsersMapper;
import cn.edu.usts.cs2018.entity.User;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

*/
/**
* UserDaoImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>06/03/2020</pre> 
* @version 1.0 
*//*

public class UserDaoImplTest { 

@Before
public void before() throws Exception {


} 

@After
public void after() throws Exception { 
} 

*/
/**
* 
* Method: getSqlSessionFactory() 
* 
*//*

@Test
public void testGetSqlSessionFactory() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) 
* 
*//*

@Test
public void testSetSqlSessionFactory() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: findUserById(Integer id) 
* 
*//*

@Test
public void testFindUserById() throws Exception {
    ApplicationContext act =
            new ClassPathXmlApplicationContext("applicationContext.xml");
    UsersMapper dao=(UserDaoImpl)act.getBean("userDao");
    User user=dao.findUserById(21);
    if(user!=null)
    {
        System.out.println(user.toString());
    }else {
        System.out.println("null");
    }

//TODO: Test goes here... 
} 

*/
/**
* 
* Method: findUserByName(String username) 
* 
*//*

@Test
public void testFindUserByName() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: insertUser(User user) 
* 
*//*

@Test
public void testInsertUser() throws Exception { 
//TODO: Test goes here...
    ApplicationContext act =
            new ClassPathXmlApplicationContext("applicationContext.xml");
    UsersMapper dao=(UserDaoImpl)act.getBean("userDao");
    User user=new User(24,"uuu","13","123","11111111","nan","12");
    System.out.println(dao.insertUser(user));
} 

*/
/**
* 
* Method: updateUser(User user) 
* 
*//*

@Test
public void testUpdateUser() throws Exception { 
//TODO: Test goes here...
    ApplicationContext act =
            new ClassPathXmlApplicationContext("applicationContext.xml");
    UsersMapper dao=(UserDaoImpl)act.getBean("userDao");
    User user=new User("xjl111","许静雷","dxl666","???????????","男","异人");
    int i=dao.updateUser(user);
    System.out.println(i);
} 

*/
/**
* 
* Method: deleteUserByid(int id) 
* 
*//*

@Test
public void testDeleteUserByid() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: deleteUserByName(String username) 
* 
*//*

@Test
public void testDeleteUserByName() throws Exception { 
//TODO: Test goes here...
    ApplicationContext act =
            new ClassPathXmlApplicationContext("applicationContext.xml");
    UsersMapper dao=(UserDaoImpl)act.getBean("userDao");
    dao.deleteUserById(4444);
} 

*/
/**
* 
* Method: findActivity(String username) 
* 
*//*

@Test
public void testFindActivity() throws Exception { 
//TODO: Test goes here... 
} 


} 
*/
