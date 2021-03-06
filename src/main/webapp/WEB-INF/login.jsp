<%@ page import="static com.codeup.adlister.controllers.LoginServlet.invalidUserError" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Please Log In</h1>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username</label><%=invalidUserError%>
            <input id="username" name="username" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password" required>
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Log In">
        <input id="from" type="hidden" name="from">
    </form>
</div>

<script>

    var referal = document.referrer;
    document.getElementById("from").value = referal;
</script>

</body>
</html>
