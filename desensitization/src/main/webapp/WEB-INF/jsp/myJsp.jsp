<%--
  Created by IntelliJ IDEA.
  User: LZS
  Date: 2019/5/12
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Title</title>
</head>
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
            url: "${pageContext.request.contextPath}/user/getAllUserInfo.action" ,//url
            data: $('#loginform').serialize(),
            success: function (result) {
               alert("right")
            },
            error : function() {
                alert("cuowu")
            }
        });
    }
</script>
<body>

<a href="${pageContext.request.contextPath}/user/getAllUserInfo1.action">查询所有人信息</a>
</body>
</html>
