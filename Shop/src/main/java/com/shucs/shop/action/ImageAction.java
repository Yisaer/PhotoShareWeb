package com.shucs.shop.action;

/**
 * Created by Yisa on 16/9/8.
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.shucs.shop.domain.Image;
import com.shucs.shop.domain.User;
import com.shucs.shop.service.ImageService;
import java.io.PrintWriter;

import com.shucs.shop.service.PicUserService;
import com.shucs.shop.service.UserService;


/**
 * 图片控制器
 * @author
 *
 */
@WebServlet(value = "/ImageAction")
@MultipartConfig
public class ImageAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Integer type = Integer.valueOf(request.getParameter("type"));
        ImageService imageService = new ImageService();
        PrintWriter out = response.getWriter();
        PicUserService picUserService = new PicUserService();


        if (type == 1) {    //上传图片
            String imageName = request.getParameter("image_name");
            Part image = request.getPart("imageInput");

            System.out.println("imageName = " +imageName);
            if(image == null){
                System.out.println("NULL image");
            }
            Image img = new Image();
            img.setDate(new Date());
            img.setName(imageName);
            img.setUser((User) request.getSession().getAttribute("user"));
            img.setUrl(img.getUser().getUsername() + "/" + UUID.randomUUID());
            imageService.addImage(img, image.getInputStream());
            request.getSession().setAttribute("imageList", imageService.getByUserId(img.getUser().getId()));
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        } else if (type == 2) {    //删除图片
            String ids = request.getParameter("ids");
            String urls = request.getParameter("urls");
            imageService.delByIdsAndUrls(ids, urls);
            request.getSession().setAttribute("imageList", imageService.getByUserId(((User) request.getSession().getAttribute("user")).getId()));
        } else if(type ==3 ){  // 返回url与uid记录

            ArrayList<Object[]> List = imageService.getImageList();
            String head = "{ \"picInfo\":[";
            String tail = "]}";
            StringBuilder plus = new StringBuilder();
            ArrayList<Image> ShareList = new ArrayList<Image>();

            for(int i  = 0; i<List.size();i++){
                if(i>0){
                    plus.append(",");
                }
                String name = (String)List.get(i)[0];
                plus.append(" {\"name\":\""+name+"\",");
                String url = (String)List.get(i)[1];
                plus.append(" \"url\":\""+url+"\",");
                int user_id = (Integer) List.get(i)[2];
                UserService userService = new UserService();
                User u = userService.getUserById(user_id);
                String username = u.getUsername();
                plus.append(" \"username\":\""+username+"\"}");
                Image image = new Image();
                image.setName(name);
                image.setUrl(url);
                image.setUser(u);
                ShareList.add(image);
            }
            request.getSession().setAttribute("ShareList",ShareList);
            String content = plus.toString();
            String json = head +content +tail ;
            out.print( json );
        } else if(type==4){ // 修改头像
            Part image = request.getPart("PicUrlinput");
            User user= (User)request.getSession().getAttribute("user");
            String username = user.getUsername();
            int user_id = user.getId();
            String PicUrl =  username +"/" +UUID.randomUUID();

            Image img = new Image();
            img.setDate(new Date());
            img.setUrl(PicUrl);
            imageService.addPicurl(img,image.getInputStream());

            picUserService.UpdatePicUrlByUserId(user_id,PicUrl);
            request.getSession().setAttribute("PicUrl",PicUrl);
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        }
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

}
