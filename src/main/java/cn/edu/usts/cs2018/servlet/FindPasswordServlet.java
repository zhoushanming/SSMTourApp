package cn.edu.usts.cs2018.servlet;

import cn.edu.usts.cs2018.dao.UserDaoImpl;
import cn.edu.usts.cs2018.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/servlet/findpassword")
public class FindPasswordServlet extends HttpServlet
{
    /*
    protected void processRequest(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        String jspfile = "../common/findpassword.jsp"; //返回给用户的视图
//1.取得用户的请求数据
        UserDaoImpl dao=new UserDaoImpl();
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("name");
        String strSQL="SELECT * FROM newusers WHERE name= '"+username+"';" ;
        List<User> ls=dao.find(strSQL);
        if(ls.size()>0)
        {
            User user=ls.get(0);
            request.setAttribute("user",user);
        }else {
            System.out.println("wrong");
        }

        System.out.println(jspfile);
        try {
            RequestDispatcher rd = request.getRequestDispatcher(jspfile);
            System.out.println(rd.toString());
            rd.forward(request, response);
        }catch (Exception e)
        {
            e.printStackTrace();
        }

//转跳方法二，注意二者差别。
//response.sendRedirect(jspfile);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

     */
}
