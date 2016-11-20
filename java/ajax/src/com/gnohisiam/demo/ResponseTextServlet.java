package com.gnohisiam.demo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ResponseTextServlet extends HttpServlet {

    private final static String KEYWORD = "apple";

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //使JSP接受含汉字的responseText不产生乱码,告诉浏览器返回的数据是html格式
        response.setContentType("text/html; charset=utf-8");
        //也可以 response.setCharacterEncoding("utf-8");

        //使Servlet在get方法中接受含汉字不产生乱码,在post方法中用request.setCharacterEncoding("utf-8");
        String username = new String( request.getParameter("value").getBytes("iso8859-1"),"utf-8");
        String message = KEYWORD.equals(username) ? "Great!" : "Oops..";
        response.getWriter().write(message);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String username = request.getParameter("value");
        String message = KEYWORD.equals(username) ? "Great!" : "Oops..";
        response.getWriter().write(message);
    }

}
