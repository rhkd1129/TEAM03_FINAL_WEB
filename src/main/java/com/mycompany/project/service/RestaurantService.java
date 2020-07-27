package com.mycompany.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.RestaurantDao;
import com.mycompany.project.model.Amember;
import com.mycompany.project.model.Rmember;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	public void join(Amember amember) {
		restaurantDao.insert(amember);
	}

	public Rmember getRmember(String rid) {
		Rmember rmember = restaurantDao.selectByRid(rid);
		return rmember;
	}

}
