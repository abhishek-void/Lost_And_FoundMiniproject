
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

@WebServlet("/ClaimServlet")
public class ClaimServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String itemIdValue = request.getParameter("itemId");
        String claimDetails = request.getParameter("claimDetails");

        if (itemIdValue == null || claimDetails == null
                || itemIdValue.trim().isEmpty()
                || claimDetails.trim().isEmpty()) {
            response.getWriter().println("Please enter item ID and claim details.");
            return;
        }

        int itemId;

        try {
            itemId = Integer.parseInt(itemIdValue.trim());
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid item ID.");
            return;
        }

        int claimantId = (Integer) session.getAttribute("userId");

        String sql = "INSERT INTO claims "
                   + "(item_id, claimant_id, claim_details) "
                   + "SELECT i.item_id, ?, ? FROM items i "
                   + "WHERE i.item_id = ? AND i.user_id <> ? "
                   + "AND i.item_status = 'OPEN'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, claimantId);
            ps.setString(2, claimDetails.trim());
            ps.setInt(3, itemId);
            ps.setInt(4, claimantId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect(
                    request.getContextPath() + "/claims.jsp?submitted=success");
            } else {
                response.getWriter().println(
                    "Claim not submitted. Check the item ID, item status, "
                    + "or make sure you are not claiming your own item.");
            }

        } catch (SQLException e) {
            getServletContext().log("Claim submission failed", e);
            response.sendError(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "Database error. Check the Eclipse Console.");
        }
    }
}
