package com.cognizant.trainerpool.bo;

import com.cognizant.trainerpool.dao.SMEDaoImpl;
import com.cognizant.trainerpool.model.Trainer;

public class SMEBO {
	SMEDaoImpl smeDaoImpl = new SMEDaoImpl();

	public boolean checkUser(int userId) {
		return smeDaoImpl.checkSME(userId);
	}
	public boolean addSME(Trainer sme) {
		return smeDaoImpl.addSME(sme);
	}
}
