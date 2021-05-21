package cn.edu.usts.cs2018.controller;

import cn.edu.usts.cs2018.dao.UserDaoImpl;
import cn.edu.usts.cs2018.entity.Activity;
import cn.edu.usts.cs2018.entity.Cost;
import cn.edu.usts.cs2018.entity.Tour;
import cn.edu.usts.cs2018.entity.User;
import cn.edu.usts.cs2018.service.ActivityServiceImpl;
import cn.edu.usts.cs2018.service.CostServiceImpl;
import cn.edu.usts.cs2018.service.TourServiceImpl;
import cn.edu.usts.cs2018.service.UserServiceImpl;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller(value = "tourController")
@RequestMapping("/tourController")
public class TourController
{
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

    @Autowired
    @Qualifier("activityService")
    private ActivityServiceImpl activityService;

    public ActivityServiceImpl getActivityService() {
        return activityService;
    }

    public void setActivityService(ActivityServiceImpl activityService) {
        this.activityService = activityService;
    }

    public CostServiceImpl getCostService() {
        return costService;
    }

    public void setCostService(CostServiceImpl costService) {
        this.costService = costService;
    }

    @Autowired
    @Qualifier("costService")
    private CostServiceImpl costService;
    @RequestMapping(value="/viewTour")
    public String showTour(HttpServletRequest request, HttpServletResponse response) {
        try {
            File file = new File("D:\\JavaEEDev\\SSMTourApp\\src\\main\\webapp\\json\\showtour.json");
            List<Tour> list=tourService.findAllTour();
            System.out.println(list.size());
            request.setCharacterEncoding("UTF-8");
            JSONObject jsonObject=new JSONObject();
            Tour tour;
            JSONObject jsontem;
            int id=1;
//            {"id":"1","userId":"24","userName":"段相龙","telephone": "18106122792","address": "江苏常州","birthday": "2000-07-22","dept":"执法院"}
            jsonObject.put("total",list.size()) ;
            JSONArray array=new JSONArray();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            for(int i=0;i<list.size();i++)
            {
                jsontem=new JSONObject();
                tour=list.get(i);
                jsontem.put("tourname",tour.getTourname());
                jsontem.put("leader",tour.getLeader());
                jsontem.put("introduction",tour.getIntroduction());
                jsontem.put("startdate",sdf.format(tour.getStartdate()));
                jsontem.put("enddate",sdf.format(tour.getEnddate()));
                array.add(jsontem);
            }
            jsonObject.put("rows",array);
            System.out.println(jsonObject);
            System.out.println(JSON.toJSONString(jsonObject));
            String jsonStr = JSON.toJSONString(jsonObject);
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
            System.out.println(jsonStr);
            bw.write(jsonStr);
            bw.flush();
            bw.close();
        }catch (Exception e)
        {
            e.printStackTrace();

        }
        String resultView = "common/tourshow";

        logger.info(resultView);
        return  resultView;
    }

    @RequestMapping(value="/updateTour")
    public String updateTour(HttpServletRequest request, HttpServletResponse response) {
        String tourname=request.getParameter("tourname");
        System.out.println(tourname);
        String resultView = "common/tourshow";

        logger.info(resultView);
        return  resultView;
    }
    @RequestMapping(value="/participateTour")
    public String participateTour(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        String info=(String)session.getAttribute("participate");
        System.out.println(info);
        String[] ss=info.split("\\|,\\|");
        System.out.println(ss.length);

        User user=(User)session.getAttribute("user");
        Tour tour=new Tour(ss[0],ss[1],user.getUsername(),ss[2],convertDate(ss[3]),convertDate(ss[4]));
        int re=tourService.insertTour(tour);
        System.out.println(re);
        String resultView = "common/participatefailure";
        if(re>0)
        {
            resultView="common/participatesuccess";
        }
        logger.info(resultView);
        return  resultView;
    }
    public Date convertDate(String a)
    {
        String[] s=a.split("\\-");

        Date date=new Date(Integer.valueOf(s[0])-1900,Integer.valueOf(s[1])-1,Integer.valueOf(s[2]));
        return date;
    }



