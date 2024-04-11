package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/pointAction")
public class PointActionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String country = req.getParameter("country");
        String updatedValue = req.getParameter("updatedValue");
        String tableName = req.getParameter("tableName");

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");

            if ("delete".equals(action)) {
                // Implement logic to handle Delete
                PreparedStatement ps = con.prepareStatement("DELETE FROM " + tableName + " WHERE country = ?");
                ps.setString(1, country);

                int rowsDeleted = ps.executeUpdate();

                if (rowsDeleted > 0) {
                    out.print("Deleted record with country: " + country);
                } else {
                    out.print("Failed to delete record with country: " + country);
                }
            } else if ("update".equals(action)) {
                // Implement logic to handle Update
                PreparedStatement ps = con.prepareStatement("UPDATE " + tableName + " SET country = ? WHERE country = ?");
                ps.setString(1, updatedValue);
                ps.setString(2, country);

                int rowsUpdated = ps.executeUpdate();

                if (rowsUpdated > 0) {
                    out.print("Updated record with country: " + country + " to: " + updatedValue);
                } else {
                    out.print("Failed to update record with country: " + country);
                }
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.print("Error: " + e.getMessage());
        }
    }
}
