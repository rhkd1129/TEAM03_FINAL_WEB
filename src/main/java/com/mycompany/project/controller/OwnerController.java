package com.mycompany.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.OloginForm;
import com.mycompany.project.model.Omember;
import com.mycompany.project.service.OwnerService;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@Autowired
	private OwnerService ownerService;
	
	@RequestMapping("/owner_main.do") 
	public String main() {
		return "owner/owner_main";
	}
	
	@GetMapping("/owner_login.do")
	public String loginForm(OloginForm ologinForm) {
		return "owner/owner_login";
	}
	
	@PostMapping("/owner_login.do")
	public String login(OloginForm ologinForm) {
		return "redirect:/owner/owner_main.do";
	}
	
	@GetMapping("/owner_join.do")
	public String ojoinForm(Omember omember) {
		return "owner/owner_join";
	}
	
	@PostMapping("/owner_join.do")
	public String join(Omember omember) {
		ownerService.join(omember);
		return "redirect:/owner/owner_login.do";
	}

}
