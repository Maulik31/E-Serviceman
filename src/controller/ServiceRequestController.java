package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Alloprations;
import DAO.ClientOperation;
import Model.City;
import Model.Client;
import Model.ServiceData;
import Model.ServiceRequest;
@WebServlet("/sreq")
	public class ServiceRequestController extends HttpServlet
	{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
		{
			int serviceid=Integer.parseInt(req.getParameter("serviceid"));
			
			ClientOperation cp = new ClientOperation();
			
			List<City> c =  cp.getAllCity();
			List<ServiceData> s =  cp.getAllServicesById(serviceid);
			
			req.setAttribute("city", c);
			
			req.setAttribute("service", s);
			req.getRequestDispatcher("orderdetails.jsp").forward(req, resp);
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
		{
			
			
			
			long millis=System.currentTimeMillis();
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
			String time = formatter.format(millis);
		   
		    
			String servicereq=req.getParameter("servicereq");
			String name=req.getParameter("fname");
			String address=req.getParameter("address");
			String city= req.getParameter("city");
			int ctid = Integer.parseInt(city);
			String zip=req.getParameter("zip");
			String phone=req.getParameter("phone");
			String email=req.getParameter("email");
			String problem=req.getParameter("problem");
			
			ServiceRequest sreq=new ServiceRequest();
			sreq.setSrid(Integer.parseInt(servicereq));
			sreq.setUserName(name);
			sreq.setUserAddress(address);
			sreq.setCtid(ctid);
			sreq.setUserZip(zip);
			sreq.setUserPhone(phone);
			sreq.setUserEmail(email);
			sreq.setServiceDescription(problem);
			sreq.setSstatus(false);
			sreq.setFeedback("");
			sreq.setDate(time);
			
				
				Random r =new Random();
				int otp = r.nextInt(10000);
				
				
				HttpSession session = req.getSession();	
				
				session.setAttribute("cdata", sreq);
				session.setAttribute("otp", otp);
				
				ClientOperation op = new ClientOperation();
				op.sendSms(phone, otp);
				req.setAttribute("phone", sreq.getUserPhone());
				req.setAttribute("otp",otp);
				req.getRequestDispatcher("otpverification.jsp").forward(req, resp);
				
				
				}
				
			

			
			
			
			
			/*Alloprations sdao=new Alloprations();
			int i=sdao.addUserRequest(sreq);
			if(i>0)
			{
				req.setAttribute("msg5","Request Submitted..");
				
				req.setAttribute("service", s);
				req.getRequestDispatcher("orderdetails.jsp").forward(req, resp);;
			}*/
			
		}
		
	
