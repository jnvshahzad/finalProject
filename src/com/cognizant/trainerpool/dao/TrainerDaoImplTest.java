package com.cognizant.trainerpool.dao;

import java.util.List;

import com.cognizant.trainerpool.model.Request;

public class TrainerDaoImplTest {
public static void main(String[] args) {
	TrainerDao trainerDao = new TrainerDaoImpl();
		/*
		 * List<Request> listRequest = trainerDao.showRequest(34565); for(Request
		 * r:listRequest) { System.out.println(r); }
		 */
	
//	System.out.println(trainerDao.updateRequest(500001));
	System.out.println(trainerDao.insertUserRequest(34565, 500001));
}
	
}
