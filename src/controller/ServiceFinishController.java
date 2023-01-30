package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClientOperation;

@WebServlet("/finished")
public class ServiceFinishController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int id=Integer.parseInt(req.getParameter("id"));
		int id2=Integer.parseInt(req.getParameter("id2"));
		String phoneno=req.getParameter("phon");
		Random r =new Random();
		int otp = r.nextInt(10000);
		
		HttpSession session = req.getSession();			
		session.setAttribute("otp", otp);

		ClientOperation op = new ClientOperation();
		op.sendSms(phoneno, otp);
		req.setAttribute("clientid", id);
		req.setAttribute("serviceid", id2);
        req.setAttribute("phone",phoneno);
        req.setAttribute("otp",otp);
		req.getRequestDispatcher("serviceCompleteVerification.jsp").forward(req, resp);
	}
}
