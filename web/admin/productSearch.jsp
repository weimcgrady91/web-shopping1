<%@ page import="com.weiqun.shopping.bean.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="checkSession.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    List<Category> categories = new ArrayList<>();
    new Category().findCategoriesByLevel(categories, 3);
%>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<form action="productSearchList.jsp?pageNum=1" target="main" method="post">
    <input type="hidden" name="action" value="search">
    <table>
        <caption>产品搜索</caption>
        <tr>
            <td>名称:</td>
            <td colspan="2"><input type="text" name="key" placeholder="输入名称"></td>
        </tr>
        <tr>
            <td>普通价格:</td>
            <td><input type="text" name="minnormalprice" placeholder="最小价格"></td>
            <td><input type="text" name="maxnormalprice" placeholder="最大价格"></td>
        </tr>
        <tr>
            <td>会员价格:</td>
            <td><input type="text" name="minmemberprice" placeholder="最小价格"></td>
            <td><input type="text" name="maxmemberprice" placeholder="最大价格"></td>
        </tr>
        <tr>
            <td>产品类型:</td>
            <td colspan="2">
                <select name="categoryid">
                    <%
                        for (int i = 0; i < categories.size(); i++) {
                    %>
                    <option value="<%=categories.get(i).getId()%>"><%=categories.get(i).getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
    </table>
    <tr>
        <td colspan="3"><input type="submit" value="提交"></td>
    </tr>


</form>
</body>
</html>
