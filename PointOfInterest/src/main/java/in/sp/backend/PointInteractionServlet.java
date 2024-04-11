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

@WebServlet(urlPatterns = "/pointInteraction")
public class PointInteractionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        int pointId = Integer.parseInt(req.getParameter("pointId"));

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");

            if ("like".equals(action)) {
                if (pointId > 0) {
                    // Update the database to record the Like for the specified pointId
                    PreparedStatement ps = con.prepareStatement("UPDATE PointOfInterest SET likes = likes + 1 WHERE id = ?");
                    ps.setInt(1, pointId);

                    int rowsUpdated = ps.executeUpdate();

                    if (rowsUpdated > 0) {
                        out.print("Liked Point ID: " + pointId);
                    } else {
                        out.print("Failed to Like Point ID: " + pointId);
                    }
                } else {
                    out.print("Invalid Point ID");
                }
            } else if ("comment".equals(action)) {
                if (pointId > 0) {
                    String commentText = req.getParameter("comment");

                    if (commentText != null && !commentText.isEmpty()) {
                        // Insert the comment into the Comments table
                        PreparedStatement commentPs = con.prepareStatement("INSERT INTO Comments (point_id, comment) VALUES (?, ?)");
                        commentPs.setInt(1, pointId);
                        commentPs.setString(2, commentText);

                        int rowsInserted = commentPs.executeUpdate();

                        if (rowsInserted > 0) {
                            out.print("Commented on Point ID: " + pointId + " Comment: " + commentText);
                        } else {
                            out.print("Failed to add comment for Point ID: " + pointId);
                        }
                    } else {
                        out.print("Comment cannot be empty");
                    }
                } else {
                    out.print("Invalid Point ID");
                }
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.print("Error: " + e.getMessage());
        }
    }
}
