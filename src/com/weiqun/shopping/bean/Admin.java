package com.weiqun.shopping.bean;

import com.weiqun.shopping.dao.AdminDao;
import com.weiqun.shopping.dao.UserDao;
import com.weiqun.shopping.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Admin {
    private int id;
    public String username;
    public String password;

    public Admin() {

    }

    public Admin(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean login() {
        try {
            return AdminDao.login(this);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("检查账号失败!");
            return false;
        }
    }
}
