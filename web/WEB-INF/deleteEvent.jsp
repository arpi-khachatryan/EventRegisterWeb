<%@ page import="model.Event" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Event</title>
</head>
<body>
<%
    List<Event> events = (List<Event>) request.getAttribute("events");
%>
Please select event's name:
<form action="/events/delete" method="post">
    <select name="id">
        <table>
            <% for (Event event : events) { %>
            <tr>
                <option value="<%=event.getId()%>"><%=event.getName()%>
                </option>
            </tr>
            <% } %>
        </table>
    </select><br>
    <input type="submit" value="Add">
</form>
</body>
</html>
