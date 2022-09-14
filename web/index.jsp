<%@ page import="model.User" %>
<%@ page import="model.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event Manager</title>
</head>
<%
    User user = (User) session.getAttribute("user");
%>
<body>
<div style="width: 1000px; margin: 0 auto">
    <div>
        <img src="/image/events.jpg" width="800" height="350">
    </div>
    <div>
        <br>
        <a href="/events">Show All Events</a>
        <%
            if (user != null && user.getUserRole() == UserRole.ADMIN) {
        %>
        <a href="/events/add">Add Event</a>
        <a href="/users/add">Add User</a>
        <%}%>
        <%
            if (user != null) {
        %>
        <a href="/users">Show all users</a>
        <a href="/logout">Logout</a>
        <%} else {%>
        <a href="/users/add">Register </a>
        <a href="/login">Login</a>
        <%}%>
        <%--        <a href="/events/delete" style="color: dodgerblue">Delete Event</a>--%>
        <%--        <a href="/users/delete" style="color: dodgerblue">Delete User</a>--%>
    </div>
</div>
</body>
</html>
