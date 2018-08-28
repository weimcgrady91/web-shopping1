package com.weiqun.shopping.manager;

import com.weiqun.shopping.bean.Cart;
import com.weiqun.shopping.bean.SaleItem;
import com.weiqun.shopping.bean.SaleOrder;
import com.weiqun.shopping.dao.SaleOrderDao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SaleOrderManager {
    private volatile static SaleOrderManager saleOrderManager;
    private SaleOrderManager() {

    }
    public static SaleOrderManager newInstance(){
        if(saleOrderManager==null){
            synchronized (SaleOrderManager.class){
                if(saleOrderManager==null){
                    saleOrderManager = new SaleOrderManager();
                }
            }
        }
        return saleOrderManager;
    }

    public boolean saveOrder(SaleOrder saleOrder,Cart cart){
        try {
            saleOrder.setOdate(new Date());
            saleOrder.setStatus(0);
            List<SaleItem> saleItems = new ArrayList<>();
            for(int i=0;i<cart.getCartItems().size();i++) {
                SaleItem saleItem = new SaleItem();
                saleItem.setPcount(cart.getCartItems().get(i).getCount());
                saleItem.setUnitprice(cart.getCartItems().get(i).getUnitPrice());
                saleItem.setProductid(cart.getCartItems().get(i).getProduct().getId());
                saleItems.add(saleItem);
            }
            saleOrder.setSaleItems(saleItems);
            SaleOrderDao.save(saleOrder);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("保存订单失败!");
            return false;
        }
    }

    public int findSaleOrders(List<SaleOrder> saleOrders, int pageNum) {
        int pageSize = 10;
        try {
            List<SaleOrder> result = SaleOrderDao.findSaleOrders((pageNum - 1) * pageSize, pageSize);
            saleOrders.addAll(result);
            int total = SaleOrderDao.findSaleOrderTotal();
            return total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("获取订单列表失败!");
            return 0;
        }
    }

    public void findSaleItems(List<SaleItem> saleItems, int id) {
        try {
            List<SaleItem> result = SaleOrderDao.findSaleItemsById(id);
            saleItems.addAll(result);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("获取订单详情失败!");
        }
    }

    public SaleOrder findSaleOrder(int id) {
        try {
            return SaleOrderDao.findSaleOrder(id);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找订单失败!");
            return null;
        }
    }
}
