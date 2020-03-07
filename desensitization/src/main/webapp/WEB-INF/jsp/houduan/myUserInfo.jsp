<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>洗衣店管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/houduan/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/houduan/xadmin.css">
    <script src="${pageContext.request.contextPath}/resource/js/houduan/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/houduan/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <%--<div class="x-nav">--%>
      <%--<span class="layui-breadcrumb">--%>
        <%--<!--<a href="">首页</a>-->--%>
        <%--<!--<a href="">演示</a>-->--%>
        <%--<a><cite>导航元素</cite></a>--%>
      <%--</span>--%>
      <%--<a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">--%>
        <%--<i class="layui-icon" style="line-height:38px">ဂ</i></a>--%>
    <%--</div>--%>
    <div class="x-body">
      <%--<xblock>--%>
        <%--&lt;%&ndash;<button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/user/addUserJSP.action')"><i class="layui-icon"></i>添加</button>&ndash;%&gt;--%>
      <%--</xblock>--%>
        <table class="layui-table" lay-data="{width: 1000, height:332, url:'${pageContext.request.contextPath}/user/getMyUserInfo.action', page:true, id:'idTest'}" lay-filter="demo">
        <thead>
        <tr>
          <%--<th lay-data="{type:'checkbox', fixed: 'left'}"></th>--%>
          <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
          <th lay-data="{field:'name', width:200}">用户名</th>
          <th lay-data="{field:'gender', width:80, sort: true}">性别</th>
          <th lay-data="{field:'age', width:80}">年龄</th>
          <%--<th lay-data="{fixed:'right', width:178, align:'center', toolbar: '#barDemo'}"></th>--%>
        </tr>
        </thead>
      </table>
      <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
        <%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">重置密码</a>--%>
      </script>

    </div>

    <%--<script>--%>
    <%--layui.use('table', function(){--%>
    <%--var table = layui.table;--%>

    <%--table.render({--%>
    <%--elem: '#test'--%>
    <%--,url:'${pageContext.request.contextPath}/user/getAllUserInfo.action'--%>
    <%--,cellMinWidth: 80--%>
    <%--,cols: [--%>
    <%--[--%>
    <%--{field:'id', width:80, title: 'ID', sort: true}--%>
    <%--,{field:'name', width:200, title: '账号'}--%>
    <%--,{field:'gender', width:80, title: '性别'}--%>
    <%--,{field:'age', title: '年龄', minWidth: 150}--%>
    <%--,{fixed: 'right', width: 200, align:'center', toolbar: '#barDemo'}--%>
    <%--]--%>
    <%--]--%>
    <%--,page: true--%>
    <%--});--%>
    <%--});--%>
    <%--</script>--%>

    <script>
        layui.use(['layer','form','table'], function(){
            var table = layui.table;
            //监听表格复选框选择
            table.on('checkbox(demo)', function(obj){
                console.log(obj)
            });
            //监听工具条
            table.on('tool(demo)', function(obj){
                var data = obj.data;
                if(obj.event === 'detail'){
                    layer.confirm('真的重置用户密码么', function(index){
                        $.ajax({
                            type: "GET",
                            url: "/desensitization/user/updataPasswprd/"+data.id+".action",
                            success: function(msg){
                                layer.msg("重置成功");
                            }
                            ,error:function(msg) {
                                layer.msg(msg.responseText);
                            }
                        })
                        layer.close(index);
                    });
                } else if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        $.ajax({
                            type: "GET",
                            url: "/desensitization/user/deleteUserInfoById/"+data.id+".action",
                            success: function(msg){
                                layer.msg("删除成功");
                            }
                            ,error:function(msg) {
                                layer.msg(msg.responseText);
                            }
                        })
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    // layer.alert('编辑行：<br>'+ JSON.stringify(data))
                    layer.open({
                        type: 2 //此处以iframe举例
                        ,title: '当你选择该窗体时，即会在最顶端'
                        ,area: ['390px', '260px']
                        ,shade: 0
                        ,maxmin: true
                        ,offset: [ //为了演示，随机坐标
                            Math.random()*($(window).height()-300)
                            ,Math.random()*($(window).width()-390)
                        ]
                        ,content: '${pageContext.request.contextPath}/user/updataUserInfoJSP/'+data.id+'.action'
                        ,yes: function(){
                            $(this).click();
                        }
                        ,btn2: function(){
                            layer.closeAll();
                        }

                        ,zIndex: layer.zIndex //重点1
                        ,success: function(layero){
                            layer.setTop(layero); //重点2
                        }
                    });
                }
            });



            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });
    </script>
  </body>

</html>