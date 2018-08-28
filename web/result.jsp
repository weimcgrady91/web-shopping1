<%@ page import="com.weiqun.shopping.bean.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setContentType("text/html");
    response.setHeader("Cache-Control","no-store");;
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
//    response.getWriter().write("<msg>invalid</msb>");


%>
<%
    Category category = new Category();
    List<Category> categories = new ArrayList<>();
    category.findCategoriesByLevel(categories, 1);
    StringBuffer sb = new StringBuffer();
    sb.append("var category1 = document.getElementById('category1');\n");
    sb.append("category1.length=" + categories.size() + ";\n");
//    sb.append("category1.selectedIndex=0;\n");
    for (int i = 0; i < categories.size(); i++) {
        sb.append("category1.options[" + i + "].text='" + categories.get(i).getName() + "';\n");
        sb.append("category1.options[" + i + "].value='" + categories.get(i).getId() + "';\n");

        //        sb.append("if(category1.selectedIndex===0){");
//        List<Category> childCategories = CategoryDao.findChildCategories(i);
//        for (int i = 0; i <)
//            sb.append("");
//        sb.append("}");
        sb.append("if(category1.selectedIndex==="+i+"){\n");
        String childStr = getChildCategories(categories.get(i).getId());
        System.out.println(childStr);
        sb.append(childStr);
        sb.append("}\n");
    }
//    String childStr = getChildCategories(categories.get(0).getId());
//        sb.append(childStr);
    String result = sb.toString();
    response.getWriter().write(result);

%>

<%! public String getChildCategories(int pid) {
    System.out.println(pid);
    List<Category> childCategories = new ArrayList<>();
    new Category().findChildCategories(childCategories, pid);
    StringBuffer sb = new StringBuffer();
    sb.append("var category2 = document.getElementById('category2');\n");
    sb.append("category2.length=" + childCategories.size() + ";\n");
    sb.append("category2.selectedIndex=0;\n");
    for (int i = 0; i < childCategories.size(); i++) {
        sb.append("category2.options[" + i + "].text='" + childCategories.get(i).getName() + "';\n");
        sb.append("category2.options[" + i + "].value='" + childCategories.get(i).getId() + "';\n");
    }
    return sb.toString();
}
%>
