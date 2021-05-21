package cn.edu.usts.cs2018.service;

import cn.edu.usts.cs2018.entity.Tour;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ITourService {
    public int insertTour(Tour tour);

    public List<Tour> findTourByTourname(String tourname);
    public List<Tour> findTourByUsername(String username);
    public List<Tour> findTourByLeader(String leader);
    public Tour findTourById(int id);

    public int updateTour(Tour tour);

    public void deleteTourById(int id);
    public void deleteTourByTourname(String tourname);
    public void deleteTourByLeader(String leader);
    public void deleteTourByUsernameTourname(@Param("username") String username, @Param("tourname") String tourname);
    public List<Tour> findAllTour();
}
