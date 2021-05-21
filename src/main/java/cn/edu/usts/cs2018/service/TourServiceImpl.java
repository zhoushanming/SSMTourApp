package cn.edu.usts.cs2018.service;

import cn.edu.usts.cs2018.dao.TourDaoImpl;
import cn.edu.usts.cs2018.entity.Tour;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service(value = "tourService")
public class TourServiceImpl implements ITourService{
    @Resource(name = "tourDao")
    TourDaoImpl dao;

    public TourDaoImpl getDao() {
        return dao;
    }

    public void setDao(TourDaoImpl dao) {
        this.dao = dao;
    }

    @Override
    public int insertTour(Tour tour) {
        System.out.println("invoke insertTour...");

        return dao.insertTour(tour);
    }

    @Override
    public List<Tour> findTourByTourname(String tourname) {
        System.out.println("invoke findTourByTourname...");
        return dao.findTourByTourname(tourname);
    }

    @Override
    public List<Tour> findTourByUsername(String username) {
        System.out.println("invoke findTourByUsername...");
        return dao.findTourByUsername(username);
    }

    @Override
    public List<Tour> findTourByLeader(String leader) {
        System.out.println("invoke findTourByLeader....");
        return dao.findTourByLeader(leader);
    }

    @Override
    public Tour findTourById(int id) {
        System.out.println("invoke findTourById...");

        return dao.findTourById(id);
    }

    @Override
    public int updateTour(Tour tour)
    {
        System.out.println("invoke updateTour...");
        return dao.updateTour(tour);
    }

    @Override
    public void deleteTourById(int id) {
        System.out.println("invoke deleteTourById...");
        dao.deleteTourById(id);
    }

    @Override
    public void deleteTourByTourname(String tourname) {
        System.out.println("invoke deleteTourByTourname");
        dao.deleteTourByTourname(tourname);
    }

    @Override
    public void deleteTourByLeader(String leader) {
        System.out.println("invoke deleteTourByLeader...");
        dao.deleteTourByLeader(leader);

    }

    @Override
    public void deleteTourByUsernameTourname(String username, String tourname) {
        System.out.println("invoke deleteTourByUsernameTourname...");
        dao.deleteTourByUsernameTourname(username,tourname);
    }

    @Override
    public List<Tour> findAllTour() {
        System.out.println("invoke find all tours...");
        List<Tour> list=dao.findAllTour();
        return list;
    }
}
