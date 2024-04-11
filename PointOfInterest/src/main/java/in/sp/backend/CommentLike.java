package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import java.sql.DriverManager;
import java.sql.* ; 

@WebServlet(urlPatterns="/addcom")
public class CommentLike extends HttpServlet {
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
		{PrintWriter out = resp.getWriter();
		String myid=req.getParameter("id1");
		String mycity2=req.getParameter("city2");
		String mylike=req.getParameter("like2");
		String mycomment=req.getParameter("comment2");
		
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");
			//preparedStatement ps = con.prepareStatement("insert into user_register");
			PreparedStatement ps=con.prepareStatement("insert into likepoints values(?,?,?,?)"); 
			ps.setString(1, myid);
			ps.setString(2, mycity2);
			ps.setString(3, mylike);
			ps.setString(4, mycomment);
			
			
		
			int count=ps.executeUpdate();
			if(count>0) {
				resp.setContentType("text/html");
				out.print("<h2 style= 'color:green'> Comment And Like ADDED </h2>");
				
				RequestDispatcher rd=req.getRequestDispatcher("profile.jsp");
				rd.include(req, resp);

			
			}else {
				resp.setContentType("text/html");
				out.print("<h2 style= 'color:red'> Comment OR Like Not ADDED </h2>");
				
				RequestDispatcher rd=req.getRequestDispatcher("profile.jsp");
				rd.include(req, resp);
			
			}
	
			
			
		}catch(Exception e) 
		{
			e.printStackTrace();
			resp.setContentType("text/html");
			out.print("<h2 style= 'color:red'> Exception Occured "+e.getMessage()+"  </h2>");
			
			RequestDispatcher rd=req.getRequestDispatcher("profile.jsp");
			rd.include(req, resp);
		
		}
	}
}