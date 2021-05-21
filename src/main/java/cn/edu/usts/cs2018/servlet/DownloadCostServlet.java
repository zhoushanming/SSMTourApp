package cn.edu.usts.cs2018.servlet;

import cn.edu.usts.cs2018.entity.Cost;
import cn.edu.usts.cs2018.entity.User;
import cn.edu.usts.cs2018.service.CostServiceImpl;
import cn.edu.usts.cs2018.utils.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet(urlPatterns = "/servlet/downloadCost")
public class DownloadCostServlet extends HttpServlet
{

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        sendExcel(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        sendExcel(request, response);
    }
    public void sendExcel(HttpServletRequest request,HttpServletResponse response){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        //excel标题
        String[] title = {"旅程名称","活动名称","需要费用","是否已经缴纳"};
        //excel文件名
        String fileName = "活动费用清单.xls";
        ApplicationContext act =
                new ClassPathXmlApplicationContext("applicationContext.xml");
        CostServiceImpl costService=(CostServiceImpl)act.getBean("costService");
        List<Cost> list=costService.findCostByUsername(user.getUsername());



        //sheet名

        String sheetName = "活动缴费清单";
        //  将数据转换成String [][] 二维数组（具体情况根据自身需求定）
        String [][] content = new String[list.size()][title.length];
        Cost cost;
        for(int i=0;i<list.size();i++)
        {
//                usertem=ls.get(i);
//                content[i][0]=String.valueOf(usertem.getId());
//                content[i][1]=usertem.getName();
//                content[i][2]=usertem.getTelephone();
//                content[i][3]=usertem.getAddress();
//                content[i][4]=String.valueOf(usertem.getBirthday());
//                content[i][5]=usertem.getDept();
                cost=list.get(i);
                content[i][0]=cost.getTourname();
                content[i][1]=cost.getActivityname();
                content[i][2]=cost.getCost()+"";
                if(cost.getPay()==0)
                {
                    content[i][3]="否";
                }else{
                    content[i][3]="是";
                }

        }


        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
        //响应到客户端

        this.setResponseHeader(response, fileName);
        OutputStream os = null;
        try {
            os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {

                fileName = URLEncoder.encode(fileName,"UTF-8");

            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


}
