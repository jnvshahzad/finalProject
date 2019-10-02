package com.cognizant.trainerpool.model;

import java.util.Date;

public class Trainer {

	private User userTrainer;

	private String skills;
	private Date startDate;
	private Date endDate;

	public Trainer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Trainer(User userTrainer) {
		super();
		this.userTrainer = userTrainer;
	}

	public Trainer(User userTrainer, String skills, Date startDate, Date endDate) {
		super();
		this.userTrainer = userTrainer;
		this.skills = skills;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public User getUserTrainer() {
		return userTrainer;
	}

	public void setUserTrainer(User userTrainer) {
		this.userTrainer = userTrainer;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Trainer [userTrainer=" + userTrainer + ", skills=" + skills + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}

}
