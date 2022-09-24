<%--<%@ page import="model.Event" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="java.util.ArrayList" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        Add user
    </title>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
%>
<% if (msg != null) { %>
<p style="color: red"><%=msg%>
</p>
<% }%>
<h3>Please input User's data:</h3>
<form action="/users/add" method="post" enctype="multipart/form-data" id="registerForm">
    <input type="text" name="name" placeholder="please input name"/> <br>
    <input type="text" name="surname" placeholder="please input surname"/> <br>
    <input type="email" name="email" placeholder="please input email"/> <br>
    <input type="password" name="password" placeholder="please input password"/> <br>
    <select name="user_role">
        <option value="ADMIN">Admin</option>
        <option value="USER">User</option>
    </select><br>
    <%--    <select name="eventId">--%>
    <%--        <% for (Event event : events) { %>--%>
    <%--           <option value="<%=event.getId()%>"><%=event.getName()%> <%=event.getPlace()%> (<%=event.getPrice()%>)</option>--%>
    <%--        <% } %>--%>
    <%--    </select><br>--%>
    <h3>Profile Picture:</h3>
    <input type="file" name="profilePic">
    <input type="submit" value="Register" onclick="alert('hello from java script')">
</form>
<script>
 let elementById = document.getElementById("registerForm");


</script>
</body>
</html>


