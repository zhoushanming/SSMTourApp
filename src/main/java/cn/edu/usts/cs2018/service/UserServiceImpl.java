package cn.edu.usts.cs2018.service;

import cn.edu.usts.cs2018.dao.UserDaoImpl;
import cn.edu.usts.cs2018.entity.Activity;
import cn.edu.usts.cs2018.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service(value = "userService")
public class UserServiceImpl implements IUserService {
    @Resource(name = "userDao")
    UserDaoImpl dao;

    public UserDaoImpl getDao() {
        return dao;
    }

    public void setDao(UserDaoImpl dao) {
        this.dao = dao;
    }

    @Override
    public User findUserById(Integer id) {
        System.out.println("invoke findUserById...");
        User user=dao.findUserById(id);

        return user;
    }

    @Override
    public User findUserByName(String username) {
        System.out.println("invoke findUserByName...");
        User user=dao.findUserByName(username);

        return user;
    }

    @Override
    public int insertUser(User user) {
        System.out.println("invoke insertUser...");
       int i=dao.insertUser(user);

        return i;
    }

    @Override
    public int updateUser(User user) {
        System.out.println("invoke updateUser");
        return dao.updateUser(user);
    }

    @Override
    public void deleteUserById(int id) {
        System.out.println("invoke deleteUserById");
        dao.deleteUserById(id);
    }

    @Override
    public void deleteUserByName(String username) {
        System.out.println("invoke deleteUserByName");
        dao.deleteUserByName(username);
    }

    @Override
    public List<Activity> findActivity(String username) {
        System.out.println("invoke findActivity");
        List<Activity> ls=dao.findActivity(username);
        return ls;
    }
}
