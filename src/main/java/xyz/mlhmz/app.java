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

@WebServlet("/app")
public class app extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, NullPointerException {

        res.setContentType("text/html");

        HttpSession session = req.getSession();

        String value = req.getParameter("appSelector");

        switch(value){
            case("admin"):
                if ((int) session.getAttribute("rang") > 1) {
                    RequestDispatcher view = req.getRequestDispatcher("/apps/admin.jsp");
                    view.include(req, res);
                }
                break;
            case("data"):
                if ((int) session.getAttribute("rang") > 0) {
                    RequestDispatcher view = req.getRequestDispatcher("/apps/data.jsp");
                    view.include(req, res);
                }
                break;
            case("creation"):
                if ((int) session.getAttribute("rang") > 0) {
                    RequestDispatcher view = req.getRequestDispatcher("/apps/creation.jsp");
                    view.include(req, res);
                }
                break;
            case("list"):
                if ((int) session.getAttribute("rang") >= 0) {
                    RequestDispatcher view = req.getRequestDispatcher("/apps/list.jsp");
                    view.include(req, res);
                }
                break;

        }



    }
}
