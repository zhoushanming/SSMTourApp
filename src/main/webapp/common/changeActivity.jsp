<%--
  Created by IntelliJ IDEA.
  User: 19530
  Date: 2020/6/8
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>更改活动界面</title>
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
<div id="mainWrap" class="easyui-window" title="活动注册表" style="width:600px;padding:175px 0px 0px 275px;">
    <div style="padding:0px 0px 20px 0px">
        <form id="ff" method="post" action="<%=request.getContextPath()%>/tourController/getupdateActivity">
            <table cellpadding="5">
                <tr>
                    <td>活动名称:</td>
                    <td><label>${sessionScope.updateActivity.activityname}</label></td>
                </tr>

                <tr>
                    <td>活动内容:</td>
                    <td><input class="easyui-textbox" type="text" name="content" id="content" data-options="required:true" value="${sessionScope.updateActivity.content}"></input></td>
                </tr>
                <tr>
                    <td>预计(每人)开销(/元):</td>
                    <td><input class="easyui-textbox" type="text" name="cost" id="cost" data-options="required:true" value="${sessionScope.updateCost.cost}"></input></td>
                </tr>
                <tr>

                    <td><input type="submit"  name="department" data-options="multiline:true" value="提交" ></input></td>
                    <td><input type="button"  name="department" data-options="multiline:true" value="取消"></input></td>
                    <td><a href="<%=request.getContextPath()%>/tourController/deleteActivity">删除此活动</a> </td>
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