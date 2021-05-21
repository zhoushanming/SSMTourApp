package cn.edu.usts.cs2018.entity;

public class User {
    private Integer id;
    private String username;
    private String realname;
    private String password;
    private String cardid;
    private String sex;
    private String job;

    public User(Integer id, String username, String realname, String password, String cardid, String sex, String job) {
        this.id = id;
        this.username = username;
        this.realname = realname;
        this.password = password;
        this.cardid = cardid;
        this.sex = sex;
        this.job = job;
    }

    public User(String username, String realname, String password, String cardid, String sex, String job) {
        this.username = username;
        this.realname = realname;
        this.password = password;
        this.cardid = cardid;
        this.sex = sex;
        this.job = job;
    }

    public User(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", realname='" + realname + '\'' +
                ", password='" + password + '\'' +
                ", cardid='" + cardid + '\'' +
                ", sex='" + sex + '\'' +
                ", job='" + job + '\'' +
                '}';
    }
}
