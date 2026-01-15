package com.naukrisphere.controller;

import com.naukrisphere.dao.AlertDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UnsubscribeAlertServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("userEmail") : null;

        if (email == null) {
            response.sendRedirect("user_login.jsp?alertLogin");
            return;
        }

        AlertDAO dao = new AlertDAO();
        boolean status = dao.unsubscribe(email);

        if (status) {
            response.sendRedirect("HomeServlet?unsubscribed=success");
        } else {
            response.sendRedirect("HomeServlet?unsubscribed=fail");
        }
    }
}
