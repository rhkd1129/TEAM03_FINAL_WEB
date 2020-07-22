package com.mycompany.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Pager;
import com.mycompany.project.service.CustomerService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/main.do")
	public String main(@RequestParam(defaultValue="1") int pageNo, 
			 @RequestParam(defaultValue="10") int rowsPerPage, Model model, 
			 HttpSession session) {
		
		Pager pager = new Pager(rowsPerPage, 5 ,customerService.getTotalAdboardNo(), pageNo);
		model.addAttribute("pager",pager);
		session.setAttribute("pager", pager);
		
		List<Cmember> list = customerService.getList(pageNo, rowsPerPage);
		model.addAttribute("cmemberlist", list);
		return "admin/main";
	}
	
	@GetMapping("/cmemberdelete.do")
	public String cmemberDelete(String mid) {
		customerService.deleteCMember(mid);
		System.out.println("3");

		return "redirect:/admin/main.do";
	}
	
	@RequestMapping("/index.do")
	public String index() {
		return "admin/index";
	} 

	@RequestMapping("/smssend.do")
	public String smssend() {
		return "admin/smssend";
	}	
	
	@RequestMapping("/calljson.do")
	public String calljson() {
		return "admin/calljson";
	}	

}
