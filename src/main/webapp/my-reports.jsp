
<%@ page import="java.sql.*" %>
<%@ page import="com.lostfound.util.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%!
    private String escapeHtml(String value) {
        if (value == null) return "-";

        return value.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#x27;");
    }
%>

<%
    Object userObj = session.getAttribute("userId");

    if (userObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) userObj;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Reports - Lost and Found Portal</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f3f6fb;
            color: #263449;
            min-height: 100vh;
        }

        .navbar {
            background: #173b65;
            color: white;
            padding: 20px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .navbar h2 {
            font-size: 22px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 14px;
            border: 1px solid rgba(255,255,255,0.5);
            padding: 10px 15px;
            border-radius: 8px;
        }

        .navbar a:hover {
            background: #24558b;
        }

        .container {
            width: 92%;
            max-width: 1400px;
            margin: 35px auto;
        }

        .page-heading {
            margin-bottom: 25px;
        }

        .page-heading h1 {
            color: #173b65;
            font-size: 30px;
            margin-bottom: 9px;
        }

        .page-heading p {
            color: #748094;
            font-size: 14px;
            line-height: 1.6;
        }

        .info-card {
            display: flex;
            align-items: center;
            gap: 15px;
            background: white;
            border: 1px solid #e9eef5;
            border-radius: 12px;
            padding: 18px 22px;
            margin-bottom: 24px;
            box-shadow: 0 4px 15px rgba(23, 59, 101, 0.04);
        }

        .info-icon {
            width: 45px;
            height: 45px;
            flex-shrink: 0;
            border-radius: 12px;
            background: #e8efff;
            color: #173b65;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
        }

        .info-card strong {
            display: block;
            color: #173b65;
            margin-bottom: 5px;
            font-size: 15px;
        }

        .info-card p {
            font-size: 13px;
            color: #748094;
            line-height: 1.5;
        }

        .table-card {
            background: white;
            border: 1px solid #e9eef5;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(23, 59, 101, 0.06);
            overflow: hidden;
        }

        .table-heading {
            padding: 21px 22px;
            border-bottom: 1px solid #edf1f7;
        }

        .table-heading h3 {
            color: #173b65;
            font-size: 17px;
        }

        .table-responsive {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px 16px;
            border-bottom: 1px solid #edf1f7;
            text-align: left;
            vertical-align: middle;
            font-size: 13px;
            line-height: 1.5;
        }

        th {
            background: #f5f8fd;
            color: #52627a;
            text-transform: uppercase;
            font-size: 11px;
            letter-spacing: 0.4px;
            white-space: nowrap;
        }

        tbody tr:hover {
            background: #f8faff;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .item-id {
            color: #173b65;
            font-weight: bold;
        }

        .type-badge, .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
            white-space: nowrap;
        }

        .lost {
            background: #fff0ef;
            color: #c62828;
        }

        .found {
            background: #e9f7ef;
            color: #188038;
        }

        .status-open {
            background: #fff4d6;
            color: #8a6200;
        }

        .status-claimed {
            background: #e8efff;
            color: #24558b;
        }

        .status-returned {
            background: #e9f7ef;
            color: #188038;
        }

        .claim-count {
            display: inline-block;
            padding: 6px 10px;
            background: #eef3fb;
            color: #173b65;
            border-radius: 7px;
            font-weight: bold;
            white-space: nowrap;
        }

        .empty-message, .error-message {
            padding: 35px 20px;
            text-align: center;
            line-height: 1.6;
        }

        .empty-message {
            color: #748094;
        }

        .error-message {
            color: #b42318;
        }

        .empty-link {
            display: inline-block;
            margin-top: 12px;
            padding: 10px 15px;
            background: #173b65;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
        }

        .footer {
            text-align: center;
            padding: 25px 15px;
            font-size: 12px;
            color: #8490a2;
        }

        @media (max-width: 600px) {
            .navbar {
                padding: 17px 5%;
            }

            .navbar h2 {
                font-size: 19px;
            }

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .page-heading h1 {
                font-size: 25px;
            }

            .info-card {
                padding: 15px;
            }
        }
    </style>
