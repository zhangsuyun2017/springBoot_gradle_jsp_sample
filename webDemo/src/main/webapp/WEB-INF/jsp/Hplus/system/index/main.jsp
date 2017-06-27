<%--
  Created by IntelliJ IDEA.
  User: hxdn
  Date: 2017/3/10
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <%@ include file="top.jsp"%>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <%@ include file="left.jsp"%>

        <%@ include file="head.jsp"%>

        <%@ include file="right.jsp"%>




    </div>



    <%@ include file="foot.jsp"%>
</body>
</html>
