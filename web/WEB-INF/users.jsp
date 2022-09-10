<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>USER</title>
</head>
<body>
<% List<User> users = (List<User>) request.getAttribute("users");%>
<table border="1">
    <tr>
        <th>image</th>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>event name and place</th>
        <th>action</th>
    </tr>
    <% for (User user : users) { %>
    <tr>
        <td>
            <%if (user.getProfilePic() == null || user.getProfilePic().length() ==0) {%>
            <img src="/image/78-786293_1240-x-1240-0-avatar-profile-icon-png.png" width="100">
            <%} else {%>
            <img src="/getImage?profilePic=<%=user.getProfilePic()%>" width="100">
            <%}%>
        </td>
        <td><%=user.getId()%>
        </td>
        <td><%=user.getName()%>
        </td>
        <td><%=user.getSurname()%>
        </td>
        <td><%=user.getEmail()%>
        </td>
        <td>
            <%if (user.getEvent() != null) {%>
            <%=user.getEvent().getName()%><%=user.getEvent().getPlace()%>
            <%} else {%>
            <span style="color: red">There is no event</span>
            <%}%>
        </td>
        <td>
            <a href="/users/remove?id=<%=user.getId()%>">Remove</a> |
            <a href="/users/edit?id=<%=user.getId()%>">Edit</a>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
