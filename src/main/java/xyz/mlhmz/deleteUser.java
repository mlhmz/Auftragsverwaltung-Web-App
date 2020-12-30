package xyz.mlhmz;

import xyz.mlhmz.Database.sqlUserData;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/deleteUser")
public class deleteUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (Integer.parseInt(session.getAttribute("rang").toString()) == 2) {
            PrintWriter writer = res.getWriter();
            int uid = Integer.parseInt(req.getParameter("uid"));

            sqlUserData.delete(uid);
            writer.println("<p class='message'>Der Nutzer mit der ID " + uid + " wurde erfolgreich entfernt!</p>");

            RequestDispatcher view = req.getRequestDispatcher("/apps/admin.jsp");
            view.include(req, res);
        } else {
            RequestDispatcher view = req.getRequestDispatcher("/selection");
            view.include(req, res);
        }

    }
}