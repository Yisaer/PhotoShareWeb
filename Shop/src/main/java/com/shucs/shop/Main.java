package com.shucs.shop;

/**
 * Created by Yisa on 16/9/8.
 */

import com.shucs.shop.domain.Comment;
import com.shucs.shop.service.CommentService;
import com.sun.org.apache.regexp.internal.RE;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;


public class Main {
    public static void main (String[] args){

        CommentService commentService = new CommentService();
        ArrayList<Comment> list = commentService.getLatestComment();
        for(Comment comment : list){
            System.out.println(comment.getUsername());
            System.out.println(comment.getComment());
            System.out.println(comment.getDate());
            System.out.println(comment.getUrl());
        }

    }
}
