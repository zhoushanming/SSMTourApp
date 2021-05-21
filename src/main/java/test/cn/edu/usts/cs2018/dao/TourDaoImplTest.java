/*
package test.cn.edu.usts.cs2018.dao;

import cn.edu.usts.cs2018.dao.TourDaoImpl;
import cn.edu.usts.cs2018.entity.Tour;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

*/
/**
* TourDaoImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>06/03/2020</pre> 
* @version 1.0 
*//*

public class TourDaoImplTest { 

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
* Method: insertTour(Tour tour) 
* 
*//*

@Test
public void testInsertTour() throws Exception { 
//TODO: Test goes here...
    ApplicationContext act =
            new ClassPathXmlApplicationContext("applicationContext.xml");

    Tour tour=new Tour(5,"冬游","uchiha","uchiha","冬天出去玩",new Date(2020-1900,13-1,25),new Date(2020-1900,13-1,28));
    TourDaoImpl dao=(TourDaoImpl)act.getBean("tourDao");
    int i=dao.insertTour(tour);
    System.out.println(i);
}


*/
/**
* 
* Method: findTourByTourname(String tourname) 
* 
*//*

@Test
public void testFindTourByTourname() throws Exception { 
//TODO: Test goes here...
    ApplicationContext act =
            new ClassPathXmlApplicationContext("applicationContext.xml");

//    Tour tour=new Tour(5,"冬游","uchiha","uchiha","冬天出去玩",new Date(2020-1900,13-1,25),new Date(2020-1900,13-1,28));
    TourDaoImpl dao=(TourDaoImpl)act.getBean("tourDao");
    List<Tour> tour=dao.findTourByTourname("春游");
    for (Tour tou: tour
         ) {
        System.out.println(tou.toString());

    }

} 

*/
/**
* 
* Method: findTourByUsername(String username) 
* 
*//*

@Test
public void testFindTourByUsername() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: findTourByLeader(String leader) 
* 
*//*

@Test
public void testFindTourByLeader() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: findTourById(int id) 
* 
*//*

@Test
public void testFindTourById() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: updateTour(Tour tour) 
* 
*//*

@Test
public void testUpdateTour() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: deleteTourById(int id) 
* 
*//*

@Test
public void testDeleteTourById() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: deleteTourByTourname(String tourname) 
* 
*//*

@Test
public void testDeleteTourByTourname() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: deleteTourByLeader(String leader) 
* 
*//*

@Test
public void testDeleteTourByLeader() throws Exception { 
//TODO: Test goes here... 
} 

*/
/**
* 
* Method: deleteTourByUsernameTourname(String username, String tourname) 
* 
*//*

@Test
public void testDeleteTourByUsernameTourname() throws Exception {
    ApplicationContext act =
            new ClassPathXmlApplicationContext("applicationContext.xml");

    Tour tour=new Tour(5,"冬游","uchiha","uchiha","冬天出去玩",new Date(2020-1900,13-1,25),new Date(2020-1900,13-1,28));
    TourDaoImpl dao=(TourDaoImpl)act.getBean("tourDao");
    dao.deleteTourByUsernameTourname("xjl","春游");
//TODO: Test goes here... 
}



} 
*/
