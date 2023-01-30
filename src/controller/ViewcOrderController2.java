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

@WebServlet("/ViewcOrderController")
public class ViewcOrderController2 extends HttpServlet
{
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
     {
    	Alloprations allop=new Alloprations();
    	
    	ArrayList<ServiceRequest> al=allop.getAllordersc();
    	req.setAttribute("orders", al);
    	req.getRequestDispatcher("ViewcOrder.jsp").forward(req, resp);
    	
     }
}
