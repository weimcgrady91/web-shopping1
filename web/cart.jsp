<%@ page import="com.weiqun.shopping.bean.Cart" %>
<%@ page import="com.weiqun.shopping.manager.ProductManager" %>
<%@ page import="com.weiqun.shopping.bean.Product" %>
<%@ page import="com.weiqun.shopping.bean.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean login = false;
    request.setCharacterEncoding("utf-8");
    String isLogin = (String) session.getAttribute("isUserLogin");
    if (isLogin == null || !isLogin.equals("true")) {
        out.println("<a href='login.jsp?route=cart'>登录,有更多优惠哦!</a>");
    } else {
        login = true;
    }
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
    }
    String action = request.getParameter("action");
    if (action != null) {
        String productIdStr = request.getParameter("productid");
        if (productIdStr != null) {
            int productid = Integer.parseInt(productIdStr);
            Product product = ProductManager.getInstance().findProduct(productid);
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setCount(1);
            if (action.equals("remove")) {
                cart.remove(cartItem);
            } else if (action.equals("add")) {
                cart.add(cartItem);
            } else if (action.equals("reduce")) {
                cart.reduce(cartItem);
            }
            session.setAttribute("cart", cart);
        }
    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="buy.jsp" method="post">
    <table align="center" border="1">
        <caption>购物车</caption>
        <tr>
            <td>名称</td>
            <td><%=login ? "会员价格" : "普通价格"%>
            </td>
            <td>数量</td>
            <td>操作</td>
        </tr>
        <%
            for (int i = 0; i < cart.getCartItems().size(); i++) {
        %>
        <tr>
            <td><%=cart.getCartItems().get(i).getProduct().getName()%>
            </td>
            <td>$&nbsp;<%=cart.getCartItems().get(i).getUnitPrice(login)%>
            </td>
            <td><%=cart.getCartItems().get(i).getCount()%>
            </td>
            <td><a href="cart.jsp?productid=<%=cart.getCartItems().get(i).getProduct().getId()%>&action=add">增加</a>
                <a href="cart.jsp?productid=<%=cart.getCartItems().get(i).getProduct().getId()%>&action=reduce">减少</a>
                <a href="cart.jsp?productid=<%=cart.getCartItems().get(i).getProduct().getId()%>&action=remove">删除</a>
            </td>
        </tr>
        <%
            }
        %>
        <tr>
            <td>收货地址</td>
            <td colspan="3">
                <textarea rows="20" cols="30" name="addr"></textarea>
            </td>
        </tr>
        <tr>
            <td>总价:</td>
            <td colspan="2">$&nbsp;<%=cart.getTotalPrice(login)%>
            </td>
            <td><input type="submit" value="提交"></td>
        </tr>
    </table>

</form>

</body>
</html>
