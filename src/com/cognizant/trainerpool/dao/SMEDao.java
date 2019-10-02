package com.cognizant.trainerpool.dao;

import com.cognizant.trainerpool.model.Trainer;

public interface SMEDao {
	public boolean checkSME(int userId);

	public boolean addSME(Trainer SME);
	
	public boolean changePassword(int userId, String previousPassword, String newPassword);
}
