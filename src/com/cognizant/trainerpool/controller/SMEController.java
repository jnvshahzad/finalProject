package com.cognizant.trainerpool.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.trainerpool.dao.AdminDao;
import com.cognizant.trainerpool.dao.AdminDaoImpl;
import com.cognizant.trainerpool.dao.SMEDao;
import com.cognizant.trainerpool.dao.SMEDaoImpl;
import com.cognizant.trainerpool.model.Skill;

@WebServlet("/SME")
public class SMEController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SMEController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String userId = session.getAttribute("userId").toString();
		String action = request.getParameter("action");

		AdminDao adminDao = new AdminDaoImpl();
		List<Skill> skills = adminDao.showSkills();

		SMEDao smeDao = new SMEDaoImpl();
		session.setAttribute("userId", userId);

		if (action.equals("editSkills")) {
			request.setAttribute("editSkills", true);
			request.setAttribute("skills", skills);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("sme.jsp");
			requestDispatcher.forward(request, response);
		} else if (action.equals("editAvailability")) {
			request.setAttribute("editAvailability", true);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("sme.jsp");
			requestDispatcher.forward(request, response);
		} else if (action.equals("editPassword")) {
			request.setAttribute("editPassword", true);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("sme.jsp");
			requestDispatcher.forward(request, response);
		} else if (action.equals("editPasswordForm")) {
			int user = Integer.parseInt(userId);
			String previousPassword, newPassword;

			previousPassword = request.getParameter("previousPassword");
			newPassword = request.getParameter("newPassword");

			boolean flag = smeDao.changePassword(user, previousPassword, newPassword);

			if (flag) {
				request.setAttribute("passwordChanged", true);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("SME?action=editPassword");
				requestDispatcher.forward(request, response);
			} else {
				request.setAttribute("passwordChanged", false);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("SME?action=editPassword");
				requestDispatcher.forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
