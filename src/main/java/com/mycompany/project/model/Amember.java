package com.mycompany.project.model;

import java.sql.Date;

public class Amember {
	private String aid;
	private String apassword;
	private String aname;
	private String atitle;
	private String aadress;  
	private String atel;
	private String acategory;
	private Date adate;
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getApassword() {
		return apassword;
	}
	public void setApassword(String apassword) {
		this.apassword = apassword;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAadress() {
		return aadress;
	}
	public void setAadress(String aadress) {
		this.aadress = aadress;
	}
	public String getAtel() {
		return atel;
	}
	public void setAtel(String atel) {
		this.atel = atel;
	}
	public String getAcategory() {
		return acategory;
	}
	public void setAcategory(String acategory) {
		this.acategory = acategory;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	
}
