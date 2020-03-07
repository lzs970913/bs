<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <base href="<%=basePath%>">
    <title>M家</title>
    <link href="${pageContext.request.contextPath}/resource/css/firstPage/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resource/css/firstPage/index.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resource/css/firstPage/flexslider.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <script src="${pageContext.request.contextPath}/resource/js/firstPage/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/firstPage/jquery.flexslider-min.js"></script>
</head>
<body>
<div class="header_wrap ah">
    <div class="wrap header">
        <ul class="logo">
            <%--${pageContext.request.contextPath}/resource/images/firstPage/logo.png--%>
            <%--<a href="#"><img src="#" alt="">民宿管理系统</a>--%>
        </ul>
        <ul class="nav">
            <li><a href="#">首页</a></li>
            <li ><a href="#">查看房源</a></li>
            <li ><a href="#">精彩评论</a></li>
            <li ><a href="#">我的订单</a></li>
        </ul>
        <!-- <ul class="nav-r">
            <li class="search">
            <form method="post" action="/index.php/content/index/pid/13.html" name="formSearch">
            <input name="btn_submit" id="btn_submit" type="submit"  value=""/>
            <input name="sh_keywords" type="text" id="keywords" maxlength="55" autocomplete="off" />
            </form>
            </li>
            <li class="icon"><a class="wx" href="javascript:;"></a><a class="sina" href="http://weibo.com/huashiyingshi"></a></li>
        </ul> -->
        <ul class="mbi_nav">
            <a href="javascript:void(0)"><span></span><span></span><span></span><span></span></a>
        </ul>
        <ul class="language"><a href="#" style="display:none;">中文版</a> <span style="display:none;">|</span> <a href="#" style="display:none;">ENGLISH</a> <span style="display:none;">|</span> <a href="#">登录</a>
            <span>|</span> <a href="">注册</a>         </ul>
    </div>
</div>
<div class="hid_menu">
    <ul>
        <li><a href="#">首页</a></li>
        <li><a href="#">关于公司</a></li><li><a href="#">电影作品</a></li><li><a href="#">电视作品</a></li><li><a href="#">艺人经纪</a></li><li><a href="#">华视动态</a></li>    </ul>
</div>
<div class="banner">
    <div class="cnt">
        <ul>
            <li>
                <img src="${pageContext.request.contextPath}/resource/images/firstPage/00b32c48-d287-4bd4-841a-9be23f51481a.jpg" alt="致我们终将逝去的青春 (2013)"/>
                <ul><h3>房间1</h3><span>属于你们的回忆，随时间静静流淌</span></ul>
                <p><a href="javascript:;" class="btn_video" data0="http://static.video.qq.com/TPout.swf?vid=z0011e00wzq&auto=1" data1="http://player.youku.com/player.php/sid/XNTA4NDM0NzQw/v.swf?VideoIDS=XNDA3OTM4NA=&isAutoPlay=true&isS" data2="https://www.youtube.com/v/JJCs-pgHWL8">预告欣赏</a><a href="/index.php/content/index/pid/2/cid/20.html">关于作品</a></p>
            </li>

            <li>
                <img src="${pageContext.request.contextPath}/resource/images/firstPage/ed472ad6636763e22da62194b119ef1a.jpg" alt="平凡的世界(2015)"/>
                <ul><h3>room1</h3><span>有你的世界才精彩</span></ul>
                <p><a href="/index.php/content/index/pid/3/cid/108.html">查看房间</a></p>
            </li>

            <li>
                <img src="${pageContext.request.contextPath}/resource/images/firstPage/4a9b4600a20d4aacaa16aee0bc4adc85.jpg" alt="刀客家族的女人 (2014)"/>
                <ul><h3>room3</h3><span>流逝的是时间，留下的是你</span></ul>
                <p><a href="/index.php/content/index/pid/3/cid/36.html">查看房间</a></p>
            </li>

            <li>
                <img src="${pageContext.request.contextPath}/resource/images/firstPage/1ed4f2fe326a627f0dd68acd10040e46.jpg" alt="六弄咖啡馆 (待映)"/>
                <ul><h3>room4</h3><span>房间4</span></ul>
                <p><a href="/index.php/content/index/pid/2/cid/17.html">查看房间</a></p>
            </li>

            <li>
                <img src="${pageContext.request.contextPath}/resource/images/firstPage/798dc1b43cfe7dc38160d3c16271a0d3.jpg" alt="致青春 (2016)"/>
                <ul><h3>room5</h3><span>房间5的信息</span></ul>
                <p><a href="/index.php/content/index/pid/3/cid/39.html">查看房间</a></p>
            </li>
        </ul>

    </div>
    <a id="a_l" class="arr"></a>
    <a id="a_r" class="arr"></a>
    <div class="arr_down"><p class="l"></p><p class="r"></p></div>
