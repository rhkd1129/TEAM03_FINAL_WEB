package com.mycompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.CloginForm;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@RequestMapping("/main.do")
	public String main() {
		return "customer/main";
	}
	
	@GetMapping("/customer_login.do")
	public String loginForm(CloginForm cloginForm) {
		return "customer/customer_login";
	}
	
	@PostMapping("/customer_login.do")
	public String login(CloginForm cloginForm) {
		return "redirect:/customer/main.do";
	}

}
