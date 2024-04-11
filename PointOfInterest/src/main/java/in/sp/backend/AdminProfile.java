package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns="/adminProfile")
public class AdminProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        String userName = (String) session.getAttribute("session_name");

        if (userName != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterest", "root", "9787");

                PreparedStatement ps = con.prepareStatement("select * from adminregisteration where name=?");
                ps.setString(1, userName);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // Fetching data from the result set
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    // Add more fields as needed

                    // Display the data
                    out.println("<h1>Welcome, " + name + "!</h1>");
                    out.println("<p>Email: " + email + "</p>");
                    // Display more fields as needed

                } else {
                    out.println("<h2>User not found</h2>");
                }

                con.close();

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<h2 style='color:red'>Exception Occurred: " + e.getMessage() + "</h2>");
            }
        } else {
            out.println("<h2 style='color:red'>Session not found</h2>");
            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
            rd.include(req, resp);
        }
    }
}
