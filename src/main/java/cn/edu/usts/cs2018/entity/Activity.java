package cn.edu.usts.cs2018.entity;


import cn.edu.usts.cs2018.entity.User;

import java.util.List;

public class Activity {
    public Activity(int id, String content, String username, String activityname, String tourname) {
        this.id = id;
        this.content = content;
        this.username = username;
        this.activityname = activityname;
        this.tourname = tourname;
    }

    public Activity(String content, String username, String activityname, String tourname) {
        this.content = content;
        this.username = username;
        this.activityname = activityname;
        this.tourname = tourname;
    }

    public Activity(int id, String username, String tourname) {
        this.id = id;
        this.username = username;
        this.tourname = tourname;
    }

    public Activity(String username, String tourname) {
        this.username = username;
        this.tourname = tourname;
    }

    private int id;
    private String content;
    private String username;
    private String activityname;
    private String tourname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getActivityname() {
        return activityname;
    }

    public void setActivityname(String activityname) {
        this.activityname = activityname;
    }

    public String getTourname() {
        return tourname;
    }

    public void setTourname(String tourname) {
        this.tourname = tourname;
    }

    @Override
    public String toString() {
        return "Activity{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", username='" + username + '\'' +
                ", activityname='" + activityname + '\'' +
                ", tourname='" + tourname + '\'' +
                '}';
    }
}
