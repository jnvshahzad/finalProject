package com.cognizant.trainerpool.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.trainerpool.dao.TrainerDao;
import com.cognizant.trainerpool.dao.TrainerDaoImpl;

/**
 * Servlet implementation class TrainerController
 */
@WebServlet("/TrainerController")
public class TrainerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		TrainerDao trainerDao = null;
		HttpSession httpSession = request.getSession(false);
		
		if(request.getParameter("action").equals("viewRequests")) {
			trainerDao = new TrainerDaoImpl();
			RequestDispatcher rd = request.getRequestDispatcher("trainer.jsp");
			request.setAttribute("listRequest", trainerDao.showRequest((Integer)httpSession.getAttribute("userId")));
			request.setAttribute("viewRequest",true);
			rd.forward(request, response);
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
