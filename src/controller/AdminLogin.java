package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Statement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.CreateConnection;

@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet
	{
	  @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	  
	{
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		CreateConnection con=new CreateConnection();
		Connection cn=con.DoConnection();
		RequestDispatcher rd=null;
		
		try
		{
			Statement st =cn.createStatement();
			ResultSet rs=st.executeQuery("select * from adminlogin where email='"+email+"' and password='"+password+"'");
			if(rs.next())
			{
					HttpSession session = req.getSession();
					session.setAttribute("admin", email);
					rd=req.getRequestDispatcher("admindashboard.jsp");
					rd.forward(req, resp);
					
				}
				else
				{
					req.setAttribute("error", "Invalid Login Credintials");
					rd=req.getRequestDispatcher("adminlogin.jsp");
					rd.forward(req, resp);
				}
			
			
			
		}
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		  
	}
}
