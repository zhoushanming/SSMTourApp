package cn.edu.usts.cs2018.entity;


import java.util.Date;
import java.util.List;

public class Tour {
    private int id;
    private String tourname;
    private String leader;
    private String username;
    private String introduction;
    private Date startdate;
    private Date enddate;

    public Tour(int id, String tourname, String leader, String username, String introduction, Date startdate, Date enddate) {
        this.id = id;
        this.tourname = tourname;
        this.leader = leader;
        this.username = username;
        this.introduction = introduction;
        this.startdate = startdate;
        this.enddate = enddate;
    }

    public Tour(String tourname, String leader, String username, String introduction, Date startdate, Date enddate) {
        this.tourname = tourname;
        this.leader = leader;
        this.username = username;
        this.introduction = introduction;
        this.startdate = startdate;
        this.enddate = enddate;
    }

    public Tour(int id, String tourname) {
        this.id = id;
        this.tourname = tourname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTourname() {
        return tourname;
    }

    public void setTourname(String tourname) {
        this.tourname = tourname;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    @Override
    public String toString() {
        return "Tour{" +
                "id=" + id +
                ", tourname='" + tourname + '\'' +
                ", leader='" + leader + '\'' +
                ", username='" + username + '\'' +
                ", introduction='" + introduction + '\'' +
                ", startdate=" + startdate +
                ", enddate=" + enddate +
                '}';
    }
}
