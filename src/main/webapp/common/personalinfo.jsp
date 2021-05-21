<%--
  Created by IntelliJ IDEA.
  User: 19530
  Date: 2020/6/7
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息表表</title>
    <link rel="stylesheet" type="text/css" href="../js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../js/easyui/demo/demo.css">
    <script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/icon.css">
    <link href="<%=request.getContextPath()%> /css/styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="<%=request.getContextPath()%> /images/icon.ico" />
    <script type="text/javascript" src="<%=request.getContextPath()%> /js/iepngfix_tilebg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%> /js/iepngfix.js"></script>
</head>
<body>

<%--<div style="margin:20px 0;"></div>--%>
<div id="mainWrap" class="easyui-window" title="${user.username}的信息表表" style="width:600px;padding:175px 0px 0px 275px;">
    <div style="padding:0px 0px 20px 0px">
        <form id="ff" method="post" action="<%=request.getContextPath()%>/userController/update">
            <table cellpadding="5">
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-textbox" type="text" name="username" id="username" data-options="required:true" value="${user.username}"></input></td>
                </tr>
                <tr>
                    <td>真实姓名:</td>
                    <td><input class="easyui-textbox" type="text" name="realname" id="realname" data-options="required:true" value="${user.realname}"></input></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input class="easyui-textbox" type="text" name="password" id="password" data-options="required:true"value="${user.password}"></input></td>
                </tr>
                <tr>
                    <td>身份证号:</td>
                    <td><input class="easyui-textbox" type="text" name="cardid" id="cardid" data-options="required:true" value="${user.cardid}"></input></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><input class="easyui-checkbox" type="radio" name="sex" value="man" checked="checked" ></input>男</td>
                    <td><input class="easyui-checkbox" type="radio" name="sex" value="woman"  ></input>女</td>
                </tr>
                <tr>
                    <td>工作:</td>
                    <td><input class="easyui-textbox" type="text" name="job" id="job" data-options="required:true" value="${user.job}"}></input></td>
                </tr>
                <tr>

                    <td><input type="submit"  name="department" data-options="multiline:true" value="提交" ></input></td>
                    <td><input type="submit"  name="department" data-options="multiline:true" value="取消"></input></td>

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