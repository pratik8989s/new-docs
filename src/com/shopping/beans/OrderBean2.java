package com.shopping.beans;

public class OrderBean2 {
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
	public String getPri() {
		return pri;
	}
	public void setPri(String pri) {
		this.pri = pri;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getStst() {
		return stst;
	}
	public void setStst(String stst) {
		this.stst = stst;
	}
	String pid;
	String pname;
	String pcat;
	String pstatus;
	String pri;
	String desc;
	String oid;
	String date;
	String pay;
	String stst;
	public OrderBean2(String pid, String pname, String pcat, String pstatus,
			String pri, String desc, String oid, String date, String pay,
			String stst) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pcat = pcat;
		this.pstatus = pstatus;
		this.pri = pri;
		this.desc = desc;
		this.oid = oid;
		this.date = date;
		this.pay = pay;
		this.stst = stst;
	}

}
