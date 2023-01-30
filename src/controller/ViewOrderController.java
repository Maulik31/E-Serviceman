package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Alloprations;
import Model.ServiceRequest;

@WebServlet("/ViewOrderController")
public class ViewOrderController extends HttpServlet
{
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
     {
    	Alloprations allop=new Alloprations();
    	
    	ArrayList<ServiceRequest> al=allop.getAllorders();
    	req.setAttribute("orders", al);
    	req.getRequestDispatcher("ViewOrder.jsp").forward(req, resp);
    	
     }
}
