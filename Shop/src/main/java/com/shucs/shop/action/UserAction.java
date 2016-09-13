package com.shucs.shop.action;

/**
 * Created by Yisa on 16/9/8.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shucs.shop.domain.User;
import com.shucs.shop.service.UserService;
import com.shucs.shop.service.ImageService;
import com.shucs.shop.domain.Image;
import com.shucs.shop.service.PicUserService;


/**
 * 用户控制器
 * @author
 *
 */
@WebServlet(value = "/UserAction")
public class UserAction extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("Utf-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        UserService userService = new UserService();
        ImageService imageService = new ImageService();
        PicUserService picUserService = new PicUserService();

        Integer type = Integer.valueOf(request.getParameter("type"));
        if (type == 1) {    //用户登录
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String result = null;
            User user = null;
            //验证用户是否有效
            if (username.isEmpty()) {
                result = "1";
            } else if (password.isEmpty()) {
                result = "2";
            } else if ((user = userService.getUserByUsername(username)) == null) {
                result = "3";
            } else {
                if (!user.getPassword().equals(password)) {
                    result = "4";
                } else {

                    request.getSession().setAttribute("user", user);
                    ArrayList<Image> imageList = imageService.getByUserId(user.getId());
                    request.getSession().setAttribute("imageList",  imageList);
                    String PicUrl  = picUserService.getUrlByUserId(user.getId());
                    request.getSession().setAttribute("PicUrl",PicUrl);
                    result = "5";
                }
            }
            out.print(result);
        } else if (type == 2) {    //用户注册
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            String result = null;
            System.out.println("username = " + username);
            System.out.println("password = " + password);
            System.out.println("repassword = " + repassword);
            //验证有效性
            if (username.isEmpty()) {
                result = "1";
            } else if (password.isEmpty()) {
                result = "2";
            } else if (repassword.isEmpty()) {
                result = "3";
            } else if (!repassword.equals(password)) {
                result = "4";
            } else if (userService.getUserByUsername(username) != null) {
                result = "5";
            } else {
                User user = new User(username, password);
                //添加用户
                userService.addUser(user);
                int newuserid = userService.getUserByUsername(username).getId();
                user.setId(newuserid);
                request.getSession().setAttribute("user", user);
                picUserService.AddUserPic(newuserid);
                String PicUrl  = picUserService.getUrlByUserId(newuserid);
                request.getSession().setAttribute("PicUrl",PicUrl);
                result = "6";
            }
            out.print(result);
        } else if (type == 3) {    //用户退出
            request.getSession().invalidate();
        } else if (type == 4){  //   用户修改资料
            String result = null;
            String username = request.getParameter("username");
            String oldpassword = request.getParameter("oldpassword");
            String newpassword = request.getParameter("newpassword");
            String renewpassword = request.getParameter("renewpassword");


            if(oldpassword.isEmpty()){
                result = "1";
            }
            else if(newpassword.isEmpty()){
                result = "2";
            }
            else if (renewpassword.isEmpty()){
                result = "3";
            }
            else if(!userService.getUserByUsername(username).getPassword().equals(oldpassword)){
                result = "4";
            }
            else if(!newpassword.equals(renewpassword)){
                result = "5";
            }
            else{
                User user = new User(username,newpassword);
                userService.updateUser(user);
                request.getSession().setAttribute("user",user);
                result = "6";


            }
            out.print(result);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

}
