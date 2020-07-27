package com.mycompany.project.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.Amember;
import com.mycompany.project.model.RloginForm;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	private static final Logger LOGGER =
			LoggerFactory.getLogger(RestaurantController.class);
	
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
	public String joinForm(Amember amember) {
		return "restaurant/restaurant_join";
	}
	
	@PostMapping("/restaurant_join.do")
	public String join(Amember amember) {
		restaurantService.join(amember);
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
	
	@PostMapping("/idcheck.do")
	public void idCheck(String rid, HttpServletResponse response) throws Exception {
		String result = "overlapID";
		Rmember rmember = restaurantService.getRmember(rid);
		
		if (rmember == null) {
			result = "success";
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		String json = jsonObject.toString();
		PrintWriter pw = response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
	}

}
