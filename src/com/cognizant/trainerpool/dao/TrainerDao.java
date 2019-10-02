package com.cognizant.trainerpool.dao;

import java.util.List;

import com.cognizant.trainerpool.model.Request;
import com.cognizant.trainerpool.model.Trainer;

public interface TrainerDao {
	
	public boolean checkTrainer(int userId);
	
	public boolean addTrainer(Trainer trainer);
	
	// Trainer
	
	public List<Request> showRequest(int trainerId);
	public Boolean updateRequest(int reqId);
	public Boolean insertUserRequest(int trainerId,int reqId);
}
