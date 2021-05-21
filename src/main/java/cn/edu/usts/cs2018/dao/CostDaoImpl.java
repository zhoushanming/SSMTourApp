package cn.edu.usts.cs2018.dao;

import cn.edu.usts.cs2018.dao.mapper.CostMapper;
import cn.edu.usts.cs2018.entity.Cost;
import cn.edu.usts.cs2018.entity.Tour;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Repository(value = "costDao")
public class CostDaoImpl implements CostMapper {
    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    public SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    @Override
    public Cost findCostById(int id) {
        SqlSession openSession = sqlSessionFactory.openSession();
        Cost cost=openSession.selectOne("findCostById",id);

        return cost;
    }

    @Override
    public Cost findCostByTAU(String tourname, String activityname, String username) {
        SqlSession openSession = sqlSessionFactory.openSession();
        Map<String,String> map=new HashMap<String, String>();
        map.put("tourname",tourname);
        map.put("activityname",activityname);
        map.put("username",username);
        Cost cost=openSession.selectOne("findCostByTAU",map);
        return cost;
    }

    @Override
    public List<Cost> findCostByUsername(String username) {
        SqlSession openSession = sqlSessionFactory.openSession();
        List<Cost> list=openSession.selectList("findCostByUsername",username);

        return list;
    }

    @Override
    public List<Cost> findCostByTAname(String tourname, String activityname) {
        SqlSession openSession = sqlSessionFactory.openSession();
        Map<String,String> map=new HashMap<String, String>();
        map.put("tourname",tourname);
        map.put("activityname",activityname);

        List<Cost> cost=openSession.selectList("findCostByTAname",map);
        return cost;
    }

    @Override
    public int insertCost(Cost cost) {
        int result;
        SqlSession openSession = sqlSessionFactory.openSession();
        try {
            result=openSession.insert("insertCost",cost);
            openSession.commit();
        }catch (Exception e)
        {
            result=-1;
        }

        return result;
    }

    @Override
    public int updateCost(Cost cost) {
        SqlSession openSession = sqlSessionFactory.openSession();

        int result=openSession.update("updateCost",cost);

        return result;
    }

    @Override
    public void deleteCost(Cost cost) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteCost",cost);
    }
}
