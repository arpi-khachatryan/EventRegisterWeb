<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete user</title>
</head>
<body>
<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
Please select user's name:
<form action="/users/delete" method="post">
    <select name="id">
        <table>
            <% for (User user : users) { %>
            <tr>
                <option value="<%=user.getId()%>"><%=user.getName()%>
                </option>
            </tr>
            <% } %>
        </table>
    </select><br>
    <input type="submit" value="Add">
</form>
</body>
</html>
