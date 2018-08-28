package com.weiqun.shopping.dao;

import com.weiqun.shopping.bean.Category;
import com.weiqun.shopping.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    public static List<Category> findChildCategories(int pid) throws Exception{
        List<Category> categories = new ArrayList<>();
        Connection conn = DBUtils.getConnection();
        String sql = "select * from category where pid=?";
        PreparedStatement pstmt = DBUtils.getPStamt(conn,sql);
        pstmt.setInt(1,pid);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()){
            Category category = createFromRs(rs);
            categories.add(category);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        DBUtils.close(conn);
        return categories;

    }

    public static void addCategory(Category category) throws Exception {
        Connection conn = DBUtils.getConnection();
        conn.setAutoCommit(false);
        addCategory(conn, category);
        updateCategory(conn, category);
        conn.commit();
        conn.setAutoCommit(true);
        DBUtils.close(conn);
    }

    public static void addCategory(Connection conn, Category category) throws Exception {
        String sql = "insert into category values(null,?,?,?,?,?)";
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, category.getPid());
        pstmt.setString(2, category.getName());
        pstmt.setString(3, category.getDersc());
        pstmt.setInt(4, category.isIsleaf() ? 0 : 1);
        pstmt.setInt(5, category.getLevel());
        pstmt.executeUpdate();
        DBUtils.close(pstmt);
    }

    public static void updateCategory(Connection conn, Category category) throws Exception {
        String sql = "update category set isleaf=? where id=?";
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, 1);
        pstmt.setInt(2, category.getPid());
        pstmt.executeUpdate();
        DBUtils.close(pstmt);
    }

    public static List<Category> findAll() throws Exception {
        List<Category> categories = new ArrayList<>();
        Connection conn = DBUtils.getConnection();
        tree(categories, conn, 0);
        DBUtils.close(conn);
        return categories;
    }

    public static void tree(List<Category> categories, Connection conn, int pid) throws Exception {
        String sql = "select * from category where pid=?";
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, pid);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()) {
            Category category = createFromRs(rs);
            categories.add(category);
            tree(categories, conn, rs.getInt("id"));
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
    }

    public static Category findCategoryById(Connection conn, int id) throws Exception {
        Category category = null;
        String sql = "select * from category where id=?";
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, id);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()) {
            category = createFromRs(rs);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        return category;
    }

    public static Category findCategoryById(int id) throws Exception {
        Category category = null;
        Connection conn = DBUtils.getConnection();
        category = findCategoryById(conn, id);
        DBUtils.close(conn);
        return category;
    }

    public static void modifyCategory(Category category) throws Exception {
        Connection conn = DBUtils.getConnection();
        modifyCategory(conn, category);
        DBUtils.close(conn);
    }

    public static void modifyCategory(Connection conn, Category category) throws Exception {
//        String sql = "update category set isleaf=? where id=?";
        String sql = "update category set name=?,dersc=? where id=?";
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
//        pstmt.setInt(1, category.isIsleaf() ? 0 : 1);
        pstmt.setString(1, category.getName());
        pstmt.setString(2, category.getDersc());
        pstmt.setInt(3, category.getId());
        pstmt.executeUpdate();
        DBUtils.close(pstmt);

    }

    public static Category createFromRs(ResultSet rs) throws Exception {
        Category category = new Category();
        category.setId(rs.getInt("id"));
        category.setPid(rs.getInt("pid"));
        category.setName(rs.getString("name"));
        category.setDersc(rs.getString("dersc"));
        category.setIsleaf(rs.getInt("isleaf") == 0);
        category.setLevel(rs.getInt("level"));
        return category;
    }

    public static void deleteTree(int id) throws Exception {
        Connection conn = DBUtils.getConnection();
        conn.setAutoCommit(false);
        tree2(conn, id);
        conn.commit();
        conn.setAutoCommit(true);
        DBUtils.close(conn);
    }

    public static void tree2(Connection conn, int id) throws Exception {
        String sql = "select * from category where pid=?";
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, id);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()) {
            tree2(conn, rs.getInt("id"));
        }

        String delSQL = "delete from category where id=?";
        pstmt = DBUtils.getPStamt(conn, delSQL);
        pstmt.setInt(1, id);
        pstmt.executeUpdate();

        DBUtils.close(rs);
        DBUtils.close(pstmt);
    }

    public static void modifyParentLeaf(Connection conn, int id) throws Exception {
        String sql = "select * from category where pid=?";
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, id);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        if (!rs.next()) {
            sql = "update category set isleaf=0 where id=?";
            pstmt = DBUtils.getPStamt(conn, sql);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
    }

    public static void deleteById(int id) throws Exception {
        Connection conn = DBUtils.getConnection();
        conn.setAutoCommit(false);
        Category category = findCategoryById(id);
        tree2(conn, id);
        modifyParentLeaf(conn, category.getPid());
        conn.commit();
        conn.setAutoCommit(true);
        DBUtils.close(conn);
    }

    public static List<Category> findCategoriesByLevel(int id) throws Exception {
        List<Category> categories = new ArrayList<>();
        String sql = "select * from category where level=?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn,sql);
        pstmt.setInt(1,id);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while(rs.next()){
            categories.add(createFromRs(rs));
        }

        DBUtils.close(rs);
        DBUtils.close(pstmt);
        DBUtils.close(conn);
        return categories;
    }
}
