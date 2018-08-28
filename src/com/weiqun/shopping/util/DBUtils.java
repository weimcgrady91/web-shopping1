package com.weiqun.shopping.util;


import java.sql.*;

public class DBUtils {
    public static String username;
    public static String password;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            username = "weimcgrady91";
            password = "880516";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws Exception {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?useSSL=false", username, password);
        return conn;
    }

    public static PreparedStatement getPStamt(Connection conn, String sql) throws Exception {
        return conn.prepareStatement(sql);
    }

    public static void close(ResultSet rs) throws Exception {
        if (rs != null)
            rs.close();
    }

    public static void close(Statement statement) throws Exception {
        if (statement != null)
            statement.close();
    }

    public static void close(Connection connection) throws Exception {
        if (connection != null)
            connection.close();
    }

    public static Statement getStmt(Connection conn) throws Exception {
        return conn.createStatement();
    }

    public static ResultSet getResultSet(Statement stmt, String sql) throws Exception {
        return stmt.executeQuery(sql);
    }

    public static ResultSet getResultSet(PreparedStatement pstmt) throws Exception {
        return pstmt.executeQuery();
    }
}