</div>

<div id="slider1" class="slider ah">
    <ul id="pic_list1" class="pic_list pic2">
        <li><a class="pic" style="background:url(${pageContext.request.contextPath}/resource/images/firstPage/5d52d7bf775b36b8479b743a5a824f19.jpg) no-repeat center; background-size:cover;"></a><a title="致我们终将逝去的青春 (2013)" class="txt"><b>致我们终将逝去的青春 (2013)</b><span>改编自作家辛夷坞的同名小说，由香港导演关锦鹏担任监制，内地编剧李樯改编剧本，海峡两岸演员赵又廷、韩庚、杨子姗、江疏影、张瑶、刘雅瑟、包贝尔、郑恺、黄明、王嘉佳、佟丽娅等主演，王菲演唱主题曲《致青春》，于2013年4月26日全国公映。内地最终票房为7.2亿。</span></a></li><li><a class="pic" style="background:url(images/ed472ad6636763e22da62194b119ef1a.jpg) no-repeat center; background-size:cover;"></a><a title="平凡的世界(2015)" class="txt"><b>平凡的世界(2015)</b><span>56集电视连续剧。根据路遥同名小说改编，华视团队历时8年创作、投资近1.2亿元拍摄，由著名导演毛卫宁执导，王雷、佟丽娅、袁弘、李小萌、刘威、吕一、尤勇智等主演，讲述了在面对现实压力和人生抉择时，少安少平兄弟俩依旧坚守最初梦想和对爱情执着追求的故事。该剧已于2015年2月26日在北京卫视、东方卫视首播。2015年该剧获得上海电视节第21届白玉兰奖最佳导演奖、第13届四川电视节金熊猫奖长篇电视剧类大奖和第30届中国电视剧飞天奖优秀电视剧大奖，成为年度最具重量的现象级电视剧。</span></a></li><li><a class="pic" style="background:url(images/4a9b4600a20d4aacaa16aee0bc4adc85.jpg) no-repeat center; background-size:cover;"></a><a title="刀客家族的女人 (2014)" class="txt"><b>刀客家族的女人 (2014)</b><span>44集电视连续剧。由“白玉兰"最佳导演杨文军执导，根据董陆明《拉锯地带》小说改编，并由著名编剧张晓亚老师保驾护航，实力派演员佟丽娅、杨烁、许还幻、何赛飞、高露、毛晓彤、郭鹏、曾虹畅等主演的传奇大剧。该剧在全国一线卫视收视率夺魁，网络点击率创同类型题材第一名，并荣获华鼎奖、金牛奖、全国电视制片业十佳奖等多个海内外大奖。
</span></a></li><li><a class="pic" style="background:url(${pageContext.request.contextPath}/resource/images/firstPage/1ed4f2fe326a627f0dd68acd10040e46.jpg) no-repeat center; background-size:cover;"></a><a title="六弄咖啡馆 (待映)" class="txt"><b>六弄咖啡馆 (待映)</b><span>改编自台湾畅销青春小说，原著作者“台湾青春小说天王”吴子云(笔名：藤井树)导演处女作。两届金马奖最佳男演员提名奖获得者、最具潜力的90后华语男明星董子健，香港新一代甜心小天后颜卓灵联袂领衔主演，精心缔造2016年度最受瞩目的华语青春电影扛鼎之作！影片将于7月29日在全国公映，相约影院，与你同在。</span></a></li><li><a class="pic" style="background:url(images/798dc1b43cfe7dc38160d3c16271a0d3.jpg) no-repeat center; background-size:cover;"></a><a title="致青春 (2016)" class="txt"><b>致青春 (2016)</b><span>2016年7月11日登陆东方卫视、安徽卫视黄金档，北京卫视非黄档，优酷视频。80后最受欢迎女作家辛夷坞百万畅销原著小说改编，“白玉兰”奖金牌导演杨文军，携手最受瞩目新生代青春明星阵容杨玏、陈瑶、张丹峰、马可、徐悦等，推出 “2016非看不可的荧屏青春爆款”！</span></a></li>    </ul>
</div>
<div class="footer">
    <div class="foot-nav">
        <a href="#"> 关于我们</a>|<a href="#"> 联 系 我 们</a>|<a href="#"> 加 入 我 们</a></div>
    <div class="foot-copy">Copyright © HS Entertainment  All Rights Reserved. </div>
