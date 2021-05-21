<%--
  Created by IntelliJ IDEA.
  User: 19530
  Date: 2020/4/27
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/demo/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>

    <%--<link rel="stylesheet" type="text/css" href="../js/easyui/themes/gray/easyui.css">--%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/icon.css">
    <link href="<%=request.getContextPath()%> /css/styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="<%=request.getContextPath()%> /images/icon.ico" />
    <script type="text/javascript" src="<%=request.getContextPath()%> /js/iepngfix_tilebg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%> /js/iepngfix.js"></script>

</head>
<body >
<!--<div id="login" class="easyui-window" style="padding-top: 5px;padding-left: 15px"  data-options="modal:true,close:true,iconCls:'Lockgo',minimizable:false">-->
<div id="mainWrap" class="easyui-window" title="登录"
     data-options="modal:true,closed:false,iconCls:'Lockgo',minimizable:false"
     style="width:600px;padding:175px 0px 20px 275px;">
    <form id="loginForm"  action="<%=request.getContextPath()%>/userController/login" method="post">
        <input type="hidden" name="method" value="Login" />
        <div style="text-align: center;color: red;" id="showMsg"></div>

        <table>
            <tr>
                <td width="20%">
                    <div style="margin-bottom:10px">
                        用户名
                    </div>
                </td>
                <td width="80%">
                    <div style="margin-bottom:10px">
                        <input class="easyui-textbox" type="text" id="username" name="username" style="height:30px;padding:12px"
                               data-options="prompt:'用户名',iconCls:'icon-man',iconWidth:38" />
                    </div>
                </td>
            </tr>
            <tr>
                <td width="20%">
                    <div style="margin-bottom:10px">
                        密　码
                    </div>
                </td>
                <td width="80%">
                    <div style="margin-bottom:10px">
                        <input class="easyui-passwordbox" id="password" name="password" prompt="登录密码" iconWidth="38"
                               style="height:30px;padding:12px" />
                    </div>
                </td>
            </tr>
            <tr>
                <td width="20%">
                    <div style="margin-bottom:10px">
                        验证码
                    </div>
                </td>
                <td width="80%">
                    <div style="margin-bottom:20px">
                        <input class="easyui-validatebox textbox" type="text" id="logyzm"
                               style="width:40%;height:30px;padding:12px; font-size: 18px"
                               data-options="prompt:'验证码'"  />
                        <span>
                        <img  id="imgCheckCode" style=" margin:1px ; vertical-align:middle; height:26px;width: 60px"
                              src="<%=request.getContextPath()%>/getValidateCode" title="看不清,点击刷新" onclick="changeCheckCode();return false;"/>
                        <img  id="checkIconOK"   style="margin:0px;height:20px;width: 20px"
                              src="<%=request.getContextPath()%>/images/icons/cancel.png"/>
                    </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td width="20%">

                </td>
                <td width="80%">
                    <div style="margin-bottom:10px">
                        <input class="easyui-checkbox" type="checkbox"value="true" name="remember" label="记住密码:"
                               data-options="checked:false">
                        <input type="submit" onclick="doLogin()" style="width: 60px;height: 25px" value="登录">
                    </div>
                    <a href="findpassword.jsp">找回密码</a>

                    <a href="<%=request.getContextPath()%>/common/login.jsp">注册新用户</a>
                </td>



            </tr>

        </table>
    </form>
</div>

<script type="text/javascript">
    var isCheckCodeSuccess = false;     // 设置验证成功标志
    $(function() {
        $("#login").dialog({
            title : '用户登录',
            backcolor:'#00f',
            iconCls : 'icon-lock',
            width : '420',
            height : '330',
            closable : false,
            minimizable : false,
            maximizable : false,
            resizable : false,
            modal : true,
            closed : false
            ,
            buttons : [ {
                text : '登录',
                iconCls : 'icon-ok',
                handler:function(){
                    doLogin();
                }},
                {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#login").dialog("close");
                    }

                } ]
        });

        $("#logyzm").bind("blur",function(){
            //此处写你需要执行的代码
            isCheckCodeSuccess = false;
            checkCode();
        });

        $("#logyzm").bind("focus",function(){
            //此处写你需要执行的代码
            checkCodeClear();
        });

    });
    function doLogin(){
        if($("input[name='userName']").val()=="" || $("input[name='password']").val()==""){
            $("#showMsg").html("用户名或密码为空，请重新输入。");
            $("input[name='userName']").focus();
        }
        if(! isCheckCodeSuccess) {
            $("#showMsg").html("验证码错误，请重新输入。");
        }
        else
        {
            $("#login").dialog("close");
            $("#loginForm").get(0).submit();
        }
    }

    function changeCheckCode() {
        var timestamp = new Date().getTime();
        var path = "<%=request.getContextPath()%>/getValidateCode?date=";
        $("#imgCheckCode").attr("src", path + timestamp);
    }

    function checkCode() 	 {
        $.ajax({
            url: '<%=request.getContextPath()%>/checkCode',
            type: "POST",
            data:  {
                logyzm:$("#logyzm").val()
            },  //将表单序列化$("#logyzm").serialize(),
            //contentType: "application/json; charset=utf-8",   // 请求数据格式
            dataType: "json",               //  响应数据格式
            beforeSend: function() {
                isCheckCodeSuccess = false;     // 设置验证成功标志
            },
            success: function (data) {
                //data = jQuery.parseJSON(data);  // 如果dataType注释了，故需要转换为JSON对象
                //data2 = eval('(' + data1 + ')');      //将一个json字符串解析成js对象
                //ajax方式直接将后台的json字符串转换为json对象，即这里的data已经是json对象，不需要转换
                if (data.Success) {
                    isCheckCodeSuccess = true;     // 设置验证成功标志--成功:true.
                    $("#checkIconOK").attr("src", "/images/icons/ok.png");
                }
                else {
                    $("#checkIconOK").attr("src", "/images/icons/cancel.png");
                }
            },
            error:function(){
                alert('验证码校验请求失败!');
            }
        })
    }

    function checkCodeClear() 	 {
        $("#checkIconOK").attr("src", "/images/icons/cancel.png");
        //$("#logyzm").textbox("setValue","");
    }

</script>

</body>
</html>
