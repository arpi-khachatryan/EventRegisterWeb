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
        <h2 style="color: dodgerblue">Hello from event manager</h2>
        <br>
        <a href="/events" style="color: dodgerblue">Show All Events</a>

        <%
            if (user != null && user.getUserRole() == UserRole.ADMIN) {
        %>
        <a href="/events/add" style="color: dodgerblue">Add Event</a><br>
        <% } %>


        <%
            if (user != null) {
        %>
        <a href="/users" style="color: dodgerblue">Show All Users</a>
        <a href="/logout" style="color: dodgerblue">Logout</a>
        <% } else {%>
        <a href="/users/add" style="color: dodgerblue">Register</a><br>
        <a href="/login" style="color: dodgerblue">Login</a><br>
        <%}%>
        <%--        <a href="/events/delete" style="color: dodgerblue">Delete Event</a>--%>
        <%--        <a href="/users/delete" style="color: dodgerblue">Delete User</a>--%>
    </div>
</div>
</body>
</html>
