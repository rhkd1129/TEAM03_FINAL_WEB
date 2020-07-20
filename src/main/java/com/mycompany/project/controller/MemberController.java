package com.mycompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.CloginForm;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.OloginForm;
import com.mycompany.project.model.Omember;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/cjoin.do")
	public String cjoinform(Cmember cmember) {
		return "member/cjoinForm";
	}
	
	@PostMapping("/cjoin.do")
	public String cjoin(Cmember cmember) {
		return "redirect:/customer/main.do";
	}
	
	@GetMapping("/clogin.do")
	public String cloginform(CloginForm cloginForm) {
		return "member/cloginForm";
	}
	
	@PostMapping("/clogin.do")
	public String clogin(CloginForm cloginFrom) {
		return "redirect:/customer/main.do";
	}
	
	@GetMapping("/ojoin.do")
	public String ojoinform(Omember omember) {
		return "member/ojoinForm";
	}
	
	@PostMapping("/ojoin.do")
	public String ojoin(Omember omember) {
		return "redirect:/owner/main.do";
	}
	
//	@GetMapping("/ologin.do")
//	public String ologinform(OloginForm ologinForm) {
//		return "member/ologinForm";
//	}
//	
//	@PostMapping("/ologin.do")
//	public String ologin(OloginForm ologinForm) {
//		return "redirect:/owner/main.do";
//	}

}
