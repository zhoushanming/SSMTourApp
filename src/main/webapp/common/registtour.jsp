<%--
  Created by IntelliJ IDEA.
  User: 19530
  Date: 2020/6/5
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册表</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/demo/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/icon.css">
    <link href="<%=request.getContextPath()%> /css/styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="<%=request.getContextPath()%> /images/icon.ico" />
    <script type="text/javascript" src="<%=request.getContextPath()%> /js/iepngfix_tilebg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%> /js/iepngfix.js"></script>
</head>
<body>

<%--<div style="margin:20px 0;"></div>--%>
<div id="mainWrap" class="easyui-window" title="旅程注册表" style="width:600px;padding:175px 0px 0px 275px;">
    <div style="padding:0px 0px 20px 0px">
        <form id="ff" method="post" action="<%=request.getContextPath()%>/userController/createTour">
            <table cellpadding="5">
                <tr>
                    <td>旅程名称:</td>
                    <td><input class="easyui-textbox" type="text" name="tourname" id="tourname" data-options="required:true"></input></td>
                </tr>
<%--                <tr>--%>
<%--                    <td>组织人</td>--%>
<%--                    <td><input class="easyui-textbox" type="text" name="leader" id="leader" data-options="required:true"></input></td>--%>
<%--                </tr>--%>
                <tr>
                    <td>旅程介绍:</td>
                    <td><input class="easyui-textbox" type="text" name="introduction" id="introduction" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>开始日期:</td>
                    <td><input class="easyui-datebox" type="date" name="startdate" id="startdate" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>结束日期:</td>
                    <td><input class="easyui-datebox" type="date" name="enddate" id="enddate" data-options="required:true"></input></td>
                </tr>

                <tr>

                    <td><input type="submit"  name="department" data-options="multiline:true" value="提交" ></input></td>
                    <td><input type="button"  name="department" data-options="multiline:true" value="取消"></input></td>

                </tr>
            </table>
        </form>

    </div>
</div>
<script>
    function submitForm(){
        $('#ff').form('submit');
    }
    function clearForm(){
        $('#ff').form('clear');
    }

</script>
</body>
</html>