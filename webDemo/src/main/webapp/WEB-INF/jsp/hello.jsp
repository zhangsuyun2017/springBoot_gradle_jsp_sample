<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test: hello</title>
</head>
<body>
	<h1>Hello,<c:out value="${msg}"></c:out></h1>
<!-- 	用户信息如下：<br/> -->
<%-- 	用户id:<c:out value="${user。name}"></c:out><br/> --%>
<%-- 	用户姓名:<c:out value="${user。name}"></c:out><br/> --%>
<%-- 	用户年龄:<c:out value="${user。name}"></c:out><br/> --%>

    <c:forEach items="${list }" var="user">
        用户id:<c:out value="${user.id}"></c:out><br/>
        用户姓名:<c:out value="${user.name}"></c:out><br/>
       用户年龄:<c:out value="${user.age}"></c:out><br/>
    </c:forEach>
</body>
</html>