<%@ page import="com.weiqun.shopping.bean.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.weiqun.shopping.bean.Product" %>
<%@ page import="com.weiqun.shopping.manager.ProductManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    List<Category> categories = new ArrayList<>();
    Category category = new Category();
    category.findCategoriesByLevel(categories, 3);
    String action = request.getParameter("action");
    if (action != null && action.equals("add")) {
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String normalprice = request.getParameter("normalprice");
        String memberprice = request.getParameter("memberprice");
        String categoryid = request.getParameter("categoryid");

        Product product = new Product();
        product.setName(name);
        product.setDescr(desc);
        product.setNormalprice(Double.parseDouble(normalprice));
        product.setMemberprice(Double.parseDouble(memberprice));
        product.setCategoryid(Integer.parseInt(categoryid));

        if (ProductManager.getInstance().addProduct(product)) {
            out.println("添加产品成功!");
%>
<script type="text/javascript">
    window.parent.main.location.reload();
</script>
<%
        } else {
            out.println("添加产品失败!");
        }
    }
%>
<!doctype html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<form action="addProduct.jsp" method="post">
    <table border="1">
        <tr>
            <td>名称:</td>
            <td><input type="text" name="name" placeholder="填入名称"></td>
        </tr>
        <tr>
            <td>描述:</td>
            <td><input type="text" name="desc" placeholder="填入描述"></td>
        </tr>
        <tr>
            <td>普通价格:</td>
            <td><input type="text" name="normalprice" placeholder="普通价格"></td>
        </tr>
        <tr>
            <td>会员价格:</td>
            <td><input type="text" name="memberprice" placeholder="会员价格"></td>
        </tr>
        <tr>
            <td>产品类别:</td>
            <td><select name="categoryid">
                <%
                    for (int i = 0; i < categories.size(); i++) {
                %>
                <option value="<%=categories.get(i).getId()%>"><%=categories.get(i).getName()%>
                </option>
                <%
                    }
                %>
            </select></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="提交"></td>
        </tr>
    </table>
    <input type="hidden" name="action" value="add">
</form>
</body>
</html>
