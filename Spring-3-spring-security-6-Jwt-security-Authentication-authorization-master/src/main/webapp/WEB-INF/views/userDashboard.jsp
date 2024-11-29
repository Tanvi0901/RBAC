<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.spring3.oauth.jwt.dtos.UserResponse" %>
<%@ page import="com.spring3.oauth.jwt.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<html>
<head>
    <title>User Dashboard</title>
</head>
<body>
    <h2>User Dashboard</h2>
    <div id="userProfile"></div>

    <script>
        // Fetch user profile on dashboard load
        fetch('/api/v1/profile', {
            method: 'POST',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('accessToken'),
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to fetch user profile');
            }
            return response.json();
        })
        .then(data => {
            document.getElementById('userProfile').innerHTML = `
                <h3>Welcome, ${data.username}</h3>
                <p>Your Roles: ${data.roles.map(role => role.role).join(', ')}</p>
                <!-- Add more user-specific information here -->
            `;
        })
        .catch(error => {
            alert(error.message);
        });
    </script>

    <button onclick="logout()">Logout</button>

    <script>
        function logout() {
            localStorage.removeItem('accessToken');
            window.location.href = '/login.jsp'; // Redirect to login page
        }
    </script>
</body>
</html>