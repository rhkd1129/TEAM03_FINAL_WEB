package com.mycompany.project.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mycompany.project.service.CustomerService;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger("AdminController");
	
	//회원 명단 service 불러오기
	@Autowired
	private CustomerService customerService;
	
	//레스토랑 명단 service 불러오기
	@Autowired
	private RestaurantService restaurantService;
	
	//메인 화면 
	@GetMapping("/main.do")
	public String main() {
		
		return "admin/main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
