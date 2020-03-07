<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>民俗客栈管理系统</title>
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
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <!--<a href="">首页</a>-->
        <!--<a href="">演示</a>-->
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </div>
    <div class="x-body">
      <%--<div class="layui-row">--%>
        <%--<form class="layui-form layui-col-md12 x-so">--%>
          <%--<input class="layui-input" placeholder="开始日" name="start" id="start">--%>
          <%--<input class="layui-input" placeholder="截止日" name="end" id="end">--%>
          <%--<div class="layui-input-inline">--%>
            <%--<select name="contrller">--%>
              <%--<option>支付状态</option>--%>
              <%--<option>已支付</option>--%>
              <%--<option>未支付</option>--%>
            <%--</select>--%>
          <%--</div>--%>
          <%--<div class="layui-input-inline">--%>
            <%--<select name="contrller">--%>
              <%--<option value="">订单状态</option>--%>
              <%--<option value="0">待确认</option>--%>
              <%--<option value="1">已确认</option>--%>
              <%--<option value="2">已收货</option>--%>
              <%--<option value="3">已取消</option>--%>
              <%--<option value="4">已完成</option>--%>
              <%--<option value="5">已作废</option>--%>
            <%--</select>--%>
          <%--</div>--%>
          <%--<input type="text" name="username"  placeholder="请输入订单号" autocomplete="off" class="layui-input">--%>
          <%--<button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>--%>
        <%--</form>--%>
      <%--</div>--%>


        <table class="layui-table" lay-data="{width: 1000, height:332, url:'${pageContext.request.contextPath}/order/getAllOrderInfo.action', page:true, id:'idTest'}" lay-filter="demo">
          <thead>
          <tr>
            <th lay-data="{field:'id', width:120, sort: true, fixed: true}">订单编号</th>
            <th lay-data="{field:'roomName', width:120}">预定房间名</th>
            <th lay-data="{field:'orderStartData', width:140, sort: true}">订单开始时间</th>
            <th lay-data="{field:'orderEndData', width:140}">订单结束时间</th>
            <th lay-data="{field:'orderStatus', width:80}">订单状态</th>
            <th lay-data="{field:'userName', width:200}">预定人</th>
            <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
          </tr>
          </thead>
        </table>
      <script type="text/html" id="barDemo">
        <%--<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
        <a  class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
      </script>

    </div>

    <%--<script>--%>
        <%--layui.use('table', function(){--%>
            <%--var table = layui.table;--%>

            <%--table.render({--%>
                <%--elem: '#test'--%>
                <%--,url:'${pageContext.request.contextPath}/order/getAllOrderInfo.action'--%>
                <%--,cellMinWidth: 80--%>
                <%--,cols: [--%>
                    <%--[--%>
                        <%--{field:'id', width:80, title: 'ID', sort: true}--%>
                        <%--,{field:'name', width:80, title: '房间名'}--%>
                        <%--,{field:'orderStartData', title: '开始时间', sort: true}--%>
                        <%--,{field:'orderEndData', width:80, title: '结束时间'}--%>
                        <%--,{field:'orderStatus', title: '订单状态', minWidth: 150}--%>
                        <%--,{field:'username', title: '预定用户', sort: true}--%>
                        <%--,{fixed: 'right', width: 200, align:'center', toolbar: '#barDemo'}--%>
                    <%--]--%>
                <%--]--%>
                <%--,page: true--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>

    <script>
        layui.use('table', function(){
            var table = layui.table;
            //监听表格复选框选择
            table.on('checkbox(demo)', function(obj){
                console.log(obj)
            });
            //监听工具条
            table.on('tool(demo)', function(obj){
                var data = obj.data;
                if(obj.event === 'detail'){
                    layer.msg('ID：'+ data.id + ' 的查看操作');
                } else if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        $.ajax({
                            type: "GET",
                            url: "/desensitization/order/deleteOrder/"+data.id+".action",
                            success: function(msg){
                                layer.msg("删除成功");
                            }
                            ,error:function(msg) {
                                layer.msg("删除失败");
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
                        ,content: '${pageContext.request.contextPath}/room/updataRoomInfoByIdJSP.action'
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

            var $ = layui.$, active = {
                getCheckData: function(){ //获取选中数据
                    var checkStatus = table.checkStatus('idTest')
                        ,data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                }
                ,getCheckLength: function(){ //获取选中数目
                    var checkStatus = table.checkStatus('idTest')
                        ,data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                }
                ,isAll: function(){ //验证是否全选
                    var checkStatus = table.checkStatus('idTest');
                    layer.msg(checkStatus.isAll ? '全选': '未全选')
                }
            };

            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });
    </script>
  </body>

</html>