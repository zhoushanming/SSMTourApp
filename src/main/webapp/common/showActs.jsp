<%@ page import="cn.edu.usts.cs2018.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.edu.usts.cs2018.entity.Activity" %>
<%@ page import="cn.edu.usts.cs2018.entity.Cost" %>
<%@ page import="cn.edu.usts.cs2018.service.TourServiceImpl" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="cn.edu.usts.cs2018.entity.Tour" %>
<%@ page import="java.util.Date" %>
<%@ page import="cn.edu.usts.cs2018.dao.TourDaoImpl" %>
<%--&lt;%&ndash;--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style>
        .alpha{filter: Alpha(Opacity=50)}
    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>活动列表</title>
    <link href="<%=request.getContextPath()%> /css/styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="<%=request.getContextPath()%>/images/icon.ico" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix_tilebg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js" charset="UTF-8"></script>
    <%--    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js" charset="UTF-8" ></script>--%>
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
            <div id="quots" >
                <p style="font-size: 50px">&nbsp;</p>
                <p style="font-size: 50px">&nbsp;</p>
            </div>

            <div id="leftPanel">

                <div class="about">
                    <h2>“${sessionScope.tourname}”的活动</h2>
                    <%--                    <h3>自定旅程</h3>--%>
                    <a href="<%=request.getContextPath()%>/servlet/downloadActs"><p><span></span>点击我下载此活动表格（表格有更详细的内容哦）</p></a>
                    <div class="services">


                    </div>
                </div>

                <table border="1" style="font-size:16px;border: #0c7cd5" width="100%">
                    <tr style="">
                        <th>活动内容</th>
                        <th>参加用户</th>
                        <th>所属旅程</th>
                        <th width="20px">花费</th>
                    </tr>

                    <%
                                boolean flag=false;

                                ApplicationContext act =
                                new ClassPathXmlApplicationContext("applicationContext.xml");
                                TourServiceImpl tourService=(TourServiceImpl) act.getBean("tourService");
                                List<Activity> list=(List<Activity>)session.getAttribute("activity");
                                User user=(User)session.getAttribute("user");
                                if(tourService.findTourByTourname(list.get(0).getTourname()).get(0).getLeader().equals(user.getUsername()))
                                {
                                    flag=true;
                                }
                                List<Cost> co=(List<Cost>)session.getAttribute("cost");
                                if(list.size()>0)
                                    {


                                for (int i=0;i<list.size();i++) {
                                    Activity activity=list.get(i);
                                    session.removeAttribute("singleAct");
                                    session.setAttribute("singleAct",activity);
                                    session.setAttribute("singlecost",co.get(i));
                    %>
                    <tr>
                        <td>${sessionScope.singleAct.activityname}</td>
                        <td>${sessionScope.singleAct.username}</td>
                        <td>${sessionScope.singleAct.tourname}</td>
                        <td>${sessionScope.singlecost.cost}</td>
                        <td style="width: 20px;font-size: 10px"><a href="<%=request.getContextPath()%>/tourController/participateActivity?id=<%=i%>" >参加</a></td>
                        <td style="width: 20px;font-size: 10px"><a href="<%=request.getContextPath()%>/tourController/exitActivity?id=<%=i%>" >退出</a></td>
                        <%
                            if(flag)
                            {
                        %>
                        <td style="width: 20px;font-size: 10px"><a href="<%=request.getContextPath()%>/tourController/updateActivity?id=<%=i%>">修改</a></td>
                        <%
                            }
                        %>

                    </tr>
                        <%
                                }
                                 }else {
                        %>
                    <tr>
                        <td><h10>暂无活动</h10></td>
                    </tr>

                        <%
                            }
                        %>
                </table>

            </div>
            <div id="rightPanel">

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

