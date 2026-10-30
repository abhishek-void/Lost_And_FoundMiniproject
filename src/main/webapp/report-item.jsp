
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Item - Lost and Found Portal</title>

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
            color: #263449;
            padding: 25px;
        }

        .navbar {
            max-width: 1100px;
            margin: 0 auto 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .brand {
            color: #173b65;
            font-size: 22px;
            font-weight: bold;
        }

        .back-link {
            color: #173b65;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            padding: 10px 15px;
            background: white;
            border: 1px solid #dce5f2;
            border-radius: 8px;
        }

        .back-link:hover {
            background: #edf3ff;
        }

        .form-box {
            width: 100%;
            max-width: 560px;
            margin: 20px auto;
            padding: 35px;
            background: white;
            border: 1px solid #edf1f7;
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(23, 59, 101, 0.10);
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

        h1 {
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
            margin-bottom: 28px;
        }

        .info-box {
            background: #f1f6ff;
            border-left: 4px solid #315f9d;
            padding: 13px 15px;
            border-radius: 7px;
            color: #425674;
            font-size: 13px;
            line-height: 1.6;
            margin-bottom: 25px;
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

        input, textarea, select {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #dce3ed;
            border-radius: 9px;
            background: white;
            color: #263449;
            font-family: Arial, sans-serif;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus, textarea:focus, select:focus {
            border-color: #315f9d;
            box-shadow: 0 0 0 3px rgba(49, 95, 157, 0.12);
        }

        textarea {
            resize: vertical;
            min-height: 110px;
            line-height: 1.5;
        }

        .hint {
            display: block;
            margin-top: 7px;
            color: #7b8798;
            font-size: 12px;
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

        .footer-text {
            text-align: center;
            margin-top: 22px;
            color: #8490a2;
            font-size: 12px;
            line-height: 1.6;
        }

        @media (max-width: 600px) {
            body {
                padding: 15px;
            }

            .form-box {
                padding: 27px 21px;
                margin-top: 15px;
            }

            h1 {
                font-size: 23px;
            }

            .brand {
                font-size: 19px;
            }
        }
    </style>
</head>

<body>

<nav class="navbar">
    <div class="brand">Lost &amp; Found Portal</div>
    <a class="back-link" href="dashboard.jsp">
        &#8592; Dashboard
    </a>
</nav>

<div class="form-box">

    <div class="icon-box">&#128221;</div>

    <h1>Report Lost / Found Item</h1>

    <p class="subtitle">
        Help someone recover their belongings by sharing accurate item details.
    </p>

    <div class="info-box">
        <strong>Quick tip:</strong>
        Include useful identifying details and the location where the item was lost or found.
    </div>

    <form action="ReportItemServlet" method="post">

        <div class="input-group">
            <label for="itemName">Item Name</label>
            <input
                type="text"
                id="itemName"
                name="itemName"
                placeholder="e.g. Black Wallet"
                required>
        </div>

        <div class="input-group">
            <label for="description">Description</label>
            <textarea
                id="description"
                name="description"
                placeholder="Describe the item's colour, brand, unique marks, etc."
                rows="4"></textarea>
            <span class="hint">
                Adding identifying details can help verify the item.
            </span>
        </div>

        <div class="input-group">
            <label for="location">Location</label>
            <input
                type="text"
                id="location"
                name="location"
                placeholder="Where was it lost or found?"
                required>
        </div>

        <div class="input-group">
            <label for="itemType">Report Type</label>
            <select id="itemType" name="itemType" required>
                <option value="">Select Type</option>
                <option value="LOST">Lost Item</option>
                <option value="FOUND">Found Item</option>
            </select>
        </div>

        <div class="input-group">
            <label for="categoryId">Category</label>
            <select id="categoryId" name="categoryId" required>
                <option value="">Select Category</option>
                <option value="1">Wallet</option>
                <option value="2">Mobile</option>
                <option value="3">ID Card</option>
                <option value="4">Bag</option>
                <option value="5">Keys</option>
                <option value="6">Other</option>
            </select>
        </div>

        <button type="submit">Submit Report</button>

    </form>

    <p class="footer-text">
        Thank you for helping reunite people with their belongings.
    </p>

</div>

</body>
</html>
