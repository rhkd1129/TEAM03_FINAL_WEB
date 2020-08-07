package com.mycompany.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springmodules.validation.bean.conf.loader.annotation.handler.Length;

import com.mycompany.project.SHA256.SHA256Util;
import com.mycompany.project.controller.CustomerController;
import com.mycompany.project.dao.CustomerDao;

import com.mycompany.project.model.BeforeOrder;
import com.mycompany.project.model.Cmember;

import com.mycompany.project.model.Comment;

import com.mycompany.project.model.Fnb;
import com.mycompany.project.model.OrderReceipt;
import com.mycompany.project.model.Rmember;

import com.mycompany.project.model.CloginForm;




@Service
public class CustomerService {
	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerService.class);

	@Autowired
	private CustomerDao customerDao;

	public static final int LOGIN_MID_FAIL = 0;
	public static final int LOGIN_MAPSSWORD_FAIL = 1;
	public static final int LOGIN_SUCCESS = 2;

	public int login(CloginForm cloginForm) {
		Cmember dbCmember = customerDao.selectByMid(cloginForm.getMid());
		if (dbCmember == null) {
			return LOGIN_MID_FAIL;

		} else {
			String salt = customerDao.getSaltByMid(cloginForm.getMid());
			String password = cloginForm.getMpassword();

			password = SHA256Util.getEncrypt(password, salt);
			cloginForm.setMpassword(password);

			if (dbCmember.getMpassword().equals(cloginForm.getMpassword())) {
				return LOGIN_SUCCESS;

			} else {
				return LOGIN_MAPSSWORD_FAIL;

			}
		}
	}

	public void loginFailCount(String mid) {
		customerDao.loginFailCount(mid);
	}

	public int getFailCount(CloginForm cloginForm) {
		int failCount = customerDao.getFailCountByMid(cloginForm.getMid());
		return failCount;
	}

	public void loginLock(String mid) {
		customerDao.loginLock(mid);
	}

	public String getLoginLock(CloginForm cloginForm) {
		String loginLock = customerDao.getLoginLockByMid(cloginForm.getMid());
		return loginLock;
	}

	public void loginTryDate(String mid) {
		customerDao.updateLoginTryDate(mid);
	}

	public String getLoginTryDate(CloginForm cloginForm) {
		String loginTryDate = customerDao.getLoginTryDateByMid(cloginForm.getMid());
		return loginTryDate;
	}

	public void resetLoginLock(String mid) {
		customerDao.resetLoginLock(mid);
	}

	public void join(Cmember cmember) {
		String salt = SHA256Util.generateSalt();
		cmember.setSalt(salt);

		String password = cmember.getMpassword();
		password = SHA256Util.getEncrypt(password, salt);

		cmember.setMpassword(password);

		customerDao.insert(cmember);
	}

	public void insertComment(Comment comment) {
		customerDao.insertComment(comment);
	}

	public double averageRating(Comment comment) {
		double averageRating = customerDao.averageRating(comment);
		return averageRating;
	}

	public List<Comment> reviewList(Comment comment) {
		List<Comment> reviewList = customerDao.reviewList(comment);
		return reviewList;
	}

	public List<Cmember> getList(int pageNo, int rowsPerPage) {
		List<Cmember> list = customerDao.selectAll(pageNo, rowsPerPage);
		return list;
	}

	public int getTotalAdboardNo() {
		int totalAdboardNo = customerDao.count();
		return totalAdboardNo;
	}

	public void deleteCMember(String mid) {
		customerDao.deleteByMid(mid);
		System.out.println("2");
	}

	public Cmember getCmember(String mid) {
		Cmember cmember = customerDao.selectByMid(mid);
		return cmember;
	}

	//회원가입 오늘 날짜 수
	public int getTotalTodayNo() {
		int TodayNo = customerDao.countbytoday();
//		System.out.println("Service TodayNo : " + TodayNo);
		return TodayNo;
	}

	//회원가입 어제 날짜 수
	public int getTotalYesterdayNo() {
		int YesterdayNo = customerDao.countbyyesterday();
//		System.out.println("Service YesterdayNo : " + YesterdayNo);
		return YesterdayNo;
	}

	//회원가입 2일전 날짜 수
	public int getTotal2YesterdayNo() {
		int Yesterday2No = customerDao.countby2day();
//		System.out.println("Service Yesterday2No : " + Yesterday2No);
		return Yesterday2No;
	}

	//회원가입 3일전 날짜 수
	public int getTotal3YesterdayNo() {
		int Yesterday3No = customerDao.countby3day();
//		System.out.println("Service Yesterday3No : " + Yesterday3No);
		return Yesterday3No;
	}

	//회원가입 4일전 날짜 수
	public int getTotal4YesterdayNo() {
		int Yesterday4No = customerDao.countby4day();
//		System.out.println("Service Yesterday4No : " + Yesterday4No);
		return Yesterday4No;
	}

	//회원가입 5일전 날짜 수
	public int getTotal5YesterdayNo() {
		int Yesterday5No = customerDao.countby5day();
//		System.out.println("Service Yesterday5No : " + Yesterday5No);
		return Yesterday5No;
	}

	//회원가입 6일전 날짜 수
	public int getTotal6YesterdayNo() {
		int Yesterday6No = customerDao.countby6day();
//		System.out.println("Service Yesterday6No : " + Yesterday6No);
		return Yesterday6No;
	}

	//회원가입 7일전 날짜 수
	public int getTotal7YesterdayNo() {
		int Yesterday7No = customerDao.countby7day();
//		System.out.println("Service Yesterday7No : " + Yesterday7No);
		return Yesterday7No;
	}

	//회원가입 8일전 날짜 수
	public int getTotal8YesterdayNo() {
		int Yesterday8No = customerDao.countby8day();
//		System.out.println("Service Yesterday8No : " + Yesterday8No);
		return Yesterday8No;
	}

	//회원가입 9일전 날짜 수
	public int getTotal9YesterdayNo() {
		int Yesterday9No = customerDao.countby9day();
//		System.out.println("Service Yesterday9No : " + Yesterday9No);
		return Yesterday9No;
	}

	public Fnb getFnbByFno(int fno) {
		Fnb fnb = customerDao.selectFnbByFno(fno);
		return fnb;
	}

	public void addOrderTable(BeforeOrder beforeOrder) {
		customerDao.insertOrderTable(beforeOrder);
	}

	public List<BeforeOrder> getOrderTable(String bmid) {
		List<BeforeOrder> list = customerDao.selectOrderTableByBmid(bmid);
		return list;
	}

	public void removeOrderTable(int bno) {
		customerDao.insertOrderTable(bno);
	}

	public void makeOrderInfo(OrderReceipt orderReceipt) {
		String osummary = "";
		int max = 0;
		int maxIndex = 0;
		List<BeforeOrder> boList = customerDao.selectOrderTableByBmid(orderReceipt.getOmid());
		if(boList.size()>1) {
			for(int i = 0; i < boList.size(); i++) {
				BeforeOrder br = boList.get(i);
				int temp = br.getBfprice();
				if(temp > max) {
					max = temp;
					maxIndex = i;
				}
				
			osummary = boList.get(maxIndex).getBfname() + " 외 " + (boList.size()-1) + "개";
				
			} 
		
		} else {
			osummary = boList.get(maxIndex).getBfname() + "1개";
		}
		
		orderReceipt.setOsummary(osummary);
		
		customerDao.insertOrder(orderReceipt);
		
	}

	public int getOnoByOmid(String omid) {
		int ono = customerDao.selectOnobyOmid(omid);
		
		return ono;
	}

	public void setOnoAtBo(int ono, String omid) {
		LOGGER.info("실행");
		customerDao.udateOnoAtBo(ono, omid);
		
	}




}
