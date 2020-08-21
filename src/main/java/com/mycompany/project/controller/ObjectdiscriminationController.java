package com.mycompany.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Omember;
import com.mycompany.project.model.Pager;
import com.mycompany.project.service.ObjectdiscriminationService;


@Controller
@RequestMapping("/Objectdiscrimination")
public class ObjectdiscriminationController {
	private static final Logger LOGGER =
			LoggerFactory.getLogger(ObjectdiscriminationController.class);

	@Autowired
	private ObjectdiscriminationService objectdiscriminationService;
	
	@RequestMapping("/firstlayout")
	public String firstlayout() {
		LOGGER.info("firstlayout 실행");						
		return "Objectdiscrimination/firstlayout";
	}

	//-------------------------------------------------------------------------
	@RequestMapping(value = "test.do")
	public String joinForm(Omember omember, Model model) {
		LOGGER.info("test joinForm 실행");					
		model.addAttribute("objectdiscrimination", omember);
		return "Objectdiscrimination/test";
	}
	
	@PostMapping(value = "test.do")
	public String join(Omember omember, HttpSession session)throws Exception {
		objectdiscriminationService.insert(omember);
		return "Objectdiscrimination/test";
	}	
	//-------------------------------------------------------------------------
	@RequestMapping(value = "fixlayout.do")
	public String fixlayoutForm(@RequestParam(defaultValue="1") int pageNo, 
					 			@RequestParam(defaultValue="5") int rowsPerPage, 
					 			Model model, HttpSession session,
					 			Omember omember
					 			) {
		LOGGER.info("test joinForm 실행");					
		model.addAttribute("objectdiscrimination", omember);
		
		// Pager1
		Pager pager = new Pager(rowsPerPage, 5 ,objectdiscriminationService.getTotalAdboardNo(), pageNo);
		model.addAttribute("pager",pager);
		session.setAttribute("pager", pager);
				
		List<Omember> list = objectdiscriminationService.getList(pageNo, rowsPerPage);
		model.addAttribute("omemberlist", list);
		return "Objectdiscrimination/fixlayout";
	}
	
	@PostMapping(value = "fixlayout.do")
	public String fixlayout(Omember omember, HttpSession session)throws Exception {
		objectdiscriminationService.insert(omember);
		return "Objectdiscrimination/fixlayout";
	}	
	
	@RequestMapping("/login")
	public String login() {
		LOGGER.info("login 실행");
		return "Objectdiscrimination/login";
	}	
	
	@RequestMapping("/jetson2")
	public String jetson2() {
		LOGGER.info("jetson2 실행");						
		return "Objectdiscrimination/jetson2";
	}	
	
	@RequestMapping("/jetson3")
	public String jetson3() {
		LOGGER.info("jetson3 실행");						
		return "Objectdiscrimination/jetson3";
	}	
}
