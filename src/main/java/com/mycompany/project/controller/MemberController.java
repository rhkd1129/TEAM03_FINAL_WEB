package com.mycompany.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Omember;
import com.mycompany.project.service.CustomerService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/cjoin.do")
	public String cjoinform(Cmember cmember) {
		return "member/cjoinForm";
	}
	
	@PostMapping("/cjoin.do")
	public String cjoin(Cmember cmember) {
		customerService.join(cmember);
		return "redirect:/customer/main.do";
	}
	
	/*@PostMapping("/cjoin.do")
	public String cjoin(Cmember cmember) {
		return "redirect:/customer/main.do";
	}*/
	
/*	@GetMapping("/clogin.do")
	public String cloginform(CloginForm cloginForm) {
		return "member/cloginForm";
	}
	
	@PostMapping("/clogin.do")
	public String clogin(CloginForm cloginForm) {
		return "redirect:/customer/main.do";
	}*/
	
	@GetMapping("/ojoin.do")
	public String ojoinform(Omember omember) {
		return "member/ojoinForm";
	}
	
	@PostMapping("/ojoin.do")
	public String ojoin(Omember omember) {
		return "redirect:/owner/main.do";
	}
	
/*	@GetMapping("/ologin.do")
	public String ologinform(OloginForm ologinForm) {
		return "member/ologinForm";
	}
	
	@PostMapping("/ologin.do")
	public String ologin(OloginForm ologinForm) {
		return "redirect:/owner/main.do";
	}*/

}
