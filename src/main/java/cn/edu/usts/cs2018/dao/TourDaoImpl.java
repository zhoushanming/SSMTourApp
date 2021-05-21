package cn.edu.usts.cs2018.dao;

import cn.edu.usts.cs2018.dao.mapper.TourMapper;
import cn.edu.usts.cs2018.entity.Tour;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository(value = "tourDao")
public class TourDaoImpl implements TourMapper
{
    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    public SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    @Override
    public int insertTour(Tour tour) {
        int result;
        SqlSession openSession = sqlSessionFactory.openSession();
        try {
            result=openSession.insert("insertTour",tour);
            openSession.commit();
        }catch (Exception e)
        {
            result=-1;
        }

        return result;

    }

    @Override
    public List<Tour> findTourByTourname(String tourname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        List<Tour> tour=openSession.selectList("findTourByTourname",tourname);
        return tour;
    }

    @Override
    public List<Tour> findTourByUsername(String username) {
        SqlSession openSession = sqlSessionFactory.openSession();
        List<Tour> tour=openSession.selectList("findTourByUsername",username);
        return tour;
    }

    @Override
    public List<Tour> findTourByLeader(String leader) {
        SqlSession openSession = sqlSessionFactory.openSession();
        List<Tour> tour=openSession.selectList("findTourByLeader",leader);
        return tour;
    }

    @Override
    public List<Tour> findAllTour() {
        SqlSession openSession = sqlSessionFactory.openSession();
        List<String> list=openSession.selectList("findAllTour");
        List<Tour> re=new ArrayList<Tour>();
        Tour tour;
        for (int i = 0; i <list.size() ; i++) {
            tour=findTourByTourname(list.get(i)).get(0);
            re.add(tour);
        }
        return re;
    }




    @Override
    public Tour findTourById(int id) {
        SqlSession openSession = sqlSessionFactory.openSession();
        Tour tour=openSession.selectOne("findTourById",id);
        return tour;
    }

    @Override
    public int updateTour(Tour tour) {
        SqlSession openSession = sqlSessionFactory.openSession();

        int result=openSession.update("updateTour",tour);

        return result;

    }

    @Override
    public void deleteTourById(int id) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteTourById",id);
    }

    @Override
    public void deleteTourByTourname(String tourname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteTourByTourname",tourname);
    }

    @Override
    public void deleteTourByLeader(String leader) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteTourByLeader",leader);
    }

    @Override
    public void deleteTourByUsernameTourname(String username, String tourname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        Map<String,String> map=new HashMap<String, String>();
        map.put("username",username);
        map.put("tourname",tourname);
        openSession.delete("deleteTourByUsernameTourname",map);
    }
}
