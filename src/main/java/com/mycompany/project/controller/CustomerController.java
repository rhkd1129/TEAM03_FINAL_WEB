package com.mycompany.project.controller;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.CloginForm;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.CustomerService;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private CustomerService customerService;

	@Autowired
	private RestaurantService restaurantService;

	@RequestMapping("/customer_main.do")
	public String main() {
		return "customer/customer_main";
	}

	@GetMapping("/customer_login.do")
	public String loginForm(CloginForm cloginForm) {
		return "customer/customer_login";
	}

	@PostMapping("/customer_login.do")
	public String login(CloginForm cloginForm, BindingResult bindingResult, HttpSession session) {

		int loginResult = customerService.login(cloginForm);
		String returnPage = "customer/customer_login";

		if(bindingResult.hasErrors()) {
			return returnPage;
		}

		if (loginResult == CustomerService.LOGIN_SUCCESS) {
			session.setAttribute("sessionMid", cloginForm.getMid());
			returnPage = "redirect:/customer/customer_main.do";
		} else if (loginResult == CustomerService.LOGIN_MID_FAIL) {
			LOGGER.info("dighdfkdj");
			bindingResult.rejectValue("mid", "login.mid.fail");
			// returnPage = "customer/customer_login";
			return returnPage;
		} else if (loginResult == CustomerService.LOGIN_MAPSSWORD_FAIL) {
			bindingResult.rejectValue("mpassword", "login.mpassword.fail");
			// returnPage = "customer/customer_login";
			return returnPage;
		}
		return returnPage;
	}

	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		LOGGER.info("아아아아아아아ㅏ아아ㅏ아앙");
		session.invalidate();
		return "redirect:/customer/customer_main.do";
	}

	@GetMapping("/customer_join.do")
	public String joinForm(Cmember cmember) {
		return "customer/customer_join";
	}

	@PostMapping("/customer_join.do")
	public String join(Cmember cmember) {
		customerService.join(cmember);
		return "redirect:/customer/customer_main.do";
	}


	// @ResponseBody
	@PostMapping("/idcheck.do")
	public void idCheck(String mid, HttpServletResponse response) throws Exception {
		LOGGER.info("로거거거거거거거거거거걱거ㅓ");
		String result = "overlapID";
		Cmember cmember = customerService.getCmember(mid);
		if (cmember == null) {
			result = "success";
		}

		response.setContentType("application/json; charset=UTF-8");

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		String json = jsonObject.toString();
		PrintWriter pw = response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
	}

	@GetMapping("/customer_search.do")
	public String search(String roadAddr, String bdNm, String siNm, String emdNm,  Model model) {
		String fullAddr = roadAddr + " " + bdNm;
		List<Rmember> list = restaurantService.getRestaurantList(siNm, emdNm);
		model.addAttribute("fullAddr", fullAddr);
		model.addAttribute("restaurantList", list);
		LOGGER.info("실행");
		LOGGER.info("" + list);

		return "customer/customer_search";

	}

}
