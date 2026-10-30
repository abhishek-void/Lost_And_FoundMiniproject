
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Lost and Found Portal</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #eaf1ff, #f8faff);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 25px;
            color: #263449;
        }

        .form-box {
            width: 100%;
            max-width: 420px;
            background: white;
            padding: 38px 32px;
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(23, 59, 101, 0.12);
            border: 1px solid #edf1f7;
        }

        .logo {
            width: 58px;
            height: 58px;
            margin: 0 auto 18px;
            background: #e8efff;
            color: #173b65;
            border-radius: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 28px;
        }

        h2 {
            text-align: center;
            color: #173b65;
            font-size: 27px;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #748094;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 26px;
        }

        .input-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #34445b;
        }

        input {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #dce3ed;
            border-radius: 9px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus {
            border-color: #315f9d;
            box-shadow: 0 0 0 3px rgba(49, 95, 157, 0.12);
        }

        button {
            width: 100%;
            padding: 14px;
            margin-top: 5px;
            background: #173b65;
            color: white;
            border: none;
            border-radius: 9px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }

        button:hover {
            background: #24558b;
            transform: translateY(-1px);
        }

        .login-text {
            text-align: center;
            margin-top: 24px;
            font-size: 14px;
            color: #68758a;
        }

        a {
            color: #24558b;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .home-link {
            display: block;
            text-align: center;
            margin-top: 18px;
            font-size: 14px;
        }

        @media (max-width: 480px) {
            .form-box {
                padding: 30px 22px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>

<body>

<div class="form-box">

    <div class="logo">&#128100;</div>

    <h2>Create Account</h2>

    <p class="subtitle">
        Join the Lost &amp; Found Portal and help reunite people with their belongings.
    </p>

    <form action="RegisterServlet" method="post">

        <div class="input-group">
            <label for="fullName">Full Name</label>
            <input
                type="text"
                id="fullName"
                name="fullName"
                placeholder="Enter your full name"
                autocomplete="name"
                required>
        </div>

        <div class="input-group">
            <label for="email">Email Address</label>
            <input
                type="email"
                id="email"
                name="email"
                placeholder="Enter your email address"
                autocomplete="email"
                required>
        </div>

        <div class="input-group">
            <label for="password">Password</label>
            <input
                type="password"
                id="password"
                name="password"
                placeholder="Create a password"
                autocomplete="new-password"
                required>
        </div>

        <button type="submit">Create Account</button>

    </form>

    <p class="login-text">
        Already registered?
        <a href="login.jsp">Login</a>
    </p>

    <a class="home-link" href="index.jsp">← Back to Home</a>

</div>

</body>
</html>
