<%--
  Created by IntelliJ IDEA.
  User: stephenapolinar
  Date: 8/28/18
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h5>
    <c:out value="${ad.title}"/>
</h5>
<p>
    <c:out value="${ad.description}"/>
</p>

<p>
    <c:out value="post by: ${ad.username}"/><br>
    <c:out value="price: $${ad.price}"/><br>
    <c:out value="location: ${ad.city}, ${ad.state}"/><br>
    <c:if test="${ad.username == sessionScope.user.username}">
        <a class="btn btn-primary" href="/ads/edit-ad?id=${ad.id}">Edit</a>
        <a class="btn btn-primary" id="deletebtn" href="/ads/delete-ad?id=${ad.id}">Delete</a>
    </c:if>


</p>




</body>
</html>