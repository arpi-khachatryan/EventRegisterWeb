<%@ page import="model.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<%
    User user = (User) request.getAttribute("user");
    List<Event> events = (List<Event>) request.getAttribute("events");
%>
Please update user's data:
<form action="/users/edit" method="post">
    <input type="hidden" name="id" value="<%=user.getId()%>">
    <input type="text" name="name" value="<%=user.getName()%>"><br>
    <input type="text" name="surname" value="<%=user.getSurname()%>"> <br>
    <input type="email" name="email" value="<%=user.getEmail()%>"><br>
    <select name="event_id">
        <% for (Event event : events) {
            if (event.equals(user.getEvent())) {
        %>
        <option selected value="<%=event.getId()%>"><%=event.getName()%> <%=event.getPlace()%> (<%=event.getPrice()%>)
        </option>
        <% } else { %>
        <option value="<%=event.getId()%>"><%=event.getName()%> <%=event.getPlace()%> (<%=event.getPrice()%>)
        </option>
        <% }
        } %>
    </select>
    <input type="submit" value="Update">
</form>
</body>
</html>


