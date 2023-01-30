package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userLogout")
public class UserLogoutController extends HttpServlet
{
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
    	 HttpSession session = req.getSession(false);
    	 session.invalidate();
    	 
    	 req.setAttribute("msg4", "logout successfully");
    	 RequestDispatcher rd =req.getRequestDispatcher("userLogin.jsp");
    	 rd.forward(req, resp);
    }
}
