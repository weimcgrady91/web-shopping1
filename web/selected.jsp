<%@ page import="com.weiqun.shopping.bean.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.weiqun.shopping.dao.CategoryDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        var result ;
        function loadCategory() {
            alert("aaa");
            // alert("a");
            // var from1 = document.getElementById('form1');

            <%--eval(<%=aa%>)--%>
           if(result==null){
               alert('result===null');
               result = fetchCategory();
           }
           alert(result);
           result;
            // var category1 = document.getElementById('category1');
            // category1.length=2;
            // category1.selectedIndex=1;
            // category1.options[0].text='a';
            // category1.options[0].value='a';
            // category1.options[1].text='b';
            // category1.options[1].value='b';
        }

        window.onload = loadCategory;

        function loadCategory2(select) {
            <%--<%=getChildCategories()%>;--%>
        }

        function fetchCategory(){
            alert('fetchCategory');
            var xmlhttp;
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp=new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                alert(xmlhttp.readyState);
                if (xmlhttp.readyState==4 )
                {
                    alert(xmlhttp.responseText);
                    result = xmlhttp.responseText;
                    eval(xmlhttp.responseText);
                    // return xmlhttp.responseText;

                }
            }
            xmlhttp.open("GET","result.jsp",true);
            xmlhttp.send();
            alert("bb11");
        }
    </script>
</head>
<body>
<form name="form1" action="#" method="post" id="form1">
    <select name="category1" id="category1" onchange="loadCategory();"></select><br/>
    <select name="category2" id="category2"></select>
</form>
</body>
</html>
