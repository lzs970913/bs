<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title> 民宿客栈管理系统的设计与实现</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content=" Master  Login Form Widget Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"/>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="./resource/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="//fonts.googleapis.com/css?family=Cormorant+SC:300,400,500,600,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/background/jquery-2.2.0.min.js"></script>


    <script src="${pageContext.request.contextPath}/resource/js/jquery.serializejson.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/jquery.json.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/jquery-2.2.4.min.js"></script>

    <script type="text/javascript">
        function login() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/login/userLogin.action" ,//url
                data: $('#loginform').serialize(),
                success: function (result) {
                    if (msg) {//根据返回值进行跳转
                        window.location.href = '${pageContext.request.contextPath}/login/userLogin.action';
                    }
                }

            });
        }
    </script>
    <style>
        #reg{
            color:#999;
            padding-left: 20px;
        }

        #reg:hover{
            color:red;
        }
    </style>
</head>

<body>
<div class="padding-all">
    <div class="header">
        <h1>民俗客栈管理系统</h1>
    </div>

    <div class="design-w3l">
        <div class="mail-form-agile">
            <%--${pageContext.request.contextPath}/login/userLogin.action--%>
            <form action="${pageContext.request.contextPath}/login/userLogin.action" method="post" id="loginform">
                <input type="text" name="name" placeholder="User Name  or  email..." required=""/>
                <input type="password"  name="password" class="padding" placeholder="Password" required=""/>

                <input type="submit" value="登录">  <a id="reg" href="${pageContext.request.contextPath}/regist/regist.action" target="_blank"> 去注册</a>
                <%--<input type="button" onclick="login()" value="提交">--%>
            </form>
        </div>
        <div class="clear"> </div>
    </div>

    <div class="footer">
        <%--<p>© 2017  Master  Login form. All Rights Reserved | Design by  <a href="#" >  w3layouts </a></p>--%>
    </div>
</div>
</body>
</html>