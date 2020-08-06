package com.mycompany.project.model;

import java.util.Date;

public class BeforeOrder {
	private int bno;
	private int bono;
	private String bmid;
	private int brno;
	private String bfname;
	private int bfprice;
	private int bcount;
	private Date bdate;
	private int bcheckout;
	
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getBono() {
		return bono;
	}
	public void setBono(int bono) {
		this.bono = bono;
	}
	public String getBmid() {
		return bmid;
	}
	public void setBmid(String bmid) {
		this.bmid = bmid;
	}
	public int getBrno() {
		return brno;
	}
	public void setBrno(int brno) {
		this.brno = brno;
	}
	public String getBfname() {
		return bfname;
	}
	public void setBfname(String bfname) {
		this.bfname = bfname;
	}
	public int getBfprice() {
		return bfprice;
	}
	public void setBfprice(int bfprice) {
		this.bfprice = bfprice;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public int getBcheckout() {
		return bcheckout;
	}
	public void setBcheckout(int bcheckout) {
		this.bcheckout = bcheckout;
	}
	
}
