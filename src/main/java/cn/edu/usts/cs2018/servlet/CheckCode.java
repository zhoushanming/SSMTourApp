package cn.edu.usts.cs2018.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/checkCode")
public class CheckCode extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String result = "{\"Success\":false}";

        try {
            String code = request.getParameter("logyzm").toString();

            if (code != null && code.length() > 0) {
                Object validateCode = ((HttpSession) request.getSession()).getAttribute("ValidateCode");
                if(validateCode != null) {
                    String mCode =validateCode.toString();
                    if ( code.toUpperCase().equals(mCode.toUpperCase())) {
                        result = "{\"Success\":true}";
                    }
                }
            }
        }
        catch (Exception ex ) {
            ex.printStackTrace();
        }
        out.print(result);
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}