<script type="text/javascript">
    /* jquery入口*/
    $(function() {
        loadgrid(); //加载datagrid
    });

    /* 加载datagrid列表*/
    function loadgrid(){
        $('#grid').datagrid({
            title : '客户信息一览表',
            url:'http://localhost:8080/json/showmytour.json',
            method: 'post',
            loadMsg : '正在加载…',  //当从远程站点载入数据时，显示的一条快捷信息。
            rownumbers: true,
            nowrap: false, //设置为true，当数据长度超出列宽时将会自动截取
            fitColumns : true, // 自动适应列宽
            singleSelect : true, // 每次只选中一行
            sortName : 'id', //默认排序字段
            sortOrder : 'asc', // 升序asc/降序desc
            striped : true,  // 隔行变色
            pagination : true,  // 在底部显示分页工具栏
            pageNumber : 1, //初始化页码
            pageSize : 20,  // 指定每页的大小，服务器要加上page属性和total属性
            pageList : [ 20, 30, 50 ], // 可以设置每页记录条数的列表，服务器要加上rows属性
            //rownumbers : true, // 在最前面显示行号
            idField : 'id', // 主键属性
            // 冻结列,当很多咧出现滚动条时该列不会动
            frozenColumns : [ [
                {title : '选择', width : '20', field : 'ck', checkbox : true},
                // {title : '序号', width : '50', field : 'id', sortable : true},
                {title : '旅程名称', width : '100', field : 'tourname', sortable : true},
                {title : "组织人", width : '100',	field : 'leader',sortable : true}
            ] ],
            columns : [ [
                {title : '旅程介绍', width : '150', field : 'introduction', sortable : false},
                {title : '开始日期', width : '200',	field : 'startdate', sortable : false},
                {title : '结束日期', width : '200',	field : 'enddate', sortable : false},

            ] ],

            // 工具栏按钮0

            toolbar: [
                "-", {id: 'add', text: '添加',	iconCls: 'icon-add', handler: function () { add()} },
                // "-", {id: 'edit', text: '修改',	iconCls: 'icon-edit',	 handler: function () { edit()} },
                // "-", {id: 'remove', text: '删除',iconCls: 'icon-remove', handler: function () {remove()} },
                "-", {id: 'remove',  text: '刷新',iconCls: 'icon-reload', handler: function () {reload()} },
                "-", {id: 'download',  text: '下载',iconCls: 'icon-download', handler: function () {download()} },
                "-", {id: 'participate',  text: '参加',iconCls: 'icon-participate', handler: function () {participate()} },
                "-", {id: 'addActivity',  text: '添加活动',iconCls: 'icon-participate', handler: function () {addActivity()} }
            ]
        });
    }
    /* 显示Dialog*/
    function openDialog(title){
        $("#dialog").dialog({
            resizable: false,
            modal: true,
            buttons: [{ //设置下方按钮数组
                text: '保存',
                iconCls: 'icon-save',
                handler: function () {
                    save();
                }
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    closeDialog();
                }
            }]
        });
        $("#dialog").dialog('setTitle', title);
        $("#dialog").dialog('open');
    }

    /* 关闭Dialog*/
    function closeDialog() {
        $("#form").form('clear'); // 清空form的数据
        $("#dialog").dialog('close');// 关闭dialog
    }
    function add() {
        // openDialog('添加旅程'); // 显示添加数据dialog窗口
        // $("#form").form('clear'); // 清空form的数据
        // url = 'customer!add.action'; //后台添加数据action
        window.location.href="http://localhost:8080/common/registtour.jsp";
    }
    function download() {
        window.location.href="http://localhost:8080/MyWeb/servlet/download";
    }

    var t;
    function participate () {
        var row = $('#grid').datagrid('getSelected'); //// 得到选中的一行数据
        //如果没有选中记录
        if(row == null){
            $.messager.alert("提示", "请选择一条记录",'info');
            // return;
        }else {
            t=row.tourname+"|,|"+row.leader+"|,|"+row.introduction+"|,|"+row.startdate+"|,|"+row.enddate;
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/tourController/participateTour",
                data: {"participate":t},
            });
        }

    }
    var activity;
    function addActivity() {
        var row = $('#grid').datagrid('getSelected'); //// 得到选中的一行数据
        //如果没有选中记录
        if(row == null){
            $.messager.alert("提示", "请选择一条记录",'info');
            // return;
        }else {
            activity=row.tourname+"|,|"+row.leader;
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/tourController/getActivity",
                data: {"addActivity":activity},
            });
            tiaozhuan();
        }
    }
    function tiaozhuan()
    {
        window.location.href="http://localhost:8080/common/addActivity.jsp";
    }


    /* 修改数据*/
    function edit() {
        var row = $('#grid').datagrid('getSelected'); //// 得到选中的一行数据
        //如果没有选中记录

        if(row == null){
            $.messager.alert("提示", "请选择一条记录",'info');
            return;
        }

        openDialog('修改旅程信息'); // 显示更新数据dialog窗口
        $("#form").form('load', row); // 加载选择行数据
        url = 'http://localhost:8080/tourController/updateTour'; //后台更新数据action
    }

    /* 保存数据*/
    function save(){
        $('#form').form('submit',{
            url: "http://localhost:8080/tourController/updateTour",						//提交地址
            onSubmit: function(){
                return $(this).form('validate'); //前台字段格式校验
            },
            success: function(result){
                var result = eval('('+result+')');
                if (result.success){
                    closeDialog();		// 调用closeDialog;
                    reload();			// 重新加载
                    $.messager.show({    //显示正确信息
                        title: '提示',
                        msg: result.msg
                    });
                } else {
                    $.messager.show({	//显示错误信息
                        title: '错误',
                        msg: result.msg
                    });
                }
            }
        });
    }

    /* 删除数据*/
    function remove(){
        var row = $('#grid').datagrid('getSelected');
        //如果没有选中记录
        if(row == null){
            $.messager.alert("提示", "请选择一条记录",'info');
            return;
        }
        $.messager.confirm('确认', '确定要删除吗？', function (r) {
            if (r) {
                //提交到后台的action
                $.post('customer!remove.action', { id: row.id }, function (result) {
                    if (result.success) {
                        reload();
                        $.messager.show({	//显示正确信息
                            title: '提示',
                            msg: result.msg
                        });
                    } else {
                        $.messager.show({	//显示错误信息
                            title: '错误',
                            msg: result.msg
                        });
                    }
                }, 'json');
            }
        });

    }

    /* 刷新grid*/
    function reload(){
        window.location.href="http://localhost:8080/tourController/viewMyTour";
        $('#grid').datagrid('reload');
    }



</script>
</body>
</html>
