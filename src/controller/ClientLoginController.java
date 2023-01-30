package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
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
import Model.City;
import Model.Client;
import Model.ServiceData;
import Model.ServiceRequest;
import util.CreateConnection;


@WebServlet("/login")
public class ClientLoginController extends HttpServlet

{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		

		/*HttpSession session = req.getSession();
		if(session != null)
		{
			RequestDispatcher rd;
			rd=req.getRequestDispatcher("clientdata.jsp");
			rd.forward(req, resp);
		}*/
		
		String email=req.getParameter("email");
		String pass=req.getParameter("password");
		
		System.out.println(email);
		
		Client cl =new Client();
		cl.setClientEmail(email);
		cl.setClientPassword(pass);
		
		
		
		ClientOperation co =new ClientOperation();
		boolean b = co.checkLogin(cl);
		
		
		
		
		CreateConnection con=new CreateConnection();
		Connection cn=con.DoConnection();
		RequestDispatcher rd;
		if(b)
		{
			HttpSession session=req.getSession();
			session.setAttribute("client",email);
			
			Client cd = co.getDataById(email);
			List<ServiceRequest> seq= co.getAllOrders(cd.getCid());
			req.setAttribute("data", cd);
			req.setAttribute("msg2", email);
			req.setAttribute("servicedata", seq);
			rd=req.getRequestDispatcher("clientdata.jsp");
			rd.forward(req, resp);
		}
		else
		{
			HttpSession session = req.getSession(false);
			if(session != null)
			{
				Client cd = co.getDataById((String)session.getAttribute("client"));
				List<ServiceRequest> seq= co.getAllOrders(cd.getCid());
				req.setAttribute("data", cd);
				req.setAttribute("msg2", email);
				req.setAttribute("servicedata", seq);
				rd=req.getRequestDispatcher("clientdata.jsp");
				rd.forward(req, resp);
			}
			
			
			req.setAttribute("msg3", "Invalid");
			rd=req.getRequestDispatcher("clientLogin.jsp");
			rd.forward(req, resp);
		}
		}
		
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		
		ClientOperation cp = new ClientOperation();
		
		List<City> c =  cp.getAllCity();
		List<ServiceData> s =  cp.getAllServices();
		
		req.setAttribute("city", c);
		
		req.setAttribute("service", s);
		req.getRequestDispatcher("clientRegistration.jsp").forward(req, resp);
	}
}
