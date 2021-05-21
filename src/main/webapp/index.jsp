<%@ page import="cn.edu.usts.cs2018.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>电子企业智能生产信息系统</title>
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css" charset="UTF-8"/>
    <link rel="icon" href="<%=request.getContextPath()%>/images/icon.ico" charset="UTF-8" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix_tilebg.js" charset="UTF-8"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix.js" charset="UTF-8"></script>
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
                <li><a href="<%=request.getContextPath()%>/index.jsp"><span>登录（注册）</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/showmytour.jsp"><span>综合信息查询</span></a></li><li><div class="blank"></div></li>

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
            <%
                request.setCharacterEncoding("utf-8");
                session=request.getSession();
                if(session.getAttribute("user")==null &session.getAttribute("User")==null ){


            %>
            <h2>用户登录</h2>
               <p>还不是会员? <a href="<%=request.getContextPath()%>/common/register.jsp">注册会员</a></p><a href="<%=request.getContextPath()%>/common/login.jsp" class="login">登录</a>
            <%
                }else {
            %>
            <p>${user.username},欢迎回来</p>
            <%
                }
            %>
        </div>
        <div id="quots" >
            <p style="font-size: 50px">拼团自由玩-----组团AA制</p>
        </div>
        <div id="leftPanel">
            <div class="about">
                <h2>关于本网站</h2>
                <h3>自定旅程</h3>
                <p><span></span><br/>对于身处银河系荒凉偏僻的旋臂上，微小的太阳星系中，一颗渺小蓝色星球上，尘埃一样微不足道的我们，在这个狭小的世界上旅行能有什么意义？
                    在宇宙的时间长河里，我们不过百年的一生又有什么意义？</p>
                <div class="date">
                    <div class="left">Monday, June 26, 2020&nbsp;&nbsp;|</div>

                </div>
            </div>
            <div class="services">
                <h2>我们提供的服务简介</h2>
                <div class="pic"><a href="#"></a></div>
                <p><span>我们提供自由组团游行，账单公开透明，可给你们一场无比惬意的旅程！</span>（We offer free group marches, open and transparent billing, and give you a very pleasant journey!）</p>
                <h3>Services</h3>
                <ul>
                    <li><a href="#">Nam congue quam non augue ivamus porttitor</a></li>
                    <li><a href="#" class="bottom">Jam aongue buam n augue famus</a></li>
                </ul>
                <p><span>Pellentesque dolor.</span> Nunc congue est in ante mattis ultrices. liquam erat volutpat. Nam congue quam non augue. </p>
            </div>
            <div class="testimonial">
                <h2>用户评价</h2>
                <p><span>哦，我的老伙计，这真是最棒的一次旅程</span>此次旅行我们去了西藏，在这个风景如此迷人的地方，当地的人们非常的善良热情。他们脸上的高原红是这个地方标志性的特色。人们明净的眼睛像这边的天空一样干净且美好，他们的微笑能打能人的心，像冬日的阳光温暖，像夏日的风一样清凉，他们会给来此的人酥油茶喝，给他们保平安的信物。在这里可能会产生新的信仰，许多去西藏是为了追寻心中的信仰。这是去过西藏后的真实的感受，是洗涤人心灵的净土。</p>
                <h3><span>------</span> 许静雷</h3>
                <p><span>人生得意须尽欢，莫使金樽空对月！世界那么大，多去走走</span>人生大好，和我随我吟一篇诗，醉一斗酒，颂一曲长歌，仗一剑天涯。</p>
                <h3><span>------</span> 李小白</h3>
            </div>
        </div>
        <div id="rightPanel">
            <h2>照片墙</h2>
            <div class="pic1"></div><a href="#" class="view">点击放大</a>
            <div class="pic2"></div><a href="#" class="view">点击放大</a>
            <div class="pic3"></div><a href="#" class="view">点击放大</a>
<%--            <div class="contacts">--%>
<%--                <h2>Quick Contact</h2>--%>
<%--                <p>Name</p><input name="name" type="text" value="- enter your name -" onfocus="if(this.value=='- enter your name -')this.value=''" onblur="if(this.value=='')this.value='- enter your name -'"/>--%>
<%--                <p>Email</p><input name="name" type="text" value="- enter your email -" onfocus="if(this.value=='- enter your email -')this.value=''" onblur="if(this.value=='')this.value='- enter your email -'"/>--%>
<%--                <div class="blank2"></div>--%>
<%--                <a href="#">Need a Quote?</a><div class="blank"></div><a href="#">Submit</a>--%>
<%--            </div>--%>
            <div class="project">
                <h2>最新公告</h2>
                <ul>
                    <li><a href="#">纯玩你的嗨，纯玩你的好，纯玩你的专属海报！</a></li>
                    <li><a href="#">漫想南国好风景，纯玩尽兴！</a></li>
                    <li><a href="#">彩云之南，遇见你——嗨游记。</a></li>
                    <li><a href="#" class="bottom">就把七彩云南，变成一旅不凡。</a></li>
                </ul>
            </div>
        </div>
        <div id="footPanel">
            <div class="nav">
                <p>         </p>
                <ul>
                    <li><a href="#">&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</a></li><li><div class="blank">|</div></li>
                    <li><a href="#">关于我们</a></li><li><div class="blank">|</div></li>
                    <li><a href="#">赞助商</a></li><li><div class="blank">|</div></li>
                    <li><a href="#">未来的发展</a></li><li><div class="blank">|</div></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
            </div>
            <div class="copyright">
                <div class="fleft"></div>
                <div class="fright"></div>
                <div class="fclear">Copyright &copy; 2010-2020 YSL.All Rights Reserved.</div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
