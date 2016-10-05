package com.shucs.shop.domain;

import java.util.Date;

/**
 * Created by Yisa on 16/9/22.
 */
public class Comment {
    private String comment ;
    private String url ;
    private String username ;
    private Date date;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
