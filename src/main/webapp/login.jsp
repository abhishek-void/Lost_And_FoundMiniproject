<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Lost and Found Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eaf1fb, #f7f9fd);
            color: #243247;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        nav {
            background: linear-gradient(135deg, #173b65, #28558a);
            color: white;
            padding: 18px 7%;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
        }

        nav h2 {
            margin: 0;
            font-size: 23px;
        }

        .page-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 35px 16px;
        }

        .form-box {
            width: 100%;
            max-width: 410px;
            padding: 35px;
            background: white;
            border: 1px solid #e3eaf4;
            border-radius: 17px;
            box-shadow: 0 12px 35px rgba(30, 58, 95, 0.10);
        }

        .login-icon {
            width: 60px;
            height: 60px;
            margin: 0 auto 17px;
            border-radius: 16px;
            background: #e8f1ff;
            color: #173b65;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
        }

        h2 {
            text-align: center;
            color: #173b65;
            margin: 0 0 10px;
            font-size: 27px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            font-size: 14px;
            line-height: 1.6;
            margin: 0 0 25px;
        }

        .field-label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            color: #334155;
            margin: 17px 0 8px;
        }

        input {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            background: #fbfdff;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus {
            border-color: #28558a;
            box-shadow: 0 0 0 3px rgba(40, 85, 138, 0.12);
        }

        button {
            width: 100%;
            padding: 13px;
            margin-top: 24px;
            background: #173b65;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }

        button:hover {
            background: #28558a;
            transform: translateY(-1px);
        }

        .register-text {
            text-align: center;
            margin: 23px 0 15px;
            font-size: 14px;
            color: #64748b;
        }

        a {
            color: #245b91;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .back-link {
            display: block;
            text-align: center;
            font-size: 14px;
            margin-top: 18px;
        }

        footer {
            text-align: center;
            padding: 18px 12px;
            color: #8491a5;
            font-size: 13px;
        }

        @media (max-width: 480px) {
            .form-box {
                padding: 27px 22px;
            }

            nav {
                padding: 17px 5%;
            }

            nav h2 {
                font-size: 20px;
            }
        }
    </style>
</head>

<body>

<nav>
    <h2>🔎 Lost &amp; Found Portal</h2>
</nav>

<div class="page-content">
    <div class="form-box">

        <div class="login-icon">🔐</div>

        <h2>Welcome Back!</h2>
        <p class="subtitle">
            Login to manage your reports and claim requests.
        </p>

        <% if ("success".equals(request.getParameter("registered"))) { %>
            <p style="background:#e8f7ed; color:#176b38; padding:12px; border-radius:7px; font-size:14px;">
                Registration successful! Please login.
            </p>
        <% } %>

        <form action="LoginServlet" method="post">

            <label class="field-label" for="email">Email Address</label>
            <input type="email"
                   id="email"
                   name="email"
                   placeholder="Enter your email"
                   autocomplete="email"
                   required>

            <label class="field-label" for="password">Password</label>
            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter your password"
                   autocomplete="current-password"
                   required>

            <button type="submit">Login to Account &rarr;</button>

        </form>

        <p class="register-text">
            Don't have an account?
            <a href="register.jsp">Create Account</a>
        </p>

        <a class="back-link" href="index.jsp">&larr; Back to Home</a>

    </div>
</div>

<footer>
    Lost &amp; Found Portal | Helping belongings find their owners
</footer>

</body>
</html>