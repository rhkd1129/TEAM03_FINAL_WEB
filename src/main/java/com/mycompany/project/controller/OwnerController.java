package com.mycompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.OloginForm;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@GetMapping("/owner_login.do")
	public String loginForm(OloginForm ologinForm) {
		return "owner/owner_login";
	}
	
	@PostMapping("/owner_login.do")
	public String main(OloginForm ologinForm) {
		return "owner/owner_main";
	}


}
