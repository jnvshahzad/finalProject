package com.cognizant.trainerpool.model;

import java.util.Date;

public class Request {
	private int requestorId;
	private int requestId;
	private String requestSubject;
	private Date startDate;
	private Date endDate;
	private String city;
	private int batchSize;
	private int amount;
	private String requestStatus;

	public Request() {
		super();
	}

	public Request(int requestorId, String requestSubject, Date startDate, Date endDate,
			String city, int batchSize) {
		super();
		this.requestorId = requestorId;
		this.requestSubject = requestSubject;
		this.startDate = startDate;
		this.endDate = endDate;
		this.city = city;
		this.batchSize = batchSize;
	}

	public Request(int requestorId, String requestSubject, Date startDate, Date endDate,
			String city, int batchSize, int amount) {
		super();
		this.requestorId = requestorId;
		this.requestSubject = requestSubject;
		this.startDate = startDate;
		this.endDate = endDate;
		this.city = city;
		this.batchSize = batchSize;
		this.amount = amount;
	}

	public Request(int requestorId, int requestId, String requestSubject, Date startDate,
			Date endDate, String city, int batchSize) {
		super();
		this.requestorId = requestorId;
		this.requestId = requestId;
		this.requestSubject = requestSubject;
		this.startDate = startDate;
		this.endDate = endDate;
		this.city = city;
		this.batchSize = batchSize;
	}

	public Request(int requestorId, int requestId, String requestSubject, Date startDate,
			Date endDate, String city, int batchSize, String requestStatus) {
		super();
		this.requestorId = requestorId;
		this.requestId = requestId;
		this.requestSubject = requestSubject;
		this.startDate = startDate;
		this.endDate = endDate;
		this.city = city;
		this.batchSize = batchSize;
		this.requestStatus = requestStatus;
	}

	public int getRequestorId() {
		return requestorId;
	}

	public void setRequestorId(int requestorId) {
		this.requestorId = requestorId;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public String getRequestSubject() {
		return requestSubject;
	}

	public void setRequestSubject(String requestSubject) {
		this.requestSubject = requestSubject;
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
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

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	@Override
	public String toString() {
		return "Request [requestorId=" + requestorId + ", requestId=" + requestId
				+ ", requestSubject=" + requestSubject + ", startDate=" + startDate + ", endDate="
				+ endDate + ", city=" + city + ", batchSize=" + batchSize + ", requestStatus="
				+ requestStatus + "]";
	}

}
