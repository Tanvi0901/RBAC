<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Superuser Dashboard</title>
</head>
<body>
    <h2>Superuser Dashboard</h2>
    <h3>Assign Roles to Users</h3>

    <form action="/superuser/updateUserRoles" method="post">
        <table border="1">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Current Roles</th>
                    <th>Assign New Role</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.roles}</td>
                        <td>
                            <select name="roles">
                                <option value="USER">USER</option>
                                <option value="ADMIN">ADMIN</option>
                                <option value="SUPERUSER">SUPERUSER</option>
                            </select>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <input type="submit" value="Update Roles" />
    </form>
</body>
</html>
