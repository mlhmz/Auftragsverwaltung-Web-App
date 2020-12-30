package xyz.mlhmz;

import xyz.mlhmz.Database.sqlUserData;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/createUser")
public class createUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Get Credentials from HTTP Post Request
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        int rank = -1;
        String rankStr = req.getParameter("rang");
        switch(rankStr) {
            case ("reading"):
                rank = 0;
                break;
            case("managing"):
                rank = 1;
                break;
            case("admin"):
                rank = 2;
                break;
            default:
                break;
        }



        sqlUserData.create(username, password, fullname, rank, email);
        PrintWriter writer = res.getWriter();
        writer.println("<p class='message'>Nutzer erfolgreich erstellt!</p>");
        RequestDispatcher view = req.getRequestDispatcher("/apps/admin.jsp");
        view.include(req, res);




    }
}
