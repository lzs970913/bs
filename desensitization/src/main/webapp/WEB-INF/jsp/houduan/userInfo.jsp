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
          <%--&lt;%&ndash;<button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>&ndash;%&gt;--%>
        <%--</form>--%>
      <%--</div>--%>
      <%--<xblock>--%>
        <%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>
        <%--<button class="layui-btn" onclick="x_admin_show('添加用户','./order-add')"><i class="layui-icon"></i>添加</button>--%>
        <%--&lt;%&ndash;<span class="x-right" style="line-height:40px">共有数据：88 条</span>&ndash;%&gt;--%>
      <%--</xblock>--%>

      <!--<table class="layui-table">-->
        <!--<thead>-->
          <!--<tr>-->
            <!--<th>-->
              <!--<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>-->
            <!--</th>-->
            <!--<th>订单编号</th>-->
            <!--<th>收货人</th>-->
            <!--<th>总金额</th>-->
            <!--<th>应付金额</th>-->
            <!--<th>订单状态</th>-->
            <!--<th>支付状态</th>-->
            <!--<th>发货状态</th>-->
            <!--<th>支付方式</th>-->
            <!--<th>配送方式</th>-->
            <!--<th>下单时间</th>-->
            <!--<th >操作</th>-->
            <!--</tr>-->
        <!--</thead>-->
        <!--<tbody>-->
          <!--<tr>-->
            <!--<td>-->
              <!--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>-->
            <!--</td>-->
            <!--<td>2017009171822298053</td>-->
            <!--<td>老王:18925139194</td>-->
            <!--<td>7829.10</td>-->
            <!--<td>7854.10</td>-->
            <!--<td>待确认</td>-->
            <!--<td>未支付</td>-->
            <!--<td>未发货</td>-->
            <!--<td>其他方式</td>-->
            <!--<td>申通物流</td>-->
            <!--<td>2017-08-17 18:22</td>-->
            <!--<td class="td-manage">-->
              <!--<a title="查看"  onclick="x_admin_show('编辑','order-view.html')" href="javascript:;">-->
                <!--<i class="layui-icon">&#xe63c;</i>-->
              <!--</a>-->
              <!--<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">-->
                <!--<i class="layui-icon">&#xe640;</i>-->
              <!--</a>-->
            <!--</td>-->
          <!--</tr>-->
        <!--</tbody>-->
      <!--</table>-->
      <!---->
      <!---->
      <!--<div class="page">-->
        <!--<div>-->
          <!--<a class="prev" href="">&lt;&lt;</a>-->
          <!--<a class="num" href="">1</a>-->
          <!--<span class="current">2</span>-->
          <!--<a class="num" href="">3</a>-->
          <!--<a class="num" href="">489</a>-->
          <!--<a class="next" href="">&gt;&gt;</a>-->
        <!--</div>-->
      <!--</div>-->

        <table class="layui-table" lay-data="{width: 1000, height:332, url:'${pageContext.request.contextPath}/user/getAllUserInfo.action', page:true, id:'idTest'}" lay-filter="demo">
          <thead>
          <tr>
            <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
            <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
            <th lay-data="{field:'name', width:200}">用户名</th>
            <th lay-data="{field:'gender', width:80, sort: true}">性别</th>
            <th lay-data="{field:'age', width:80}">年龄</th>
            <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
          </tr>
          </thead>
        </table>
      <script type="text/html" id="barDemo">
        <%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
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
                        obj.del();
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