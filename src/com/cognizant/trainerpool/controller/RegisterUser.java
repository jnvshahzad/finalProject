package com.cognizant.trainerpool.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cognizant.trainerpool.dao.RequestorDaoImpl;
import com.cognizant.trainerpool.dao.SMEDaoImpl;
import com.cognizant.trainerpool.dao.TrainerDaoImpl;
import com.cognizant.trainerpool.model.Requestor;
import com.cognizant.trainerpool.model.Trainer;
import com.cognizant.trainerpool.model.User;

@WebServlet("/Register")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterUser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userRole = request.getParameter("role");
		
		User user = null;

		RequestDispatcher requestDispatcher = null;
		if (userRole.equals("SME")) {
			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			int age = Integer.parseInt(request.getParameter("age"));
			long contactNumber = Long.parseLong(request.getParameter("contactNumber"));
			String gender = request.getParameter("gender");
			String addLine1 = request.getParameter("addLine1");
			String addLine2 = request.getParameter("addLine2");
			String city = request.getParameter("city");
			String address = addLine1 + "% " + addLine2 + "% " + city;
			int userId = Integer.parseInt(request.getParameter("userId"));
			String password = request.getParameter("password");

			user = new User(userId, firstName, lastName, age, gender, contactNumber, address,
					password);
			Trainer sme = new Trainer(user);

			SMEDaoImpl smeDaoImpl = new SMEDaoImpl();

			if (smeDaoImpl.checkSME(userId)) {
				request.setAttribute("userExists", true);
				requestDispatcher = request.getRequestDispatcher("register.jsp");
				requestDispatcher.forward(request, response);
			} else if (smeDaoImpl.addSME(sme)) {
//				System.out.println("success");
				request.setAttribute("userId", userId);
				request.setAttribute("signUpSuccess", true);
				requestDispatcher = request.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(request, response);
			} else {
				request.setAttribute("errorInsert", true);
				requestDispatcher = request.getRequestDispatcher("register.jsp");
				requestDispatcher.forward(request, response);
			}
		} else if (userRole.equals("Trainer")) {
			String firstName2, lastName2, gender2, addLine12, addLine22, city2, address2, password2;
			int age2, userId2;
			long contactNumber2;
			
			firstName2 = request.getParameter("firstName2");
			lastName2 = request.getParameter("lastName2");
			age2 = Integer.parseInt(request.getParameter("age2"));
			contactNumber2 = Long.parseLong(request.getParameter("contactNumber2"));
			gender2 = request.getParameter("gender2");
			addLine12 = request.getParameter("addLine12");
			addLine22 = request.getParameter("addLine22");
			city2 = request.getParameter("city2");
			address2 = addLine12 + "% " + addLine22 + "% " + city2;
			userId2 = Integer.parseInt(request.getParameter("userId2"));
			password2 = request.getParameter("password2");
			
			user = new User(userId2, firstName2, lastName2, age2, gender2, contactNumber2, address2,
				password2);
			
			Trainer trainer = new Trainer(user);

			TrainerDaoImpl trainerDaoImpl = new TrainerDaoImpl();
			
			if(trainerDaoImpl.checkTrainer(userId2)) {
				request.setAttribute("userExists", true);
				requestDispatcher = request.getRequestDispatcher("register.jsp");
				requestDispatcher.forward(request, response);
			} else if (trainerDaoImpl.addTrainer(trainer)) {
				request.setAttribute("userId", userId2);
				request.setAttribute("signUpSuccess", true);
				requestDispatcher = request.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(request, response);
			} else {
				request.setAttribute("errorInsert", true);
				requestDispatcher = request.getRequestDispatcher("register.jsp");
				requestDispatcher.forward(request, response);
			}
		} else if (userRole.equals("Requestor")) {
			String firstName3, lastName3, gender3, addLine13, addLine23, city3, address3, password3;
			int age3, userId3;
			long contactNumber3;
			
			firstName3 = request.getParameter("firstName3");
			lastName3 = request.getParameter("lastName3");
			age3 = Integer.parseInt(request.getParameter("age3"));
			contactNumber3 = Long.parseLong(request.getParameter("contactNumber3"));
			gender3 = request.getParameter("gender3");
			addLine13 = request.getParameter("addLine13");
			addLine23 = request.getParameter("addLine23");
			city3 = request.getParameter("city3");
			address3 = addLine13 + "% " + addLine23 + "% " + city3;
			userId3 = Integer.parseInt(request.getParameter("userId3"));
			password3 = request.getParameter("password3");
			
			user = new User(userId3, firstName3, lastName3, age3, gender3, contactNumber3, address3,
				password3);
			
			Requestor requestor = new Requestor(user);
			
			RequestorDaoImpl requestorDaoImpl = new RequestorDaoImpl();
			
			if(requestorDaoImpl.checkRequestor(userId3)) {
				request.setAttribute("userExists", true);
				requestDispatcher = request.getRequestDispatcher("register.jsp");
				requestDispatcher.forward(request, response);
			} else if(requestorDaoImpl.addRequestor(requestor)) {
				request.setAttribute("userId", userId3);
				request.setAttribute("signUpSuccess", true);
				requestDispatcher = request.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(request, response);
			} else {
				request.setAttribute("errorInsert", true);
				requestDispatcher = request.getRequestDispatcher("register.jsp");
				requestDispatcher.forward(request, response);
			}
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
