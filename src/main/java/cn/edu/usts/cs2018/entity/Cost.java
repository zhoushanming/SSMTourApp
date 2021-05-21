package cn.edu.usts.cs2018.entity;

public class Cost
{
    private int id;
    private String tourname;
    private String activityname;
    private String username;
    private double cost;

    public Cost(int id, String tourname, String activityname, String username, double cost, int pay) {
        this.id = id;
        this.tourname = tourname;
        this.activityname = activityname;
        this.username = username;
        this.cost = cost;
        this.pay = pay;
    }

    public Cost(String tourname, String activityname, String username, double cost, int pay) {
        this.tourname = tourname;
        this.activityname = activityname;
        this.username = username;
        this.cost = cost;
        this.pay = pay;
    }

    private int pay;
    public Cost(int id, String tourname, String activityname, String username, double cost) {
        this.id = id;
        this.tourname = tourname;
        this.activityname = activityname;
        this.username = username;
        this.cost = cost;
    }

    public Cost(String tourname, String activityname, String username, double cost) {
        this.tourname = tourname;
        this.activityname = activityname;
        this.username = username;
        this.cost = cost;
    }
    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
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

    public String getActivityname() {
        return activityname;
    }

    public void setActivityname(String activityname) {
        this.activityname = activityname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "Cost{" +
                "id=" + id +
                ", tourname='" + tourname + '\'' +
                ", activityname='" + activityname + '\'' +
                ", username='" + username + '\'' +
                ", cost=" + cost +
                '}';
    }
}
