<%@ page import="model.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add user</title>
</head>
<body>
<%--<%--%>
<%--    List<Event> events = (List<Event>) request.getAttribute("event");--%>
<%--%>--%>
<%
    String msg = (String) request.getAttribute("msg");
%>
<% if (msg != null) {%>
<p style="color: red"><%=msg%>
</p>
<%}%>
<h3 style="color: dodgerblue">Please input data about the user:</h3>
<form action="/users/add" , method="post" , enctype="multipart/form-data">
    <input type="text" name="name" placeholder="Please input user's name"><br>
    <input type="text" name="surname" placeholder="Please input user's surname"><br>
    <input type="email" name="email" placeholder="Please input user's email"><br>
    <input type="password" name="password" placeholder="Please input user's password"><br>
    <select name="user_role">
        <option value="ADMIN">Admin</option>
        <option value="USER">User</option>
    </select>
    <%--   <h3 style="color: dodgerblue"> Please select event:</h3>--%>
    <%--    <select name="event_id">--%>
    <%--        <% for (Event event : events) { %>--%>
    <%--        <option value="<%=event.getId()%>"> <%=event.getName()%>  <%=event.getPlace()%>  (<%=event.getPrice()%>)--%>
    <%--        </option>--%>
    <%--        <% } %>--%>
    <%--    </select><br>--%>
    <h3 style="color: dodgerblue">Profile Picture:</h3>
    <input type="file" name="profilePic"/><br>
    <input type="submit" value="Register"/>
</form>
</body>
</html>


