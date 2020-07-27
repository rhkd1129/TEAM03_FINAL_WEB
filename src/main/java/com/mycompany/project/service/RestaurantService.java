package com.mycompany.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.RestaurantDao;
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
}
