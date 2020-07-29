package com.mycompany.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.RestaurantDao;
import com.mycompany.project.model.Fnb;
import com.mycompany.project.model.Rmember;

@Service
public class RestaurantService {
	private static final Logger LOGGER = LoggerFactory.getLogger(RestaurantService.class); 
	
	//레스토랑 dao 불러오기
	@Autowired
	private RestaurantDao restaurantDao;
	
	//레스토랑 조합 가입하기
	public void join(Rmember rmember) {
		restaurantDao.insert(rmember);
	}
	
	//레스토랑 조합 명단 불러오기
	public List<Rmember> getList(int pageNo1, int rowsPerPage1) {
		List<Rmember> list = restaurantDao.selectAll(pageNo1, rowsPerPage1);	
		return list;
	}	
	
	//레스토랑 페이저 
	public int getTotalAdboardNo() {
		int totalAdboardNo = restaurantDao.count();
		return totalAdboardNo;
	}
	
	//레스토랑 명단 제명
	public void deleteRMember(String rid) {
		restaurantDao.deleteByRid(rid);
		System.out.println("2");

	}

	public List<Rmember> getRestaurantList(String siNm, String emdNm) {
		List<Rmember> list = restaurantDao.selectByAddr(siNm, emdNm);
		LOGGER.info("실행");
		return list;
	}
	
	//가게 등록 오늘 날짜 수
	public int RgetTotalTodayNo() {
		int RTodayNo = restaurantDao.Rcountbytoday();
//		System.out.println("Service RTodayNo : " + RTodayNo);
		return RTodayNo;
	}
	
	//가게 등록 어제 날짜 수
	public int RgetTotalYesterdayNo() {
		int RYesterdayNo = restaurantDao.Rcountbyyesterday();
//		System.out.println("Service RYesterdayNo : " + RYesterdayNo);
		return RYesterdayNo;
	}
	
	//가게 등록 2일전 날짜 수
	public int RgetTotal2YesterdayNo() {
		int RYesterday2No = restaurantDao.Rcountby2day();
//		System.out.println("Service RYesterday2No : " + RYesterday2No);
		return RYesterday2No;
	}	
	
	//가게 등록 3일전 날짜 수
	public int RgetTotal3YesterdayNo() {
		int RYesterday3No = restaurantDao.Rcountby3day();
//		System.out.println("Service RYesterday3No : " + RYesterday3No);
		return RYesterday3No;
	}		
	
	//가게 등록 4일전 날짜 수
	public int RgetTotal4YesterdayNo() {
		int RYesterday4No = restaurantDao.Rcountby4day();
//		System.out.println("Service RYesterday4No : " + RYesterday4No);
		return RYesterday4No;
	}		
	
	//가게 등록 5일전 날짜 수
	public int RgetTotal5YesterdayNo() {
		int RYesterday5No = restaurantDao.Rcountby5day();
//		System.out.println("Service RYesterday5No : " + RYesterday5No);
		return RYesterday5No;
	}		

	//가게 등록 6일전 날짜 수
	public int RgetTotal6YesterdayNo() {
		int RYesterday6No = restaurantDao.Rcountby6day();
//		System.out.println("Service RYesterday6No : " + RYesterday6No);
		return RYesterday6No;
	}	
	
	//가게 등록 7일전 날짜 수
	public int RgetTotal7YesterdayNo() {
		int RYesterday7No = restaurantDao.Rcountby7day();
//		System.out.println("Service RYesterday7No : " + RYesterday7No);
		return RYesterday7No;
	}		
	
	//가게 등록 8일전 날짜 수
	public int RgetTotal8YesterdayNo() {
		int RYesterday8No = restaurantDao.Rcountby8day();
//		System.out.println("Service RYesterday8No : " + RYesterday8No);
		return RYesterday8No;
	}		
	
	//가게 등록 9일전 날짜 수
	public int RgetTotal9YesterdayNo() {
		int RYesterday9No = restaurantDao.Rcountby9day();
//		System.out.println("Service RYesterday9No : " + RYesterday9No);
		return RYesterday9No;
	}

	public int getRnoByRid(String rid) {
		int rno = restaurantDao.selectRnoByRid(rid);
		return rno;
	}

	public void registerNewMenu(Fnb fnb) {
		restaurantDao.insertNewMenu(fnb);
	}		
	
	
	
	
	
	
	
}
