package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClientOperation;
import Model.Client;
@WebServlet("/cotp")
public class ClientOtpValidation extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		HttpSession session = req.getSession(false);
		int otp = (int) session.getAttribute("otp");
		int id=Integer.parseInt(req.getParameter("id"));
		int id2=Integer.parseInt(req.getParameter("id2"));
		
		int userOtp = Integer.parseInt(req.getParameter("otp"));
		
		if(otp == userOtp)
		{
			ClientOperation op = new ClientOperation();
			
			
			int j=  op.serviceDone(id,id2);
		
		
			
			if(j>0)
			{
				
				
				req.setAttribute("msg","Service Completed");
				
				/*req.setAttribute("service", s);*/
				req.getRequestDispatcher("login").forward(req, resp);
			}
			
		}
		
		else
		{
			req.setAttribute("msg", "Enter valid OTP");
			req.getRequestDispatcher("otpverification.jsp").forward(req, resp);
		}
	}
}