    @RequestMapping(value="/viewMyParticipateTour")
    public String showMyParticipateTour(HttpServletRequest request, HttpServletResponse response) {
        try {
            File file = new File("D:\\JavaEEDev\\SSMTourApp\\src\\main\\webapp\\json\\showmyparticipatetour.json");
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("user");
            List<Tour> list=tourService.findTourByUsername(user.getUsername());
            System.out.println(list.size());
            request.setCharacterEncoding("UTF-8");
            JSONObject jsonObject=new JSONObject();
            Tour tour;
            JSONObject jsontem;
            int id=1;
//            {"id":"1","userId":"24","userName":"段相龙","telephone": "18106122792","address": "江苏常州","birthday": "2000-07-22","dept":"执法院"}
            jsonObject.put("total",list.size()) ;
            JSONArray array=new JSONArray();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            for(int i=0;i<list.size();i++)
            {
                jsontem=new JSONObject();
                tour=list.get(i);
                jsontem.put("tourname",tour.getTourname());
                jsontem.put("leader",tour.getLeader());
                jsontem.put("introduction",tour.getIntroduction());
                jsontem.put("startdate",sdf.format(tour.getStartdate()));
                jsontem.put("enddate",sdf.format(tour.getEnddate()));
                array.add(jsontem);
            }
            jsonObject.put("rows",array);
            System.out.println(jsonObject);
            System.out.println(JSON.toJSONString(jsonObject));
            String jsonStr = JSON.toJSONString(jsonObject);
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
            System.out.println(jsonStr);
            bw.write(jsonStr);
            bw.flush();
            bw.close();
        }catch (Exception e)
        {
            e.printStackTrace();

        }
        String resultView = "common/showmyparticipatetour";

        logger.info(resultView);
        return  resultView;
    }
    @RequestMapping(value="/viewMyTour")
    public String showMyTour(HttpServletRequest request, HttpServletResponse response) {
        try {
            File file = new File("D:\\JavaEEDev\\SSMTourApp\\src\\main\\webapp\\json\\showmytour.json");
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("user");

            List<Tour> list=tourService.findAllTour();
            List<Tour> re= new ArrayList<Tour>();
            for (Tour t:
                 list) {
                if(t.getLeader().equals(user.getUsername()))
                {
                    re.add(t);
                }

            }
            System.out.println(re.size());
            request.setCharacterEncoding("UTF-8");
            JSONObject jsonObject=new JSONObject();
            Tour tour;
            JSONObject jsontem;
            int id=1;
//            {"id":"1","userId":"24","userName":"段相龙","telephone": "18106122792","address": "江苏常州","birthday": "2000-07-22","dept":"执法院"}
            jsonObject.put("total",re.size()) ;
            JSONArray array=new JSONArray();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            for(int i=0;i<re.size();i++)
            {
                jsontem=new JSONObject();
                tour=re.get(i);
                jsontem.put("tourname",tour.getTourname());
                jsontem.put("leader",tour.getLeader());
                jsontem.put("introduction",tour.getIntroduction());
                jsontem.put("startdate",sdf.format(tour.getStartdate()));
                jsontem.put("enddate",sdf.format(tour.getEnddate()));
                array.add(jsontem);
            }
            jsonObject.put("rows",array);
            System.out.println(jsonObject);
            System.out.println(JSON.toJSONString(jsonObject));
            String jsonStr = JSON.toJSONString(jsonObject);
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
            System.out.println(jsonStr);
            bw.write(jsonStr);
            bw.flush();
            bw.close();
        }catch (Exception e)
        {
            e.printStackTrace();

        }
        String resultView = "common/showmytour";

        logger.info(resultView);
        return  resultView;
    }



    @RequestMapping(value="/addActivity")
    public String addActivity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");

        String tourinfo=(String) session.getAttribute("tourinfo");

