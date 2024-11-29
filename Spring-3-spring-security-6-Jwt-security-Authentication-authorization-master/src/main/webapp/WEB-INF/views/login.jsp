<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .login-form {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            border-radius: 8px;
        }
        .login-form h2 {
            text-align: center;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .btn {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
    <script>
        const response = // Get this response from the login API
        if (response.redirectUrl) {
            window.location.href = response.redirectUrl; // Redirect to the respective dashboard
        }
    </script>

</head>
<body>

    <div class="login-form">
        <h2>Login</h2>
        <input id="username" class="input-field" type="text" placeholder="Username" required>
        <input id="password" class="input-field" type="password" placeholder="Password" required>
        <button class="btn" onclick="login()">Login</button>
        <p id="error-message" class="error"></p>
    </div>

    <script>
        function login() {
            const username = document.getElementById("username").value;
            const password = document.getElementById("password").value;

            if (!username || !password) {
                document.getElementById("error-message").innerText = "Both fields are required!";
                return;
            }

            const authData = {
                username: username,
                password: password
            };

            fetch("/api/v1/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(authData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.accessToken) {
                    localStorage.setItem("accessToken", data.accessToken);
                    localStorage.setItem("refreshToken", data.token);
                    window.location.href = "/home"; // Redirect to home or dashboard
                } else {
                    document.getElementById("error-message").innerText = "Invalid credentials!";
                }
            })
            .catch(error => {
                document.getElementById("error-message").innerText = "Error: " + error.message;
            });
        }
    </script>

</body>
</html>
