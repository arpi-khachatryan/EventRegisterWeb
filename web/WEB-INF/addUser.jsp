<%@ page import="model.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add user</title>
</head>
<body>
<%
    List<Event> events = (List<Event>) request.getAttribute("event");
%>
Please input user's data:
<form action="/users/add" , method="post">
    <input type="text" name="name" placeholder="Please input user's name"><br>
    <input type="text" name="surname" placeholder="Please input user's surname"><br>
    <input type="text" name="email" placeholder="Please input user's email"><br>
    Please select the event<br>
    <select name="event_id">
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


