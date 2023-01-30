package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserOperation;
@WebServlet("/deleteSreq")
public class UserDeleteService extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.parseInt(req.getParameter("srid"));
		UserOperation op = new UserOperation();
		op.deletereq(id);
		req.getRequestDispatcher("UserData.jsp").forward(req, resp);
	}

}
