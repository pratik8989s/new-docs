package com.shopping.beans;

public class CartBean{
	
	private String pid;
	private String pname;
	private String pcat;
	private String pstatus; 
	private String price;
	private String pdesc;
	

	public CartBean(String pid,String pname, String pcat, String pstatus, String price, String pdesc) {
		this.pid=pid;
		this.pname = pname;
		this.pcat = pcat;
		this.pstatus = pstatus;
		this.price = price;
		this.pdesc = pdesc;
		
	}
	
	
	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcat() {
		return pcat;
	}
	public void setPcat(String pcat) {
		this.pcat = pcat;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	


}
