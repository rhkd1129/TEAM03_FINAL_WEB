package com.mycompany.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static final Logger LOGGER = LoggerFactory.getLogger("AdminController");
	
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
		model.addAttribute("pager1", pager1);
		session.setAttribute("pager1", pager1);
		
		List<Rmember> list1 = restaurantService.getList(pageNo1, rowsPerPage1);
		model.addAttribute("rmemberlist", list1);

//회원-----------------------------------------------------------------------		
		
		//회원 오늘 가입 수 
		int todaylist = customerService.getTotalTodayNo();
		model.addAttribute("TodayNolist", todaylist);
//		System.out.println("오늘 명단 수 : " + todaylist);
		
		//회원 어제 가입 수
		int yesterdaylist = customerService.getTotalYesterdayNo();
		model.addAttribute("Yesterday1Nolist", yesterdaylist);
//		System.out.println("어제 명단 수 : " + yesterdaylist);
	
		//회원 2일전 가입 수 
		int yesterday2list = customerService.getTotal2YesterdayNo();
		model.addAttribute("Yesterday2Nolist", yesterday2list);
//		System.out.println("2일전 명단 수 : " + yesterday2list);		
		
		//회원 3일전 가입 수 
		int yesterday3list = customerService.getTotal3YesterdayNo();
		model.addAttribute("Yesterday3Nolist", yesterday3list);
//		System.out.println("3일전 명단 수 : " + yesterday3list);				
		
		//회원 4일전 가입 수 
		int yesterday4list = customerService.getTotal4YesterdayNo();
		model.addAttribute("Yesterday4Nolist", yesterday4list);
//		System.out.println("4일전 명단 수 : " + yesterday4list);				
		
		//회원 5일전 가입 수 
		int yesterday5list = customerService.getTotal5YesterdayNo();
		model.addAttribute("Yesterday5Nolist", yesterday5list);
//		System.out.println("5일전 명단 수 : " + yesterday5list);				
		
		//회원 6일전 가입 수 
		int yesterday6list = customerService.getTotal6YesterdayNo();
		model.addAttribute("Yesterday6Nolist", yesterday6list);
//		System.out.println("6일전 명단 수 : " + yesterday6list);		
		
		//회원 7일전 가입 수 
		int yesterday7list = customerService.getTotal7YesterdayNo();
		model.addAttribute("Yesterday7Nolist", yesterday7list);
//		System.out.println("7일전 명단 수 : " + yesterday7list);				
		
		//회원 8일전 가입 수 
		int yesterday8list = customerService.getTotal8YesterdayNo();
		model.addAttribute("Yesterday8Nolist", yesterday8list);
//		System.out.println("8일전 명단 수 : " + yesterday8list);				
		
		//회원 9일전 가입 수 
		int yesterday9list = customerService.getTotal9YesterdayNo();
		model.addAttribute("Yesterday9Nolist", yesterday9list);
//		System.out.println("9일전 명단 수 : " + yesterday9list);			
		
//가게-----------------------------------------------------------------------
		
		//가게 오늘 등록 수 
		int Rtodaylist = restaurantService.RgetTotalTodayNo();
		model.addAttribute("RTodayNolist", Rtodaylist);
//		System.out.println("오늘 명단 수 : " + Rtodaylist);
		
		//가게 어제 가입 수
		int Ryesterdaylist = restaurantService.RgetTotalYesterdayNo();
		model.addAttribute("RYesterday1Nolist", Ryesterdaylist);
//		System.out.println("어제 명단 수 : " + Ryesterdaylist);
	
		//가게 2일전 가입 수 
		int Ryesterday2list = restaurantService.RgetTotal2YesterdayNo();
		model.addAttribute("RYesterday2Nolist", Ryesterday2list);
//		System.out.println("2일전 명단 수 : " + Ryesterday2list);		
		
		//가게 3일전 가입 수 
		int Ryesterday3list = restaurantService.RgetTotal3YesterdayNo();
		model.addAttribute("RYesterday3Nolist", Ryesterday3list);
//		System.out.println("3일전 명단 수 : " + Ryesterday3list);				
		
		//가게 4일전 가입 수 
		int Ryesterday4list = restaurantService.RgetTotal4YesterdayNo();
		model.addAttribute("RYesterday4Nolist", Ryesterday4list);
//		System.out.println("4일전 명단 수 : " + Ryesterday4list);				
		
		//가게 5일전 가입 수 
		int Ryesterday5list = restaurantService.RgetTotal5YesterdayNo();
		model.addAttribute("RYesterday5Nolist", Ryesterday5list);
//		System.out.println("5일전 명단 수 : " + Ryesterday5list);				
		
		//가게 6일전 가입 수 
		int Ryesterday6list = restaurantService.RgetTotal6YesterdayNo();
		model.addAttribute("RYesterday6Nolist", Ryesterday6list);
