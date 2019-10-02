package com.cognizant.trainerpool.model;

public class Admin {

	private User userAdmin;

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(User userAdmin) {
		super();
		this.userAdmin = userAdmin;
	}

	public User getUserAdmin() {
		return userAdmin;
	}

	public void setUserAdmin(User userAdmin) {
		this.userAdmin = userAdmin;
	}

	@Override
	public String toString() {
		return "Admin [userAdmin=" + userAdmin + "]";
	}

}
