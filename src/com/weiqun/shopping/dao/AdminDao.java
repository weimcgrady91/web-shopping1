package com.weiqun.shopping.dao;

import com.weiqun.shopping.bean.Admin;
import com.weiqun.shopping.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {
    public static boolean login(Admin admin) throws Exception{
        boolean result = false;
        Connection connection = DBUtils.getConnection();
        String sql = "select * from admins where username=? and password=?";
        PreparedStatement pStmt = DBUtils.getPStamt(connection, sql);
        pStmt.setString(1, admin.getUsername());
        pStmt.setString(2, admin.getPassword());
        ResultSet rs = DBUtils.getResultSet(pStmt);
        if (rs.next()) {
            result = true;
        }
        DBUtils.close(rs);
        DBUtils.close(pStmt);
        DBUtils.close(connection);
        return result;
    }
}
