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
          <%--&lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<select name="contrller">&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option>支付状态</option>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option>已支付</option>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option>未支付</option>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</select>&ndash;%&gt;--%>
          <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
          <%--&lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<select name="contrller">&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option value="">用户状态</option>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option value="0">待确认</option>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option value="1">已确认</option>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option value="2">已收货</option>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option value="3">已取消</option>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option value="4">已完成</option>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<option value="5">已作废</option>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</select>&ndash;%&gt;--%>
          <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
          <%--&lt;%&ndash;<input type="text" name="username"  placeholder="请输入订单号" autocomplete="off" class="layui-input">&ndash;%&gt;--%>
          <%--<button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>--%>
        <%--</form>--%>
      <%--</div>--%>
      <xblock>

        <button class="layui-btn" onclick="x_admin_show('添加房源','${pageContext.request.contextPath}/room/addRoomInfoJSP.action')"><i class="layui-icon"></i>添加</button>
        <%--<span class="x-right" style="line-height:40px">共有数据：88 条</span>--%>
      </xblock>



      <table class="layui-table" lay-data="{width: 1000, height:332, url:'${pageContext.request.contextPath}/room/getAllRoomInfo.action', page:true, id:'idTest'}" lay-filter="demo">
        <thead>
        <tr>
          <%--<th lay-data="{type:'checkbox', fixed: 'left'}"></th>--%>
          <th lay-data="{field:'id', width:120, sort: true, fixed: true}">房源编号</th>
          <th lay-data="{field:'name', width:200}">房间名</th>
          <th lay-data="{field:'price', width:100, sort: true}">房间价格</th>
          <th lay-data="{field:'description', width:300}">房间描述</th>
            <%--<th lay-data="{field:'imgUrl', width:80,templet: function(res){--%>
        <%--return '<img src=\'/desensitization/'+res.imgUrl+'\'  style=\'width:40px\' />'--%>
      <%--}}">图片</th>--%>
          <th lay-data="{field:'status', width:80}">房间状态</th>
          <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
        </tr>
        </thead>
      </table>

      <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
      </script>

    </div>

    <%--<script>--%>
        <%--layui.use('table', function(){--%>
            <%--var table = layui.table;--%>

            <%--table.render({--%>
                <%--elem: '#test'--%>
                <%--,url:'${pageContext.request.contextPath}/room/getAllRoomInfo.action'--%>
                <%--,cellMinWidth: 80--%>
                <%--,toolbar: '#barDemo'--%>
                <%--,cols: [--%>
                    <%--[--%>
                        <%--{field:'id', width:50, title: 'ID', sort: true}--%>
                        <%--,{field:'name', width:160, title: '房间名字'}--%>
                        <%--,{field:'price',width:120, title: '价格', sort: true}--%>
                        <%--,{field:'description', title: '房间描述'}--%>
                        <%--,{field:'state', width:100,title: '房间状态', minWidth: 150}--%>
                        <%--,{fixed: 'right', width: 200, align:'center', toolbar: '#barDemo'}--%>

                    <%--]--%>
                <%--]--%>
                <%--,page: true--%>
            <%--});--%>
            <%--table.on('toolbar(test)', function(obj){--%>
              <%--console.log(obj)--%>
            <%--})--%>
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
                            url: "/desensitization/room/deleteRoomInfoById/"+data.id+".action",
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
                        ,area: ['600px', '400px']
                        ,shade: 0
                        ,maxmin: true
                        ,offset:'auto'
                        ,content: '${pageContext.request.contextPath}/room/updataRoomInfoByIdJSP/'+data.id+'.action'
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
                    layer.close(index);
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