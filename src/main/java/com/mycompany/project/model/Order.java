package com.mycompany.project.model;

import java.util.Date;

public class Order {
	private int ono;
	private int orid;
	private String omid;
	private String osummary;
	private Date odate;
	private String ofulladdr;
	private String odetailaddr;
	private String otel;
	private String orequirement;
	private int ototalprice;
	
	public String getOrequirement() {
		return orequirement;
	}
	public void setOrequirement(String orequirement) {
		this.orequirement = orequirement;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getOrid() {
		return orid;
	}
	public void setOrid(int orid) {
		this.orid = orid;
	}
	public String getOmid() {
		return omid;
	}
	public void setOmid(String omid) {
		this.omid = omid;
	}
	public String getOsummary() {
		return osummary;
	}
	public void setOsummary(String osummary) {
		this.osummary = osummary;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public String getOfulladdr() {
		return ofulladdr;
	}
	public void setOfulladdr(String ofulladdr) {
		this.ofulladdr = ofulladdr;
	}
	public String getOdetailaddr() {
		return odetailaddr;
	}
	public void setOdetailaddr(String odetailaddr) {
		this.odetailaddr = odetailaddr;
	}
	public String getOtel() {
		return otel;
	}
	public void setOtel(String otel) {
		this.otel = otel;
	}
	public int getOtotalprice() {
		return ototalprice;
	}
	public void setOtotalprice(int ototalprice) {
		this.ototalprice = ototalprice;
	}
	
	

}
