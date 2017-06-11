package com.shopping.beans;

public class AdminReportBean {

	private String cid;
	private String name;
	private String address; 
	private String phNo;
	private String emailID;
	
	private String oid;
	private String date;
	private String mode;
	private String ostat;
	private String pid;
	private String pname;
	private String pcat;
	private String pstatus; 
	private String price;
	private String pdesc;
	public AdminReportBean(String cid, String name, String address,
			String phNo, String emailID, String oid, String date, String mode,
			String ostat, String pid, String pname, String pcat,
			String pstatus, String price, String pdesc) {
		super();
		this.cid = cid;
		this.name = name;
		this.address = address;
		this.phNo = phNo;
		this.emailID = emailID;
		this.oid = oid;
		this.date = date;
		this.mode = mode;
		this.ostat = ostat;
		this.pid = pid;
		this.pname = pname;
		this.pcat = pcat;
		this.pstatus = pstatus;
		this.price = price;
		this.pdesc = pdesc;
	}
	public String getCid() {
		return cid;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public String getPhNo() {
		return phNo;
	}
	public String getEmailID() {
		return emailID;
	}
	public String getOid() {
		return oid;
	}
	public String getDate() {
		return date;
	}
	public String getMode() {
		return mode;
	}
	public String getOstat() {
		return ostat;
	}
	public String getPid() {
		return pid;
	}
	public String getPname() {
		return pname;
	}
	public String getPcat() {
		return pcat;
	}
	public String getPstatus() {
		return pstatus;
	}
	public String getPrice() {
		return price;
	}
	public String getPdesc() {
		return pdesc;
	}
	
	
}
