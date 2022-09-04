<%@ page import="model.Event" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Event</title>
</head>
<body>
<% Event event = (Event) request.getAttribute("events");%>
<form action="/events/edit" method=post>
    <input type="hidden" name="id" value="<%=event.getId()%>"><br>
    <input type="text" name="name" value="<%=event.getName()%>"><br>
    <input type="text" name="place" value="<%=event.getPlace()%>"><br>
    Is the event online?<br>
    Yes<input type="radio" name="is_online" value="TRUE">
    No<input type="radio" name="is_online" value="FALSE"><br>
    Please select event's type:
    <select name="event_type">
        <option value="GAME">Game</option>
        <option valu="MOVE">Move</option>
        <option value="SPORT">Sport</option>
    </select><br>
    <input type="number" name="price" value="<%=event.getPrice()%>"><br>
    <input type="date" name="event_date" value="<%=event.getEventDate()%>"><br>
    <input type="submit" value="UPDATE">
</form>
</body>
</html>
