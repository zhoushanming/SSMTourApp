package cn.edu.usts.cs2018.dao;

import cn.edu.usts.cs2018.dao.mapper.UsersMapper;
import cn.edu.usts.cs2018.entity.Activity;
import cn.edu.usts.cs2018.entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
@Repository(value = "userDao")
public class UserDaoImpl implements UsersMapper
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
    public User findUserById(Integer id) {
        SqlSession openSession = sqlSessionFactory.openSession();
        User user=openSession.selectOne("findUserById",id);
        return user;
    }

    @Override
    public User findUserByName(String username) {
        SqlSession openSession = sqlSessionFactory.openSession();
        User user=openSession.selectOne("findUserByName",username);
        return user;

    }

    @Override
    public int insertUser(User user) {
        int result;
        SqlSession openSession = sqlSessionFactory.openSession();
        try {
            result=openSession.insert("insertUser",user);
            openSession.commit();
        }catch (Exception e)
        {
            e.printStackTrace();
            result=-1;
        }

        return result;
    }

    @Override
    public int updateUser(User user) {

        SqlSession openSession = sqlSessionFactory.openSession();

        int result=openSession.update("updateUser",user);

        return result;
    }

    @Override
    public void deleteUserById(int id) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteUserById",id);

    }

    @Override
    public void deleteUserByName(String username) {
        SqlSession openSession = sqlSessionFactory.openSession();
        openSession.delete("deleteUserByName",username);
    }

    @Override
    public List<Activity> findActivity(String username) {
        List<Activity> list;
        SqlSession openSession = sqlSessionFactory.openSession();
        list=openSession.selectList("findActivity",username);
        return null;
    }
}
