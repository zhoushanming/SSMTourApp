<%@ page import="cn.edu.usts.cs2018.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 19530
  Date: 2020/6/8
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%--
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
    <title>ๆ็่ฑ่ดน</title>
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
            <%--            ็ปๅฝๆๅ็ๆๅต--%>
            <ul>
                <li><a href="<%=request.getContextPath()%>/index.jsp"><span>้ฆ้กต</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/showmytour.jsp"><span>ๆ็่ก็จ</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/tourshow.jsp"><span>ๆ่กๆต่ง</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/showmycost.jsp"><span>ๆ็่ฑ่ดน</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/personalinfo.jsp"><span>ไธชไบบไฟกๆฏ</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/map.jsp"><span>ๅฐๅพๆฅ่ฏข</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/userController/exit"><span>้ๅบ็ปๅฝ</span></a></li><li><div class="blank"></div></li>
            </ul>
            <%
            }else
            {
            %>
            <%--            ๆช็ปๅฝๆ็ป้ๅคฑ่ดฅ็ๆๅต--%>
            <ul>
                <li><a href="<%=request.getContextPath()%>/index.jsp"><span>้ฆ้กต</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/login.jsp"><span>ๆ็่ก็จ</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/login.jsp"><span>ๆ่กๆต่ง</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/login.jsp"><span>ๆ็่ฑ่ดน</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/login.jsp"><span>ไธชไบบไฟกๆฏ</span></a></li><li><div class="blank"></div></li>
                <li><a href="<%=request.getContextPath()%>/common/map.jsp"><span>ๅฐๅพๆฅ่ฏข</span></a></li>
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
                    <h2>ๆ็ป็ป็ๆ็จ</h2>
                    <%--                    <h3>่ชๅฎๆ็จ</h3>--%>
                    <div class="services">
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/common/showmyparticipatetour.jsp">ๆๅๅ?็ๆ็จ</a></li>
                        </ul>

                    </div>
                </div>
                <div style="width:1200px;height:50%;padding:10px;overflow:hidden; center:'true'">
                    <table id="grid"></table>
                </div>
                <div id="dialog" class="easyui-dialog" data-options="closed:true" title="ไผๅ็ฎก็"
                     style="width:300px;height:320px;text-align:center" >
                    <br>
                    <form id="form" method="post">
                        <div style="margin-bottom:10px">
                            <label>ๆ็จๅ็งฐ</label>
                            <input class="easyui-textbox" name="tourname" data-options="required:true" />
                        </div>
                        <div style="margin-bottom:10px">
                            <label>ๆดปๅจๅ็งฐ</label>
                            <input class="easyui-textbox" name="activityname" data-options="required:false" />
                        </div>
                        <div style="margin-bottom:10px">
                            <label>้่ฆ่ดน็จ</label>
                            <input class="easyui-textbox" name="cost" data-options="required:false"/>
                        </div>
                        <div style="margin-bottom:10px">
                            <label>ๆฏๅฆๅทฒ็ผด็บณ</label>
                            <input class="easyui-textbox" name="pay" data-options="required:false"/>
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
    /* jqueryๅฅๅฃ*/
    $(function() {
        loadgrid(); //ๅ?่ฝฝdatagrid
    });

    /* ๅ?่ฝฝdatagridๅ่กจ*/
    function loadgrid(){
        $('#grid').datagrid({
            title : 'ๅฎขๆทไฟกๆฏไธ่ง่กจ',
            url:'http://localhost:8080/json/showmycost.json',
            method: 'post',
            loadMsg : 'ๆญฃๅจๅ?่ฝฝโฆ',  //ๅฝไป่ฟ็จ็ซ็น่ฝฝๅฅๆฐๆฎๆถ๏ผๆพ็คบ็ไธๆกๅฟซๆทไฟกๆฏใ
            rownumbers: true,
            nowrap: false, //่ฎพ็ฝฎไธบtrue๏ผๅฝๆฐๆฎ้ฟๅบฆ่ถๅบๅๅฎฝๆถๅฐไผ่ชๅจๆชๅ
            fitColumns : true, // ่ชๅจ้ๅบๅๅฎฝ
            singleSelect : true, // ๆฏๆฌกๅช้ไธญไธ่ก
            sortName : 'id', //้ป่ฎคๆๅบๅญๆฎต
            sortOrder : 'asc', // ๅๅบasc/้ๅบdesc
            striped : true,  // ้่กๅ่ฒ
            pagination : true,  // ๅจๅบ้จๆพ็คบๅ้กตๅทฅๅทๆ?
            pageNumber : 1, //ๅๅงๅ้กต็?
            pageSize : 20,  // ๆๅฎๆฏ้กต็ๅคงๅฐ๏ผๆๅกๅจ่ฆๅ?ไธpageๅฑๆงๅtotalๅฑๆง
            pageList : [ 20, 30, 50 ], // ๅฏไปฅ่ฎพ็ฝฎๆฏ้กต่ฎฐๅฝๆกๆฐ็ๅ่กจ๏ผๆๅกๅจ่ฆๅ?ไธrowsๅฑๆง
            //rownumbers : true, // ๅจๆๅ้ขๆพ็คบ่กๅท
            idField : 'id', // ไธป้ฎๅฑๆง
            // ๅป็ปๅ,ๅฝๅพๅคๅงๅบ็ฐๆปๅจๆกๆถ่ฏฅๅไธไผๅจ
            frozenColumns : [ [
                {title : '้ๆฉ', width : '20', field : 'ck', checkbox : true},
                // {title : 'ๅบๅท', width : '50', field : 'id', sortable : true},
                {title : 'ๆ็จๅ็งฐ', width : '100', field : 'tourname', sortable : true},
                {title : "ๆดปๅจๅ็งฐ", width : '100',	field : 'activityname',sortable : true}
            ] ],
            columns : [ [
                {title : '้่ฆ่ดน็จ', width : '150', field : 'cost', sortable : false},
                {title : 'ๆฏๅฆๅทฒ็ป็ผด็บณ', width : '200',	field : 'pay', sortable : false},


            ] ],

            // ๅทฅๅทๆ?ๆ้ฎ0

            toolbar: [
                // "-", {id: 'add', text: 'ๆทปๅ?',	iconCls: 'icon-add', handler: function () { add()} },
                // "-", {id: 'edit', text: 'ไฟฎๆน',	iconCls: 'icon-edit',	 handler: function () { edit()} },
                // "-", {id: 'remove', text: 'ๅ?้ค',iconCls: 'icon-remove', handler: function () {remove()} },
                "-", {id: 'remove',  text: 'ๅทๆฐ',iconCls: 'icon-reload', handler: function () {reload()} },
                "-", {id: 'download',  text: 'ไธ่ฝฝ่ดฆๅ',iconCls: 'icon-download', handler: function () {download()} },
                "-", {id: 'participate',  text: '็ผด่ดน',iconCls: 'icon-participate', handler: function () {pay()} },

            ]
        });
    }
    /* ๆพ็คบDialog*/
    function openDialog(title){
        $("#dialog").dialog({
            resizable: false,
            modal: true,
            buttons: [{ //่ฎพ็ฝฎไธๆนๆ้ฎๆฐ็ป
                text: 'ไฟๅญ',
                iconCls: 'icon-save',
                handler: function () {
                    save();
                }
            }, {
                text: 'ๅๆถ',
                iconCls: 'icon-cancel',
                handler: function () {
                    closeDialog();
                }
            }]
        });
        $("#dialog").dialog('setTitle', title);
        $("#dialog").dialog('open');
    }

    /* ๅณ้ญDialog*/
    function closeDialog() {
        $("#form").form('clear'); // ๆธ็ฉบform็ๆฐๆฎ
        $("#dialog").dialog('close');// ๅณ้ญdialog
    }
    function add() {
        // openDialog('ๆทปๅ?ๆ็จ'); // ๆพ็คบๆทปๅ?ๆฐๆฎdialog็ชๅฃ
        // $("#form").form('clear'); // ๆธ็ฉบform็ๆฐๆฎ
        // url = 'customer!add.action'; //ๅๅฐๆทปๅ?ๆฐๆฎaction
        window.location.href="http://localhost:8080/common/registtour.jsp";
    }
    function download() {
        window.location.href="http://localhost:8080/servlet/downloadCost";
    }

    var t;
    function pay() {
        var row = $('#grid').datagrid('getSelected'); //// ๅพๅฐ้ไธญ็ไธ่กๆฐๆฎ
        //ๅฆๆๆฒกๆ้ไธญ่ฎฐๅฝ
        if(row == null){
            $.messager.alert("ๆ็คบ", "่ฏท้ๆฉไธๆก่ฎฐๅฝ",'info');
            // return;
        }else if ((row.pay+"")=="ๆฏ"){
            $.messager.alert("่ญฆๅ", "ไฝ?ๅทฒ็ปไป่ฟ่ฏฅๆฌพไบ",'info');
        } else
        {

            t=row.tourname+"|,|"+row.activityname+"|,|"+row.cost+"|,|"+row.pay;
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/tourController/getPay",
                data: {"pay":t},
            });
            reachPay();
        }

    }
    function  reachPay() {
        window.location.href="http://localhost:8080/tourController/pay";
    }


    /* ไฟฎๆนๆฐๆฎ*/
    function edit() {
        var row = $('#grid').datagrid('getSelected'); //// ๅพๅฐ้ไธญ็ไธ่กๆฐๆฎ
        //ๅฆๆๆฒกๆ้ไธญ่ฎฐๅฝ

        if(row == null){
            $.messager.alert("ๆ็คบ", "่ฏท้ๆฉไธๆก่ฎฐๅฝ",'info');
            return;
        }

        openDialog('ไฟฎๆนๆ็จไฟกๆฏ'); // ๆพ็คบๆดๆฐๆฐๆฎdialog็ชๅฃ
        $("#form").form('load', row); // ๅ?่ฝฝ้ๆฉ่กๆฐๆฎ
        url = 'http://localhost:8080/tourController/updateTour'; //ๅๅฐๆดๆฐๆฐๆฎaction
    }

    /* ไฟๅญๆฐๆฎ*/
    function save(){
        $('#form').form('submit',{
            url: "http://localhost:8080/tourController/updateTour",						//ๆไบคๅฐๅ
            onSubmit: function(){
                return $(this).form('validate'); //ๅๅฐๅญๆฎตๆ?ผๅผๆ?ก้ช
            },
            success: function(result){
                var result = eval('('+result+')');
                if (result.success){
                    closeDialog();		// ่ฐ็จcloseDialog;
                    reload();			// ้ๆฐๅ?่ฝฝ
                    $.messager.show({    //ๆพ็คบๆญฃ็กฎไฟกๆฏ
                        title: 'ๆ็คบ',
                        msg: result.msg
                    });
                } else {
                    $.messager.show({	//ๆพ็คบ้่ฏฏไฟกๆฏ
                        title: '้่ฏฏ',
                        msg: result.msg
                    });
                }
            }
        });
    }

    /* ๅ?้คๆฐๆฎ*/
    function remove(){
        var row = $('#grid').datagrid('getSelected');
        //ๅฆๆๆฒกๆ้ไธญ่ฎฐๅฝ
        if(row == null){
            $.messager.alert("ๆ็คบ", "่ฏท้ๆฉไธๆก่ฎฐๅฝ",'info');
            return;
        }
        $.messager.confirm('็กฎ่ฎค', '็กฎๅฎ่ฆๅ?้คๅ๏ผ', function (r) {
            if (r) {
                //ๆไบคๅฐๅๅฐ็action
                $.post('customer!remove.action', { id: row.id }, function (result) {
                    if (result.success) {
                        reload();
                        $.messager.show({	//ๆพ็คบๆญฃ็กฎไฟกๆฏ
                            title: 'ๆ็คบ',
                            msg: result.msg
                        });
                    } else {
                        $.messager.show({	//ๆพ็คบ้่ฏฏไฟกๆฏ
                            title: '้่ฏฏ',
                            msg: result.msg
                        });
                    }
                }, 'json');
            }
        });

    }

    /* ๅทๆฐgrid*/
    var ii=1;
    function reload(){
        window.location.href="http://localhost:8080/tourController/viewCost";
        window.location.href=("http://localhost:8080/common/showmycost.jsp?ii="+ii);
        ii+=1;
        $('#grid').datagrid('reload');
    }



</script>
</body>
</html>
