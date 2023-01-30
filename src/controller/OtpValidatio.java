package controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Alloprations;
import DAO.ClientOperation;
import Model.Client;
import Model.ServiceRequest;

@WebServlet("/otp")
public class OtpValidatio extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		HttpSession session = req.getSession(false);
		int otp = (int) session.getAttribute("otp");
	
		
		//int status=Integer.parseInt(req.getParameter("id"));
	
		int userOtp = Integer.parseInt(req.getParameter("otp"));
		Alloprations sdao=new Alloprations();
		ServiceRequest serreq=new ServiceRequest();
		serreq=(ServiceRequest) session.getAttribute("cdata");
		if(otp == userOtp)
		{
			ClientOperation op = new ClientOperation();
			
			
			Client c = op.getassgnedClient(serreq.getSrid());
			
			int i=sdao.addUserRequest(serreq,c);
			if(i>0)
			{
				
				req.setAttribute("msg5","Request Submitted..");
				
				/*req.setAttribute("service", s);*/
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
			
		}
		
		else
		{
			req.setAttribute("msg", "Enter valid OTP");
			req.getRequestDispatcher("otpverification.jsp").forward(req, resp);
		}
		}
		
	}

