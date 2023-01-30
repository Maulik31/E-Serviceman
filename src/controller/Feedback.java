package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserOperation;
@WebServlet("/feedback")
public class Feedback extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
	   String fb=req.getParameter("feedback");
	   int srid= Integer.parseInt(req.getParameter("srid")) ;
	   UserOperation op = new UserOperation();
	  int i=op.feedback(srid,fb);
	   
	   if(i>0)
	   {
		   req.setAttribute("msg", "Your feedback is saved");
			req.getRequestDispatcher("ulogin").forward(req, resp);
			System.out.println("data altred..");
	   }
		 
	   
	   
}
}
