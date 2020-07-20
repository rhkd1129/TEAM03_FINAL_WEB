package com.mycompany.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.project.model.Cmember;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String joinfrom(Cmember cmember) {
		return "member/joinForm";
	}

}
