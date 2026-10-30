
<%@ page import="java.sql.*" %>
<%@ page import="com.lostfound.util.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
Object userObj = session.getAttribute("userId");

if (userObj == null) {
    response.sendRedirect("login.jsp");
    return;
}

int userId = ((Number) userObj).intValue();

String sql =
    "SELECT c.claim_id, c.item_id, i.item_name, " +
    "c.claim_details, c.claim_status, c.claimed_at " +
    "FROM claims c " +
    "JOIN items i ON c.item_id = i.item_id " +
    "WHERE c.claimant_id = ? " +
    "ORDER BY c.claimed_at DESC";

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Claims - Lost and Found Portal</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3f6fb;
            color: #243b5a;
        }

        nav {
            background: #173b65;
            color: white;
            padding: 20px 6%;
        }

        nav h2 {
            margin: 0;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 35px auto;
        }

        .heading {
            margin-bottom: 25px;
        }

        .heading h1 {
            margin-bottom: 8px;
        }

        .heading p {
            color: #687994;
        }

        .table-box {
            background: white;
            padding: 22px;
            border-radius: 14px;
            box-shadow: 0 5px 20px #dce3ed;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        th, td {
            text-align: left;
            padding: 15px 12px;
            border-bottom: 1px solid #e8edf4;
            vertical-align: top;
        }

        th {
            background: #f5f7fb;
        }

        .status {
            display: inline-block;
            padding: 6px 11px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .pending {
            background: #fff0c2;
            color: #855900;
        }

        .approved {
            background: #d9f7e5;
            color: #176b3a;
        }

        .rejected {
            background: #ffe0e0;
            color: #a32121;
        }

        .empty {
            text-align: center;
            padding: 35px 15px;
            color: #687994;
        }

        .btn {
            display: inline-block;
            background: #173b65;
            color: white;
            padding: 11px 17px;
            border-radius: 7px;
            text-decoration: none;
            margin-top: 20px;
        }

        .btn:hover {
            background: #244f80;
        }
    </style>
</head>

<body>

<nav>
    <h2>Lost &amp; Found Portal</h2>
</nav>

<div class="container">

    <div class="heading">
        <h1>My Claims</h1>
        <p>View the claim requests you have submitted and check their status.</p>
    </div>

    <div class="table-box">

        <%
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {

                if (!rs.isBeforeFirst()) {
        %>

                    <div class="empty">
                        <h3>No claims submitted yet</h3>
                        <p>Your submitted claim requests will appear here.</p>
                    </div>

        <%
                } else {
        %>

                    <table>
                        <tr>
                            <th>Claim ID</th>
                            <th>Item</th>
                            <th>Your Claim Details</th>
                            <th>Date Submitted</th>
                            <th>Status</th>
                        </tr>

                        <%
                        while (rs.next()) {
                            String status = rs.getString("claim_status");
                            String statusClass = "pending";

                            if ("APPROVED".equalsIgnoreCase(status)) {
                                statusClass = "approved";
                            } else if ("REJECTED".equalsIgnoreCase(status)) {
                                statusClass = "rejected";
                            }
                        %>

                        <tr>
                            <td><%= rs.getInt("claim_id") %></td>
                            <td>
                                <strong><%= rs.getString("item_name") %></strong><br>
                                <small>Item ID: <%= rs.getInt("item_id") %></small>
                            </td>
                            <td><%= rs.getString("claim_details") %></td>
                            <td><%= rs.getTimestamp("claimed_at") %></td>
                            <td>
                                <span class="status <%= statusClass %>">
                                    <%= status %>
                                </span>
                            </td>
                        </tr>

                        <%
                        }
                        %>

                    </table>

        <%
                }
            }

        } catch (Exception e) {
        %>
            <div class="empty">
                <h3>Unable to load your claims</h3>
                <p>Please check the database connection and try again.</p>
            </div>
            <%
            application.log("Error loading My Claims page", e);
            %>
        <%
        }
        %>

    </div>

    <a class="btn" href="dashboard.jsp">← Back to Dashboard</a>
    <a class="btn" href="claims.jsp">Submit Another Claim</a>

</div>

</body>
</html>
