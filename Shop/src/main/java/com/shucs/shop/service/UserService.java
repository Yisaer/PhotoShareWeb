package com.shucs.shop.service;

/**
 * Created by Yisa on 16/9/8.
 */
import java.util.List;

import com.shucs.shop.domain.User;
import com.shucs.shop.Util.DBUtil;



/**
 * 用户服务类
 * @author
 *
 */
public class UserService {
    /**
     * 通过用户名获取用户
     * @param username 用户名
     * @return 用户
     */
    public User getUserByUsername(String username) {
        String sql = "select id, username, password from user where username = ?";
        String[] parameters = {username};
        List<Object[]> users = DBUtil.query(sql, parameters);
        if (users.size() == 0) {
            return null;
        } else {
            Object[] objects = users.get(0);
            return objects == null ? null : new User(Integer.parseInt(objects[0].toString()), objects[1].toString(), objects[2].toString(), null);
        }
    }

    /**
     * 添加用户
     * @param user 用户
     */
    public void addUser(User user) {
        String[] sqls = {"insert into user(username, password) values(?, ?)"};
        String[][] parameters = {{user.getUsername(), user.getPassword()}};
        DBUtil.updates(sqls, parameters);
    }
    /**
     *  修改用户
     *
     */
    public void updateUser(User user){
        String[] sqls = {"  update user set password = ? where username = ?"};
        String[][] parameters = { {user.getPassword(),user.getUsername()}};
        DBUtil.updates(sqls,parameters);

    }

    public User getUserById(int id){
        String sql = "select id, username, password from user where id = ?";
        String[] parameters = {new Integer(id).toString()};
        List<Object[]> users = DBUtil.query(sql, parameters);
        if (users.size() == 0) {
            return null;
        } else {
            Object[] objects = users.get(0);
            return objects == null ? null : new User(Integer.parseInt(objects[0].toString()), objects[1].toString(), objects[2].toString(), null);
        }
    }


}