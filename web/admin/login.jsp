<%@ page import="com.weiqun.shopping.bean.Admin" %>
<!-- saved from url=(0066)http://auth.gionee.com/login?service=http%3A%2F%2Fhr.gionee.com%2F -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String result = "";
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if (action != null && action.equals("login")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null
                && !username.trim().equals("")
                && password != null
                && !password.trim().equals("")) {
            Admin admin = new Admin(username, password);
            if (admin.login()) {
                session.setAttribute("adminLogin", "true");
                session.setAttribute("adminUserName",username);
                response.sendRedirect("index.jsp");
            } else {
                out.println("账户或密码错误!");
            }
        }
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Shopping后台登录</title>
    <link rel="stylesheet" href="./style/gnif.css">
</head>
<body style="background: rgb(242, 242, 242);">
<div class="loginArea01">
    <img src="./images/login_logo_03.png">
</div>
<div class="loginArea02">
    <div class="loginTit01">

    </div>
    <form id="fm1"
          action="login.jsp"
          method="post">
        <input type="hidden" name="action" value="login">
        <div class="loginBor01">
            <div class="adImg01"><img src="./images/loginAd.jpg"></div>
            <div class="forms">
                <div class="lineDi">
                    <span class="labe">用户名</span>


                    <input id="username" name="username" class="required" tabindex="1" type="text" value="" size="25"
                           autocomplete="off">


                    <div class="inpIco userIco"></div>
                </div>
                <div class="lineDi" id="pass">
                    <span class="labe">密码</span>
                    <input id="password" name="password" class="required" tabindex="2" type="password" value=""
                           size="25" autocomplete="off">
                    <div class="inpIco passIco"></div>
                </div>

                <%--<div class="lineDi selecTex" style="display: inline">--%>
                <%--<input type="checkbox" tabindex="5" id="rememberMe" name="rememberMe" value="true">--%>
                <%= result%>
                <%--</div>--%>
                <%--<div class="lineDi selecTex" style="display: inline;">--%>
                <%--<a target="_blank" href="http://auth.gionee.com/forget">忘记密码</a>--%>
                <%--</div>--%>
                <div class="lineDi">
                    <input id="" type="submit" value="提交">
                </div>
                <input type="hidden" name="lt" value="">
                <input type="hidden" name="execution"
                       value="383fb849-654b-4e21-8219-85125843870f_ZXlKaGJHY2lPaUpJVXpVeE1pSjkuY0hwbWVqRlVkRlZCYWtocVVqazJSM0ZuU1VsMmVucFlZekp2Wld0SmVtVnhUV0V5VFZsVGVHMW1aRWRNTHpCTmJFRjRTVkEyVWtaM1QxZzFOekZDWkZvMGJXTjBiRkY0UVdoMFRWUm1SWFpJYVRSek9FNXdaMnBTU1ZKQ1dHVXhjVFpvT1VsVU1IVTJXbGhDWjFsUWFFNURiUzlxYW5SRlpVeHVRek01YmpoNWJIaEtjV2RQZWxGUWJrbFFORE5KWjFKd1NucFFhR1o0YTI5R1NUTTBVSEpRSzJsV1JEQlRORVZyYlZrMVZYcDBUbEJ2Y1VSWVJrdzVkWGt3U0dRelJWWmhiVUZaUkZwRU4xQk1OWFZzYXpKYWVIQmtaSFZIT0VsVmFVcG5RMDUzYW14WU5VRmFRUzk1VW01UE4yMVlUR05JVDJGRWNVRTBTbkp1ZEdGa1dXWXZja2xMZWxSVlNXUkhMMjh3Vmt4a05UWk5LMnhXWld4Mk4xUlRUMEp3YmpFd2MwNHZhRU4wY1dGS2MySklXR3hYU0ZCbFVtNVBiamRQVFhCS2FIVjVaMWh3TkVweVdVTkhVRm92VTFOa1oxQk1aR00wYW10dVdGZDNjVGRTUWpSTWNYWnBjVEJzVURsbE0yVjNibVZKVVVFeFRUWjFPR2xvTW1oQlJTOXNLMHR6U1ZZNWFtbDFaVk13TXpoa1JuaHlkVkpOVjJJNEt6UjVkRkE1Ym5sMVZXTkJRMWQxZERkc1UxcGpiVk5HY0RGVGEwRkhSV2hEZDJ0S1ZIRjFVMVp1VDJKeWFuWlBSSFpHYjFaTVF6UjJZV1ZRVGtaVWFGVkVWM0JJU2xCaGNEZzJMMDlQVFd4U2FYWkpkalY2Y1RWMmJtNVJlSEEzYkcwcmFqZzBWMVJDYTB0dlFUZzRjbFl3YTJwTVFVcGpiVEUzU0V4NWVqWlJSbTVET1doSFkwWkNRblZGWjBNeFVrVm9RMVI0UVZseFJsVnVlVllyTjA0d1VEWktPRFZKVkZOMGMySjNWRGhLT0hRclEySnZhMlZTU2lzNWIycDBWR1FyUXpaelpHWkJlbEZITWtOMk56VnFSV05uTVhwWFFtVlRNbkZVT1VoMGNWWm9SbmxZWVZWaUwxRndVVzU0ZDAxR01TdFRhVVl6VjBORmRqZElVREZHZW14NVoxTm5kMDlCYUVoM2NIRjRTemx0TlU5Qk5WbHJjWEJTY0U5aFZFbDVlRUY2VFZWSFQwb3hSVFJZYm1wMlJ6WkJTRFJyU2xJMlFWcFVPR0Z5WkM5dlVIRXdPVGxCVEhFNFRrOWhXSFIyTTJVd1UxSm1SRklyTlhaa2VHZG5aa05wVnk5aU9FOTVSbWQzVlhab2JHcEdOMlUzTkdKelprWlNkRkZPUWt0UE9FcFROaTltUkdSMllrMW1UWE5CUkZGeWJVWkxkakF3TlhwWVoyeFJRM05qZERWRk9YaHFXbGs0Tkd0alNUWjZOVmhrWTNnM1NtOUxVbkJXU1ZKeUwwNXRSVXRwVGxCRE1Hd3piMG96ZFc4M1pYRlpUbTlaZVdnek5VSlhSbkU0Y2s5bFpVMXVZa1pKTTI1RFMyUnhRMmRDY25CSGEwbENNbEJuYlhaYVNISmpabUoyZWt4TVFYSTBZVFZNUkRkQlFWZGxiREZrVkdsSlJ6RlFNRXRJVW1GVWNVOW1aRGd5U0ZCR1RESkdOVlJMT0c5alluTllNR2xHWW5aMFdURm5lblIzVGpSak9XY3lhV3BFWWxaVk0wOW9VV3BvVXpseGVqSlVUV2RYV0ZaQ1RuUnlObGxDYURkNlVHZ3pUVE4zZERGNFQwUjBWbUZIY0VVMmJFUnZTWE1yTUU4eGMwOXVVMkoyVlhZMU5VZFJLMVY1Vm1ReGVreHhaSFJJTldSTFR6VmpOWEI0YjBaV1pFMVZSVFpSYW1FeVRUbHlkbEZ5U0hZNVNWVnJhbkI1UXpoa1UxRm5VVFE0VXpkR1MzTlFiak52TjJjeGJtMU9TalJ6UVVSalZYSktjVVJqUjJWMU5GZ3ZWeTlETlUwdkwzVjZORU5DZUUxSk1sVXplazVJVldSaGFHdHdhR2RaVDIxQ2NtTmFWa1I0TlV3elIweE9SMGhpWlhCalVEWXJRVlJTUkVKV1NYRkxZa3hZU2tsSVVGWjJjak5NYm14dmIzTTFOSE5tWTFOVk1rb3pUMDk2V0dsdFZrMHZhVlJFZUU1S05WSk9NM3BGU0VkWFRuSlRWVGwwV0d0aUswZHBVRTVOUm5GWk5WUm5XRmc0WjNCcWVGTk9hVGRwTldSRGFYZzJPSGRXTkVNeGNqSm5lRVZYVURCd1prZGxSMlZKUTFOaGRWbEZSbkl3Y1RCb1ltYzJiMlZZY21aVFUxRnJSRVZIYUZNd1NtcHpjV3hNVGpGVFUwOUtZMlU0VWpaaU5uQnRSVFY2ZHk5dlZGSlZSbTltYVZSTWFGWkJjMmNyVGpsQldUUm5iM1l5UkVaV2NWbzFiM0ZWY2sxak5uZERXR1JVV1hSR2QyODJVVkJrY1ZGeGNGVlVWMEk0TTNOd1RHWlZhMWwzZGlzM2FVeE1WRWRFYVZnclpWUmhka3AzWjBWSFNsb3pWRTVzWW00d1kzQmFibTlHZDA0M2VUTlZUWEZaZGtVcmNGaGtZMWxZU2k5dFZtc3ZWRVZIU2pKMmFrZEtiMEY1ZFUxUk9VbHJOelExWkhOM2VFOVJObkZETnk5R2RURktSbVZUSzFKSFIzZExSRUZsTjBjMFVGSlJhVE0yU1dNeGVWRmpOM1pPZW5KRmMyaHhTVW8wTlRBNFFXMXliMU0zS3pOdFNsUXdWQzlwVjJwSVZVc3dPV1ZHVDAxVmMwUnNVVm94U0RWdGRGZGhWRGR0ZHpoSVIzaDBjaXN4YVRsWFVGZFdjREZJYkdFMlQyRlRMMlpvUjFoRGJqSmFlbEJXUW5RdlZEZDBSV2RHY3l0a2VYazVNV3gyVjFoSmMxUnZPSEZpSzFSQlVreEJVRk15VFZaalVUZDROamRpU1RkU2RVRmphbTFNUmxocE1GcFBSMmhZYURoUFZYSnFXSE16ZVZveU4ybDZWak5YTjFNcmJYVnJjVTE2Wld0M2IyVmxPVk5uVWxScVQzQklTbm8zYWxCSFFXRXpZa1UxTWk5UU1XbFVRVmxXT0ZSSFlVTkJlVkpZT0hBNVFqSjBUaTlOYml0cGVYUnhUMUJVYlRCMlZEQk1hSGxGWlVadWMzQnFWV0ZZUTJSWFlYWlBSMlZWUm1GT1JFNXlkMUJzU1ZkWGFHNHJhRWs1YW01aFdsUk9ZVWMzTUVKT2RsZDROemxPTWtKd2VHeE5hVXRUWmxWdlZ6a3lhRnA0VUhSVmFqVmtiRXBJZVhab1oyc3dhR2x2VFRsNGMyTnBXa3RpWjJzNWREUnNkRGxFUmlzM2FESlNTVzh2TUdoclptOW1ZV1JNWlVoU1FXUklkbUZYWVhwT1NXb3hTbHBWWldZMllrOUtjMHg2UVhCVk4yVkthMEpwUmtsa1ptTmFNR1V2WjNFeU0wSm5WRVIxY0VGUWRUWk1MMVoxU0hKT2FXOU1aekkzYWtaQllVRm9NbkJ0Ymtjck1XeGFUbnBYV2pjNFRFVjZZbFUzUlc5U1drVktPV1JoUWtzdk9HTnVkQ3RMVlhSclZEaHZURVl6WWxjMVpuSk9hbHAwUzA5M2RHaHVaRmw0TWpoWlRuZExUMVpvTlRFNFNqZHhXVUZVUjJSTVFsUjRNblYwZW1abU5USldjblEwZFU5eGFYaFRVVFptVm5sUFNYUnJjV0pFU1RKRGFFSnpRblYxYjBobGFXSXJkR3h0VGpKVFJuQlVkbW95T1hGRGJTOVVjR1ZTTmpWbFFWQlRlRGRXTm1kRFJXcFJUVU5qT0Uxak0zbzNibkV5WmxaQldFSjBOWEpVWVRONVpXNXFZV3BJT0VwRmJXRTVla3RXUnl0TmFFTTFkVGRSVEcxWE9IQXpRMVo0TDBWQmVXNW1WRmwxVW05WFYybEVSbE5HWWxBeWMxVlphMUJuVlc1clZsQmFVMWxZVWxkdWJFMHpia2RuVVROSFpWVkJUMHcyYVhwb016QmlhMU5xVUVGR01FZHZNREJoT0hkT2MzTkRUbmczVjNjeWRGSnRZa1p6ZWtwSmRqVnhWRVV6WmpWRGFsRlVMMjB6UkVKMVRFMHdNSGxNUkhsVlkyUkdaVFJ3ZDJoV1YzZGFTbmhQYm1wc2VIaFNNbkZvT1RKb2RrOXZUamgwVmtGQldrOXFXbEpsUXpneFpXSnFNWEZxVkhWS1dqUmpOUzg1U21kRlkwZEpXVmwyZG5KRWIyUm9kM2hHVWxoaE9TODFRa0pMZEdkM01GVnpiUzlOVjJKamRtbHpjRUpXWVdSeWJUWXhXbGQ1VGt0TlQyMUVSbGxrU0VveGIxQTBUMUptTDB0Q1luTlJWM0U0Y0d0cE5uSkhSMWRzVlVVNU0zVXdSMUpyUW1oRFdsaE5jVEZDV25KWFFVZEZhMUJJSzFSMGVUWnhPV3RXV0VkTE1uTm5iV2M0YWxGT1dVcGxWMUJ0VDNNdmJYbE9WVTltWTBzdlJGaHROMlpSTkN0SFFYRndOWEFyZFdwR04wSktZM2xOVlU5M2NGQTFjMVY2VEc1MFptRmpVVGR1ZFc0M1oybEZXVlpDTVdkSVZrbFhZMFY2YVRJeVJHTlZZV1ozUW5JMlowUldaa2h2VlhCdmFtNXJRMmcwV1VSVVRrMXVheTluVkZadVpqUnVSM1pTWVZSQ2QxbERiVUZwZUUxc2FHeFlTMDVYY3pobWJYTmtRVlZISzIxUE9VVnlVWFZCU0hwUVExTldNVEZhVHpsNlVrUkVPSEk0VGtkalRuaEpVRlZwU0RKVVYwNHpLMG96Y3pjeVoyZEViMWxyTVZab1RIWnBjbUY2U1RKdFFtNVlaVGNyVTBSRFQxWm1NSEZyU0VKbVRuVmxMMmwyZVM5dlVVUjZlRm94VmpGTVVETjZVU3N3VjBneGFsWmlSRlJHUjJWTGJrWjBVazh2VXpaa1RqZzFVbE5KZG5Gd2RXMU5iemR2YjBsR1luUTRLMmh4VVROdFUybGxUbmxtZFM5bUwxUkVOa2RVYjJaNFozSlZVVVJsVTJacmVVTXdRbUZoUWs1cmF5dDVURkZxVkdwd1dXczVTSFJtUmtwcmFsRnZWMFU0YjNSek9VNTRiaTlhYzBFME9YbDVabEo0T1hkSU1raE5URXhWVXpSeWNXZEhjVm8zUzNWc1Z6ZE5SWEExVHpkNk5tRXdNRXhLWVZOb2RtdGpiSFJ2TUVwcE5sZEZjM293TVVjMWNrMHlXV1IwVG5ObFVISXZhV3BFZEZsaE4wOTBTRVJ1U2t3MU5IUnpLMEoyYnpFMVF6UTBNMlJPUTBWUi5ILWJzdkRFdG1LTVh2VmNmQ2NrWUkyWV9uak83RzRlVGJ0VFhxVkZPdWE5aV9qdlNnZkQxV2dkNE0tS21wemg3S0pDVFRqRnZuT0xqUkZDVHlXLVR5dw==">
                <input type="hidden" name="_eventId" value="submit">
            </div>

        </div>
    </form>
</div>
<div class="shadowLine"></div>
<div class="bottomArea01">
    <ul>
        <li class="floatL">@版权所有：深圳市金立通信设备有限公司</li>
        <li class="floatR">软件开发：金立集团信息中心开发部</li>
    </ul>
</div>
<script type="text/javascript" src="./script/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(function () {
        if (!$('#password').val()) {
            $('#password').focus();
        }
        if (!$('#username').val()) {
            $('#username').focus();
        }
    });

    function onCaptchaClick() {
        var now = new Date();
        $('#captchaImg').attr('src', "captcha?" + now.getTime());
    }
</script>


</body>
</html>