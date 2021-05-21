package cn.edu.usts.cs2018.service;

import cn.edu.usts.cs2018.dao.ActivityDaoImpl;
import cn.edu.usts.cs2018.dao.mapper.ActivityMapper;
import cn.edu.usts.cs2018.entity.Activity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service(value = "activityService")
public class ActivityServiceImpl implements ActivityMapper {
    @Resource(name = "activityDao")
    ActivityDaoImpl dao;
    public ActivityDaoImpl getDao() {
        return dao;
    }

    public void setDao(ActivityDaoImpl dao) {
        this.dao = dao;

    }


    @Override
    public Activity findActivityById(int id) {
        System.out.println("invoke findActivityById...");
        return dao.findActivityById(id);
    }

    @Override
    public List<Activity> findActivityByTourname(String tourname) {
        System.out.println("invoke findActivityByTourname...");

        return dao.findActivityByTourname(tourname);
    }

    @Override
    public List<Activity> findActivityByUsernameTourname(String username, String tourname) {
        System.out.println("invoke findActivityByUsernameTourname...");

        return dao.findActivityByUsernameTourname(username,tourname);
    }

    @Override
    public List<Activity> findActivityByTournameActivityname(String tourname, String activityname) {
        System.out.println("invoke findActivityByTournameActivityname...");

        return dao.findActivityByTournameActivityname(tourname,activityname);
    }

    @Override
    public int updateActivity(Activity activity) {
        System.out.println("invoke updateActivity...");
        return dao.updateActivity(activity);
    }

    @Override
    public int insertActivity(Activity activity) {
        System.out.println("invoke insertActivity...");
        return dao.insertActivity(activity);
    }

    @Override
    public void deleteActivityById(int id) {
        System.out.println("invoke deleteActivityById...");
        dao.deleteActivityById(id);
    }

    @Override
    public void deleteActivityByTourname(String tourname) {
        System.out.println("invoke deleteActivityByTourname...");
        dao.deleteActivityByTourname(tourname);
    }

    @Override
    public void deleteActivityByActivityname(String activityname) {
        System.out.println("invoke deleteActivityByActivityname");
        dao.deleteActivityByActivityname(activityname);
    }

    @Override
    public void deleteActivityByActivity(Activity activity) {
        System.out.println("invoke deleteActivityByActivity.....");
        dao.deleteActivityByActivity(activity);
    }
}
