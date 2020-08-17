package com.mycompany.project.model;

import java.sql.Date;

public class Rmember {
	private int rno;
	private String rid;
	private String rpassword;
	private String rname;
	private String rtitle;
	private String raddress;
	private String rtel;
	private String rcategory;
	private Date rdate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRpassword() {
		return rpassword;
	}
	public void setRpassword(String rpassword) {
		this.rpassword = rpassword;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRaddress() {
		return raddress;
	}
	public void setRaddress(String radress) {
		this.raddress = radress;
	}
	public String getRtel() {
		return rtel;
	}
	public void setRtel(String rtel) {
		this.rtel = rtel;
	}
	public String getRcategory() {
		return rcategory;
	}
	public void setRcategory(String rcategory) {
		this.rcategory = rcategory;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

}
