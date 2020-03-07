<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>民宿客栈管理系统</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/houduan/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/houduan/xadmin.css">
	
    <script src="${pageContext.request.contextPath}/resource/js/houduan/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/houduan/xadmin.js"></script>

</head>

<%--<script type="text/javascript">--%>
    <%--$(function() {--%>
        <%--$.ajax({--%>
            <%--type : "get",--%>
            <%--url : "/common/getAccountId",--%>
            <%--dataType : "text",--%>
            <%--success : function(result) {--%>
                <%--document.getElementsByTagName('b')[0].innerHTML=result;--%>
            <%--},--%>
            <%--error : function() {--%>
                <%--alert("請求失敗");--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>



<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="index.index.jsp">民俗客栈管理系统</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>

        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;"><b></b></a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <%--<dd><a onClick="x_admin_show('个人信息','${pageContext.request.contextPath}/user/getMyUserInfoJSP.action')">个人信息</a></dd>--%>
              <dd><a href="${pageContext.request.contextPath}">退出</a></dd>
            </dl>
          </li>
        </ul>
        
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
             <li >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6eb;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li><a _href="${pageContext.request.contextPath}/user/getAllUserInfoJSP.action"><i class="iconfont">&#xe6a7;</i><cite>查看用户</cite></a></li >
                </ul>
            </li>
            <li >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6eb;</i>
                    <cite>个人信息管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li><a _href="${pageContext.request.contextPath}/user/getMyUserInfoJSP.action"><i class="iconfont">&#xe6a7;</i><cite>查看个人信息</cite></a></li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe69e;</i>
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/order/getAllOrderInfoJSP.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>全部订单</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>房源管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/room/getAllRoomInfoJSP.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>查看所有房源信息</cite>
                        </a>
                    </li >

                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>评论管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/comments/getAllCommentsJSP.action">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>查看评论</cite>
                        </a>
                    </li >
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont">&#xe70b;</i>--%>
                            <%--<cite>会员管理</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe6a7;</i>--%>
                        <%--</a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a _href="houduan/member-del.html">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>会员列表</cite>--%>
                                <%--</a>--%>
                            <%--</li >--%>
                            <%--<li>--%>
                                <%--<a _href="houduan/member-del.html">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>会员删除</cite>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                </ul>
            </li>             
        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='${pageContext.request.contextPath}/login/firstPage.action' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <!--<div class="footer">
        <div class="copyright">Copyright ©2019 L-admin v2.3 All Rights Reserved</div>  
    </div>-->
    <!-- 底部结束 -->
</body>
</html>