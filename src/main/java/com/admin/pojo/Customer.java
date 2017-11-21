package com.admin.pojo;

public class Customer {
	private String name;
	private String email;
	private String city;
	private String phone;
	private String wantTo;
	private String interestedIn;
	private String budget;
	
	
	
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public String getWantTo() {
		return wantTo;
	}
	public void setWantTo(String wantTo) {
		this.wantTo = wantTo;
	}
	public String getInterestedIn() {
		return interestedIn;
	}
	public void setInterestedIn(String interestedIn) {
		this.interestedIn = interestedIn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
