package com.shopping.beans;

public class UserUpdate {
	
	private String id;
	private String name;
	private String address; 
	private String phNo;
	private String emailID;
	private String passwd;
	//private String cpasswrd;
	public String getId() {
		return id;
	}
	public UserUpdate(String id, String name, String address, String phNo,
			String emailID, String passwd) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.phNo = phNo;
		this.emailID = emailID;
		this.passwd = passwd;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhNo() {
		return phNo;
	}
	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

}
