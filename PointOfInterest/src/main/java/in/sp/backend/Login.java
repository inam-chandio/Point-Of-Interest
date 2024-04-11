package in.sp.backend;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import java.sql.DriverManager;
import java.sql.* ; 

@WebServlet(urlPatterns="/loginForm")
public class Login  extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-ge	super.doPost(req, resp);
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String myname=req.getParameter("name1");
		String mypass=req.getParameter("pass1");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");
			PreparedStatement ps=con.prepareStatement("select * from register where name=? and password=?");  
			ps.setString(1, myname);
			ps.setString(2, mypass);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				
				HttpSession session= req.getSession();
				session.setAttribute("session_name", rs.getString("name"));
				
				RequestDispatcher rd=req.getRequestDispatcher("/profile.jsp");
				rd.include(req, resp);
			}else {
			
				out.print("<h2 style= 'color:red'>SORRY! UserName and Password did not Matched </h2>");
				
				RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
				rd.include(req, resp);
			}
			
		
			
		}catch(Exception e) 
		{
			e.printStackTrace();
			
			out.print("<h2 style= 'color:red'> Exception Occured "+e.getMessage()+"  </h2>");
			
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
		
		}
	}

		
		
	}

