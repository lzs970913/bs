<%--
  Created by IntelliJ IDEA.
  User: haihua.xu
  Date: 2019/2/19
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>API分享</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/dataQuality.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/laydate/need/laydate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/laydate/skins/danlan/laydate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/model/dataShare/APIshare.css" />
    <script src="${pageContext.request.contextPath}/js/laydate/laydate.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery/jquery.json.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/model/dataShare/APIshare.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/errorMsg.js"></script>

</head>
<%--<script>--%>
    <%--//点击添加api--%>
    <%--function toAdd_api(api){--%>
        <%--$.ajax({--%>
            <%--type: "post",--%>
            <%--url: "../api-info/addApiInfo",--%>
            <%--data:api,--%>
            <%--dataType:"json",--%>
            <%--contentType:"application/json",--%>
            <%--success: function (res) {--%>
                <%--console.log("添加api的返回"+res);--%>
                <%--// alert("添加api成功");--%>
                <%--$(".adress").html("${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}"+res.path);--%>
                <%--$(".newAPIid").val(res.id);--%>
            <%--},--%>
            <%--error:function (res) {--%>
                <%--alert("添加api失败");--%>
                <%--hide_bj();--%>

            <%--}--%>
        <%--});--%>


    <%--}--%>
    <%--//点击使用说明--%>
    <%--function seeUse(apiId){--%>
        <%--console.log(apiId);--%>
        <%--if(typeof apiId != 'undefined'){--%>
            <%--$(".downbtn").attr("id",apiId);--%>
            <%--$.ajax({--%>
                <%--type: "GET",--%>
                <%--url: "../apiDL/catApiDoc/"+apiId,--%>
                <%--dataType: "json",--%>
                <%--contentType:"application/json",--%>

                <%--success: function (res) {--%>
                    <%--console.log(res);--%>
                    <%--$(".res_params>tbody").html("");--%>
                    <%--if(res.type==="query") {--%>
                        <%--//有说明这一列--%>
                        <%--var tr=$("<tr class='tou'>" +--%>
                            <%--"<td>名称</td>" +--%>
                            <%--"<td>是否必填</td>" +--%>
                            <%--"<td>参数类型</td>" +--%>
                            <%--"<td class='Description1'>说明</td>" +--%>
                            <%--"</tr>");--%>
                        <%--$(".res_params>tbody").append(tr);--%>
                        <%--if (res.list) {--%>
                            <%--//有数据--%>
                            <%--$(".requestWz>.flow").text(res.path);--%>
                            <%--var data = res.list;--%>
                            <%--data.forEach(function(item){--%>
                                <%--var exitTr = $("<tr class='tou'>" +--%>
                                    <%--"<td name='kongzhi'>" + item.name + "</td>" +--%>
                                    <%--"<td name='kongzhi'>" + item.canWrite + "</td>" +--%>
                                    <%--"<td name='kongzhi'>" + item.type + "</td>" +--%>
                                    <%--"<td class='Description1' " +--%>
                                    <%--"onclick='showMoredes(this)' style='width:25%;cursor:pointer'><span  name='kongzhi'>"+ item.description +--%>
                                    <%--"</span><span class='more'>"+">>"--%>
                                    <%--+"</span></td>" +--%>
                                    <%--"</tr>");--%>
                                <%--$(".res_paramsTbody").append(exitTr);--%>

                            <%--})--%>
                            <%--//--%>
                        <%--} else{--%>
                            <%--var exitTr = $("<tr class='kong'>" +--%>
                                <%--"<td colspan=4>暂无数据</td>" +--%>
                                <%--"</tr>");--%>
                            <%--$(".res_paramsTbody").append(exitTr);--%>

                        <%--}--%>

                    <%--}else if(res.type==="native"){--%>
                        <%--$(".res_params>tbody").html("");--%>
                        <%--//无说明列--%>
                        <%--var tr=$("<tr class='tou'>" +--%>
                            <%--"<td>名称</td>" +--%>
                            <%--"<td>是否必填</td>" +--%>
                            <%--// "<td>参数类型</td>" +--%>
                            <%--"</tr>");--%>
                        <%--$(".res_params>tbody").append(tr)--%>
                        <%--if (res.list&&res.list.length>0) {--%>
                            <%--//有数据--%>
                            <%--$(".requestWz>.flow").text(res.path);--%>
                            <%--var data = res.list;--%>
                            <%--data.forEach(function(item){--%>
                                <%--var exitTr = $("<tr>" +--%>
                                    <%--"<td name='kongzhi'>" + item.name + "</td>" +--%>
                                    <%--"<td name='kongzhi'>" + item.canWrite + "</td>" +--%>
                                    <%--// "<td name='kongzhi'>" + item.type + "</td>" +--%>
                                    <%--"</tr>");--%>
                                <%--$(".res_paramsTbody").append(exitTr);--%>
                            <%--})--%>

                            <%--//--%>
                        <%--} else {--%>
                            <%--var exitTr = $("<tr class='kong '>" +--%>
                                <%--"<td colspan=2>暂无数据</td>" +--%>
                                <%--"</tr>");--%>
                            <%--$(".res_paramsTbody").append(exitTr);--%>

                        <%--}--%>

<%--//--%>
                    <%--}--%>

                    <%--$(".download").attr('href',"${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}/daip/apiDL/apiDownLoad/"+apiId);--%>
                    <%--var kong=document.getElementsByName("kongzhi");--%>
                    <%--console.log(kong.length)--%>
                    <%--for(var i=0;i<kong.length;i++){--%>
                        <%--if(kong[i].innerText==='undefined'){--%>
                            <%--kong[i].innerText=" ";--%>
                            <%--console.log("kong");--%>
                            <%--$(kong[i]).next().hide();--%>
                        <%--}--%>
                    <%--}--%>
                <%--}--%>
                <%--//--%>
            <%--});--%>
        <%--}else{--%>
            <%--alert("后台有误，请联系管理员")--%>
        <%--}--%>


    <%--}--%>
    <%--function downLoad(button){--%>
        <%--var apiId=button.id;--%>
        <%--if(typeof apiId != 'undefined'){--%>
            <%--$.ajax({--%>
                <%--type: "get",--%>
                <%--url: "../apiDL/apiDownLoad/"+apiId,--%>
                <%--success: function (res) {--%>
                    <%--// alert(res);--%>
                <%--},--%>
                <%--error:function(){--%>
                    <%--console.log(res);--%>
                <%--}--%>
            <%--});--%>
        <%--}else{--%>
            <%--console.log("数据的id为空");--%>
        <%--}--%>
    <%--}--%>