</div>



<script>
    <!--
    $(function(){
        $(".mbi_nav").click(function(e){
            if($(".hid_menu").is(':hidden'))
                $(".hid_menu").slideDown();
            else
                $(".hid_menu").slideUp();
            e.stopPropagation();
        });
        $("body").click(function(e){
            $(".hid_menu").hide();
            e.stopPropagation();
        });
        $('.ewm a').click(function(){
            $('.ewm').hide();
        });
        $('.wx').click(function(){
            $('.ewm').show();
        });

    });
    function fl(){
        $(".flsm").show();
        $(".flsm").height($(document).height());
        $(window).scrollTop(0);
    }
    $('.flsm_close').click(function(){
        $(".flsm").hide();
    });

    -->
</script>
<div class="ewm"><a>×</a><img src="resource/images/15b089be07a74ba468924527a36e7bdf.jpg" /></div>


<script>
    <!--
    var bAuto=true;

    $(function() {

        var lw;
        function rz(){
            var sw=$(window).width();
            w=sw/5;
            lw=w-10;
            $('#slider1 li').width(lw);
            $('#slider1 li').height(lw * 0.65+$('#slider1 li span').height() + 45);
            $('#slider1 li a.pic').height(lw * 0.65);
            $('.banner li').width(sw);
            var minHeight=0;
            scr()
        }
        rz();
        $(window).resize(rz);

        var nCur=0;
        var cn=$('#pic_list1 li').length-1;
        var nd=cn+1;
        $('#pic_list1').append($('#pic_list1').html());
        $('#slider1').scrollLeft((lw+10) * (cn-1));
        var w=$('#slider1 li').width()+10;
        $("#a_l").click(function(){
            nd--;
            scr();
        });
        $("#a_r").click(function(){
            nd++;
            scr();
        });
        $("#pic_list1 li").click(function(){
            nd=$(this).index();
            scr();
        });
        var t=setInterval(function(){
            if(bAuto)$("#a_r").click();
        },5000);
        $('.banner').hover(function(){
            bAuto=false;
        },function(){
            bAuto=true;
        });
        function scr(){
            var sw=$(window).width();
            if(nd-cn>2){
                nd=nd-cn-1;
            }else if(nd<3){
                nd=cn+nd+1;
            }
            $('#slider1').scrollLeft((lw+10) * (nd-2));
            if(nd>cn){
                nCur=nd-cn-1;
            }else{
                nCur=nd;
            }
            //alert(sw)
            $('.cnt').stop().animate({scrollLeft:nCur * sw});
        }
    });
    -->
</script>
<div id="video_pannel">
    <dl>
        <dt></dt>
        <dd><a href="#" class="on">腾讯视频</a><a href="#">优酷视频</a><a href="#">YouTube视频</a></dd>
    </dl>
</div>
<link href="resource/css/firstPage/jquery.fancybox.css" type="text/css" rel="stylesheet">
<script src="resource/js/firstPage/jquery.fancybox.pack.js" type="text/javascript"></script>
<script>
    <!--
    $(function() {
        var curObject=null;
        $('.btn_video').click(function(){
            bAuto=false;
            curObject=$(this);
            var d=$(this).attr("data0");
            //$("#video_pannel").html('<video id="media" width="100%" height="100%" autoplay="true" controls><source src="' + d + '" id="v_src"></video>');
            $("#video_pannel dt").html('<embed src="' + d + '" allowFullScreen="true" quality="high" width="100%" height="100%" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>');
            $.fancybox('#video_pannel',{
                padding: 0
            });
            $("#video_pannel dd").show();
        });

        $('#video_pannel dd a').click(function(){
            var n=$(this).index();
            var d=curObject.attr("data"+n);
            $("#video_pannel dt").html('<embed src="' + d + '" allowFullScreen="true" quality="high" width="100%" height="100%" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>');
            $('#video_pannel dd a').removeClass('on');
            $(this).addClass('on');
        });

        function video_rz(){
            var w=$(window).width() * 0.65;
            $('#video_pannel').width(w);
            $('#video_pannel dt').height(w * 0.65);
        }
        video_rz();
        $(window).resize(video_rz);
    });
    -->
</script>
</body>
</html>