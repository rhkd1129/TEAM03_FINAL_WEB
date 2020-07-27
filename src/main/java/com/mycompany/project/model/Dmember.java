package com.mycompany.project.model;

import java.sql.Date;

public class Dmember {
	private String dmid;
	private Date ddate;
	private String dadress;
	private String dmenu;
	private int dprice;
	private String drestaurant;

	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public String getDmid() {
		return dmid;
	}
	public void setDmid(String dmid) {
		this.dmid = dmid;
	}

	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

	public String getDadress() {
		return dadress;
	}
	public void setDadress(String dadress) {
		this.dadress = dadress;
	}
	public String getDmenu() {
		return dmenu;
	}
	public void setDmenu(String dmenu) {
		this.dmenu = dmenu;
	}
	public int getDprice() {
		return dprice;
	}
	public void setDprice(int dprice) {
		this.dprice = dprice;
	}
	public String getDrestaurant() {
		return drestaurant;
	}
	public void setDrestaurant(String drestaurant) {
		this.drestaurant = drestaurant;
	}

}
