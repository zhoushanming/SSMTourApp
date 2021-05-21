package cn.edu.usts.cs2018.service;

import cn.edu.usts.cs2018.entity.Activity;
import cn.edu.usts.cs2018.entity.User;

import java.util.List;

public interface IUserService {
    public User findUserById(Integer id);
    public User findUserByName(String username);
    public int insertUser(User user);
    public int updateUser(User user);
    public void deleteUserById(int id);
    public void deleteUserByName(String username);
    public List<Activity> findActivity(String username);
}
