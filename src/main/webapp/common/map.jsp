<%@ page import="cn.edu.usts.cs2018.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 19530
  Date: 2020/6/8
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <title>拼团自由玩</title>
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css" charset="UTF-8"/>
    <link rel="icon" href="<%=request.getContextPath()%>/images/icon.ico" charset="UTF-8" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix_tilebg.js" charset="UTF-8"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix.js" charset="UTF-8"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vSaiGWokyxxOTX4sLLboOdTG426v6CdZ"></script>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <title>根据起终点名称驾车导航</title>
    <style type="text/css">
        #search_form input {
            border: 0;
            BACKGROUND-COLOR: transparent;
            BORDER-BOTTOM: #ffb234 1px solid;
            BORDER-LEFT: #ffffff 1px solid;
            COLOR: #000000;
            HEIGHT: 18px;
            font-size: 12pt
        }
    </style>
</head>
<body>

<div id="mainWrap">
    <div id="mainPanel">
        <div id="menu">
            <%
                User user=(User)session.getAttribute("user");
                if(user!=null)
                {
            %>
            <%--            登录成功的情况--%>
            <ul>
                <li><a href="<%=request.getContextPath()%>/index.jsp"><span>首页</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/showmytour.jsp"><span>我的行程</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/tourshow.jsp"><span>旅行浏览</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/showmycost.jsp"><span>我的花费</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/personalinfo.jsp"><span>个人信息</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/map.jsp"><span>地图查询</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/userController/exit"><span>退出登录</span></a></li><li><div class="blank"></div></li>
            </ul>
            <%
            }else
            {
            %>
            <%--            未登录或登陆失败的情况--%>
            <ul>
                <li><a href="<%=request.getContextPath()%>/index.jsp"><span>首页</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/login.jsp"><span>我的行程</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/login.jsp"><span>旅行浏览</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/login.jsp"><span>我的花费</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/login.jsp"><span>个人信息</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/map.jsp"><span>地图查询</span></a></li>
            </ul>

            <%
                }
            %>
        </div><div class="inner_copy"></div>
        <div>
            <div></div>
            <div id="loginPanel">
                <h2><br><br><br></h2>
            </div>

            <div id="leftPanel">
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
            </div>
            <div id="allmap" style="width: 100%;height: 500px">

            </div>

            <div id="rightPanel">
                <input type="button" value="查询该点" onclick="findPoint()" style="background-color:#fff7a7;color:#000000;opacity:0.5">

                <input type="text" id="point" style=" border: 0;
            BACKGROUND-COLOR: transparent;
            BORDER-BOTTOM: #ffb234 1px solid;
            BORDER-LEFT: #ffffff 1px solid;
            COLOR: #000000;
            HEIGHT: 18px;
            font-size: 12pt">



                <br>

                <form id="search_form">
                    <p>起点：<input type="text" id="start" /></p>
                    <p>终点：<input type="text" id="end" /></p>
                </form>
                <input type="button" value="重新定位" onclick="relocation()" style="background-color:#fff7a7;color:#000000;opacity:0.5;">
                <input type="button" value="查询路径" onclick="search()" style="background-color:#fff7a7;color:#000000;opacity:0.5;">

            </div>
            <div id="r-result" style="width: 100%"></div>
            <div id="footPanel">
                <div class="nav">
                    <ul>
                        <li><a href="#">Home</a></li><li><div class="blank">|</div></li>
                        <li><a href="#">About Us</a></li><li><div class="blank">|</div></li>
                        <li><a href="#">Suppor</a></li><li><div class="blank">|</div></li>
                        <li><a href="#">Forum</a></li><li><div class="blank">|</div></li>
                        <li><a href="#">Development</a></li><li><div class="blank">|</div></li>
                        <li><a href="#">Conact Us</a></li>
                    </ul>
                </div>
                <div class="copyright">
                    <div class="fleft">Copyright Statement</div>
                    <div class="fright">Popular free web templates <a href="http://www.websitetemplatesonline.com" target="_blank">at www.WebsiteTemplatesOnline.com</a>. Impressive <a href="http://www.flashtemplates.com/flash-templates/" title="Flash Templates for Websites">Flash Templates for Websites</a>.</div>
                    <div class="fclear"></div>
                    Design by <a href="http://www.templateworld.com/" target="_blank">TemplateWorld</a> and brought to you by <a href="http://www.smashingmagazine.com/" target="_blank">SmashingMagazine</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    var map = new BMap.Map("allmap");
    map.enableScrollWheelZoom(true);
    map.centerAndZoom(new BMap.Point(120.591682,31.305976), 11);
    var geolocation = new BMap.Geolocation();
    var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map,panel:"r-result",autoViewport: true}});
    var myGeo = new BMap.Geocoder();
    var start;
    var end;
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
            map.centerAndZoom(new r.point, 18);
            alert("当前地点坐标为（经度："+point.lng+",纬度："+point.lat+"）");
        }
        else {
            alert('failed'+this.getStatus());
        }
    },{enableHighAccuracy: true});




    function search() {
        start=document.getElementById("start").value+"";
        end=document.getElementById("end").value+"";
        myGeo.getPoint(start, function(point){
            if (point) {
                start=point;
            }else{
                alert("您选择地址没有解析到结果!");
            }
        }, "苏州市");
        myGeo.getPoint(end, function(point){
            if (point) {
                end=point;
            }else{
                alert("您选择地址没有解析到结果!");
            }
        }, "苏州市");
        driving.search(start,end);
    }


    function relocation() {
        geolocation.getCurrentPosition(function(r){
            if(this.getStatus() == BMAP_STATUS_SUCCESS){
                var mk = new BMap.Marker(r.point);
                map.addOverlay(mk);
                map.panTo(r.point);
                map.centerAndZoom(new r.point, 18);
                alert("当前地点坐标为（经度："+point.lng+",纬度："+point.lat+"）");
            }
            else {
                alert('failed'+this.getStatus());
            }
        },{enableHighAccuracy: true});
    }
    function findPoint()
    {
        var t=document.getElementById("point").value+"";

        myGeo.getPoint(t, function(point){
            if (point) {
                var mk = new BMap.Marker(point);
                map.addOverlay(mk);
                map.panTo(point);
                alert("该点坐标为（经度："+point.lng+",纬度："+point.lat+"）");
            }else{
                alert("您选择地址没有解析到结果!");
            }
        }, "苏州市");
    }
</script>