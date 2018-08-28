package com.weiqun.shopping.manager;

import com.weiqun.shopping.bean.Product;
import com.weiqun.shopping.dao.ProductDao;

import java.util.List;

public class ProductManager {
    private volatile static ProductManager pm;

    public static ProductManager getInstance() {
        if (pm == null) {
            synchronized (ProductManager.class) {
                if (pm == null) {
                    pm = new ProductManager();
                }
            }
        }
        return pm;
    }

    public int findProducts(List<Product> products, int pageNum) {
        int pageSize = 10;
        try {
            List<Product> result = ProductDao.findProducts((pageNum - 1) * pageSize, pageSize);
            products.addAll(result);
            int total = ProductDao.findProductTotal();
            return total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public boolean addProduct(Product product) {
        try {
            ProductDao.addProduct(product);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("添加产品失败!");
            return false;
        }
    }

    public boolean removeProduct(int id) {
        try {
            ProductDao.deleteProduct(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Product findProduct(int id) {
        try {
            return ProductDao.findProduct(id);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找产品失败!");
            return null;
        }
    }

    public boolean modifyProduct(Product product) {
        try {
            ProductDao.modifyProduct(product);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("编辑商品失败!");
            return false;
        }
    }

    public int findProducts(List<Product> products, String key,
                            String minnormalprice,
                            String maxnormalprice,
                            String minmemberprice,
                            String maxmemberprice,
                            String categoryid,
                            int pageNum) {
        int pageSize = 10;
        try {
            List<Product> result = ProductDao.findProducts(key, minnormalprice,
                    maxnormalprice, minmemberprice,
                    maxmemberprice, categoryid, (pageNum - 1) * pageSize, pageSize);
            products.addAll(result);
            int total = ProductDao.findProductTotal(key, minnormalprice,
                    maxnormalprice, minmemberprice,
                    maxmemberprice, categoryid);
            return total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void findNewProducts(List<Product> products, int count){
        try {
            products.addAll(ProductDao.findNewProducts(count));
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找热门商品失败!");
        }
    }
}
