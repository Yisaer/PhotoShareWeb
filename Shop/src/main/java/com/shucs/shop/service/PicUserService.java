package com.shucs.shop.service;

/**
 * Created by Yisa on 16/9/12.
 */

import com.shucs.shop.Util.DBUtil;
import com.shucs.shop.Util.FileUtil;

import java.util.List;


public class PicUserService {

    public String getUrlByUserId ( int user_id){

        String sql = "select PicUrl from UserPic where user_id = ? ";
        String[] parameters = {user_id + ""};
        List<Object[]> imageList = DBUtil.query(sql, parameters);
        String url ="";

        for (Object[] objects : imageList) {
            url = objects[0].toString();
        }
        return url;
    }

    public void AddUserPic(int user_id){
        String[] sqls = {"insert into UserPic (user_id) values (?)"};
        String[][] parameters = {{user_id + ""}};
        DBUtil.updates(sqls, parameters);
    }


    public void UpdatePicUrlByUserId(int user_id ,String url){

        String[] sqls = {" update UserPic set PicUrl = ? where user_id = ?"};
        String[][] parameters = { { url,user_id+"" } };
        DBUtil.updates(sqls,parameters);

    }

}
