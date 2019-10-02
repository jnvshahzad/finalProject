package com.cognizant.trainerpool.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.trainerpool.constants.QueryConstants;
import com.cognizant.trainerpool.util.DBUtil;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String password = request.getParameter("password");

		Connection connection = DBUtil.getConnection();
		try {
			PreparedStatement statementLogin = connection.prepareStatement(QueryConstants.SELECT_USER);
			statementLogin.setInt(1, userId);
			statementLogin.setString(2, password);

			System.out.println(userId + "  " + password);

			/*
			 * ResultSet resultLogin = statementLogin.executeQuery(); int count = 0;
			 * 
			 * while (resultLogin.next()) { if (resultLogin.getInt(3) == 100001) {
			 * HttpSession session = request.getSession(); session.setAttribute("userId",
			 * userId); response.sendRedirect("admin.jsp"); } else if (resultLogin.getInt(3)
			 * == 100002) { HttpSession session = request.getSession();
			 * session.setAttribute("userId", userId); response.sendRedirect("sme.jsp"); }
			 * else if (resultLogin.getInt(3) == 100003) { HttpSession session =
			 * request.getSession(); session.setAttribute("userId", userId);
			 * response.sendRedirect("trainer.jsp"); } else if (resultLogin.getInt(3) ==
			 * 100004) { HttpSession session = request.getSession();
			 * session.setAttribute("userId", userId);
			 * response.sendRedirect("requestor.jsp"); } // System.out.println("success");
			 * count++; return; } if (count == 0) { request.setAttribute("noUser", true);
			 * RequestDispatcher requestDispatcher =
			 * request.getRequestDispatcher("login.jsp"); requestDispatcher.forward(request,
			 * response); }
			 */

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
