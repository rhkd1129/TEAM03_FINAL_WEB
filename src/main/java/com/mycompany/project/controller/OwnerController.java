package com.mycompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@RequestMapping("/main.do")
	public String main() {
		return "owner/main";
	}

}
