package com.mycompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.RloginForm;

@Controller
@RequestMapping("/owner")
public class OwnerController {

	@RequestMapping("/owner_main.do")
	public String main() {
		return "owner/owner_main";
	}

	@GetMapping("/owner_login.do")
	public String loginForm(RloginForm ologinForm) {
		return "owner/owner_login";
	}

	@PostMapping("/owner_login.do")
	public String login(RloginForm ologinForm) {
		return "redirect:/owner/owner_main.do";
	}


	@GetMapping("/owner_order_queue.do")
	public String orderQueue() {
		return "owner/owner_order_queue";
	}




}
