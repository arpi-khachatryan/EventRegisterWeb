<%@ page import="model.User" %>
<%@ page import="model.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event Manager</title>
    <link href="/css/main.css" rel="stylesheet">
    <link href="/css/riot-slider.min.css" rel="stylesheet">

    <script src="/js/jquery-3.6.1.js"></script>
    <script src="/js/riot-slider.min.js"></script>
    <script src="/js/myJs.js"></script>

</head>
<%
    User user = (User) session.getAttribute("user");
%>
<body>
<div class="mainDiv">
    <div>

        <ul class="riot-slider">
            <li><img src="/image/istockphoto-479977238-170667a.jpg"/></li>
            <li><img src="/image/istockphoto-597940046-612x612.jpg"/></li>
            <li><img src="/image/NEW-aim_cover-interna1100x416_sport.jpg"/></li>
            <li><img src="/image/pexels-photo-976866.jpeg"/></li>
        </ul>

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

    <div style="width: 200px; margin: 0 auto">

        <%--        <button id="redBtn">Red</button>--%>
        <%--        <button id="orangeBtn">Orange</button>--%>
        <%--        <button id="blackBtn">Black</button> --%>

        <button class="colorBtn" onclick="onBtnClick(this)">Red</button>
        <button class="colorBtn" onclick="onBtnClick(this)">Orange</button>
        <button class="colorBtn" onclick="onBtnClick(this)">Black</button>
    </div>
    <br>
    <div>
        <div style="width: 200px;height: 200px;border: 1px solid red;background-color: blue;margin: 0 auto"
             id="myDiv"></div>
    </div>
</div>


<%--<script>--%>
// let redBtn = document.getElementById("redBtn");
// redBtn.onclick = function () {
// let myDiv = document.getElementById("myDiv");
// myDiv.style.backgroundColor = 'red';
// }
//
// let orangeBtn = document.getElementById("orangeBtn");
// orangeBtn.onclick = function () {
// let myDiv = document.getElementById("myDiv");
// myDiv.style.backgroundColor = 'orange';
// }
//
// let blackBtn = document.getElementById("blackBtn");
// blackBtn.onclick = function () {
// let myDiv = document.getElementById("myDiv");
// myDiv.style.backgroundColor = 'black';
// }


// function onBtnClick(e) {
// let color = e.textContent;
// let myDiv = document.getElementById("myDiv");
// myDiv.style.backgroundColor = color;


<%--    function onBtnClick(e) {--%>
<%--        let color = e.textContent;--%>
<%--        let myDiv = $('#myDiv');--%>
<%--        myDiv.css("background-color", color)--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
