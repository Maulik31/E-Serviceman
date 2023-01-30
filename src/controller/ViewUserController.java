package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserOperation;
import Model.User;

@WebServlet("/ViewUserController")
public class ViewUserController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
	   UserOperation uop=new UserOperation();
	   ArrayList<User> al =  uop.getAllUser();
	   
	    req.setAttribute("UserData", al);
		RequestDispatcher rd = req.getRequestDispatcher("ViewUser.jsp");
		rd.forward(req, resp);
	}
	
}
