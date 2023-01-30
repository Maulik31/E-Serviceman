package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAO.ClientOperation;
import DAO.UserOperation;
import Model.Client;
import Model.User;

@WebServlet("/ureg")
@MultipartConfig
public class UserRegistration extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String path = "C:\\Users\\Maulik\\eclipse-workspace\\E-Services\\WebContent\\img\\user\\";
		Part uimage=req.getPart("uimage");
		
		String name=req.getParameter("fname");
		String address=req.getParameter("address");
		int ctid= Integer.parseInt(req.getParameter("city")) ;
		String zip=req.getParameter("zip");
		String phone=req.getParameter("phone");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		System.out.println(ctid);
		String filename = Paths.get(uimage.getSubmittedFileName()).getFileName().toString();

		 FileOutputStream fs = new FileOutputStream(new File(path+File.separator+filename));
		 
		 InputStream fileContent = uimage.getInputStream();
		 
		 int count=0;
		 byte[] bytes = new byte[1024];
		 
		 while((count = fileContent.read(bytes)) != -1)
		 {
			 fs.write(bytes,0,count);
		 }
		
		
		User u1=new User();
		u1.setName(name);
		u1.setAddress(address);
		u1.setPassword(password);
		u1.setCtid(ctid);
		u1.setZip(zip);
		u1.setPhone(phone);
		u1.setEmail(email);
		u1.setUimage(filename);
	
		
		UserOperation uo=new UserOperation();
		
		int i = uo.adduser(u1);
		
		
		if(i>0)
		{
			req.setAttribute("msg", "Registration Successfull");
			RequestDispatcher rq=req.getRequestDispatcher("userLogin.jsp");
			rq.forward(req, resp);
		}
		
	}
}
