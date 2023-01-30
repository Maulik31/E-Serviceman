package controller;
import java.io.File;
import java.io.FileInputStream;
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
import Model.ServiceData;

@WebServlet("/addserv")
@MultipartConfig
public class AddServiceController extends HttpServlet
{
 
 	@Override
 		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
 		{
 		
 			Alloprations allopp = new Alloprations();
 			List<ServiceData> serv = allopp.getAllservice();
 			req.setAttribute("service", serv);
 			req.getRequestDispatcher("admin_addservices.jsp").forward(req, resp);
 		}
 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		String ac=req.getParameter("action");
		if(ac.equals("submit"))
		{
			String path = "C:\\Users\\Maulik\\eclipse-workspace\\E-Services\\WebContent\\img\\service\\";
			String sname=req.getParameter("sname");
			String sdetails=req.getParameter("sdetails");
			Part simage = req.getPart("simage");
			String filename =Paths.get(simage.getSubmittedFileName()).getFileName().toString();
			 FileOutputStream fs = new FileOutputStream(new File(path+File.separator+filename));
			 InputStream fileContent = simage.getInputStream();
			 int count=0;
			 byte[] bytes = new byte[1024];
			 while((count = fileContent.read(bytes)) != -1)
			 {
				 fs.write(bytes,0,count);
			 }
			 
			 
			 ServiceData s1=new ServiceData();
			 s1.setSname(sname);
			 s1.setSdetails(sdetails);
			 s1.setSimage(filename);
			 Alloprations all=new Alloprations();
			 int j=all.addservice(s1);
			 
			 RequestDispatcher rd;
			 if(j>0)
			 {
				 req.setAttribute("msg", "Service Added into Database");
				 doGet(req, resp);
			 }
			 else
			 {
				req.setAttribute("msg", "Failed..Try Again");
				rd=req.getRequestDispatcher("admin_addservices.jsp");
				rd.forward(req, resp);
			 }
		}
		else if (ac.equals("update"))
		{
				int sid = Integer.parseInt(req.getParameter("sid"));
				String path = "C:\\Users\\HP\\eclipse-workspace\\E-Services\\WebContent\\img\\service";
			 String sname=req.getParameter("sname");
			 String sdetails=req.getParameter("sdetails");
			 Part simage = req.getPart("simage");
			 String filename =Paths.get(simage.getSubmittedFileName()).getFileName().toString();
			 
			 FileOutputStream fs = new FileOutputStream(new File(path+File.separator+filename));
			 
			 InputStream fileContent = simage.getInputStream();
			 
			 System.out.println(sid+" "+sname+" "+sdetails+" "+filename);
			 
			 int count=0;
			 byte[] bytes = new byte[1024];
			 
			 while((count = fileContent.read(bytes)) != -1)
			 {
				 fs.write(bytes,0,count);
			 }
			 
			 
			 ServiceData s1=new ServiceData();
			 
			 
			 s1.setSid(sid);
			 s1.setSname(sname);
			 s1.setSdetails(sdetails);
			 s1.setSimage(filename);
			 Alloprations all=new Alloprations();
			 
			 int j=all.updateService(s1);
			 
			 RequestDispatcher rd;
			 if(j>0)
				 {
				 req.setAttribute("msg", "Service update into Database");
				 doGet(req, resp);
				 }
				 else
				 {
				req.setAttribute("msg", "Failed..Try Again");
				 doGet(req, resp);
				 }
		}
	}
}