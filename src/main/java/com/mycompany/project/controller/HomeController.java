package com.mycompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@RequestMapping("/landingpage.do")
	public String landingpage() {
		return "home/landingpage";
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "home/main";
	}

}
