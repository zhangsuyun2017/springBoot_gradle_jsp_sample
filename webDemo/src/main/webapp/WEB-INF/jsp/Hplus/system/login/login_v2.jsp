<%--
  Created by IntelliJ IDEA.
  User: hxdn
  Date: 2017/3/11
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>H+ 后台主题UI框架 - 登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="/Hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/Hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="/Hplus/css/animate.css" rel="stylesheet">
    <link href="/Hplus/css/style.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">H+</h1>

        </div>
        <h3>欢迎使用 H+</h3>

        <form class="m-t" role="form" action="index.html">
            <div class="form-group">
                <input type="text" id="userName" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" id="passWord" class="form-control" placeholder="密码" required="">
            </div>
            <button type="button" id="login" class="btn btn-primary block full-width m-b">登 录</button>


            <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
            </p>

        </form>
    </div>
</div>

<!-- 全局js -->
<script src="/Hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="/Hplus/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="static/js/md5.js"></script>
<script type="text/javascript" src="static/js/sign.js"></script>
<script type="text/javascript">


    $(function(){
        $("#login").click(function (){
            var userName = $("#userName").val();
            var passWord = $("#passWord").val();
            if(userName==""||userName==undefined){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg("账号不能为空！");
                });
                return false;
            }
            if(passWord==""||passWord==undefined){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg("密码不能为空！");
                });
                return false;
            }
            var map = {
                userName:userName,
                passWord:passWord
            };
            console.log(mysign.getSign(map));
            $.ajax({
                type:'POST',
                url: "${pageContext.request.contextPath}/login",
                data:{userName:userName,passWord:passWord,sign:mysign.getSign(map)},
                success:function(data){
                    console.log(data);
                    if(data.data=="SUCCESS"){
                        window.location.href = "${pageContext.request.contextPath}/admin/index/main";
                    }
                }

            });
        });
    });

</script>



</body>
</html>
