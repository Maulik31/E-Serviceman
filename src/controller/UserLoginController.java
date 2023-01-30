package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClientOperation;
import DAO.UserOperation;
import Model.City;
import Model.Client;
import Model.ServiceData;
import Model.ServiceRequest;
import Model.User;
import util.CreateConnection;

@WebServlet("/ulogin")
public class UserLoginController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		String email=req.getParameter("email");
		String pass=req.getParameter("password");
		
		User user=new User();
		user.setEmail(email);
		user.setPassword(pass);
		
		UserOperation uo=new UserOperation();
		boolean b = uo.checkUserLogin(user);
		List<ServiceRequest> seq= uo.getAllOrdersById(email);
		
		CreateConnection con=new CreateConnection();
		Connection cn=con.DoConnection();
		RequestDispatcher rd;
		if(b)
		{
			HttpSession session = req.getSession();
			session.setAttribute("user", email);
			User ud = uo.getUserDataById(email);
			req.setAttribute("data", ud);
			req.setAttribute("msg2", email);
			req.setAttribute("servicedata", seq);
			rd=req.getRequestDispatcher("UserData.jsp");
			rd.forward(req, resp);
		}
		else
		{
			HttpSession session = req.getSession(false);
			if(session != null)
			{
				User ud = uo.getUserDataById((String)session.getAttribute("user"));
				/*List<ServiceRequest> seq= uo.getAllOrders(ud.getUserid());*/
				req.setAttribute("data", ud);
				req.setAttribute("msg2", email);
				req.setAttribute("servicedata", seq);
				rd=req.getRequestDispatcher("UserData.jsp");
				rd.forward(req, resp);
			}
			
			req.setAttribute("msg3", "Invalid Credential");
			rd=req.getRequestDispatcher("userLogin.jsp");
			rd.forward(req, resp);
		}
	
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		ClientOperation cp = new ClientOperation();
		
		List<City> c1 =  cp.getAllCity();
		/*List<ServiceData> s =  cp.getAllServices();*/
		
		req.setAttribute("city", c1);
		
		
		/*req.setAttribute("service", s);*/
		req.getRequestDispatcher("UserRegistration.jsp").forward(req, resp);
	}
	
}
