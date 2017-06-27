<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
      <title>首页</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <meta name="format-detection" content="telephone=no"/>
      <meta name="renderer" content="webkit"/>
      <meta http-equiv="Cache-Control" content="no-siteapp" />
      <link rel="alternate icon" type="image/png" href="/assets/i/favicon.png"/>
      <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
      <link rel="stylesheet" href="layui/css/layui.css"/>

  </head>


  </head>
  
  <body>
  <header class="am-topbar am-topbar-inverse">
      <h1 class="am-topbar-brand">
          <a href="#">Amaze UI</a>
      </h1>

      <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

      <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
          <ul class="am-nav am-nav-pills am-topbar-nav">
              <li class="am-active"><a href="#">首页</a></li>
              <li><a href="#">项目</a></li>
              <li class="am-dropdown" data-am-dropdown>
                  <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                      下拉 <span class="am-icon-caret-down"></span>
                  </a>
                  <ul class="am-dropdown-content">
                      <li class="am-dropdown-header">标题</li>
                      <li><a href="#">1. 去月球</a></li>
                      <li class="am-active"><a href="#">2. 去火星</a></li>
                      <li><a href="#">3. 还是回地球</a></li>
                      <li class="am-disabled"><a href="#">4. 下地狱</a></li>
                      <li class="am-divider"></li>
                      <li><a href="#">5. 桥头一回首</a></li>
                  </ul>
              </li>
          </ul>

          <form class="am-topbar-form am-topbar-left am-form-inline" role="search">
              <div class="am-form-group">
                  <input type="text" class="am-form-field am-input-sm" placeholder="搜索">
              </div>
          </form>

          <div class="am-topbar-right">
              <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
                  <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle>其他 <span class="am-icon-caret-down"></span></button>
                  <ul class="am-dropdown-content">
                      <li><a href="#">注册</a></li>
                      <li><a href="#">随便看看</a></li>
                  </ul>
              </div>
          </div>

          <div class="am-topbar-right">
              <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm">登录</button>
          </div>
      </div>
  </header>

  <h2>Hello World! Action Websoket  <span>当前登录用户：${userName}</span></h2>
  <div style="width: 100%;">
      <div style="float: left; width: 70%; height: 200px; background-color: antiquewhite;">
          <p id="message"></p>
      </div>
  </div>
  <hr/>
  发送消息：<input id="text" type="text"/>
  <button onclick="send()">发送消息</button>
  <button onclick="closeWebSocket()">关闭WebSocket连接</button>
  <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
  <script src="assets/js/amazeui.min.js"></script>
  <script type="text/javascript" src="layui/layui.js"></script>
  <script type="text/javascript">
  var userName = "${userName}";
  var websocket = null;
  //判断当前浏览器是否支持WebSocket
  if ('WebSocket' in window) {
  //取到一个客户端的socket
  websocket = new WebSocket("ws://localhost:8083/myweb/websocket.ws/"+userName);
  }
  else {
  alert('当前浏览器 Not support websocket')
  }
  //连接发生错误的回调方法
  websocket.onerror = function () {
  setMessageInnerHTML("WebSocket连接发生错误");
  };
  //连接成功建立的回调方法
  websocket.onopen = function () {
    setMessageInnerHTML("<span style='color:red;'>WebSocket连接成功</span>");
  }
  //接收到消息的回调方法
  websocket.onmessage = function (event) {
  setMessageInnerHTML(event.data);
  }
  //连接关闭的回调方法
  websocket.onclose = function () {
      console.log("WebSocket连接关闭");
  setMessageInnerHTML("WebSocket连接关闭");
  }
  //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
  window.onbeforeunload = function () {
      console.log("window.onbeforeunload");
        closeWebSocket();
  }
  //将消息显示在网页上
  function setMessageInnerHTML(innerHTML) {
     document.getElementById('message').innerHTML += innerHTML + '<br/>';
  }
  //关闭WebSocket连接
  function closeWebSocket() {
  websocket.close();
  }
  //发送消息
  function send() {

      var message = document.getElementById('text').value;
      var textJson = '{"sendName":"'+"hs"+'","message":"'+message+'"}';
      if(websocket.readyState != 3){
        websocket.send(textJson);
      }else{
        alert("websocket连接已经关闭或者出现网络异常！");
      }
  }
  //指定消息接收人
  function createReceiveUser(userName){
      alert("给"+userName+"发送消息");
      $("#sendName").text(userName);
  }



  </script>


  </body>
</html>
