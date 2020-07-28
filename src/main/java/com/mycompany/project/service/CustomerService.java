package com.mycompany.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.CustomerDao;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Rmember;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDao customerDao;
	
	public void join(Cmember cmember) {
		customerDao.insert(cmember);
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
	
	
	
	
}
