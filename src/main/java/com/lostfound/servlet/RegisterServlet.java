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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (fullName == null || email == null || password == null
                || fullName.trim().isEmpty()
                || email.trim().isEmpty()
                || password.isEmpty()) {

            response.getWriter().println("Please fill all fields.");
            return;
        }

        String sql = "INSERT INTO users "
                   + "(full_name, email, password_hash) "
                   + "VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, fullName.trim());
            ps.setString(2, email.trim());
            ps.setString(3, password);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp?registered=success"
                );
            } else {
                response.getWriter().println(
                    "Registration failed. Please try again."
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();

            if (e.getErrorCode() == 1) {
                response.getWriter().println(
                    "This email is already registered."
                );
            } else {
                response.getWriter().println(
                    "Database error. Check the Eclipse Console."
                );
            }
        }
    }
}
