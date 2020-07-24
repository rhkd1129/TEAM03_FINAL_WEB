package com.mycompany.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.CloginForm;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
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
	public String search(String roadAddr, String bdNm, Model model) {
		String fullAddr = roadAddr + " " + bdNm;
		model.addAttribute("fullAddr", fullAddr);
				
		return "customer/customer_search";
	}

}