<%--</script>--%>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/api-info/getApiInfoByApiNameCardName" id="firstfrom" method="GET">
        <div class="up" >
            <button class="add_API" data-toggle="modal" data-target="#add_api" type="button">
                添加API
            </button>
            <%--<div class="useApi"  data-toggle="modal" data-target="#showusemethod" type="button">使用API说明 >></div>--%>
        </div>
        <div class="mid">
            <div class="left api_left">
                <div class="apimc">
                    <span class="shaixuan">API名称：</span>
                    <input type="search" id="sousuo_API" placeholder="请输入API名称/API Code" name="name" value="${param.name}">
                    <div class="">
                        <button type="submit" value=" " class="press1" >搜索</button>
                    </div>
                </div>
                <div class="bbmc">
                    <span class="shaixuan">报表名称：</span>
                    <div class="baoB">
                        <input type="text" class="bao" placeholder="请选择报表名称"  name="cardName1" value="${param.cardName1}">
                        <input type="text" hidden="hidden" class="bbsArrayid"  name="cardName" value="${param.cardName}">
                        <img src="../img/1.png" alt="" class="xl">
                        <div class="baobiao_xl" style="display:none;">
                            <ul class="bb_ul" >
                                <c:forEach items="${cardName}" var="tabs">
                                    <li name="li_baobiao" class="tab_li">
                                        <input  class='cb c_box ' type='checkbox' name="licence" onclick='most_bao(this,${tabs.id})' value="${tabs.id}">

                                        <span>${tabs.name}</span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="zt">
                    <span class="shaixuan">API状态：</span>
                    <div class="zhuangT">
                        <input class="status" placeholder="请选择API的状态" readonly="readonly" readonly="readonly" name="state" value="${param.state}">
                        <input type="text" hidden="hidden" class="ssArrayid">
                        <img src="../img/1.png" alt="" class="xl">
                        <div class="zhuangTai_xl" style="display:none;">
                            <ul class="status_ul">
                                <li name="启用" class="lirm" onclick='select_status("启用",this)'>启用</li>
                                <li name="禁用" class="lirm" onclick='select_status("禁用",this)'>禁用</li>
                                <li name="报表已归档" class="lirm" onclick='select_status("报表已归档",this)'>报表已归档</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="data data1">
                <span class="shaixuan">时间筛选：</span>
                <input placeholder="开始时间" id="start" name="startDate" value="${param.startDate}">&nbsp;~&nbsp;
                <input placeholder="结束时间" id="end" name="endDate" value="${param.endDate}">
            </div>
            <div class="press">
                <button type="submit" value=" " class="cx" id="querySub">查询</button>
            </div>
        </div>
        <input type="hidden" name="tabsidsz" class="tabsidsz" value="${param.tabsidsz}">
        <input type="hidden" name="tabsnamesz" class="tabsnamesz" value="${param.tabsnamesz}">
    </form>
    <div class="biao">
        <div>
            <table class="tabContxt apitab" align="center" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th hidden="hidden"></th>
                    <th class="name_td">API名称</th>
                    <th>API路径</th>
                    <th >API描述</th>
                    <th>报表名称</th>
                    <th >状态</th>
                    <th>创建时间</th>
                    <th class="operation">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${model.list}" var="APIs">
                    <tr>
                        <td hidden="hidden">${APIs.apiPath.id}</td>

                        <td class="name_td">${APIs.name}</td>
                        <td class="Path1" onclick="showMorepath(this)">
                            <span class="span_path"> ${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${APIs.apiPath.path}</span>
                            <span class="more">
                                >></span>
                        </td>
                        <td class="Description1" onclick="showMoredes(this)">
                            <span class="span_des">${APIs.description}</span>
                            <span class="more">
                                >></span>
                        </td>
                        <td style="color:#509ee3;"><a href='${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}/question/${APIs.reportCard.id}'>${APIs.reportCard.name}</a></td>
                        <td class="td_status">
                            <span class="span_status">${APIs.state}</span>
                            <img src="../img/1.png" alt="" class="xl tdStatus" id="${APIs.id}"></td>
                        <td>
                                ${APIs.createdTime}
                        </td>
                        <td class="operation">
                            <a href="${pageContext.request.contextPath}/api-user/getUsers/${APIs.id}?id=${APIs.id}"
                               onclick='tolookUsers(${APIs.id})' >&nbsp;查看用户&nbsp;</a>|
                            <a onclick="editAPI(${APIs.id})" class="bianji_Api" data-toggle="modal"
                               data-target="#edite_api" href="">&nbsp;修改API&nbsp;</a>
                            |<a onclick="seeUse(${APIs.apiPath.id})" class="bianji_Api" data-toggle="modal"
                                data-target="#showusemethod" href="" >&nbsp;查看使用说明文档&nbsp;</a>
                            |<a onclick="seeUse(${APIs.apiPath.id})" class="bianji_Api" data-toggle="modal"
                                data-target="#showusemethod" href="" >&nbsp;删除API&nbsp;</a>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="tx">搜索结果${model.total}条</div>
        <input type="hidden" id="to_updataAPIid">
        <input type="hidden" id="to_updataAPIzt">
        <input type="hidden" id="to_updataAPIcjsj">

        <input type="hidden" id="pages" value="${model.pages}">
        <input type="hidden" id="pageNum" value="${model.pageNum}">
        <div class="tcdPageCode"></div>

    </div>
    <div class="mtk">
        <%--编辑API模态框--%>
        <div class="modal fade " id="edite_api" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             show="false" aria-hidden="true"  data-backdrop="false" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header ">
                        <div class="close_MD" data-dismiss="modal">
                            <img src="../img/close2.png" alt="关闭" >
                        </div>
                        <div class="modal-title" >
                            修改API
                        </div>
                    </div>
                    <div class="modal-body">
                        <form class="form" id="myForm2">
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>
                                    <span>API名称：</span>
                                </div>
                                <input type="" name="apiName" class="form-control" id="api_Name2"
                                       placeholder="支持中文，英文，数字，下划线，连字符，不超过100个字符" maxlength="100" >
                            </div>
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>

                                    <span>API&nbsp;Code：</span>
                                </div>
                                <input type="" name="apiCode" class="form-control" id="api_Code2"
                                       placeholder="支持英文，数字，下划线，仅支持/开头，不超过200个字符" maxlength="200">
                            </div>
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>
                                    <span >报表：</span>
                                </div>
                                <input type="text" name="sel_bao" class="form-control" id="sel_bao2" placeholder="请选择所属报表" readonly="readonly">
                                <img src="../img/1.png" class="xl"/>
                                <div class="xl_mbb" style="display:none;" >
                                    <ul class="collection">
                                        <li style="padding-left:2em;">点击加号选择集合下的报表</li>
                                    </ul>
                                    <ul class="jiheNotc"></ul>
                                </div>
                                <input type="hidden" class="baoid2">
                            </div>
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>
                                    <span>选择API用户：</span>
                                </div>
                                <input type="text" name="sel_apiUser" class="form-control" id="sel_apiUser2" placeholder="请选择用户" readonly="readonly">
                                <img src="../img/1.png" class="xl"/>
                                <div class="user_xl" style="display:none;">
                                    <div class="search_p">
                                        <input type="hidden" class="uid2">
                                        <input type="hidden" class="sel_uid">
                                        <input type="hidden" class="allUsers">
                                        <input type="text" class="search_man" id="search_man2" placeholder="搜索关键词">
                                        <img src="../img/fdj.png" alt="" class="fdj2">
                                    </div>
                                    <div class="mana_xl">
                                        <ul class="users_xl_ul1">
                                        </ul>
                                        <ul class="users_xl_ul2">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>

                                    <span>API描述：</span>
                                </div>
                                <textarea type="" name="apiCode" class="form-control" id="api_content2"
                                          placeholder="请输入API描述，最多可输入300个字" maxlength="300"></textarea>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn qxed_btn"  data-dismiss="modal">取消</button>
                        <button class="btn  edite_wcbtn" data-dismiss="modal">完成</button>
                        <span class="messageSpan" style="color:red"></span>
                    </div>
                </div>
            </div>
        </div>
        <%--添加模态框的确认框--%>
        <div class="modal fade"  id="sureAdd_api" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             show="false" aria-hidden="true"  data-backdrop="false"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header ">
                        <div class="close_MD" data-dismiss="modal">
                            <img src="../img/close2.png" alt="关闭" >
                        </div>
                        <div class="modal-title" >
                            API结果
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="state">API先已经完成，生成地址如下：</div>
                        <div class="adress"></div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn sureaddApi"  data-dismiss="modal">确定</button>
                        <input type="hidden" class="newAPIid">
                    </div>
                </div>
            </div>
        </div>
        <%--添加API模态框--%>
        <div class="modal fade " id="add_api" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             show="false" aria-hidden="true"  data-backdrop="false" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header ">
                        <div class="close_MD" data-dismiss="modal">
                            <img src="../img/close2.png" alt="关闭" >
                        </div>
                        <div class="modal-title" >
                            添加API
                        </div>
                    </div>
                    <div class="modal-body">
                        <form class="form" id="myForm">
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>
                                    <span>API名称：</span>
                                </div>
                                <input type="" name="apiName" class="form-control" id="api_Name"
                                       placeholder="支持中文，英文，数字，下划线，连字符，不超过100个字符" maxlength="100">
                            </div>
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>

                                    <span>API&nbsp;Code：</span>
                                </div>
                                <input type="" name="apiCode" class="form-control" id="api_Code"
                                       placeholder="支持英文，数字，下划线，仅支持/开头，不超过200个字符" maxlength="200">
                            </div>
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>
                                    <span >报表：</span>
                                </div>
                                <input type="text" name="sel_bao" class="form-control" id="sel_bao" placeholder="请选择所属报表" readonly="readonly">
                                <img src="../img/1.png" class="xl"/>
                                <div class="xl_mbb" style="display:none;" >
                                    <ul class="collection">
                                        <li style="padding-left:2em;">点击加号选择集合下的报表</li>
                                    </ul>
                                    <ul class="jiheNotc"></ul>
                                </div>
                                <input type="hidden" class="baoid">
                            </div>
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>
                                    <span>选择API用户：</span>
                                </div>
                                <input type="text" name="sel_apiUser" class="form-control" id="sel_apiUser" placeholder="请选择用户" readonly="readonly">
                                <img src="../img/1.png" class="xl"/>
                                <div class="user_xl" style="display:none;">
                                    <div class="search_p">
                                        <input type="hidden" class="uid">
                                        <input type="hidden" class="sel_uid">
                                        <input type="text" class="search_man" id="search_man" placeholder="搜索关键词">
                                        <img src="../img/fdj.png" alt="" class="fdj2">
                                    </div>
                                    <div class="mana_xl">
                                        <ul class="users_xl_ul1">
                                        </ul>
                                        <ul class="users_xl_ul2">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="t_input">
                                    <div class="must">*</div>

                                    <span>API描述：</span>
                                </div>
                                <textarea type="" name="apiCode" class="form-control" id="api_content"
                                          placeholder="请输入API描述，最多可输入300个字" maxlength="300"></textarea>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn qx_btn"  data-dismiss="modal">取消</button>
                        <button class="btn  add_apibtn" >添加</button>
                        <span class="messageSpan" style="color:red"></span>
                    </div>
                </div>
            </div>
        </div>
        <%--显示api使用方法文档--%>
        <div class="modal fade"  id="showusemethod" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             show="false" aria-hidden="true"  data-backdrop="false"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header ">
                        <div class="close_MD" data-dismiss="modal">
                            <img src="../img/close2.png" alt="关闭" >
                        </div>
                        <div class="modal-title" >
                            调用API说明
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="comment">
                            <div class="requestWz"><span class="front">请求网址：</span><span class="flow"></span></div>
                            <div class="requestFf"><span class="front">请求方法：</span><span class="flow">post</span></div>
                            <%--<div class="requestDz"><span class="front">请求地址：</span><span class="flow">192.168.3.211:8080</span></div>--%>
                        </div>
                        <div class="twoTables">
                            <table class="res_header">
                                <thead>
                                <th colspan="3">请求头说明</th>
                                </thead>
                                <tbody>
                                <tr class="tou">
                                    <td>名称</td>
                                    <td>是否必填</td>
                                    <td>说明</td>
                                </tr>
                                <tr>
                                    <td>username</td>
                                    <td>是</td>
                                    <td>请求访问用户名</td>
                                </tr><tr>
                                    <td>password</td>
                                    <td>是</td>
                                    <td>请求访问的密码</td>
                                </tr><tr>
                                    <td>Accept</td>
                                    <td>是</td>
                                    <td>application/json</td>
                                </tr>
                                <tr>
                                    <td>Content-Type</td>
                                    <td>是</td>
                                    <td>application/json</td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="res_params">
                                <thead>
                                <th colspan="4" class="colspan">请求参数说明</th>
                                </thead>
                                <tbody class="res_paramsTbody">

                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <%--<button class="btn downbtn">--%>
                        <%--<a href="" class="download">下载</a>--%>
                        <%--</button>--%>
                        <a href="" class="download downbtn btn" style="display:block">下载</a>
                        <button class="btn sureApi"  data-dismiss="modal" onclick="hide_bj()">确定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
