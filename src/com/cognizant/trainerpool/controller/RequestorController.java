package com.cognizant.trainerpool.controller;

import java.io.IOException;
import java.util.Date;
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
import com.cognizant.trainerpool.dao.RequestorDao;
import com.cognizant.trainerpool.dao.RequestorDaoImpl;
import com.cognizant.trainerpool.model.Request;
import com.cognizant.trainerpool.model.Skill;
import com.cognizant.trainerpool.util.DateUtil;

@WebServlet("/Requestor")
public class RequestorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RequestorController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String userId = session.getAttribute("userId").toString();
		String action = request.getParameter("action");

		AdminDao adminDao = new AdminDaoImpl();
		List<Skill> skills = adminDao.showSkills();

		RequestorDao requestorDao = new RequestorDaoImpl();
		session.setAttribute("userId", userId);
		
		if (action.equals("createRequest")) {
			request.setAttribute("skills", skills);
			// System.out.println(skills);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("createRequest.jsp");
			requestDispatcher.forward(request, response);
		} else if (action.equals("createRequestForm")) {
			int requestorId = Integer.parseInt(request.getParameter("requestorId"));
			String requestSubject = request.getParameter("requestSubject");
			Date startDate = DateUtil.convertToDate(request.getParameter("startDate"));
			Date endDate = DateUtil.convertToDate(request.getParameter("endDate"));
			String city = request.getParameter("city");
			int batchSize = Integer.parseInt(request.getParameter("batchSize"));

			// System.out.println(startDate + " " + endDate);
			Request req = new Request(requestorId, requestSubject, startDate, endDate, city,
					batchSize);

			boolean flag = requestorDao.createNewRequest(req);

			if (flag == true) {
				request.setAttribute("requestCreated", true);
				// System.out.println("success");
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("Requestor?action=viewRequests");
				requestDispatcher.forward(request, response);
			} else {
				request.setAttribute("requestCreated", false);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("createRequest.jsp");
				requestDispatcher.forward(request, response);
			}
		} else if (action.equals("viewRequests")) {
			List<Request> requests = requestorDao.viewAllRequests();

			request.setAttribute("requests", requests);
			request.setAttribute("viewRequests", true);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("requestor.jsp");
			requestDispatcher.forward(request, response);
		} else if (action.equals("deleteRequest")) {
			int id = Integer.parseInt(request.getParameter("id"));
			int user = Integer.parseInt(userId);

			boolean flag = requestorDao.deleteRequest(id, user);
			if (flag) {
				request.setAttribute("requestDeleted", true);
				// System.out.println("success");
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("Requestor?action=viewRequests");
				requestDispatcher.forward(request, response);
			} else {
				request.setAttribute("requestDeleted", false);
				// System.out.println("fail");
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("Requestor?action=viewRequests");
				requestDispatcher.forward(request, response);
			}
		} else if (action.equals("editPassword")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("editPassword.jsp");
			requestDispatcher.forward(request, response);
		} else if(action.equals("editPasswordForm")) {
			int user = Integer.parseInt(userId);
			String previousPassword, newPassword;
			
			previousPassword = request.getParameter("previousPassword");
			newPassword = request.getParameter("newPassword");
			
			boolean flag = requestorDao.changePassword(user, previousPassword, newPassword);
			
			if(flag) {
				request.setAttribute("passwordChanged", true);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("Requestor?action=editPassword");
				requestDispatcher.forward(request, response);
			} else {
				request.setAttribute("passwordChanged", false);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("Requestor?action=editPassword");
				requestDispatcher.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
