package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ClientOperation;
import DAO.UserOperation;
import Model.City;
import Model.Client;
import Model.ServiceData;
import Model.User;

@WebServlet("/userupdate")
public class UserUpdateController extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String action =req.getParameter("action");
		String email =req.getParameter("email");
		
		UserOperation uop=new UserOperation();
		List<City> ct =  uop.getAllCity();
		req.setAttribute("city1",ct);
		
		User u=new User();
		u=uop.getUserDataById(email);
		req.setAttribute("udata", u);
		req.getRequestDispatcher("UserData.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email =req.getParameter("emailid");
		String name=req.getParameter("fname");
		String address=req.getParameter("address");
		String city= req.getParameter("city");
	/*	int ctid = Integer.parseInt("city");*/
		String zip=req.getParameter("zip");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
		
		
		User usr=new User();
		usr.setEmail(email);
		usr.setName(name);
		usr.setAddress(address);
		usr.setCity(city);
		usr.setZip(zip);
		usr.setPhone(phone);
		usr.setPassword(password);
		
		
		
		UserOperation uop= new UserOperation();
		 
		int i=uop.UpdateUserData(usr);
		
		if(i>0)
		{
			req.setAttribute("msg", "Request Submitted to Admin");
			req.getRequestDispatcher("ulogin").forward(req, resp);
			System.out.println("data altred..");
		}
		else
		{
			
		}
		
	}	

	
}
