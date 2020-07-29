package com.mycompany.project.controller;

import java.io.File;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.project.model.RloginForm;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	private static final Logger LOGGER = LoggerFactory.getLogger(RestaurantController.class); 
	
	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping("/restaurant_main.do") 
	public String main() {
		return "restaurant/restaurant_main";
	}
	
	@GetMapping("/restaurant_login.do")
	public String loginForm(RloginForm rloginForm) {
		return "restaurant/restaurant_login";
	}
	
	@PostMapping("/restaurant_login.do")
	public String login(RloginForm rloginForm) {
		return "redirect:/restaurant/restaurant_main.do";
	}
	
	@GetMapping("/restaurant_join.do")
	public String rjoinForm(Rmember rmember) {
		return "restaurant/restaurant_join";
	}
	
	@PostMapping("/restaurant_join.do")
	public String join(Rmember rmember) {
		restaurantService.join(rmember);
		return "redirect:/restaurant/restaurant_login.do";
	}
	
	@GetMapping("/restaurant_order_queue.do")
	public String orderQueue() {
		return "restaurant/restaurant_order_queue";
	}
	
	@GetMapping("/restaurant_order_processing.do")
	public String orderProcessing() {
		return "restaurant/restaurant_order_processing";
	}
	
	@GetMapping("/restaurant_order_complete.do")
	public String orderComplete() {
		return "restaurant/restaurant_order_complete";
	}
	
	@GetMapping("/restaurant_order_inquiry.do")
	public String orderInquiry() {
		return "restaurant/restaurant_order_inquiry";
	}
	
	@GetMapping("/restaurant_manage_menu_register.do")
	public String manageMenu() {
		return "restaurant/restaurant_manage_menu_register";
	}
	
	@PostMapping("/restaurant_manage_menu_register.do")
	public String write(String frid, String fname, String fcategory, int fprice, MultipartFile fimage) throws Exception{
		LOGGER.info("실행");
		LOGGER.info(frid);
		LOGGER.info(fname);
		LOGGER.info(fcategory);
		LOGGER.info(""+fprice);
		
		String saveDir = "C:/Temp/Images/Restaurant/menu/";
		String saveFileName = fimage.getOriginalFilename();
		File filePath = new File(saveDir + saveFileName);
		fimage.transferTo(filePath);
		
		return "restaurant/restaurant_manage_menu_register";
	}
}
