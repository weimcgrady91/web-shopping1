package com.weiqun.shopping.bean;

import com.weiqun.shopping.dao.UserDao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class User {
    private int id;
    private String username;
    private String password;
    private String phone;
    private String addr;
    private Date rdate;

    public User() {

    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String phone, String addr, Date rdate) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.addr = addr;
        this.rdate = rdate;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Date getRdate() {
        return rdate;
    }

    public String getRdateStr() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(this.rdate);
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public boolean save() {
        try {
            UserDao.addUser(this);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("注册User失败!");
            return false;
        }
    }

    public int getUserIdByUserName(String username){
        try {
            return UserDao.getUserId(username);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean login() {
        try {
            return UserDao.login(this);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("检查账号失败!");
            return false;
        }
    }

    public boolean checkUser() {
        try {
            return UserDao.checkUser(this);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找User失败!");
            return false;
        }
    }

    public User findUser() {
        try {
            return UserDao.findUserByUserName(username);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("获取User失败!");
            return null;
        }
    }

    public boolean modify() {
        try {
            return UserDao.update(this);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("修改个人信息失败!");
            return false;
        }

    }

    public void findUsers(List<User> users, int pageNum) {
        int pageSize = 10;
        try {
            List<User> result = UserDao.findUsers(pageNum, pageSize);
            users.addAll(result);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找用户记录失败!");
        }
    }

    public int getTotalPage() {
        int pageSize = 8;
        try {
            return UserDao.getTotalPage(pageSize);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找用户记录数失败!");
            return 0;
        }
    }

    public boolean remove() {
        try {
            UserDao.delete(this);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("删除用户失败");
            return false;
        }
    }
}
