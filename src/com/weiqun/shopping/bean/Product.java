package com.weiqun.shopping.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Product {
    private int id;
    private String name;
    private String descr;
    private double normalprice;
    private double memberprice;
    private Date pdate;
    private int categoryid;

    private Category category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public double getNormalprice() {
        return normalprice;
    }

    public void setNormalprice(double normalprice) {
        this.normalprice = normalprice;
    }

    public double getMemberprice() {
        return memberprice;
    }

    public void setMemberprice(double memberprice) {
        this.memberprice = memberprice;
    }

    public Date getPdate() {
        return pdate;
    }

    public String getPdateStr() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(pdate);
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