</head>

<body>

<nav class="navbar">
    <h2>Lost &amp; Found Portal</h2>
    <a href="dashboard.jsp">&#8592; Back to Dashboard</a>
</nav>

<div class="container">

    <div class="page-heading">
        <h1>My Reports</h1>
        <p>Track the items you have reported and check how many claims they have received.</p>
    </div>

    <div class="info-card">
        <div class="info-icon">&#128203;</div>
        <div>
            <strong>Your Reported Items</strong>
            <p>Only items reported by your currently logged-in account appear here.</p>
        </div>
    </div>

    <div class="table-card">

        <div class="table-heading">
            <h3>My Report History</h3>
        </div>

        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Type</th>
                        <th>Location</th>
                        <th>Status</th>
                        <th>Claim Requests</th>
                        <th>Reported At</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    String sql =
                        "SELECT i.item_id, i.item_name, i.item_type, i.location, " +
                        "i.item_status, i.reported_at, " +
                        "(SELECT COUNT(*) FROM claims c " +
                        "WHERE c.item_id = i.item_id) AS claim_count " +
                        "FROM items i " +
                        "WHERE i.user_id = ? " +
                        "ORDER BY i.reported_at DESC";

                    try (Connection con = DBConnection.getConnection();
                         PreparedStatement ps = con.prepareStatement(sql)) {

                        ps.setInt(1, userId);

                        try (ResultSet rs = ps.executeQuery()) {
                            boolean foundAny = false;

                            while (rs.next()) {
                                foundAny = true;

                                String type = rs.getString("item_type");
                                String status = rs.getString("item_status");

                                String typeClass =
                                    "LOST".equalsIgnoreCase(type) ? "lost" : "found";

                                String statusClass = "status-open";

                                if ("CLAIMED".equalsIgnoreCase(status)) {
                                    statusClass = "status-claimed";
                                } else if ("RETURNED".equalsIgnoreCase(status)) {
                                    statusClass = "status-returned";
                                }
                %>

                    <tr>
                        <td class="item-id">
                            #<%= rs.getInt("item_id") %>
                        </td>

                        <td>
                            <strong><%= escapeHtml(rs.getString("item_name")) %></strong>
                        </td>

                        <td>
                            <span class="type-badge <%= typeClass %>">
                                <%= escapeHtml(type) %>
                            </span>
                        </td>

                        <td>
                            <%= escapeHtml(rs.getString("location")) %>
                        </td>

                        <td>
                            <span class="status-badge <%= statusClass %>">
                                <%= escapeHtml(status) %>
                            </span>
                        </td>

                        <td>
                            <span class="claim-count">
                                <%= rs.getInt("claim_count") %> request(s)
                            </span>
                        </td>

                        <td>
                            <%
                                Timestamp reportedAt = rs.getTimestamp("reported_at");
                                out.print(reportedAt == null
                                    ? "-"
                                    : reportedAt.toString());
                            %>
                        </td>
                    </tr>

                <%
                            }

                            if (!foundAny) {
                %>
                    <tr>
                        <td colspan="7" class="empty-message">
                            <strong>You have not reported any items yet.</strong>
                            <br>
                            Your submitted reports will appear here.
                            <br>
                            <a class="empty-link" href="report-item.jsp">
                                + Report an Item
                            </a>
                        </td>
                    </tr>
                <%
                            }
                        }

                    } catch (SQLException e) {
                        application.log("Unable to load reports", e);
                %>
                    <tr>
                        <td colspan="7" class="error-message">
                            Unable to load reports. Please check the Eclipse Console.
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<footer class="footer">
    Lost &amp; Found Portal &mdash; Helping belongings find their owners.
</footer>

</body>
</html>
