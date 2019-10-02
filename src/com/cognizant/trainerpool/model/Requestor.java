package com.cognizant.trainerpool.model;

import java.util.Date;

public class Requestor {

	private User userRequestor;

	private int batchSize;
	private int amount;
	private Date startDate;
	private Date endDate;

	public Requestor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Requestor(User userRequestor) {
		super();
		this.userRequestor = userRequestor;
	}

	public Requestor(User userRequestor, int batchSize, int amount, Date startDate, Date endDate) {
		super();
		this.userRequestor = userRequestor;
		this.batchSize = batchSize;
		this.amount = amount;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public User getUserRequestor() {
		return userRequestor;
	}

	public void setUserRequestor(User userRequestor) {
		this.userRequestor = userRequestor;
	}

	public int getBatchSize() {
		return batchSize;
	}

	public void setBatchSize(int batchSize) {
		this.batchSize = batchSize;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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
		return "Requestor [userRequestor=" + userRequestor + ", batchSize=" + batchSize
				+ ", amount=" + amount + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
