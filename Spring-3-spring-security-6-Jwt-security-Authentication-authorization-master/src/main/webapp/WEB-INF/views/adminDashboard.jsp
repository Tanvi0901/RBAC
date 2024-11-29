<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
    body {
       font-family: Arial, sans-serif;
       background-color: #f4f4f4;
       margin: 0;
       padding: 0;
        }

   h1, h3 {
       color: #333;
   }

   form {
       margin: 20px 0;
   }

   table {
       width: 100%;
       border-collapse: collapse;
       margin-top: 20px;
   }

   table, th, td {
       border: 1px solid #ddd;
   }

   th, td {
       padding: 8px;
       text-align: left;
   }

   th {
       background-color: #f2f2f2;
   }
</style>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <h3>Create User</h3>
    <form action="/admin/createUser" method="POST">
        <label>Username:</label>
        <input type="text" name="username" required />
        <label>Password:</label>
        <input type="password" name="password" required />
        <label>Roles:</label>
        <select name="roles" multiple>
            <option value="USER">USER</option>
            <option value="ADMIN">ADMIN</option>
            <option value="SUPERUSER">SUPERUSER</option>
        </select>
        <input type="submit" value="Create User" />
    </form>

    <h3>User List</h3>
    <table border="1">
        <thead>
            <tr>
                <th>Username</th>
                <th>Roles</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.username}</td>
                    <td>
                        <c:forEach var="role" items="${user.roles}">
                            ${role.Role}
                        </c:forEach>
                    </td>
                    <td>
                        <form action="/admin/deleteUser/${user.id}" method="POST">
                            <input type="submit" value="Delete" />
                        </form>
                        <form action="/admin/updateRoles/${user.id}" method="POST">
                            <label>Update Roles:</label>
                            <select name="roles" multiple>
                                <option value="USER">USER</option>
                                <option value="ADMIN">ADMIN</option>
                                <option value="SUPERUSER">SUPERUSER</option>
                            </select>
                            <input type="submit" value="Update" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
