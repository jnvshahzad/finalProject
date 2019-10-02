package com.cognizant.trainerpool.dao;

import java.util.List;

import com.cognizant.trainerpool.model.Request;
import com.cognizant.trainerpool.model.Requestor;

public interface RequestorDao {
	public boolean checkRequestor(int userId);
	
	public boolean addRequestor(Requestor requestor);
	
	public boolean createNewRequest(Request request);
	
	public List<Request> viewAllRequests();
	
	public boolean deleteRequest(int requestId, int userId);
	
	public boolean changePassword(int userId, String previousPassword, String newPasswword);
}
