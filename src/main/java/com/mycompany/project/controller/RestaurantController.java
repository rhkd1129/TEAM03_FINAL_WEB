package com.mycompany.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.RloginForm;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
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

}
