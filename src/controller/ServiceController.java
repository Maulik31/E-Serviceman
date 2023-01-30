package controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Alloprations;
import DAO.ClientOperation;
import Model.Client;
import Model.ServiceData;

@WebServlet("/ServiceController")
public class ServiceController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		int id = Integer.parseInt(req.getParameter("sid"));
		
		Alloprations op = new Alloprations();
		ServiceData sdata = op.getDataById(id);
		
		ClientOperation cp = new ClientOperation();
		List<Client> cdata = cp.getClientByServiceId(id);
		
		req.setAttribute("cdata", cdata);
		req.setAttribute("sdata", sdata);
		req.getRequestDispatcher("services.jsp").forward(req, resp);
		
	}
}
