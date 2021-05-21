package cn.edu.usts.cs2018.dao.mapper;

import cn.edu.usts.cs2018.entity.Tour;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface TourMapper
{
   public int insertTour(Tour tour);

   public List<Tour> findTourByTourname(String tourname);
   public List<Tour> findTourByUsername(String username);
   public List<Tour> findTourByLeader(String leader);
   public List<Tour> findAllTour();

   public Tour findTourById(int id);

   public int updateTour(Tour tour);

   public void deleteTourById(int id);
   public void deleteTourByTourname(String tourname);
   public void deleteTourByLeader(String leader);
   public void deleteTourByUsernameTourname(@Param("username") String username,@Param("tourname") String tourname);
}
