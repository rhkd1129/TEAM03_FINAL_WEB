package com.mycompany.project.model;

import java.sql.Date;

public class Cmember {
	private String mid;
	private String mpassword;
	private String mname;
	private String mtel;
	private String madress;
	private Date mdate;
	private String salt;
	private int login_fail_count;
	private String login_lock;
	private Date latest_login_try_date;
	private int lock_count;
	
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
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public int getLogin_fail_count() {
		return login_fail_count;
	}
	public void setLogin_fail_count(int login_fail_count) {
		this.login_fail_count = login_fail_count;
	}
	public String getLogin_lock() {
		return login_lock;
	}
	public void setLogin_lock(String login_lock) {
		this.login_lock = login_lock;
	}
	public Date getLatest_login_try_date() {
		return latest_login_try_date;
	}
	public void setLatest_login_try_date(Date latest_login_try_date) {
		this.latest_login_try_date = latest_login_try_date;
	}
	public int getLock_count() {
		return lock_count;
	}
	public void setLock_count(int lock_count) {
		this.lock_count = lock_count;
	}

}
