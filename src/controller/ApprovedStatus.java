package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ClientOperation;

@WebServlet("/status")
public class ApprovedStatus extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		int id =Integer.parseInt(req.getParameter("cid"));
		String sname = req.getParameter("sname");
		
		if(sname.equals("approve"))
		{
			ClientOperation op = new ClientOperation();
			int i = op.updateStatus(id);
			
			if(i>0)
			{
				RequestDispatcher rd =req.getRequestDispatcher("ViewClientController");
				rd.forward(req, resp);
			}
		}
		else
		{
			ClientOperation opd = new ClientOperation();
			opd.deleteStatus(id);
			RequestDispatcher rd=req.getRequestDispatcher("ViewClientController");
			rd.forward(req, resp);
		}
		
		
	}
}
