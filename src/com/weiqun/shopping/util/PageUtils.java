package com.weiqun.shopping.util;

public class PageUtils {
    public static int getTotalPage(int total,int pageSize) {
        return total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
    }
}
