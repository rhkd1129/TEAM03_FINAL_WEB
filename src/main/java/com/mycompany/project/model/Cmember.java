package com.mycompany.project.model;

import java.util.Date;

public class Cmember {
	private String mid;
	private String mpassword;
	private String mname;
	private String mtel;
	private String madress;
	private Date mdate;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMadress() {
		return madress;
	}
	public void setMadress(String madress) {
		this.madress = madress;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

}
