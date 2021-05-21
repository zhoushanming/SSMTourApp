<%@ page import="cn.edu.usts.cs2018.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 19530
  Date: 2020/6/4
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登陆成功</title>
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="<%=request.getContextPath()%>/images/icon.ico" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix_tilebg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix.js"></script>
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

                <p>${user.username},欢迎回来</p>
            </div>
            <div id="quots">
                <p>"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit..."</p>
            </div>
            <div id="leftPanel">
                <div class="about">
                    <h2>Somelines About Us</h2>
                    <h3>ltrices inh endrerit ac tempor idtellus uis quam uisque</h3>
                    <p><span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla libero leo, suscipit acfaucibusnon.</span><br/> Etiam est. Etiam ac ipsum sed pede ultricies pretium. Nulla mi lacus, fringilla eu, pulvinar at, commodo eu, dolor. Nam porttitor viverra sapien. Pellentesque vitae augue et lorem laoreet .</p>
                    <div class="date">
                        <div class="left">Saturday, April 26, 2008&nbsp;&nbsp;|</div>
                        <div class="right"><a href="#">Read More</a></div>
                    </div>
                </div>
                <div class="services">
                    <h2>Our Spectrum of Services</h2>
                    <div class="pic"><a href="#">Cras turpis duis at sapien eget nulla vulputate.</a></div>
                    <p><span>Donec accumsan porta risus.</span> Vestibulum sollicitudinlibero ut semper commodo, purus enim sollicitudin nulla, dictum vehicula diam lacus at purus. In egestas. </p>
                    <h3>Services</h3>
                    <ul>
                        <li><a href="#">Nam congue quam non augue ivamus porttitor</a></li>
                        <li><a href="#" class="bottom">Jam aongue buam n augue famus</a></li>
                    </ul>
                    <p><span>Pellentesque dolor.</span> Nunc congue est in ante mattis ultrices. liquam erat volutpat. Nam congue quam non augue. </p>
                </div>
                <div class="testimonial">
                    <h2>Testimonial</h2>
                    <p><span>Nullam vel justo. Mauris viverra mattis neque.</span> Phasellus feugiat pede ut mauris uis orcies tibulum eleifend. Donec est purusiaculis acauctorNullam vel justo. Mauris viverra mattis neque. Phasellus feugiat pede ut mauris. Duis orci.</p>
                    <h3><span>by</span> David Jackson</h3>
                    <p><span>Vel justo. Mauris viverra mattis neque	asellus feugiat pede ut mauris uis orcies tibulum</span> eleifend. Donec est purusiaculis acauctorNullam vel justo. Mauris viverra mattis neque. Phasellus feugiat pede ut mauris.</p>
                    <h3><span>by</span> Tom Sam</h3>
                </div>
            </div>
            <div id="rightPanel">
                <h2>Photo Stock</h2>
                <div class="pic1"></div><a href="#" class="view">view large</a>
                <div class="pic2"></div><a href="#" class="view">view large</a>
                <div class="pic3"></div><a href="#" class="view">view large</a>
                <div class="contacts">
                    <h2>Quick Contact</h2>
                    <p>Name</p><input name="name" type="text" value="- enter your name -" onfocus="if(this.value=='- enter your name -')this.value=''" onblur="if(this.value=='')this.value='- enter your name -'"/>
                    <p>Email</p><input name="name" type="text" value="- enter your email -" onfocus="if(this.value=='- enter your email -')this.value=''" onblur="if(this.value=='')this.value='- enter your email -'"/>
                    <div class="blank2"></div>
                    <a href="#">Need a Quote?</a><div class="blank"></div><a href="#">Submit</a>
                </div>
                <div class="project">
                    <h2>Projects Link</h2>
                    <ul>
                        <li><a href="#">Lorem ipsum dolor sit amet eros consequat </a></li>
                        <li><a href="#">Consectetuer adipiscing elit</a></li>
                        <li><a href="#">Etiam quis est ut diam viverra rhoncus</a></li>
                        <li><a href="#">Fusce eros consequat </a></li>
                        <li><a href="#">Cras eros massa blandit </a></li>
                        <li><a href="#" class="bottom">Aoreet utdiam viverra</a></li>
                    </ul>
                </div>
            </div>
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
