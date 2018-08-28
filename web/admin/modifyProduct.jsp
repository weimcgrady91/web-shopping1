<%@ page import="com.weiqun.shopping.manager.ProductManager" %>
<%@ page import="com.weiqun.shopping.bean.Product" %>
<%@ page import="com.weiqun.shopping.bean.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if(action!=null && action.equals("modify")){
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String normalprice = request.getParameter("normalprice");
        String memberprice = request.getParameter("memberprice");
        String categoryid = request.getParameter("categoryid");

        Product product = new Product();
        product.setId(Integer.parseInt(id));
        product.setName(name);
        product.setDescr(desc);
        product.setNormalprice(Double.parseDouble(normalprice));
        product.setMemberprice(Double.parseDouble(memberprice));
        product.setCategoryid(Integer.parseInt(categoryid));
        if(ProductManager.getInstance().modifyProduct(product)){
            out.println("编辑产品成功!");
            %>
<script type="text/javascript">
    window.parent.main.location.reload();
</script>
<%
            return;
        } else {
            out.println("编辑产品失败!");
            return;
        }
    }


    List<Category> categories = new ArrayList<>();
    Category category = new Category();
    category.findCategoriesByLevel(categories, 3);
    if (categories.size() == 0) {
        out.println("编辑产品失败!");
        return;
    }

    String idStr = request.getParameter("id");
    if (idStr == null) {
        out.println("删除产品失败!");
    }
    int id = -1;
    try {
        id = Integer.parseInt(idStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
    }
    Product product =
            ProductManager.getInstance().findProduct(id);
    if (product == null) {
        out.println("编辑产品失败!");
        return;
    }

%>
<!doctype html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<form action="modifyProduct.jsp" method="post">
    <input type="hidden" name="action" value="modify">
    <input type="hidden" name="id" value="<%=product.getId()%>">
    <input type="hidden" name="name" value="<%=product.getName()%>">
    名称:<input type="text" placeholder="填入名称" value="<%=product.getName()%>" disabled><br/>
    描述:<input type="text" name="desc" placeholder="填入描述" value="<%=product.getDescr()%>"><br/>
    普通价格:<input type="text" name="normalprice" placeholder="普通价格" value="<%=product.getNormalprice()%>"><br/>
    会员价格:<input type="text" name="memberprice" placeholder="会员价格" value="<%=product.getMemberprice()%>"><br/>
    产品类别:<select name="categoryid">
    <%
        for (int i = 0; i < categories.size(); i++) {
    %>
    <option value="<%=categories.get(i).getId()%>" <%=categories.get(i).getId() == product.getCategoryid() ? "selected" : ""%>><%=categories.get(i).getName()%>
    </option>
    <%
        }
    %>
</select><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
