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
import com.mycompany.project.model.Pager1;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.CustomerService;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	//회원 명단 service 불러오기
	@Autowired
	private CustomerService customerService;
	
	//레스토랑 명단 service 불러오기
	@Autowired
	private RestaurantService restaurantService;
	
	//메인 화면 
	@GetMapping("/main.do")
	public String main(@RequestParam(defaultValue="1") int pageNo, 
			 			@RequestParam(defaultValue="10") int rowsPerPage, 
			 			
			 			@RequestParam(defaultValue="1") int pageNo1, 
			 			@RequestParam(defaultValue="10") int rowsPerPage1,
			 			Model model,HttpSession session) {
		// Pager1
		Pager pager = new Pager(rowsPerPage, 5 ,customerService.getTotalAdboardNo(), pageNo);
		model.addAttribute("pager",pager);
		session.setAttribute("pager", pager);
		
		List<Cmember> list = customerService.getList(pageNo, rowsPerPage);
		model.addAttribute("cmemberlist", list);
		
		// Pager2
		Pager1 pager1 = new Pager1(rowsPerPage1, 5 ,restaurantService.getTotalAdboardNo(), pageNo1);
		model.addAttribute("pager1",pager1);
		session.setAttribute("pager1", pager1);
		
		List<Rmember> list1 = restaurantService.getList(pageNo1, rowsPerPage1);
		model.addAttribute("rmemberlist", list1);
		
		return "admin/main";
	}
	
	//회원 명단 삭제
	@GetMapping("/cmemberdelete.do")
	public String cmemberDelete(String mid) {
		customerService.deleteCMember(mid);
		System.out.println("3");

		return "redirect:/admin/main.do";
	}
	
	//레스토랑 명단 삭제
	@GetMapping("/rmemberdelete.do")
	public String rmemberDelete(String rid) {
		restaurantService.deleteRMember(rid);
		System.out.println("3");

		return "redirect:/admin/main.do";
	}
	
	//관리자 로그인 페이지 이동
	@GetMapping("/adminlogin.do")
	public String adminlogin() {
		return "admin/adminlogin";
	} 	
	
	//문자 메세지 페이지 이동
	@RequestMapping("/index.do")
	public String index() {
		return "admin/index";
	} 
	
	//문자 메세지 요청 페이지 이동
	@RequestMapping("/smssend.do")
	public String smssend() {
		return "admin/smssend";
	}	


}
