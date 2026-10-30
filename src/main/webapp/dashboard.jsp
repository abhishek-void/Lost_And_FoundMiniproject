 
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Lost and Found Portal</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3f6fb;
            color: #243247;
        }

        nav {
            background: linear-gradient(135deg, #173b65, #28558a);
            color: white;
            padding: 18px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
        }

        nav h2 {
            margin: 0;
            font-size: 23px;
            letter-spacing: 0.3px;
        }

        .nav-tagline {
            color: #dbeafe;
            font-size: 13px;
            margin-top: 5px;
        }

        .container {
            width: 86%;
            max-width: 1200px;
            margin: 38px auto;
        }

        .welcome {
            background: linear-gradient(120deg, #ffffff, #e8f1ff);
            padding: 30px;
            border-radius: 16px;
            border-left: 5px solid #28558a;
            margin-bottom: 28px;
            box-shadow: 0 5px 18px rgba(30, 58, 95, 0.07);
        }

        .welcome h1 {
            margin: 0 0 12px;
            font-size: 30px;
            color: #173b65;
        }

        .welcome p {
            margin: 0;
            color: #64748b;
            line-height: 1.7;
        }

        .section-title {
            margin: 0 0 18px;
            font-size: 21px;
            color: #243b63;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 14px;
            border: 1px solid #e6ebf2;
            box-shadow: 0 4px 14px rgba(30, 58, 95, 0.06);
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 24px rgba(30, 58, 95, 0.12);
        }

        .card-icon {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            background: #e8f1ff;
            color: #173b65;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 23px;
            margin-bottom: 16px;
        }

        .card h3 {
            margin: 0 0 10px;
            color: #173b65;
            font-size: 20px;
        }

        .card p {
            color: #64748b;
            line-height: 1.6;
            margin: 0 0 22px;
            flex-grow: 1;
        }

        a.button,
        a.action-link {
            display: inline-block;
            padding: 11px 17px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            transition: background 0.2s, color 0.2s;
        }

        a.button {
            background: #173b65;
            color: white;
        }

        a.button:hover {
            background: #28558a;
        }

        .bottom-links {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 28px;
            padding: 18px;
            background: white;
            border-radius: 12px;
            border: 1px solid #e6ebf2;
        }

        a.action-link {
            background: #eef3fa;
            color: #173b65;
        }

        a.action-link:hover {
            background: #dce8f8;
        }

        a.logout {
            background: #fff0f0;
            color: #b4232d;
            margin-left: auto;
        }

        a.logout:hover {
            background: #ffe0e0;
        }

        footer {
            text-align: center;
            color: #8491a5;
            font-size: 13px;
            padding: 22px 12px;
        }

        @media (max-width: 900px) {
            .cards {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 600px) {
            nav {
                padding: 17px 5%;
            }

            nav h2 {
                font-size: 20px;
            }

            .container {
                width: 90%;
                margin: 25px auto;
            }

            .welcome {
                padding: 23px;
            }

            .welcome h1 {
                font-size: 25px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .bottom-links {
                align-items: stretch;
                flex-direction: column;
            }

            .bottom-links a {
                margin-left: 0;
            }
        }
    </style>
</head>

<body>

<nav>
    <div>
        <h2>🔎 Lost &amp; Found Portal</h2>
        <div class="nav-tagline">Find it. Claim it. Return it.</div>
    </div>
</nav>

<div class="container">

    <section class="welcome">
        <h1>
            Welcome, <%= session.getAttribute("fullName") %>!
        </h1>
        <p>
            Manage your lost and found items here.
            Report items, explore listings and track your claims in one place.
        </p>
    </section>

    <h2 class="section-title">What would you like to do?</h2>

    <div class="cards">

        <div class="card">
            <div class="card-icon">📦</div>
            <h3>Report an Item</h3>
            <p>Report an item you have lost or found to help reconnect it with its owner.</p>
            <a class="button" href="report-item.jsp">Report Item &rarr;</a>
        </div>

        <div class="card">
            <div class="card-icon">🔍</div>
            <h3>View Items</h3>
            <p>Browse items reported by users and look for belongings that may be yours.</p>
            <a class="button" href="items.jsp">View Items &rarr;</a>
        </div>

        <div class="card">
            <div class="card-icon">📋</div>
            <h3>My Claims</h3>
            <p>Check the claim requests you have submitted and review their status.</p>
            <a class="button" href="my-claims.jsp">My Claims &rarr;</a>
        </div>

    </div>

    <div class="bottom-links">
        <a class="action-link" href="index.jsp">&larr; Back to Home</a>

        <a class="action-link" href="my-reports.jsp">📁 My Reports</a>

        <a class="action-link logout" href="LogoutServlet">↪ Logout</a>
    </div>

</div>

<footer>
    Lost &amp; Found Portal | Helping belongings find their owners
</footer>

</body>
</html>
