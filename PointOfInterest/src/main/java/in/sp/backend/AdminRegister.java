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

@WebServlet(urlPatterns="/adregForm")
public class AdminRegister extends HttpServlet {
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
		{
			PrintWriter out = resp.getWriter();
			String myname=req.getParameter("name2");
			String myemail=req.getParameter("email2");
			String mypass=req.getParameter("pass2");
			String mygender=req.getParameter("gender2");
			String mycity=req.getParameter("city2");
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");
				//preparedStatement ps = con.prepareStatement("insert into user_register");
				PreparedStatement ps=con.prepareStatement("insert into adminregisteration values(?,?,?,?,?)");  
				ps.setString(1, myname);
				ps.setString(2, myemail);
				ps.setString(3, mypass);
				ps.setString(4, mygender);
				ps.setString(5, mycity);
			//	ps.setString(1, myname);
				int count=ps.executeUpdate();
				if(count>0) {
					resp.setContentType("text/html");
					out.print("<h2 style= 'color:green'> Admin Registered </h2>");
					
					RequestDispatcher rd=req.getRequestDispatcher("adminlogin.jsp");
					rd.include(req, resp);
					
//					RequestDispatcher rd=req.getRequestDispatcher("/profile.jsp");
//					rd.include(req, resp);
				
				}else {
					resp.setContentType("text/html");
					out.print("<h2 style= 'color:red'> Admin Not Registered </h2>");
					
					RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
					rd.include(req, resp);
				
				}
		
				
				
			}catch(Exception e) 
			{
				e.printStackTrace();
				resp.setContentType("text/html");
				out.print("<h2 style= 'color:red'> Exception Occured "+e.getMessage()+"  </h2>");
				
				RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
				rd.include(req, resp);
			
			}
		}
}