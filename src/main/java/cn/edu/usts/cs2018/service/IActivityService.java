package cn.edu.usts.cs2018.service;

import cn.edu.usts.cs2018.entity.Activity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IActivityService {
    public Activity findActivityById(int id);
    public List<Activity> findActivityByUsernameTourname(@Param("username,") String username, @Param("tourname") String tourname);
    public List<Activity> findActivityByTournameActivityname( @Param("tourname") String tourname,@Param("activityname") String activityname);
    public List<Activity> findActivityByTourname(String tourname);
    public int updateActivity(Activity activity);
    public int insertActivity(Activity activity);
    public void deleteActivityById(int id);
    public void deleteActivityByTourname(String tourname);
    public void deleteActivityByActivityname(String activityname);
    public void deleteActivityByActivity(Activity activity);
}
