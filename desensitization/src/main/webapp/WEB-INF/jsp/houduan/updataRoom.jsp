<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
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
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="name" class="layui-form-label">
                  <span class="x-red">*</span>房间名字
              </label>
              <input type="hidden" id="id" name="id" required lay-verify="required"
                     autocomplete="off" class="layui-input" value="${room.id}">
              <input type="hidden" id="state" name="state" required lay-verify="required"
                     autocomplete="off" class="layui-input" value="${room.status}">
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" required lay-verify="required"
                         autocomplete="off" class="layui-input" value="${room.name}">
              </div>
              <%--<div class="layui-input-inline">--%>
                  <%--<input type="text" id="appointmentTime" name="appointmentTime" required lay-verify="date" placeholder="yyyy-MM-dd"--%>
                  <%--autocomplete="off" class="layui-input">--%>
              <%--</div>--%>
          </div>

            <div class="layui-form-item">
                <label for="price" class="layui-form-label">
                    <span class="x-red">*</span>房间价格
                </label>
                <div class="layui-input-inline">
                <input type="text" id="price" name="price" required lay-verify="required"
                       autocomplete="off" class="layui-input" value="${room.price}">
            </div>
            </div>
          <div class="layui-form-item layui-form-text">
              <label for="description" class="layui-form-label">
                  描述
              </label>
              <%--<div class="layui-input-block">--%>
                  <%--<textarea placeholder="请输入内容" id="description" name="description" class="layui-textarea" "></textarea>--%>
              <%--</div>--%>
              <div class="layui-input-inline">
                  <input type="text" id="description" name="description" required lay-verify="required"
                         autocomplete="off" class="layui-input" value="${room.description}">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="description" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  完成
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer', 'laydate'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer
          ,laydate = layui.laydate;

            //日期
            laydate.render({
                elem: '#appointmentTime'
            });


          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
              var needdata=data.field
              console.log(needdata);
              var parStr=JSON.stringify(needdata);
              $.ajax({
                  type: "POST",
                  url: "/desensitization/room/updataRoomInfoById.action",
                  data:parStr,
                  // dataType: "string",
                  contentType: "application/json",
                  success: function(msg){
                      layer.msg("修改成功");
                  }
                  ,error:function(msg) {
                      layer.msg("修改失败");
                  }
              })



            layer.alert("修改成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
          
          
        });
    </script>
  </body>

</html>