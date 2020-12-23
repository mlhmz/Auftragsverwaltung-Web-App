package xyz.mlhmz;

import xyz.mlhmz.Database.Database;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/login")
public class login extends HttpServlet {
    public static HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // Set Response to no cache storing
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.

        // Get Username and Password from Form
        String username = request.getParameter("un");
        String password = request.getParameter("pw");

        User u = sqlUserData.get(username, password);

        PrintWriter writer = response.getWriter();

        if (u != null) {
            session = request.getSession();
            session.setAttribute("username", u.getUsername());
            session.setAttribute("password", u.getPassword());
            session.setAttribute("uid", u.getUid());
            session.setAttribute("name", u.getName());
            session.setAttribute("rang", u.getRang());
            session.setAttribute("loggedon", true);

            System.out.println(new Date() + " [Auth] Der Nutzer " + u.getUsername() + " wurde erfolgreich authenfiziert!");

            response.sendRedirect(request.getContextPath() + "/selection");
        } else {
            writer.println("<p class='error'>Falscher Nutzername oder Passwort</p>");

            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.include(request, response);
        }

        writer.close();



    }



}
