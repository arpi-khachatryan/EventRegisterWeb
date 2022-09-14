<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        Add event
    </title>
</head>
<body>
<h3>Please input event's data:</h3>
<form action="/events/add" method="post">
    <input type="text" name="name" placeholder="please input name"/> <br>
    <input type="text" name="place" placeholder="please input place"/> <br>
    <h3>Is event online?</h3><br>
    Yes <input type="radio" name="isOnline" value="TRUE">
    No <input type="radio" name="isOnline" value="FALSE"> <br>
    <h3>Select event's type:</h3>
    <select name="eventType">
        <option value="MOVE">MOVE</option>
        <option value="GAME">GAME</option>
        <option value="SPORT">SPORT</option>
    </select><br>
    <input type="number" name="price" placeholder="Please input price"><br>
    <input type="date" name="eventDate"/><br>
    <input type="submit" value="Add">
</form>
</body>
</html>