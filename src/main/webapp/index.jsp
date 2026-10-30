<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lost and Found Portal</title>
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
            font-size: 24px;
        }

        .nav-text {
            color: #dbeafe;
            font-size: 14px;
        }

        .hero {
            width: 86%;
            max-width: 1150px;
            margin: 55px auto 35px;
            padding: 65px 35px;
            text-align: center;
            background: linear-gradient(135deg, #e8f1ff, #ffffff);
            border: 1px solid #e0eaf8;
            border-radius: 22px;
            box-shadow: 0 10px 30px rgba(30, 58, 95, 0.07);
        }

        .hero-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .hero h1 {
            color: #173b65;
            font-size: 42px;
            line-height: 1.2;
            margin: 0 auto 18px;
        }

        .hero p {
            color: #64748b;
            font-size: 18px;
            line-height: 1.8;
            max-width: 680px;
            margin: 0 auto 28px;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 14px;
            flex-wrap: wrap;
        }

        a.button {
            display: inline-block;
            padding: 13px 28px;
            background: #173b65;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.2s, transform 0.2s;
        }

        a.button:hover {
            background: #28558a;
            transform: translateY(-2px);
        }

        a.button.secondary {
            background: white;
            color: #173b65;
            border: 1px solid #173b65;
        }

        a.button.secondary:hover {
            background: #e8f1ff;
        }

        .features {
            width: 86%;
            max-width: 1150px;
            margin: 35px auto 60px;
        }

        .features h2 {
            text-align: center;
            color: #173b65;
            font-size: 27px;
            margin-bottom: 25px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
        }

        .feature-card {
            background: white;
            border: 1px solid #e6ebf2;
            padding: 27px 22px;
            border-radius: 14px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(30, 58, 95, 0.05);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .feature-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 23px rgba(30, 58, 95, 0.10);
        }

        .feature-icon {
            font-size: 32px;
            margin-bottom: 12px;
        }

        .feature-card h3 {
            color: #173b65;
            margin: 0 0 10px;
        }

        .feature-card p {
            color: #64748b;
            line-height: 1.7;
            margin: 0;
        }

        footer {
            background: #173b65;
            color: #dbeafe;
            text-align: center;
            padding: 22px 15px;
            font-size: 14px;
        }

        @media (max-width: 750px) {
            .hero {
                margin-top: 30px;
                padding: 45px 22px;
            }

            .hero h1 {
                font-size: 32px;
            }

            .hero p {
                font-size: 16px;
            }

            .feature-grid {
                grid-template-columns: 1fr;
            }

            .features, .hero {
                width: 90%;
            }
        }
    </style>
</head>

<body>

    <nav>
        <h2>🔎 Lost &amp; Found Portal</h2>
        <div class="nav-text">Find it. Claim it. Return it.</div>
    </nav>

    <section class="hero">
        <div class="hero-icon">🎒</div>

        <h1>Lost Something? Find It Here!</h1>

        <p>
            Lost an important belonging or found something that belongs
            to someone else? Our platform helps people report lost and
            found items and reconnect belongings with their owners.
        </p>

        <div class="buttons">
            <a class="button" href="register.jsp">Get Started &rarr;</a>
            <a class="button secondary" href="login.jsp">Login</a>
        </div>
    </section>

    <section class="features">
        <h2>How Can We Help?</h2>

        <div class="feature-grid">

            <div class="feature-card">
                <div class="feature-icon">📝</div>
                <h3>Report Items</h3>
                <p>Submit a report for an item you lost or found.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🔍</div>
                <h3>Find Belongings</h3>
                <p>Browse reported items and look for your belongings.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🤝</div>
                <h3>Reconnect Owners</h3>
                <p>Submit a claim to help return an item to its rightful owner.</p>
            </div>

        </div>
    </section>

    <footer>
        Lost &amp; Found Portal | Helping belongings find their owners
    </footer>

</body>
</html>