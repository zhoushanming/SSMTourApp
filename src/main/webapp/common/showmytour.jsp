<%@ page import="cn.edu.usts.cs2018.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 19530
  Date: 2020/6/6
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我组织的旅程</title>
    <link href="<%=request.getContextPath()%> /css/styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="<%=request.getContextPath()%>/images/icon.ico" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix_tilebg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/iepngfix.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/demo/demo.css">

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
                    <h2>我组织的旅程</h2>
                    <%--                    <h3>自定旅程</h3>--%>
                    <div class="services">
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/common/showmyparticipatetour.jsp">我参加的旅程</a></li>
                        </ul>

                    </div>
                </div>
                <div style="width:1200px;height:50%;padding:10px;overflow:hidden; center:'true'">
                    <table id="grid"></table>
                </div>
                <div id="dialog" class="easyui-dialog" data-options="closed:true" title="会员管理"
                     style="width:300px;height:320px;text-align:center" >
                    <br>
                    <form id="form" method="post">
                        <div style="margin-bottom:10px">
                            <label>旅程名称</label>
                            <input class="easyui-textbox" name="tourname" data-options="required:true" />
                        </div>
                        <div style="margin-bottom:10px">
                            <label>组织人</label>
                            <input class="easyui-textbox" name="leader" data-options="required:true" />
                        </div>
                        <div style="margin-bottom:10px">
                            <label>旅程介绍</label>
                            <input class="easyui-textbox" name="introduction" data-options="required:false" />
                        </div>
                        <div style="margin-bottom:10px">
                            <label>开始日期</label>

                            <input class="easyui-textbox" name="startdate" data-options="required:false"/>
                        </div>
                        <div style="margin-bottom:10px">
                            <label>结束日期</label>

                            <input class="easyui-textbox" name="enddate" data-options="required:false"/>
                        </div>
                    </form>

                </div>

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
                // "-", {id: 'download',  text: '下载',iconCls: 'icon-download', handler: function () {download()} },
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
