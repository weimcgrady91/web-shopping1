package com.weiqun.shopping.dao;

import com.weiqun.shopping.bean.Category;
import com.weiqun.shopping.bean.Product;
import com.weiqun.shopping.util.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class ProductDao {
    public static void addProduct(Product product) throws Exception {
        String sql = "insert into product values(null,?,?,?,?,?,?)";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setString(1, product.getName());
        pstmt.setString(2, product.getDescr());
        pstmt.setDouble(3, product.getNormalprice());
        pstmt.setDouble(4, product.getMemberprice());
        pstmt.setTimestamp(5, new Timestamp(new Date().getTime()));
        pstmt.setInt(6, product.getCategoryid());
        pstmt.executeUpdate();
        DBUtils.close(pstmt);
        DBUtils.close(conn);
    }

    public static List<Product> findProducts(int from, int to) throws Exception {
        List<Product> products = new ArrayList<>();
        String sql = "select p.* ,c.name as cname from product p ,category c where p.categoryid=c.id limit ?,?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, from);
        pstmt.setInt(2, to);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()) {
            Product product = createProductFromRs(rs);
            Category category = new Category();
            category.setName(rs.getString("cname"));
            product.setCategory(category);
            products.add(product);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        return products;
    }

    private static Product createProductFromRs(ResultSet rs) throws Exception {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setDescr(rs.getString("descr"));
        product.setNormalprice(rs.getDouble("normalprice"));
        product.setMemberprice(rs.getDouble("memberprice"));
        product.setPdate(new Date(rs.getTimestamp("pdate").getTime()));
        product.setCategoryid(rs.getInt("categoryid"));
        return product;
    }

    public static void deleteProduct(int id) throws Exception {
        String sql = "delete from product where id=?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, id);
        pstmt.executeUpdate();
        DBUtils.close(pstmt);
        DBUtils.close(conn);
    }

    public static Product findProduct(int id) throws Exception {
        Product product = null;
        String sql = "select * from product where id=?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, id);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        if (rs.next()) {
            product = createProductFromRs(rs);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        DBUtils.close(conn);
        return product;
    }

    public static void modifyProduct(Product product) throws Exception {
        String sql = "update product set name=?,descr=?,normalprice=?,memberprice=?,categoryid=? where id=?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setString(1, product.getName());
        pstmt.setString(2, product.getDescr());
        pstmt.setDouble(3, product.getNormalprice());
        pstmt.setDouble(4, product.getMemberprice());
        pstmt.setInt(5, product.getCategoryid());
        pstmt.setInt(6, product.getId());
        pstmt.executeUpdate();
        DBUtils.close(pstmt);
        DBUtils.close(conn);
    }

    public static int findProductTotal() throws Exception {
        int result = 0;
        String sql = "select count(*) from product";
        Connection conn = DBUtils.getConnection();
        Statement stmt = DBUtils.getStmt(conn);
        ResultSet rs = DBUtils.getResultSet(stmt, sql);
        if (rs.next()) {
            result = rs.getInt(1);
        }
        DBUtils.close(rs);
        DBUtils.close(stmt);
        DBUtils.close(conn);
        return result;
    }

    public static List<Product> findProducts(String key,
                                             String minnormalprice,
                                             String maxnormalprice,
                                             String minmemberprice,
                                             String maxmemberprice,
                                             String categoryid,
                                             int from, int to) throws Exception {
        List<Product> products = new ArrayList<>();
        StringBuffer sb = new StringBuffer();
        sb.append("select p.* ,c.name as cname from product p ,category c where p.categoryid=c.id ");
        if (key != null && !key.equals("")) {
            sb.append(" and p.name like '%" + key + "%'");
        }
        if (minnormalprice != null && !minnormalprice.equals("")) {
            sb.append(" and p.normalprice>=" + minnormalprice);
        }
        if (maxnormalprice != null && !maxnormalprice.equals("")) {
            sb.append(" and p.normalprice<=" + maxnormalprice);
        }
        if (minmemberprice != null && !minmemberprice.equals("")) {
            sb.append(" and p.memberprice>=" + minmemberprice);
        }
        if (maxmemberprice != null && !maxmemberprice.equals("")) {
            sb.append(" and p.memberprice<=" + maxmemberprice);
        }
        if (categoryid != null && !categoryid.equals("")) {
            sb.append(" and p.categoryid=" + categoryid);
        }
        sb.append(" limit ?,?");
        String sql = sb.toString();
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, from);
        pstmt.setInt(2, to);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()) {
            Product product = createProductFromRs(rs);
            Category category = new Category();
            category.setName(rs.getString("cname"));
            product.setCategory(category);
            products.add(product);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        DBUtils.close(conn);
        return products;
    }

    public static int findProductTotal(String key,
                                       String minnormalprice,
                                       String maxnormalprice,
                                       String minmemberprice,
                                       String maxmemberprice,
                                       String categoryid) throws Exception {
        int result = 0;
        StringBuffer sb = new StringBuffer();
        sb.append("select count(*) from product where 1=1");
        if (key != null && !key.equals("")) {
            sb.append(" and name like '%" + key + "%'");
        }
        if (minnormalprice != null && !minnormalprice.equals("")) {
            sb.append(" and normalprice>=" + minnormalprice);
        }
        if (maxnormalprice != null && !maxnormalprice.equals("")) {
            sb.append(" and normalprice<=" + maxnormalprice);
        }
        if (minmemberprice != null && !minmemberprice.equals("")) {
            sb.append(" and memberprice>=" + minmemberprice);
        }
        if (maxmemberprice != null && !maxmemberprice.equals("")) {
            sb.append(" and memberprice<=" + maxmemberprice);
        }
        if (categoryid != null && !categoryid.equals("")) {
            sb.append(" and categoryid=" + categoryid);
        }
        String sql = sb.toString();
        Connection conn = DBUtils.getConnection();
        Statement stmt = DBUtils.getStmt(conn);
        ResultSet rs = DBUtils.getResultSet(stmt, sql);
        if (rs.next()) {
            result = rs.getInt(1);
        }
        DBUtils.close(rs);
        DBUtils.close(stmt);
        DBUtils.close(conn);
        return result;
    }

    public static List<Product> findNewProducts(int count) throws Exception{
        List<Product> products = new ArrayList<>();
        String sql = "select * from product order by pdate limit 0,?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn,sql);
        pstmt.setInt(1,count);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while(rs.next()){
            Product product = createProductFromRs(rs);
            products.add(product);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        DBUtils.close(conn);
        return products;
    }
}
