package cn.edu.usts.cs2018.controller;


import cn.edu.usts.cs2018.entity.Tour;
import cn.edu.usts.cs2018.entity.User;
import cn.edu.usts.cs2018.service.TourServiceImpl;
import cn.edu.usts.cs2018.service.UserServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller(value = "userController")
@RequestMapping("/userController")
public class UserController {
    private static Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    @Qualifier("userService")
    private UserServiceImpl userservice;

    public TourServiceImpl getTourService() {
        return tourService;
    }

    public void setTourService(TourServiceImpl tourService) {
        this.tourService = tourService;
    }

    @Autowired
    @Qualifier("tourService")
    private TourServiceImpl tourService;
    public UserServiceImpl getService() {
        return userservice;
    }

    public void setService(UserServiceImpl service) {
        this.userservice = service;
    }

    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String login(HttpServletRequest resquest, HttpServletResponse response) {
        String name=resquest.getParameter("username");
        String pwd=resquest.getParameter("password");
//        String logyzm=resquest.getParameter("logyzm");

        HttpSession session = resquest.getSession();
        User user =userservice.findUserByName(name);
        String resultView = "common/loginfailure";
        System.out.println(user.toString());
        System.out.println(pwd);
//&& logyzm.equals(session.getAttribute("ValidateCode"))

        if( user.getPassword().equals(pwd)  ) {
            System.out.println("成功");
            logger.info(user);

            session.removeAttribute("User");
            session.removeAttribute("user");

            session.setAttribute("User", user);      // 用户登录成功的信息写入Session中。
            session.setAttribute("user", user);
            resultView = "index";
        }
        logger.info(resultView);
        return  resultView;
    }
    @RequestMapping(value="/exit",method = RequestMethod.GET)
    public String exit(HttpServletRequest resquest, HttpServletResponse response) {
        HttpSession session = resquest.getSession();
        String resultView = "index";
        try {
            User user=(User)session.getAttribute("user");
            session.removeAttribute("user");
            session.removeAttribute("User");

            logger.info(user.getUsername()+"下线");


            logger.info(resultView);
        }catch (Exception e)
        {
            return  resultView;
        }

        return  resultView;

    }
    @RequestMapping(value="/register",method = RequestMethod.POST)
    public String register(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String resultView = "common/registerfailure";
        String username=request.getParameter("username");
        String realname=request.getParameter("realname");
        String password=request.getParameter("password");
        String cardid=request.getParameter("cardid");
        String sex=request.getParameter("sex");
        String job=request.getParameter("job");
        User user=new User(username,realname,password,cardid,sex,job);
        int i=userservice.insertUser(user);
        if(i>0){
            resultView="common/registersuccess";
        }
        return  resultView;

    }
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public String update(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String resultView = "common/updateUserFailure";
        String username=request.getParameter("username");
        String realname=request.getParameter("realname");
        String password=request.getParameter("password");
        String cardid=request.getParameter("cardid");
        String sex=request.getParameter("sex");
        String job=request.getParameter("job");
        User user=new User(username,realname,password,cardid,sex,job);
        int i=userservice.updateUser(user);
        if(i>0){
            resultView="common/updateUserSuccess";
        }
        return  resultView;

    }
    @RequestMapping(value="/createTour",method = RequestMethod.POST)
    public String createTour(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user =(User)session.getAttribute("user");
        String resultView = "common/createtourfailure";
        String tourname=request.getParameter("tourname");

        String introduction=request.getParameter("introduction");
        String startdate=request.getParameter("startdate");
        String enddate=request.getParameter("enddate");
        Tour tour=new Tour(tourname,user.getUsername(),user.getUsername(),introduction,convertDate(startdate),convertDate(enddate));
        int re=tourService.insertTour(tour);
        System.out.println("re:"+re);
        if(re>0)
        {
            resultView="common/createtoursuccess";
        }

        return  resultView;

    }

    public Date convertDate(String a)
    {
        String[] s=a.split("/");

        Date date=new Date(Integer.valueOf(s[2])-1900,Integer.valueOf(s[1])-1,Integer.valueOf(s[0]));
        return date;
    }

}
