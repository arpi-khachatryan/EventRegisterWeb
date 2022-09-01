
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add event</title>
</head>
<body>
Please input event's data:
<form action="/events/add" method="post">
    <input type="text" name="name" placeholder="Please input name"/><br>
    <input type="text" name="place" placeholder="Please input place"/><br>
    Is online?<br>
    Yes<input type="radio" name="isOnline" value="TRUE">
    No<input type="radio" name="isOnline" value="FALSE"><br>
    Please select event's type:
    <select name="eventType">
        <option value="GAME">Game</option>
        <option valu="MOVE">Move</option>
        <option value="SPORT">Sport</option>
    </select><br>
    <input type="number" name="price" placeholder="Pleace input price"/><br>
    <input type="date" name="eventDate"/><br>
    <input type="submit" value="Add">
</form>
</body>
</html>
