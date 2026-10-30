
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit a Claim - Lost and Found Portal</title>

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
            max-width: 480px;
            background: white;
            padding: 35px;
            border-radius: 18px;
            border: 1px solid #edf1f7;
            box-shadow: 0 12px 35px rgba(23, 59, 101, 0.12);
        }

        .icon-box {
            width: 60px;
            height: 60px;
            margin: 0 auto 18px;
            background: #e8efff;
            color: #173b65;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
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

        .info-box {
            background: #f1f6ff;
            border-left: 4px solid #315f9d;
            padding: 12px 14px;
            border-radius: 7px;
            font-size: 13px;
            color: #425674;
            line-height: 1.5;
            margin-bottom: 22px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: bold;
            color: #34445b;
        }

        input, textarea {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #dce3ed;
            border-radius: 9px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus, textarea:focus {
            border-color: #315f9d;
            box-shadow: 0 0 0 3px rgba(49, 95, 157, 0.12);
        }

        textarea {
            resize: vertical;
            min-height: 125px;
            line-height: 1.5;
        }

        .hint {
            display: block;
            color: #7b8798;
            font-size: 12px;
            margin-top: 7px;
        }

        button {
            width: 100%;
            padding: 14px;
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

        .back-link {
            display: block;
            text-align: center;
            margin-top: 22px;
            font-size: 14px;
            color: #24558b;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .form-box {
                padding: 26px 21px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>

<body>

<div class="form-box">

    <div class="icon-box">&#128203;</div>

    <h2>Submit a Claim</h2>

    <p class="subtitle">
        Found an item that belongs to you? Provide its details to help verify your ownership.
    </p>

    <div class="info-box">
        <strong>Before submitting:</strong>
        Enter the correct Item ID and describe identifying details that can help verify the item is yours.
    </div>

    <form action="ClaimServlet" method="post">

        <div class="input-group">
            <label for="itemId">Item ID</label>
            <input
                type="number"
                id="itemId"
                name="itemId"
                placeholder="Enter the reported item ID"
                min="1"
                required>
            <span class="hint">
                You can find the Item ID on the View Items page.
            </span>
        </div>

        <div class="input-group">
            <label for="claimDetails">Why is this item yours?</label>
            <textarea
                id="claimDetails"
                name="claimDetails"
                placeholder="Describe its colour, brand, unique marks, contents, or other identifying details..."
                rows="5"
                required></textarea>
        </div>

        <button type="submit">Submit Claim</button>

    </form>

    <a class="back-link" href="dashboard.jsp">
        &#8592; Back to Dashboard
    </a>

</div>

</body>
</html>
