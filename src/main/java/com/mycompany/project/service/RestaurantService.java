package com.mycompany.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.RestaurantDao;

import com.mycompany.project.model.Amember;

import com.mycompany.project.model.Fnb;
import com.mycompany.project.model.OrderReceipt;
import com.mycompany.project.model.Rmember;

@Service
public class RestaurantService {
	private static final Logger LOGGER = LoggerFactory.getLogger(RestaurantService.class);

	//레스토랑 dao 불러오기
	@Autowired
	private RestaurantDao restaurantDao;


	public void join(Amember amember) {
		restaurantDao.insert(amember);
	}

	public Rmember getRmember(String rid) {
		Rmember rmember = restaurantDao.selectByRid(rid);
		return rmember;
	}

	
	public List<Rmember> getRestaurantList(String siNm, String emdNm) {
		List<Rmember> list = restaurantDao.selectByAddr(siNm, emdNm);
		LOGGER.info("실행");
		return list;
	}

	public int getRnoByRid(String rid) {
		int rno = restaurantDao.selectRnoByRid(rid);
		return rno;
	}

	public void registerNewMenu(Fnb fnb) {
		restaurantDao.insertNewMenu(fnb);
	}

	public List<Fnb> getFoodListByFrno(int frno) {
		List<Fnb> list = restaurantDao.selectFoodListByFrno(frno);
		return list;
	}

	public List<Fnb> getBeverageListByFrno(int frno) {
		List<Fnb> list = restaurantDao.selectBeverageListByFrno(frno);
		return list;
	}

	public Rmember getRestaurantInfoByRno(int rno) {
		Rmember rmember = restaurantDao.selecRestaurantInfoByRno(rno);
		return rmember;
	}

	public List<OrderReceipt> getOrderList(int orno) {
		List<OrderReceipt> list = restaurantDao.selectOrderByOrno(orno);
		return list;
	}

	public void takeoverOrder(int ono) {
		restaurantDao.udateByTakeover(ono);
		
	}

	public List<OrderReceipt> getProcessingList(int orno) {
		List<OrderReceipt> list = restaurantDao.selectProcessingByOrno(orno);
		return list;
	}

	public void completeOrder(int ono) {
		restaurantDao.updateByComplete(ono);
	}

	public List<Rmember> getRestaurantLink(Rmember rmember) {
		List<Rmember> list = restaurantDao.getRestaurantLink(rmember);
		return list;
	}





}
