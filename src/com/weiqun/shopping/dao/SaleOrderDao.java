package com.weiqun.shopping.dao;

import com.weiqun.shopping.bean.CartItem;
import com.weiqun.shopping.bean.Category;
import com.weiqun.shopping.bean.SaleItem;
import com.weiqun.shopping.bean.SaleOrder;
import com.weiqun.shopping.util.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SaleOrderDao {
    public static void save(SaleOrder saleOrder) throws Exception {
        String sql = "insert into salesorder values(null,?,?,?,?)";
        Connection conn = DBUtils.getConnection();
        conn.setAutoCommit(false);
        PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstmt.setInt(1, saleOrder.getUserid());
        pstmt.setString(2, saleOrder.getAddr());
        pstmt.setTimestamp(3, new Timestamp(saleOrder.getOdate().getTime()));
        pstmt.setInt(4, saleOrder.getStatus());
        pstmt.executeUpdate();
        ResultSet rsKey = pstmt.getGeneratedKeys();
        int id = -1;
        if (rsKey.next()) {
            id = rsKey.getInt(1);
            rsKey.close();
        }
        sql = "insert into salesitem values(null,?,?,?,?)";
        PreparedStatement pstmt2 = DBUtils.getPStamt(conn, sql);
        List<SaleItem> cartItems = saleOrder.getSaleItems();
        for (int i = 0; i < cartItems.size(); i++) {
            pstmt2.setInt(1, cartItems.get(i).getProductid());
            pstmt2.setDouble(2, cartItems.get(i).getUnitprice());
            pstmt2.setInt(3, cartItems.get(i).getPcount());
            pstmt2.setInt(4, id);
            pstmt2.addBatch();
        }
        pstmt2.executeBatch();
        conn.commit();
        conn.setAutoCommit(true);
        DBUtils.close(pstmt2);
        DBUtils.close(pstmt);
        DBUtils.close(conn);
    }

    public static List<SaleOrder> findSaleOrders(int from, int to) throws Exception {
        List<SaleOrder> saleOrders = new ArrayList<>();
        String sql = "select * from salesorder limit ?,?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, from);
        pstmt.setInt(2, to);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()) {
            SaleOrder saleOrder = createSaleOrderFromRs(rs);
            saleOrders.add(saleOrder);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        return saleOrders;
    }

    private static SaleOrder createSaleOrderFromRs(ResultSet rs) throws Exception {
        SaleOrder saleOrder = new SaleOrder();
        saleOrder.setId(rs.getInt("id"));
        saleOrder.setUserid(rs.getInt("userid"));
        saleOrder.setStatus(rs.getInt("status"));
        saleOrder.setOdate(new Date(rs.getTimestamp("odate").getTime()));
        saleOrder.setAddr(rs.getString("addr"));
        return saleOrder;
    }

    public static int findSaleOrderTotal() throws Exception {
        int result = 0;
        String sql = "select count(*) from salesorder";
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

    public static List<SaleItem> findSaleItemsById(int id) throws Exception {
        List<SaleItem> saleItems = new ArrayList<>();
        String sql = "select * from salesitem where orderid=?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, id);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()) {
            SaleItem saleItem = createSaleItemFromRs(rs);
            saleItems.add(saleItem);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        DBUtils.close(conn);
        return saleItems;
    }

    private static SaleItem createSaleItemFromRs(ResultSet rs) throws Exception {
        SaleItem saleItem = new SaleItem();
        saleItem.setId(rs.getInt("id"));
        saleItem.setProductid(rs.getInt("productid"));
        saleItem.setUnitprice(rs.getDouble("unitprice"));
        saleItem.setPcount(rs.getInt("pcount"));
        saleItem.setOrderid(rs.getInt("orderid"));
        return saleItem;
    }

    public static SaleOrder findSaleOrder(int id) throws Exception {
        SaleOrder result = null;
        String sql = "select * from salesorder where id=?";
        Connection conn = DBUtils.getConnection();
        PreparedStatement pstmt = DBUtils.getPStamt(conn, sql);
        pstmt.setInt(1, id);
        ResultSet rs = DBUtils.getResultSet(pstmt);
        while (rs.next()) {
            result = createSaleOrderFromRs(rs);
        }
        DBUtils.close(rs);
        DBUtils.close(pstmt);
        DBUtils.close(conn);
        return result;
    }
}
