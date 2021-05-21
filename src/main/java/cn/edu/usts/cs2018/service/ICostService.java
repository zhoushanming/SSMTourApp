package cn.edu.usts.cs2018.service;

import cn.edu.usts.cs2018.entity.Cost;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICostService {
    public Cost findCostById(int id);
    public Cost findCostByTAU(@Param("tourname") String tourname, @Param("activityname") String activityname, @Param("username") String username);
    public List<Cost> findCostByTAname(@Param("tourname") String tourname, @Param("activityname") String activityname);
    public List<Cost> findCostByUsername(String username);
    public int insertCost(Cost cost);
    public int updateCost(Cost cost);

    public void deleteCost(Cost cost);
}