//		System.out.println("6일전 명단 수 : " + Ryesterday6list);		
		
		//가게 7일전 가입 수 
		int Ryesterday7list = restaurantService.RgetTotal7YesterdayNo();
		model.addAttribute("RYesterday7Nolist", Ryesterday7list);
//		System.out.println("7일전 명단 수 : " + Ryesterday7list);				
		
		//가게 8일전 가입 수 
		int Ryesterday8list = restaurantService.RgetTotal8YesterdayNo();
		model.addAttribute("RYesterday8Nolist", Ryesterday8list);
//		System.out.println("8일전 명단 수 : " + Ryesterday8list);				
		
		//가게 9일전 가입 수 
		int Ryesterday9list = restaurantService.RgetTotal9YesterdayNo();
		model.addAttribute("RYesterday9Nolist", Ryesterday9list);
//		System.out.println("9일전 명단 수 : " + Ryesterday9list);			
		
		return "admin/main";
	}
	
	//회원 명단 삭제
	@GetMapping("/cmemberdelete.do")
	public String cmemberDelete(String mid) {
		customerService.deleteCMember(mid);
		return "redirect:/admin/mainviewbox1_1.do";
	}
	
	//레스토랑 명단 삭제
	@GetMapping("/rmemberdelete.do")
	public String rmemberDelete(String rid) {
		restaurantService.deleteRMember(rid);
		return "redirect:/admin/mainviewbox1_2.do";
	}
	
	//관리자 로그인 페이지 이동
	@GetMapping("/adminlogin.do")
	public String adminlogin() {
		return "admin/adminlogin";
	} 	
	
	//문자 메세지 페이지 이동 (현재 admin.jsp에서 대신 역할 수행 중)
	@RequestMapping("/index.do")
	public String index() {
		return "admin/index";
	} 
	
	//문자 메세지 요청 페이지 이동
	@RequestMapping("/smssend.do")
	public String smssend() {
		return "admin/smssend";
	}	

	//canvas1
	@RequestMapping("/canvas.do")
	public String canvas() {
		return "admin/canvas";
	}	

	//canvas2
	@RequestMapping("/canvas2.do")
	public String canvas2() {
		return "admin/canvas2";
	}	
	
	//차트 예제2
	@RequestMapping("/zzz.do")
	public String zzz() {
		return "admin/zzz";
	}	
	
	//움직이는 트랙
	@RequestMapping("/movetrack.do")
	public String movetrack() {
		return "admin/movetrack";
	}	
	
	//jsp분할-----------------------------------------------
	
	
	//차트 페이지 1~3
	//mainviewbox1_1
	@GetMapping("/mainviewbox1_1.do")
	public String mainviewbox1_1(@RequestParam(defaultValue="1") int pageNo, 
			 			@RequestParam(defaultValue="10") int rowsPerPage, 
			 			Model model,HttpSession session) {
		// Pager
		Pager pager = new Pager(rowsPerPage, 5 ,customerService.getTotalAdboardNo(), pageNo);
		model.addAttribute("pager",pager);
		session.setAttribute("pager", pager);
		
		List<Cmember> list = customerService.getList(pageNo, rowsPerPage);
		model.addAttribute("cmemberlist", list);

		return "admin/mainviewbox1_1";
	}	
	
	//mainviewbox1_2
	@GetMapping("/mainviewbox1_2.do")
	public String mainviewbox1_2(@RequestParam(defaultValue="1") int pageNo1, 
 								@RequestParam(defaultValue="10") int rowsPerPage1,
 								Model model,HttpSession session) {		
		// Pager
		Pager1 pager1 = new Pager1(rowsPerPage1, 5 ,restaurantService.getTotalAdboardNo(), pageNo1);
		model.addAttribute("pager1", pager1);
		session.setAttribute("pager1", pager1);
		
		List<Rmember> list1 = restaurantService.getList(pageNo1, rowsPerPage1);
		model.addAttribute("rmemberlist", list1);

		return "admin/mainviewbox1_2";
	}		
	
	//mainviewbox1_3	(현재 임시용 리스트1 가지고옴)
	@GetMapping("/mainviewbox1_3.do")
	public String mainviewbox1_3(@RequestParam(defaultValue="1") int pageNo, 
			 			@RequestParam(defaultValue="10") int rowsPerPage, 
			 			Model model,HttpSession session) {
		// Pager
		Pager pager = new Pager(rowsPerPage, 5 ,customerService.getTotalAdboardNo(), pageNo);
		model.addAttribute("pager",pager);
		session.setAttribute("pager", pager);
		
		List<Cmember> list = customerService.getList(pageNo, rowsPerPage);
		model.addAttribute("cmemberlist", list);

		return "admin/mainviewbox1_3";
	}	
		
	
	//mainviewbox2
	@RequestMapping("/mainviewbox2.do")
	public String mainviewbox2(Model model,HttpSession session) {		
		//회원-----------------------------------------------------------------------				
		//회원 오늘 가입 수 
		int todaylist = customerService.getTotalTodayNo();
		model.addAttribute("TodayNolist", todaylist);
		//회원 어제 가입 수
		int yesterdaylist = customerService.getTotalYesterdayNo();
		model.addAttribute("Yesterday1Nolist", yesterdaylist);
		//회원 2일전 가입 수 
		int yesterday2list = customerService.getTotal2YesterdayNo();
		model.addAttribute("Yesterday2Nolist", yesterday2list);
		//회원 3일전 가입 수 
		int yesterday3list = customerService.getTotal3YesterdayNo();
		model.addAttribute("Yesterday3Nolist", yesterday3list);
		//회원 4일전 가입 수 
		int yesterday4list = customerService.getTotal4YesterdayNo();
		model.addAttribute("Yesterday4Nolist", yesterday4list);
		//회원 5일전 가입 수 
		int yesterday5list = customerService.getTotal5YesterdayNo();
		model.addAttribute("Yesterday5Nolist", yesterday5list);
		//회원 6일전 가입 수 
		int yesterday6list = customerService.getTotal6YesterdayNo();
		model.addAttribute("Yesterday6Nolist", yesterday6list);
		//회원 7일전 가입 수 
		int yesterday7list = customerService.getTotal7YesterdayNo();
		model.addAttribute("Yesterday7Nolist", yesterday7list);
		//회원 8일전 가입 수 
		int yesterday8list = customerService.getTotal8YesterdayNo();
		model.addAttribute("Yesterday8Nolist", yesterday8list);
		//회원 9일전 가입 수 
		int yesterday9list = customerService.getTotal9YesterdayNo();
		model.addAttribute("Yesterday9Nolist", yesterday9list);
		//가게-----------------------------------------------------------------------	
		//가게 오늘 등록 수 
		int Rtodaylist = restaurantService.RgetTotalTodayNo();
		model.addAttribute("RTodayNolist", Rtodaylist);
		//가게 어제 가입 수
		int Ryesterdaylist = restaurantService.RgetTotalYesterdayNo();
		model.addAttribute("RYesterday1Nolist", Ryesterdaylist);

		//가게 2일전 가입 수 
		int Ryesterday2list = restaurantService.RgetTotal2YesterdayNo();
		model.addAttribute("RYesterday2Nolist", Ryesterday2list);
		//가게 3일전 가입 수 
		int Ryesterday3list = restaurantService.RgetTotal3YesterdayNo();
		model.addAttribute("RYesterday3Nolist", Ryesterday3list);
		//가게 4일전 가입 수 
		int Ryesterday4list = restaurantService.RgetTotal4YesterdayNo();
		model.addAttribute("RYesterday4Nolist", Ryesterday4list);
		//가게 5일전 가입 수 
		int Ryesterday5list = restaurantService.RgetTotal5YesterdayNo();
		model.addAttribute("RYesterday5Nolist", Ryesterday5list);
		//가게 6일전 가입 수 
		int Ryesterday6list = restaurantService.RgetTotal6YesterdayNo();
		model.addAttribute("RYesterday6Nolist", Ryesterday6list);
		//가게 7일전 가입 수 
		int Ryesterday7list = restaurantService.RgetTotal7YesterdayNo();
		model.addAttribute("RYesterday7Nolist", Ryesterday7list);
		//가게 8일전 가입 수 
		int Ryesterday8list = restaurantService.RgetTotal8YesterdayNo();
		model.addAttribute("RYesterday8Nolist", Ryesterday8list);
		//가게 9일전 가입 수 
		int Ryesterday9list = restaurantService.RgetTotal9YesterdayNo();
		model.addAttribute("RYesterday9Nolist", Ryesterday9list);
		return "admin/mainviewbox2";
	}			
	
	//mainviewbox3
	@RequestMapping("/mainviewbox3.do")
	public String mainviewbox3() {
		return "admin/mainviewbox3";
	}			
	
	//mainviewbox4
	@RequestMapping("/mainviewbox4.do")
	public String mainviewbox4() {
		return "admin/mainviewbox4";
	}			
	
	//mainviewbox5
	@RequestMapping("/mainviewbox5.do")
	public String mainviewbox5() {
		return "admin/mainviewbox5";
	}			
	
	//mainviewbox6
	@RequestMapping("/mainviewbox6.do")
	public String mainviewbox6() {
		return "admin/mainviewbox6";
	}			
	
	//mainviewbox7
	@RequestMapping("/mainviewbox7.do")
	public String mainviewbox7() {
		return "admin/mainviewbox7";
	}			
	
	//mainviewbox8
	@RequestMapping("/mainviewbox8.do")
	public String mainviewbox8() {
		return "admin/mainviewbox8";
	}		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
