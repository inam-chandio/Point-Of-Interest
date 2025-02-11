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

@WebServlet(urlPatterns = "/regForm")
public class Register extends HttpServlet {
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
		{
			PrintWriter out = resp.getWriter();
			String myid=req.getParameter("id1");
			String myname=req.getParameter("name1");
			String myemail=req.getParameter("email1");
			String mypass=req.getParameter("pass1");
			String mygender=req.getParameter("gender1");
			String mycity=req.getParameter("city1");
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");
				//preparedStatement ps = con.prepareStatement("insert into user_register");
				PreparedStatement ps=con.prepareStatement("insert into register values(?,?,?,?,?,?)");  
				ps.setString(1, myid);
				ps.setString(2, myname);
				ps.setString(3, myemail);
				ps.setString(4, mypass);
				ps.setString(5, mygender);
				ps.setString(6, mycity);
			
				int count=ps.executeUpdate();
				if(count>0) {
					resp.setContentType("text/html");
					out.print("<h2 style= 'color:green'> User Registered </h2>");
					
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					rd.include(req, resp);
					
//					RequestDispatcher rd=req.getRequestDispatcher("/profile.jsp");
//					rd.include(req, resp);
				
				}else {
					resp.setContentType("text/html");
					out.print("<h2 style= 'color:red'> User Not Registered </h2>");
					
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