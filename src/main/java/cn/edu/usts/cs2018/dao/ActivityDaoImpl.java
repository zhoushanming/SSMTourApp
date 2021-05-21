package cn.edu.usts.cs2018.dao;

import cn.edu.usts.cs2018.dao.mapper.ActivityMapper;
import cn.edu.usts.cs2018.entity.Activity;
import cn.edu.usts.cs2018.entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository(value = "activityDao")
public class ActivityDaoImpl implements ActivityMapper {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    public SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
    @Override
    public Activity findActivityById(int id) {
        SqlSession openSession = sqlSessionFactory.openSession();
        Activity activity=openSession.selectOne("findActivityById",id);
        return activity;
    }

    @Override
    public List<Activity> findActivityByTourname(String tourname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        List<Activity> list=openSession.selectList("findActivityByTourname",tourname);
        return list;
    }

    @Override
    public List<Activity> findActivityByUsernameTourname(String username, String tourname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        Map<String,String> map=new HashMap<String, String>();
        map.put("username",username);
        map.put("tourname",tourname);
        List<Activity> activity=openSession.selectList("findActivityByUsernameTourname",map);
        return activity;
    }

    @Override
    public List<Activity> findActivityByTournameActivityname(String tourname, String activityname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        Map<String,String> map=new HashMap<String, String>();

        map.put("tourname",tourname);
        map.put("activityname",activityname);
        List<Activity> activity=openSession.selectList("findActivityByTournameActivityname",map);
        return activity;
    }

    @Override
    public int updateActivity(Activity activity) {
        SqlSession openSession = sqlSessionFactory.openSession();

        int result=openSession.update("updateActivity",activity);

        return result;
    }

    @Override
    public int insertActivity(Activity activity) {
        int result;
        SqlSession openSession = sqlSessionFactory.openSession();
        try {
            result=openSession.insert("insertActivity",activity);
            openSession.commit();
        }catch (Exception e)
        {
            result=-1;
        }

        return result;
    }

    @Override
    public void deleteActivityById(int id) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteActivityById",id);
    }

    @Override
    public void deleteActivityByTourname(String tourname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteActivityByTourname",tourname);
    }

    @Override
    public void deleteActivityByActivityname(String activityname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteActivityByActivityname",activityname);
    }

    @Override
    public void deleteActivityByActivity(Activity activity) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteActivityByActivity",activity);
    }
}
