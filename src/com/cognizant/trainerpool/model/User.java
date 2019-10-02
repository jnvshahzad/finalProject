package com.cognizant.trainerpool.model;

public class User {

	private int userId;
	private String userFirstName;
	private String userLastName;
	private int age;
	private String gender;
	private long contactNumber;
	private String address;
	private String password;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userId, String userFirstName, String userLastName, int age,
			String gender, long contactNumber, String address, String password) {
		super();
		this.userId = userId;
		this.userFirstName = userFirstName;
		this.userLastName = userLastName;
		this.age = age;
		this.gender = gender;
		this.contactNumber = contactNumber;
		this.address = address;
		this.password = password;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserFirstName() {
		return userFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userFirstName=" + userFirstName + ", userLastName="
				+ userLastName + ", age=" + age + ", gender=" + gender
				+ ", contactNumber=" + contactNumber + ", address=" + address + ", password="
				+ password + "]";
	}

}
