package com.weiqun.shopping.dao;

import com.weiqun.shopping.bean.User;
import com.weiqun.shopping.util.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDao {

    public static void addUser(User user) throws Exception {
        Connection connection = DBUtils.getConnection();
        String sql = "insert into user values(null,?,?,?,?,?)";
        PreparedStatement pStmt = DBUtils.getPStamt(connection, sql);
        pStmt.setString(1, user.getUsername());
        pStmt.setString(2, user.getPassword());
        pStmt.setString(3, user.getPhone());
        pStmt.setString(4, user.getAddr());
        pStmt.setTimestamp(5, new Timestamp(user.getRdate().getTime()));
        pStmt.executeUpdate();
        DBUtils.close(pStmt);
        DBUtils.close(connection);
    }


    public static boolean login(User user) throws Exception {
        boolean result = false;
        Connection connection = DBUtils.getConnection();
        String sql = "select * from user where username=? and password=?";
        PreparedStatement pStmt = DBUtils.getPStamt(connection, sql);
        pStmt.setString(1, user.getUsername());
        pStmt.setString(2, user.getPassword());
        ResultSet rs = DBUtils.getResultSet(pStmt);
        if (rs.next()) {
            result = true;
            user.setId(rs.getInt("id"));
        }
        DBUtils.close(rs);
        DBUtils.close(pStmt);
        DBUtils.close(connection);
        return result;
    }

    public static boolean checkUser(User user) throws Exception {
        boolean result = false;
        Connection connection = DBUtils.getConnection();
        String sql = "select * from user where username=?";
        PreparedStatement pStmt = DBUtils.getPStamt(connection, sql);
        pStmt.setString(1, user.getUsername());
        ResultSet rs = DBUtils.getResultSet(pStmt);
        if (rs.next()) {
            result = true;
        }
        DBUtils.close(rs);
        DBUtils.close(pStmt);
        DBUtils.close(connection);
        return result;
    }

    public static User findUserByUserName(String username) throws Exception {
        User user = null;
        Connection connection = DBUtils.getConnection();
        String sql = "select * from user where username=?";
        PreparedStatement pStmt = DBUtils.getPStamt(connection, sql);
        pStmt.setString(1, username);
        ResultSet rs = DBUtils.getResultSet(pStmt);
        if (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setPhone(rs.getString("phone"));
            user.setAddr(rs.getString("addr"));
            user.setRdate(new Date(rs.getTimestamp("rdate").getTime()));
        }
        DBUtils.close(rs);
        DBUtils.close(pStmt);
        DBUtils.close(connection);
        return user;
    }

    public static boolean update(User user) throws Exception {
        Connection connection = DBUtils.getConnection();
        String sql = "update user set password=?,phone=?,addr=? where id=?";
        PreparedStatement pStmt = DBUtils.getPStamt(connection, sql);
        pStmt.setString(1, user.getPassword());
        pStmt.setString(2, user.getPhone());
        pStmt.setString(3, user.getAddr());
        pStmt.setInt(4, user.getId());
        pStmt.executeUpdate();
        DBUtils.close(pStmt);
        DBUtils.close(connection);
        return true;
    }

    public static List<User> findUsers(int pageNum, int pageSize) throws Exception {
        List<User> users = new ArrayList<>();
        String sql = "select * from user limit ?,?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pStmt = DBUtils.getPStamt(conn, sql);
        pStmt.setInt(1, (pageNum - 1) * pageSize);
        pStmt.setInt(2, pageSize);
        ResultSet rs = DBUtils.getResultSet(pStmt);
        while (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setPhone(rs.getString("phone"));
            user.setAddr(rs.getString("addr"));
            user.setRdate(new Date(rs.getTimestamp("rdate").getTime()));
            users.add(user);
        }
        DBUtils.close(rs);
        DBUtils.close(pStmt);
        DBUtils.close(conn);
        return users;
    }

    public static int getTotalPage(int pageSize) throws Exception {
        int total = 0;
        String sql = "select count(*) as count from user";
        Connection conn = DBUtils.getConnection();
        Statement stmt = DBUtils.getStmt(conn);
        ResultSet rs = DBUtils.getResultSet(stmt, sql);
        if (rs.next()) {
            int count = rs.getInt(1);
            total = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        }
        DBUtils.close(rs);
        DBUtils.close(stmt);
        DBUtils.close(conn);
        return total;
    }

    public static void delete(User user) throws Exception {
        String sql = "delete from user where id=?";
        Connection connection = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(connection, sql);
        pstmt.setInt(1,user.getId());
        pstmt.executeUpdate();
        DBUtils.close(pstmt);
        DBUtils.close(connection);
    }

    public static int getUserId(String username) throws Exception {
        return -1;
    }
}
