package xyz.mlhmz;

import xyz.mlhmz.Database.sqlUserData;
import xyz.mlhmz.Objects.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/selection")
public class selection extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        res.setDateHeader("Expires", 0); // Proxies.

        HttpSession session = req.getSession();

        PrintWriter writer = res.getWriter();

        User u;

        try {
            u = sqlUserData.get(session.getAttribute("username").toString(), session.getAttribute("password").toString());
        } catch (NullPointerException e) {
            u = null;
        }
        if (u != null) {
            RequestDispatcher view = req.getRequestDispatcher("navigation.jsp");
            view.include(req, res);
        } else {
            writer.println("<p>Ungueltige Sitzung! Bitte erneut einloggen.</p>");
            RequestDispatcher view = req.getRequestDispatcher("index.jsp");
            view.include(req, res);
        }


    }
}
