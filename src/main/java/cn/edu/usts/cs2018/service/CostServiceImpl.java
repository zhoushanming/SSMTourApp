package cn.edu.usts.cs2018.service;

import cn.edu.usts.cs2018.dao.CostDaoImpl;
import cn.edu.usts.cs2018.dao.mapper.CostMapper;
import cn.edu.usts.cs2018.entity.Cost;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "costService")
public class CostServiceImpl implements CostMapper {


    @Resource(name = "costDao")
    CostDaoImpl dao;
    public CostDaoImpl getDao() {
        return dao;
    }

    public void setDao(CostDaoImpl dao) {
        this.dao = dao;
    }
    @Override
    public Cost findCostById(int id) {
        System.out.println("invoke findCostById...");
        return dao.findCostById(id);
    }

    @Override
    public Cost findCostByTAU(String tourname, String activityname, String username) {
        System.out.println("invoke findCostByTAU");
        return dao.findCostByTAU(tourname,activityname,username);
    }

    @Override
    public List<Cost> findCostByUsername(String username) {
        System.out.println("invoke findCostByUsername");
        return dao.findCostByUsername(username);
    }

    @Override
    public List<Cost> findCostByTAname(String tourname, String activityname) {
        System.out.println("invoke findCostByTAname...");
        return dao.findCostByTAname(tourname,activityname);
    }

    @Override
    public int insertCost(Cost cost) {
        System.out.println("invoke insertCost");
        return dao.insertCost(cost);
    }

    @Override
    public int updateCost(Cost cost) {
        System.out.println("invoke updateCost");
        return dao.updateCost(cost);
    }

    @Override
    public void deleteCost(Cost cost) {
        System.out.println("invoke deleteCost");
        dao.deleteCost(cost);
    }
}
