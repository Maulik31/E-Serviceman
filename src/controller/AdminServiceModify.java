package controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Alloprations;
import Model.ServiceData;

@WebServlet("/servmodify")
public class AdminServiceModify extends HttpServlet
{
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	   {
		  int id =Integer.parseInt(req.getParameter("id"));
		  String type =req.getParameter("type");
		  
		  if(type.equals("delete"))
		  {
			 // ServiceData sdata= new ServiceData();
			  Alloprations allop = new Alloprations();
			  
			  int i = allop.deleteData(id);
			  
			  if(i>0)
			  {
				  req.getRequestDispatcher("addserv").forward(req, resp);
			  }
		  }
		  
		  else if(type.equals("update"))
		  {
			  ServiceData sdata = new ServiceData();
			  Alloprations ope = new Alloprations();
			  sdata = ope.getDataById(id);
			
			  req.setAttribute("data", sdata);
			  req.getRequestDispatcher("admin_addservices.jsp").forward(req, resp);
		  }
	   }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	    {
    	  
	    }
}
