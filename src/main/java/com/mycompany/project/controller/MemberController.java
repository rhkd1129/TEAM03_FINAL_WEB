package com.mycompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.CloginForm;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/join.do")
	public String joinform(Cmember cmember) {
		return "member/cjoinForm";
	}
	
	@PostMapping("/join.do")
	public String join(Cmember cmember) {
		return "redirect:/home/main.do";
	}
	
	@GetMapping("/login.do")
	public String loginform(CloginForm cloginForm) {
		return "member/cloginForm";
	}
	
	@PostMapping("/login.do")
	public String login(CloginForm cloginFrom) {
		return "redirect:/home/main.do";
	}

}
