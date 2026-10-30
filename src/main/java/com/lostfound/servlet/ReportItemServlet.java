
package com.lostfound.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.lostfound.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ReportItemServlet")
public class ReportItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp");
            return;
        }

        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String itemType = request.getParameter("itemType");
        String categoryValue = request.getParameter("categoryId");

        if (itemName == null || itemName.trim().isEmpty()
                || location == null || location.trim().isEmpty()
                || categoryValue == null
                || !("LOST".equals(itemType) || "FOUND".equals(itemType))) {
            response.getWriter().println("Please fill all required fields correctly.");
            return;
        }

        int categoryId;

        try {
            categoryId = Integer.parseInt(categoryValue);
        } catch (NumberFormatException e) {
            response.getWriter().println("Please select a valid category.");
            return;
        }

        String sql = "INSERT INTO items "
                + "(user_id, category_id, item_name, description, "
                + "location, item_type) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, (Integer) session.getAttribute("userId"));
            ps.setInt(2, categoryId);
            ps.setString(3, itemName.trim());
            ps.setString(4, description);
            ps.setString(5, location.trim());
            ps.setString(6, itemType);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect(
                    request.getContextPath() + "/dashboard.jsp?reported=success");
            } else {
                response.getWriter().println("Item report failed.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "Database error. Check Eclipse Console.");
        }
    }
}
