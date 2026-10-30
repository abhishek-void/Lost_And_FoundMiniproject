
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
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Items - Lost and Found Portal</title>

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
            gap: 15px;
            flex-wrap: wrap;
        }

        .navbar h2 {
            font-size: 22px;
            color: white;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 14px;
            border: 1px solid rgba(255,255,255,0.5);
            padding: 10px 15px;
            border-radius: 8px;
            transition: background 0.2s;
        }

        .navbar a:hover {
            background: #24558b;
        }

        .container {
            width: 92%;
            max-width: 1500px;
            margin: 35px auto;
        }

        .page-heading {
            margin-bottom: 24px;
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

        .table-card {
            background: white;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(23, 59, 101, 0.07);
            border: 1px solid #e9eef5;
            overflow: hidden;
        }

        .table-heading {
            padding: 20px 22px;
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
            min-width: 1050px;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 15px 16px;
            text-align: left;
            border-bottom: 1px solid #edf1f7;
            font-size: 13px;
            line-height: 1.5;
            vertical-align: top;
        }

        th {
            background: #f5f8fd;
            color: #52627a;
            font-size: 12px;
            text-transform: uppercase;
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

        .empty-message, .error-message {
            padding: 35px 20px;
            text-align: center;
            color: #748094;
            line-height: 1.6;
        }

        .error-message {
            color: #b42318;
        }

        .footer {
            text-align: center;
            color: #8490a2;
            font-size: 12px;
            padding: 25px 15px;
        }

        @media (max-width: 600px) {
            .navbar {
                padding: 17px 5%;
            }

            .navbar h2 {
                font-size: 18px;
            }

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .page-heading h1 {
                font-size: 25px;
            }

            .table-heading {
                padding: 17px;
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
        <h1>All Reported Items</h1>
        <p>Browse lost and found items reported by portal users.</p>
    </div>

    <div class="table-card">

        <div class="table-heading">
            <h3>Reported Items Directory</h3>
        </div>

        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Type</th>
                        <th>Location</th>
                        <th>Status</th>
                        <th>Reported At</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    String sql =
                        "SELECT i.item_id, i.item_name, i.description, " +
                        "c.category_name, i.item_type, i.location, " +
                        "i.item_status, i.reported_at " +
                        "FROM items i " +
                        "JOIN categories c ON i.category_id = c.category_id " +
                        "ORDER BY i.reported_at DESC";

                    try (Connection con = DBConnection.getConnection();
                         PreparedStatement ps = con.prepareStatement(sql);
                         ResultSet rs = ps.executeQuery()) {

                        boolean hasItems = false;

                        while (rs.next()) {
                            hasItems = true;

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
                            <%= escapeHtml(rs.getString("description")) %>
                        </td>

                        <td>
                            <%= escapeHtml(rs.getString("category_name")) %>
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

                        if (!hasItems) {
                %>
                    <tr>
                        <td colspan="8" class="empty-message">
                            No items have been reported yet.
                        </td>
                    </tr>
                <%
                        }

                    } catch (SQLException e) {
                        application.log("Unable to load reported items", e);
                %>
                    <tr>
                        <td colspan="8" class="error-message">
                            Unable to load items. Please check the server log.
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
