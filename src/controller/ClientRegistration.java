package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAO.Alloprations;
import DAO.ClientOperation;
import Model.City;
import Model.Client;
import Model.ServiceData;

@WebServlet("/creg")
@MultipartConfig
public class ClientRegistration extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		ClientOperation cp = new ClientOperation();
		
		List<City> c =  cp.getAllCity();
		List<ServiceData> s =  cp.getAllServices();
		
		req.setAttribute("city", c);
		
		req.setAttribute("service", s);
		req.getRequestDispatcher("clientRegistration.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String path = "C:\\Users\\Maulik\\eclipse-workspace\\E-Services\\WebContent\\img\\serviceMan\\";
		Part cimage=req.getPart("cimage");
		
		String name=req.getParameter("fname");
		String address=req.getParameter("address");
		int ctid= Integer.parseInt(req.getParameter("city")) ;
		String zip=req.getParameter("zip");
		String phone=req.getParameter("phone");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String company=req.getParameter("company");
		int sid =Integer.parseInt(req.getParameter("service"));
		
		String filename = Paths.get(cimage.getSubmittedFileName()).getFileName().toString();

		 FileOutputStream fs = new FileOutputStream(new File(path+File.separator+filename));
		 
		 InputStream fileContent = cimage.getInputStream();
		 
		 int count=0;
		 byte[] bytes = new byte[1024];
		 
		 while((count = fileContent.read(bytes)) != -1)
		 {
			 fs.write(bytes,0,count);
		 }
		
		
		
		Client cl =new Client();
		cl.setClientName(name);
		cl.setAddress(address);
		cl.setCtid(ctid);
		cl.setZip(zip);
		cl.setClientPhone(phone);
		cl.setClientEmail(email);
		cl.setClientPassword(password);
		cl.setClientCompany(company);
		cl.setSid(sid);
		cl.setClientImage(filename);
	
		
		
		ClientOperation co = new ClientOperation();
		int i = co.addClient(cl);
		
		
		if(i>0)
		{
			req.setAttribute("msg", "Registration Successfull");
			RequestDispatcher rq=req.getRequestDispatcher("clientLogin.jsp");
			rq.forward(req, resp);
		}
		
	}
}
