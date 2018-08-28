package com.weiqun.shopping.bean;

import com.weiqun.shopping.dao.CategoryDao;

import java.util.List;

public class Category {
    private int id;
    private int pid;
    private String name;
    private String dersc;
    private boolean isleaf;
    private int level;

    public Category() {

    }


    public Category(int pid, String name, String desc) {
        this.pid = pid;
        this.name = name;
        this.dersc = desc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDersc() {
        return dersc;
    }

    public void setDersc(String dersc) {
        this.dersc = dersc;
    }

    public boolean isIsleaf() {
        return isleaf;
    }

    public void setIsleaf(boolean isleaf) {
        this.isleaf = isleaf;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }


    public void findChildCategories(List<Category> categories,int pid){
        try {
            categories.addAll(CategoryDao.findChildCategories(pid));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean addCategory(int pid, int level) {
        if (level > 3 || level <= 0) {
            return false;
        }
        this.pid = pid;
        this.isleaf = true;
        this.level = level;
        try {
            CategoryDao.addCategory(this);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("添加类别失败!");
            return false;
        }
    }

    public void findAll(List<Category> categories) {
        try {
            categories.addAll(CategoryDao.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Category findCategoryById(int id) {
        try {
            return CategoryDao.findCategoryById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean modify() {
        try {
            CategoryDao.modifyCategory(this);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeCategory(int id) {
        try {
            Category category = CategoryDao.findCategoryById(id);
            if (category.level == 1) {
                CategoryDao.deleteTree(id);
                return true;
            } else {
                CategoryDao.deleteById(id);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void findCategoriesByLevel(List<Category> categories, int i) {
        try {
            categories.addAll(CategoryDao.findCategoriesByLevel(i));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
