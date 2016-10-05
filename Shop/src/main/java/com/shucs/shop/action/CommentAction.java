package com.shucs.shop.action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.shucs.shop.domain.Comment;
import com.shucs.shop.service.*;
import com.sun.xml.internal.rngom.ast.builder.CommentList;

import java.util.ArrayList;


/**
 * Created by Yisa on 16/9/22.
 */
@WebServlet(value = "/CommentAction")
public class CommentAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("Utf-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        CommentService commentService = new CommentService();


        Integer type = Integer.valueOf(request.getParameter("type"));
        if(type==1){ // 提交评论
            String CommentContent = request.getParameter("CommentContent");
            String username = request.getParameter("username");
            String result = null;
            if(CommentContent.isEmpty()){
                result = "1";
            }
            else{
                Comment comment = new Comment();
                comment.setUsername(username);
                comment.setComment(CommentContent);
                commentService.addComment(comment);
                result="5";
            }
            out.print(result);
        }
        else if(type==2){

            ArrayList<Comment> CommentList = commentService.getLatestComment();
            request.getSession().setAttribute("CommentList",CommentList);
            out.print("success");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
