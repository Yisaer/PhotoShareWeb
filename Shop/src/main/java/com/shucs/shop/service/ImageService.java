package com.shucs.shop.service;

/**
 * Created by Yisa on 16/9/8.
 */
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.shucs.shop.domain.Image;
import com.shucs.shop.domain.User;
import com.shucs.shop.Util.DBUtil;
import com.shucs.shop.Util.FileUtil;



/**
 * 图片服务类
 * @author
 *
 */
public class ImageService {
    /**
     * 通过用户ID获取图片列表
     * @param userId 用户ID
     * @return 图片列表
     */
    public ArrayList<Image> getByUserId(int userId) {
        ArrayList<Image> images = new ArrayList<Image>();
        String sql = "select id, name, url, date, user_id from image where user_id = ? order by date desc";
        String[] parameters = {userId + ""};
        List<Object[]> imageList = DBUtil.query(sql, parameters);
        for (Object[] objects : imageList) {
            Image image = new Image();
            image.setId(Integer.parseInt(objects[0].toString()));
            image.setName(objects[1].toString());
            image.setUrl(objects[2].toString());
            image.setDate((Date) objects[3]);
            image.setUser(new User(Integer.parseInt(objects[4].toString())));
            images.add(image);
        }
        return images;
    }

    /**
     * 上传图片
     * @param image 图片
     * @param inputStream 输入流
     */
    public void addImage(Image image, InputStream inputStream) {
        FileUtil.upload(inputStream, image.getUrl());
        String[] sqls = {"insert into image(name, url, date, user_id) values(?, ?, ?, ?)"};
        String[][] parameters = {{image.getName(), image.getUrl(), new SimpleDateFormat("yyyy-MM-dd HH:mm").format(image.getDate()), image.getUser().getId() + ""}};
        DBUtil.updates(sqls, parameters);
    }

    public void addPicurl (Image image ,InputStream inputStream){
        FileUtil.upload(inputStream, image.getUrl());
    }

    /**
     * 通过图片ID数组和图片URL数组删除图片
     * @param ids 图片ID数组
     * @param urls 图片URL数组
     */
    public void delByIdsAndUrls(String ids, String urls) {
        String[] idArray = ids.split(",");
        String[] urlArray = urls.split(",");
        if (!"".equals(idArray[0]) && !"".equals(urlArray[0])) {
            String[] sqls = new String[idArray.length];
            String[][] parameters = new String[idArray.length][1];
            for (int i = 0; i < idArray.length; i++) {
                FileUtil.delete(urlArray[i]);
                sqls[i] = "delete from image where id = ?";
                parameters[i][0] = idArray[i];
            }
            DBUtil.updates(sqls, parameters);
        }
    }

    public ArrayList<Object[]> getImageList( ){
        String sql = "select name ,url ,user_id from image ";
        String[] parameters = {} ;
        return DBUtil.query(sql,parameters);
    }

}