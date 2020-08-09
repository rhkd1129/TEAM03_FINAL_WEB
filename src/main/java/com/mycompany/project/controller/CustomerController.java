package com.mycompany.project.controller;


import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.model.BeforeOrder;
import com.mycompany.project.model.CloginForm;
import com.mycompany.project.model.Cmember;
import com.mycompany.project.model.Comment;
import com.mycompany.project.model.Fnb;
import com.mycompany.project.model.OrderReceipt;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.CustomerService;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/customer")
public class CustomerController{
	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerController.class);
	private OrderReceipt globalOr;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private RestaurantService restaurantService;

	@RequestMapping("/customer_main.do")
	public String main() {
		return "customer/customer_main";
	}
	
	@GetMapping("/customer_order_details.do")
	public String orderDetails() {
		return "customer/customer_order_details";
	}
	
	@GetMapping("/customer_login.do")
	public String loginForm(CloginForm cloginForm) {
		return "customer/customer_login";
	}

	@PostMapping("/customer_login.do")
	public String login(CloginForm cloginForm, BindingResult bindingResult,
						HttpServletResponse response, HttpSession session) throws Exception {

		String mid = cloginForm.getMid();
		int loginResult = customerService.login(cloginForm);
		String returnPage = "customer/customer_login";

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if(bindingResult.hasErrors()) {
			return returnPage;
		}

		if (loginResult == CustomerService.LOGIN_SUCCESS) {
			String loginLock = customerService.getLoginLock(cloginForm);
			System.out.println(loginLock);

			String latestLoginTryDate = customerService.getLoginTryDate(cloginForm);

			java.sql.Timestamp latestTryDate = java.sql.Timestamp.valueOf(latestLoginTryDate);

			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(latestTryDate.getTime());
			cal.add(Calendar.SECOND, 600);
			Timestamp latestTryDate10 = new Timestamp(cal.getTime().getTime());

			SimpleDateFormat latestTryDate10Format = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
			String Date10Format =  latestTryDate10Format.format(latestTryDate10);

			long nowTime = System.currentTimeMillis();
			Timestamp currentTime = new Timestamp(nowTime);
			boolean timeCompare = currentTime.after(latestTryDate10);

			if (loginLock.equals("N")) {
				session.setAttribute("sessionMid", cloginForm.getMid());

				customerService.resetLoginLock(mid);

				returnPage = "redirect:/customer/customer_main.do";

			}

			if (loginLock.equals("Y") && timeCompare == true) {
				session.setAttribute("sessionMid", cloginForm.getMid());

				customerService.resetLoginLock(mid);

				returnPage = "redirect:/customer/customer_main.do";

			}

			if (loginLock.equals("Y") && timeCompare == false) {
				customerService.loginFailCount(mid);

				out.println("<script>alert('아직 10분이 지나지 않았습니다.\\n" + Date10Format + " 이후에 로그인이 가능합니다.');</script>");
				out.flush();

				return "customer/customer_login";
			}

		} else if (loginResult == CustomerService.LOGIN_MID_FAIL) {
			out.println("<script>alert('아이디를 확인해주세요.');</script>");
			out.flush();
			bindingResult.rejectValue("mid", "login.mid.fail");
			// returnPage = "customer/customer_login";
			return returnPage;

		} else if (loginResult == CustomerService.LOGIN_MAPSSWORD_FAIL) {
			customerService.loginFailCount(mid);
			int failCount = customerService.getFailCount(cloginForm);

			if (failCount < 5) {
			out.println("<script>alert('비밀번호를 (" + failCount + "/5)회 틀렸습니다.\\n5회 이상 틀릴 경우, 10분간 로그인을 할 수 없습니다.');</script>");
			out.flush();

			}

			if (failCount >= 5) {
				customerService.loginLock(mid);

				out.println("<script>alert('비밀번호 오류 횟수 초과로 인해, 10분간 로그인을 할 수 없습니다.');</script>");
				out.flush();
				// out.close();
			}

			System.out.println(failCount);

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
		String mid = cmember.getMid();
		customerService.join(cmember);
		customerService.loginTryDate(mid);
		return "redirect:/customer/customer_main.do";
	}
	
	@PostMapping("/customer_r_review.do")
	public String comment(ModelMap model, Comment comment, HttpSession session) {
		String cmid = (String)session.getAttribute("sessionMid");	
		comment.setCmid(cmid);
		
		customerService.insertComment(comment);
		
		return "redirect:/customer/customer_r_info.do?rno=1";
	}
	
	@GetMapping("/customer_r_review.do")
	public String review(HttpSession session, int rno, Model model, Comment comment, OrderReceipt orderReceipt) {
		double averageRating = customerService.averageRating(comment);
		double avgRating = (Math.round(averageRating*10)/10.0);
		
		String mid = (String) session.getAttribute("sessionMid");
		
		System.out.println(averageRating);
		System.out.println(avgRating);
		comment.setCavgrating(avgRating);
		
		List<Comment> list = new ArrayList<>();
		list = customerService.reviewList(comment);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		List<OrderReceipt> menuList = customerService.getMenuList(mid);
		
		System.out.println(menuList);
		model.addAttribute("menuList", menuList);
		
		return "customer/customer_r_review";
	}

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
	public String search(String roadAddr, String bdNm, String siNm, String emdNm,  Model model, HttpSession session) {
		String fullAddr = roadAddr + " " + bdNm;
		List<Rmember> list = restaurantService.getRestaurantList(siNm, emdNm);
		session.setAttribute("fullAddr", fullAddr);
		model.addAttribute("restaurantList", list);
		LOGGER.info("실행");
		LOGGER.info("" + list);

		return "customer/customer_search";

	}

	@GetMapping("/customer_r_info.do")
	public String detail(int rno, Model model) {
		Rmember rmember = restaurantService.getRestaurantInfoByRno(rno);
		model.addAttribute("rno", rno);
		model.addAttribute("rmember", rmember);
		return "customer/customer_r_info";
	}

	@GetMapping("/customer_r_menu.do")
	public String menu(int rno, Model model) {

		List<Fnb> foodList = restaurantService.getFoodListByFrno(rno);
		List<Fnb> beverageList = restaurantService.getBeverageListByFrno(rno);
		model.addAttribute("foodList", foodList);
		model.addAttribute("beverageList", beverageList);
		return "customer/customer_r_menu";
	}

	@GetMapping("/customer_order_table.do")
	public String orderTable(Model model, HttpSession session) {
		String bmid = (String) session.getAttribute("sessionMid");
		List<BeforeOrder> list = customerService.getOrderTable(bmid);
		model.addAttribute("orderTableList", list);
		return "customer/customer_order_table";
	}
	
	@GetMapping("/customer_insert_order_table.do")
	public String insertOrderTable(int fno, int rno, Model model, HttpSession session) {
		Fnb fnb = customerService.getFnbByFno(fno);
		BeforeOrder beforeOrder = new BeforeOrder();
		String bmid = (String) session.getAttribute("sessionMid");
		beforeOrder.setBmid(bmid);
		beforeOrder.setBrno(rno);
		beforeOrder.setBfname(fnb.getFname());
		beforeOrder.setBfprice(fnb.getFprice());
		customerService.addOrderTable(beforeOrder);

		
		
		return "redirect:/customer/customer_order_table.do";
	}
	
	@GetMapping("/customer_delete_order_table.do")
	public String deleteOrderTable(int bno) {
		
		customerService.removeOrderTable(bno);
		
		return "redirect:/customer/customer_order_table.do";
	}
	
	@GetMapping("/customer_payment.do")
	public String payment(int rno, Model model, HttpSession session) {
		String bmid = (String) session.getAttribute("sessionMid");
		List<BeforeOrder> list = customerService.getOrderTable(bmid);
		model.addAttribute("rno", rno);
		model.addAttribute("orderTableList", list);
		return "customer/customer_payment";
	}
	
	@PostMapping("/customer_kakaopay.do")
	public String checkOut(HttpServletRequest request, HttpServletResponse response, HttpSession session, OrderReceipt orderReceipt) {
		String omid = (String) session.getAttribute("sessionMid");
		orderReceipt.setOmid(omid);
		
		globalOr = orderReceipt;
		
		int totalPrice = orderReceipt.getOtotalprice();
		request.setAttribute("totalPrice", totalPrice);
		
 		
		return "customer/customer_kakaopay";
	}
	
	
	@GetMapping("/customer_payment_success.do")
	public String paymentSuccess(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		String omid = (String) session.getAttribute("sessionMid");
		customerService.makeOrderInfo(globalOr);
		int ono = customerService.getOnoByOmid(omid);
		customerService.setOnoAtBo(ono, omid);
		
		return "customer/customer_payment_success";
	}
	
	
}
