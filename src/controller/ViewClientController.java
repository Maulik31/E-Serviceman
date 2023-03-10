package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAO.ClientOperation;
import Model.Client;

@WebServlet("/ViewClientController")
@MultipartConfig
public class ViewClientController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		ClientOperation op = new ClientOperation();
		ArrayList<Client> al =  op.getAllClient();
		
		req.setAttribute("clientData", al);
		RequestDispatcher rd = req.getRequestDispatcher("admin_viewclient.jsp");
		rd.forward(req, resp);
	}
}
