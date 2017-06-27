<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java"%>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>登陆</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate icon" type="image/png" href="/assets/i/favicon.png"/>
    <link rel="stylesheet" href="/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <style>
        .header {
            text-align: center;
        }
        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }
        .header p {
            font-size: 14px;
        }
    </style>
</head>

<body>
<div class="header">
    <div class="am-g">
        <h1>爱宠</h1>
        <p>领养代替购买</p>
    </div>
    <hr />
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <%--<h3>登录</h3>
        <hr>
        <div class="am-btn-group">
            <a href="#" class="am-btn am-btn-secondary am-btn-sm"><i class="am-icon-github am-icon-sm"></i> Github</a>
            <a href="#" class="am-btn am-btn-success am-btn-sm"><i class="am-icon-google-plus-square am-icon-sm"></i> Google+</a>
            <a href="#" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-stack-overflow am-icon-sm"></i> stackOverflow</a>
        </div>
        <br>
        <br>--%>

        <form action="" method="post" class="am-form">
            <label for="userName">邮箱:</label>
            <input type="text" name="userName" id="userName" value="">
            <br>
            <label for="password">密码:</label>
            <input type="password" name="passWord" id="passWord" value="">
            <br>
            <label for="remember-me">
                <input id="remember-me" type="checkbox">
                记住密码
            </label>
            <br />
            <div class="am-cf">
                <input type="button" id="login" name="login" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
                <input type="submit" name="" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
            </div>
        </form>
        <hr>
       <%-- <p>© 2014 AllMobilize, Inc. Licensed under MIT license.</p>--%>
    </div>
</div>
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
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
                },
                error: function(e) {
                    layui.use('layer', function(){

                        var layer = layui.layer;
                        layer.msg("错误："+ e.responseText);
                    });
                }

            });
        });
    });

</script>
</body>
</html>
