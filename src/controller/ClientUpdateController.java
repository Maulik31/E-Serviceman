package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.ClientOperation;
import Model.City;
import Model.Client;
import Model.ServiceData;

@WebServlet("/update")
public class ClientUpdateController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String action =req.getParameter("action");
		String email =req.getParameter("email");
		
		ClientOperation cop = new ClientOperation();
		
		List<City> ct =  cop.getAllCity();
		List<ServiceData> s =  cop.getAllServices();
		
		
		req.setAttribute("city1", ct);
		
		req.setAttribute("service1", s);
		
	
		Client c =new Client();
		
		c= cop.getDataById(email);
		req.setAttribute("cdata", c);
		req.getRequestDispatcher("clientdata.jsp").forward(req, resp);
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email =req.getParameter("emailid");
		String name=req.getParameter("fname");
		String address=req.getParameter("address");
		String city= req.getParameter("city");
		int ctid = Integer.parseInt(city);
		String zip=req.getParameter("zip");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
		String company=req.getParameter("company");
		String service=req.getParameter("service");
		int sid = Integer.parseInt(service);
		
		Client cu =new Client();
		cu.setClientEmail(email);
		cu.setClientName(name);
		cu.setAddress(address);
		cu.setCtid(ctid);
		cu.setZip(zip);
		cu.setClientPhone(phone);
		cu.setClientPassword(password);
		cu.setClientCompany(company);
		cu.setServiceid(sid);
		
		
		ClientOperation cup=new ClientOperation();
		 
		int i=cup.UpdateClientData(cu);
		
		if(i>0)
		{
			
			req.setAttribute("msg", "Request Submitted to Admin");
			req.getRequestDispatcher("login").forward(req, resp);
			System.out.println("data altred..");
		}
		else
		{
			req.setAttribute("msg", "Update failed");
			req.getRequestDispatcher("UserData.jsp").forward(req, resp);
		}
		
	}	
}
