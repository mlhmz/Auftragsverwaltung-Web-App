package xyz.mlhmz;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/logout")
public class logout extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        res.setContentType("text/html");

        PrintWriter writer = res.getWriter();

        writer.println("<p>Du wurdest abgemeldet!</p>");

        RequestDispatcher view = req.getRequestDispatcher("index.jsp");
        view.include(req, res);

        HttpSession session = req.getSession();
        session.invalidate();

        writer.close();






    }
}