        System.out.println(tourinfo );
        String[] infos=tourinfo.split("\\|,\\|");
        String activityname=request.getParameter("activityname");
        String content=request.getParameter("content");
        Double cost=Double.valueOf(request.getParameter("cost"));
        Cost co=new Cost(infos[0],activityname,user.getUsername(),cost);
        Activity activity=new Activity(content,user.getUsername(),activityname,infos[0]);
        int acre=activityService.insertActivity(activity);
        int core=costService.insertCost(co);
        String resultview="common/addActivityfailure";
        if(acre>0 && core>0)
        {
            resultview="common/addActivitysuccess";
        }
        return resultview;
    }
    @RequestMapping(value="/getActivity")
    public String getActivity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        String tourinfo=request.getParameter("addActivity");
        session.setAttribute("tourinfo",tourinfo);

        return null;
    }
    @RequestMapping(value="/getTourInfo")
    public String getTourInfo(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();

        String tourinfo=request.getParameter("participate");
        session.removeAttribute("participate");
        session.setAttribute("participate",tourinfo);

        return null;
    }
    @RequestMapping(value="/exitTour")
    public String exitTour(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        String info=(String)session.getAttribute("participate");
        System.out.println(info);
        String[] ss=info.split("\\|,\\|");
        System.out.println(ss.length);

        User user=(User)session.getAttribute("user");
        System.out.println(user.getUsername()+"      "+ss[0]);
        tourService.deleteTourByUsernameTourname(user.getUsername(),ss[0]);

        Cost cotem;
        List<Activity> list=activityService.findActivityByUsernameTourname(user.getUsername(),ss[0]);
        for (Activity a:
             list) {
            cotem=costService.findCostByTAU(ss[0],a.getActivityname(),user.getUsername());
            costService.deleteCost(cotem);
            activityService.deleteActivityById(a.getId());
        }

        String resultView = "common/exitTourSuccess";

        logger.info(resultView);
        return  resultView;
    }


    @RequestMapping(value="/showActs")
    public String showActs(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        String info=(String)session.getAttribute("participate");
        System.out.println(info);
        String[] ss=info.split("\\|,\\|");
//        show=row.tourname+"|,|"+row.leader+"|,|"+row.introduction+"|,|"+row.startdate+"|,|"+row.enddate;
//        User user=(User)session.getAttribute("user");
//        System.out.println(user.getUsername()+"      "+ss[0]);


        List<Activity> list=activityService.findActivityByUsernameTourname(ss[1],ss[0]);
        session.removeAttribute("tourname");
        session.setAttribute("tourname",ss[0]);
        session.removeAttribute("activity");
        session.setAttribute("activity",list);
        List<Cost> co=new ArrayList<Cost>();
        Cost tem;
        for (Activity ac:
             list) {
            tem=costService.findCostByTAU(ss[0],ac.getActivityname(),ss[1]);
            co.add(tem);
        }
        session.setAttribute("cost",co);
        String resultView = "common/showActs";

        logger.info(resultView);
        return  resultView;
    }

    @RequestMapping(value="/participateActivity")
    public String participateActivity(HttpServletRequest request, HttpServletResponse response) {

        String str_id=request.getParameter("id");
        int id=Integer.valueOf(str_id);
        System.out.println(id);
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        List<Activity> list=(List<Activity>) session.getAttribute("activity");
        List<Cost> ls=(List<Cost>) session.getAttribute("cost");
        Cost cost=ls.get(id);
        Activity activity=list.get(id);
        activity.setUsername(user.getUsername());
        cost.setUsername(user.getUsername());
        int re=activityService.insertActivity(activity);
        int re2=costService.insertCost(cost);
        if(re>0 &&re2>0)
        {
            return "common/participateActivitysuccess";
        }
        return "common/participateActivityfailure";
    }
    @RequestMapping(value="/exitActivity")
    public String exitActivity(HttpServletRequest request, HttpServletResponse response) {

        String str_id=request.getParameter("id");
        int id=Integer.valueOf(str_id);
        System.out.println(id);
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        List<Activity> list=(List<Activity>) session.getAttribute("activity");
        List<Cost> ls=(List<Cost>) session.getAttribute("cost");
        Cost cost=ls.get(id);
        Activity activity=list.get(id);
        activity.setUsername(user.getUsername());
        cost.setUsername(user.getUsername());
        activityService.deleteActivityByActivity(activity);
        costService.deleteCost(cost);

        return "common/exitActivitysuccess";
    }

    @RequestMapping(value="/updateActivity")
    public String updateActivity(HttpServletRequest request, HttpServletResponse response) {

        String str_id=request.getParameter("id");
        int id=Integer.valueOf(str_id);
        System.out.println(id);
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        List<Activity> list=(List<Activity>) session.getAttribute("activity");
        List<Cost> ls=(List<Cost>) session.getAttribute("cost");
        Cost cost=ls.get(id);
        Activity activity=list.get(id);
        activity.setUsername(user.getUsername());
        cost.setUsername(user.getUsername());
        session.setAttribute("updateActivity",activity);
        session.setAttribute("updateCost",cost);

        return "common/changeActivity";
    }
    @RequestMapping(value="/getupdateActivity")
    public String getupdateActivity(HttpServletRequest request, HttpServletResponse response) {
        String content=request.getParameter("content");
        Double cost=Double.valueOf(request.getParameter("cost"));
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        Activity activity=(Activity)session.getAttribute("updateActivity");

        List<Cost> lco=costService.findCostByTAname(activity.getTourname(),activity.getActivityname());
        List<Activity> list=activityService.findActivityByTournameActivityname(activity.getTourname(),activity.getActivityname());
        for (Activity ac:
             list) {
            ac.setContent(content);
            activityService.updateActivity(ac);
        }
        for (Cost c:
             lco) {
            c.setCost(cost);
            costService.updateCost(c);
        }

        return "common/showActs";
    }

    @RequestMapping(value="/deleteActivity")
    public String  deleteActivity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        Activity activity=(Activity)session.getAttribute("updateActivity");
        activityService.deleteActivityByActivityname(activity.getActivityname());
        List<Cost> list=costService.findCostByTAname(activity.getTourname(),activity.getActivityname());
        for (Cost c:
             list)
        {
            costService.deleteCost(c);

        }
        return "common/showActs";
    }
    @RequestMapping(value="/getPay")
    public String  getPay(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        String pay=request.getParameter("pay");
        String[] info=pay.split("\\|,\\|");
        session.removeAttribute("pay");
        session.setAttribute("pay",info);
        return null;
    }
    @RequestMapping(value="/pay")
    public String  pay(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        String[] info=(String[])session.getAttribute("pay");
        User user=(User)session.getAttribute("user");
//        t=row.tourname+"|,|"+row.activityname+"|,|"+row.cost+"|,|"+row.pay;
        Cost cost=costService.findCostByTAU(info[0],info[1],user.getUsername());
        cost.setPay(1);
        costService.updateCost(cost);
        return "common/showmycost";
    }
    @RequestMapping(value="/viewCost")
    public String  viewCost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        try {
            File file = new File("D:\\JavaEEDev\\SSMTourApp\\src\\main\\webapp\\json\\showmycost.json");
            List<Cost> list=costService.findCostByUsername(user.getUsername());
            System.out.println(list.size());
            request.setCharacterEncoding("UTF-8");
            JSONObject jsonObject=new JSONObject();
            Cost cost;
            JSONObject jsontem;
            int id=1;
//            {"id":"1","userId":"24","userName":"段相龙","telephone": "18106122792","address": "江苏常州","birthday": "2000-07-22","dept":"执法院"}
            jsonObject.put("total",list.size()) ;
            JSONArray array=new JSONArray();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            for(int i=0;i<list.size();i++)
            {
                jsontem=new JSONObject();
                cost=list.get(i);
                jsontem.put("tourname",cost.getTourname());
                jsontem.put("activityname",cost.getActivityname());
                jsontem.put("cost",cost.getCost());
                if(cost.getPay()==0)
                {
                    jsontem.put("pay","否");
                }else if(cost.getPay()==1)
                {
                    jsontem.put("pay","是");
                }
                array.add(jsontem);
            }
            jsonObject.put("rows",array);
            System.out.println(jsonObject);
            System.out.println(JSON.toJSONString(jsonObject));
            String jsonStr = JSON.toJSONString(jsonObject);
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
            System.out.println(jsonStr);
            bw.write(jsonStr);
            bw.flush();
            bw.close();
        }catch (Exception e)
        {
            e.printStackTrace();

        }
        String resultView = "common/showmycost";

        logger.info(resultView);
        return  resultView;
    }

}
