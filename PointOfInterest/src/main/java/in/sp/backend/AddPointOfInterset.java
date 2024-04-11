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

@WebServlet(urlPatterns = "/addpoints")
public class AddPointOfInterset extends HttpServlet {
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
		{
			PrintWriter out = resp.getWriter();
			String mycountry=req.getParameter("country");
			String mystate=req.getParameter("state");
			String mycity=req.getParameter("city");
			
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");
				//preparedStatement ps = con.prepareStatement("insert into user_register");
				PreparedStatement ps=con.prepareStatement("insert into PointOfInterest values(?,?,?)");  
				ps.setString(1, mycountry);
				ps.setString(2, mystate);
				ps.setString(3, mycity);
				
				int count=ps.executeUpdate();
				if(count>0) {
					resp.setContentType("text/html");
					out.print("<h2 style= 'color:green'> RECO Registered </h2>");
					
//					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
//					rd.include(req, resp);
					
//					RequestDispatcher rd=req.getRequestDispatcher("/profile.jsp");
//					rd.include(req, resp);
				
				}else {
					resp.setContentType("text/html");
					out.print("<h2 style= 'color:red'> User Not Registered </h2>");
					
					RequestDispatcher rd=req.getRequestDispatcher("addPointOfInterset.jsp");
					rd.include(req, resp);
				
				}
		
				
				
			}catch(Exception e) 
			{
				e.printStackTrace();
				resp.setContentType("text/html");
				out.print("<h2 style= 'color:red'> Exception Occured "+e.getMessage()+"  </h2>");
				
				RequestDispatcher rd=req.getRequestDispatcher("addPointOfInterset.jsp");
				rd.include(req, resp);
			
			}
		}
}