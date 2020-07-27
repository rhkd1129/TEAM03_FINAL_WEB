package com.mycompany.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.CloginForm;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.CustomerService;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerController.class); 
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping("/customer_main.do")
	public String main() {
		return "customer/customer_main";
	}
	
	@GetMapping("/customer_login.do")
	public String loginForm(CloginForm cloginForm) {
		return "customer/customer_login";
	}
	
	@PostMapping("/customer_login.do")
	public String login(CloginForm cloginForm) {
		return "redirect:/customer/customer_main.do";
	}
	
	@GetMapping("/customer_join.do")
	public String joinForm(Cmember cmember) {
		return "customer/customer_join";
	}
	
	@PostMapping("/customer_join.do")
	public String join(Cmember cmember) {
		customerService.join(cmember);
		return "redirect:/customer/customer_main.do";
	}
	
	@GetMapping("/customer_search.do")
	public String search(String roadAddr, String bdNm, String siNm, String emdNm,  Model model) {
		String fullAddr = roadAddr + " " + bdNm;
		List<Rmember> list = restaurantService.getRestaurantList(siNm, emdNm);
		model.addAttribute("fullAddr", fullAddr);
		model.addAttribute("restaurantList", list);
		LOGGER.info("실행");
		LOGGER.info("" + list);
				
		return "customer/customer_search";
	}

}
