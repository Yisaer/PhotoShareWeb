package com.shucs.shop.service;

import com.shucs.shop.Util.DBUtil;
import com.shucs.shop.domain.Comment;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;




/**
 * Created by Yisa on 16/9/22.
 */
public class CommentService {

    PicUserService picUserService = new PicUserService();
    UserService userService = new UserService();


    public ArrayList<Comment> getLatestComment (){
        ArrayList<Comment> list = new ArrayList<Comment>();
        String sql = "select username,Date,Comment,user_id from Comment order by date desc limit 0,10";
        String[] parameters = {};
        List<Object[]> CommentList = DBUtil.query(sql, parameters);
        for(Object[] object : CommentList){
            Comment comment = new Comment();
            String name = object[0].toString();
            int user_id = Integer.parseInt(object[3].toString());
            comment.setUrl(picUserService.getUrlByUserId(user_id));
            comment.setUsername(name);
            comment.setDate((Date)object[1]);
            comment.setComment(object[2].toString());
            list.add(comment);
        }
        return list;
    }

    public void addComment(Comment comment){
        String[] sqls = {"insert into Comment (username,user_id,Date,Comment) values(?,?,?,?)"};
        String[][] parameters = {{
                comment.getUsername(),
                userService.getUserByUsername(comment.getUsername()).getId()+"",
                new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()),
                comment.getComment()
        }};
        DBUtil.updates(sqls,parameters);
    }


}
