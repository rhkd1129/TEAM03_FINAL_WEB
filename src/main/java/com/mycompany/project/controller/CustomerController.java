package com.mycompany.project.controller;


import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

		// 자바에서 자바스크립트 문법을 사용하기 위해 써 준 코드
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(bindingResult.hasErrors()) {
			return returnPage;
		}

		if (loginResult == CustomerService.LOGIN_SUCCESS) {
			// 로그인 잠금이 Y인지 N인지 받아오는 코드(비밀번호를 여러번 틀리면 일정 시간 로그인 금지를 시키기 위해)
			String loginLock = customerService.getLoginLock(cloginForm);
			System.out.println(loginLock);
			
			// 가장 최근 로그인 시도 시각을 받아오는 코드
			String latestLoginTryDate = customerService.getLoginTryDate(cloginForm);
			
			// 받아온 최근 로그인 시도 시각을 Timestamp 타입으로 변형하는 코드
			java.sql.Timestamp latestTryDate = java.sql.Timestamp.valueOf(latestLoginTryDate);
			
			// 최근 로그인 시도 시각에서 10분을 더한 다음, Timestamp 타입으로 변형하는 코드 
			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(latestTryDate.getTime());
			cal.add(Calendar.SECOND, 600);
			Timestamp latestTryDate10 = new Timestamp(cal.getTime().getTime());
			
			// 10분을 더한 시간의 출력 형식을 바꿔주는 코드
			SimpleDateFormat latestTryDate10Format = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
			String Date10Format =  latestTryDate10Format.format(latestTryDate10);
			
			// 시스템 상의 현재 시간을 구해서 Timestamp 타입으로 변형하는 코드
			long nowTime = System.currentTimeMillis();
			Timestamp currentTime = new Timestamp(nowTime);
			
			// 10분을 더한 시간과 현재 시간을 비교해서 현재 시간이 10분을 더한 시간보다 더 지나있으면 true, 현재 시간 기준으로 아직 10분이 지나지 않았으면 false
			boolean timeCompare = currentTime.after(latestTryDate10);
			
			// 로그인이 잠금이 N이면 로그인 성공
			if (loginLock.equals("N")) {
				session.setAttribute("sessionMid", cloginForm.getMid());

				customerService.resetLoginLock(mid);

				returnPage = "redirect:/customer/customer_main.do";

			}
			
			// 로그인이 금지되었더라도 금지된지 10분이 지났으면 로그인 성공시키고 잠금을 리셋
			if (loginLock.equals("Y") && timeCompare == true) {
				session.setAttribute("sessionMid", cloginForm.getMid());

				customerService.resetLoginLock(mid);

				returnPage = "redirect:/customer/customer_main.do";

			}
			
			// 로그인이 금지되었고 금지된지도 아직 10분이 지나지 않았으면 경고창 띄움
			if (loginLock.equals("Y") && timeCompare == false) {
				customerService.loginFailCount(mid);

				out.println("<script>alert('아직 10분이 지나지 않았습니다.\\n" + Date10Format + " 이후에 로그인이 가능합니다.');</script>");
				out.flush();

				return "customer/customer_login";
			}
			
			// 아이디 틀려서 로그인 실패
		} else if (loginResult == CustomerService.LOGIN_MID_FAIL) {
			out.println("<script>alert('아이디를 확인해주세요.');</script>");
			out.flush();
			
			// 아이디 틀렸다는 에러 메시지 출력
			bindingResult.rejectValue("mid", "login.mid.fail");
			// returnPage = "customer/customer_login";
			return returnPage;
			
			// 비밀번호 틀려서 로그인 실패
		} else if (loginResult == CustomerService.LOGIN_MAPSSWORD_FAIL) {
			
			// 로그인 실패 횟수 증가시키고 실패 횟수 받아옴
			customerService.loginFailCount(mid);
			int failCount = customerService.getFailCount(cloginForm);
			
			// 실패 횟수가 5 미만일 경우
			if (failCount < 5) {
			out.println("<script>alert('비밀번호를 (" + failCount + "/5)회 틀렸습니다.\\n5회 이상 틀릴 경우, 10분간 로그인을 할 수 없습니다.');</script>");
			out.flush();

			}
			
			// 실패 횟수가 5 이상일 경우, 로그인을 금지시키고 경고 메시지 출력
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
	
	@PostMapping("/customer_mobile_login.do")
	public String mobileLogin(CloginForm cloginForm, BindingResult bindingResult,
						HttpServletResponse response, HttpSession session) throws Exception {

		String mid = cloginForm.getMid();
		int loginResult = customerService.login(cloginForm);
		String returnPage = "customer/customer_mobile_login";

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

				returnPage = "redirect:/customer/customer_mobile_main.do";

			}

			if (loginLock.equals("Y") && timeCompare == true) {
				session.setAttribute("sessionMid", cloginForm.getMid());

				customerService.resetLoginLock(mid);

				returnPage = "redirect:/customer/customer_mobile_main.do";

			}

			if (loginLock.equals("Y") && timeCompare == false) {
				customerService.loginFailCount(mid);

				out.println("<script>alert('아직 10분이 지나지 않았습니다.\\n" + Date10Format + " 이후에 로그인이 가능합니다.');</script>");
				out.flush();

				return "customer/customer_mobile_login";
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
		LOGGER.info("111로거");
		String mid = cmember.getMid();
		customerService.join(cmember);
		customerService.loginTryDate(mid);
		return "redirect:/customer/customer_main.do";
	}
	
	@PostMapping("/customer_r_review.do")
	public String comment(ModelMap model, Comment comment, HttpSession session) {
		
		// 리뷰에 글을 작성할 때, 로그인한 아이디 정보를 저장하기 위한 코드
		String cmid = (String)session.getAttribute("sessionMid");	
		comment.setCmid(cmid);
		
		customerService.insertComment(comment);
		
		return "redirect:/customer/customer_r_info.do?rno=1";
	}
	
	@GetMapping("/customer_r_review.do")
	public String review(HttpSession session, int rno, Model model, Comment comment, OrderReceipt orderReceipt) {
		
		// 평균 별점을 소숫점 2번째 자리에서 반올림
		double averageRating = customerService.averageRating(comment);
		double avgRating = (Math.round(averageRating*10)/10.0);
		
		String mid = (String) session.getAttribute("sessionMid");
		
		System.out.println(averageRating);
		System.out.println(avgRating);
		comment.setCavgrating(avgRating);
		
		List<Comment> list = new ArrayList<>();
		list = customerService.reviewList(comment);
		
		model.addAttribute("list", list);
		
		List<OrderReceipt> menuList = customerService.getMenuList(mid);
		
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
		LOGGER.info("장바구니");
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
		LOGGER.info("결제할거야");
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
	public String paymentSuccess(Model model, HttpSession session) {
		String omid = (String) session.getAttribute("sessionMid");
		customerService.makeOrderInfo(globalOr);
		int ono = customerService.getOnoByOmid(omid);
		customerService.setOnoAtBo(ono, omid);
		
		int rno = globalOr.getOrno();
		String rtitle = customerService.getRtitleByRno(rno);
		model.addAttribute("rtitle", rtitle);
		
		
		return "customer/customer_payment_success";
	}
	
	@RequestMapping("/customer_mobile_main.do")
	public String mobileMain() {
		return "customer/customer_mobile_main";
	}
	@RequestMapping("/customer_mobile_main1.do")
	public String mobileMain1() {
		return "customer/customer_mobile_main1";
	}
	
	@RequestMapping("/customer_mobile_searchlist.do")
	public String mobileSearchList() {
		return "customer/customer_mobile_searchlist";
	}
	
	@GetMapping("/customer_mobile_restaurantlist.do")
	public String mobileRestaurantList(String roadAddr, String bdNm, String siNm, String emdNm,  Model model, HttpSession session) {
		String fullAddr = roadAddr + " " + bdNm;
		List<Rmember> list = restaurantService.getRestaurantList(siNm, emdNm);
		session.setAttribute("fullAddr", fullAddr);
		model.addAttribute("restaurantList", list);
		LOGGER.info("실행");
		LOGGER.info("" + list);

		return "customer/customer_mobile_restaurantlist";
	}
	
	@GetMapping("/customer_mobile_restaurantlink.do")
	public String mobileRestaurantLink(Model model, Rmember rmember, HttpSession session) {
		List<Rmember> list = restaurantService.getRestaurantLink(rmember);
		model.addAttribute("restaurantList", list);

		return "customer/customer_mobile_restaurantlist";
	}
	
	@GetMapping("/customer_mobile_login.do")
	public String mobileLoginForm(CloginForm cloginForm) {
		return "customer/customer_mobile_login";
	}
	
	@GetMapping("/customer_mobile_logout.do")
	public String mobileLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/customer/customer_mobile_main.do";
	}
	
	@GetMapping("/customer_mobile_orderreviewmain.do")
	public String orderReviewMain(int rno, Model model) {
		Rmember rmember = restaurantService.getRestaurantInfoByRno(rno);
		model.addAttribute("rno", rno);
		model.addAttribute("rmember", rmember);
		LOGGER.info("" + rno);
		return "customer/customer_mobile_orderreviewmain";
	}
	
	@GetMapping("/customer_mobile_order.do")
	public String mobileMenu(int rno, Model model) {
		List<Fnb> foodList = restaurantService.getFoodListByFrno(rno);
		List<Fnb> beverageList = restaurantService.getBeverageListByFrno(rno);
		model.addAttribute("foodList", foodList);
		model.addAttribute("beverageList", beverageList);
		
		return "customer/customer_mobile_order";
	}
	
	@GetMapping("/customer_mobile_review.do")
	public String mobileReview(HttpSession session, int rno, Model model, Comment comment, OrderReceipt orderReceipt) {
		LOGGER.info("리뷰컨트롤러도착");
		double averageRating = customerService.averageRating(comment);
		double avgRating = (Math.round(averageRating*10)/10.0);
		
		String mid = (String) session.getAttribute("sessionMid");
		
		comment.setCavgrating(avgRating);
		
		List<Comment> list = new ArrayList<>();
		list = customerService.reviewList(comment);
		
		model.addAttribute("list", list);
		
		List<OrderReceipt> menuList = customerService.getMenuList(mid);

		model.addAttribute("menuList", menuList);
		LOGGER.info("이이잉");
		
		return "customer/customer_mobile_review";
	}
	
	@GetMapping("/customer_mobile_basket.do")
	public String mobileBasket(int rno, Model model, HttpSession session) {
		String bmid = (String) session.getAttribute("sessionMid");
		List<BeforeOrder> list = customerService.getOrderTable(bmid);
		model.addAttribute("orderTableList", list);
		model.addAttribute("rno", rno);
		
		return "customer/customer_mobile_basket";
	}
	
	@GetMapping("/customer_mobile_insertorder.do")
	public String mobileInsertOrder(int fno, int rno, Model model, HttpSession session) {
		LOGGER.info("장바구니");
		Fnb fnb = customerService.getFnbByFno(fno);
		BeforeOrder beforeOrder = new BeforeOrder();
		String bmid = (String) session.getAttribute("sessionMid");
		beforeOrder.setBmid(bmid);
		beforeOrder.setBrno(rno);
		beforeOrder.setBfname(fnb.getFname());
		beforeOrder.setBfprice(fnb.getFprice());
		customerService.addOrderTable(beforeOrder);
		
		
		return "redirect:/customer/customer_mobile_basket.do?rno="+rno;
	}
	
	@GetMapping("/customer_mobile_deleteorder.do")
	public String mobileDeleteOrder(int bno, int rno) {
		customerService.removeOrderTable(bno);
		
		return "redirect:/customer/customer_mobile_basket.do?rno="+rno;
	}
	
	@GetMapping("/customer_mobile_payment.do")
	public String mobilePayment(int rno, Model model, HttpSession session) {
		LOGGER.info("결제할거야");
		String bmid = (String) session.getAttribute("sessionMid");
		List<BeforeOrder> list = customerService.getOrderTable(bmid);
		model.addAttribute("rno", rno);
		model.addAttribute("orderTableList", list);
		return "customer/customer_mobile_payment";
	}
	
	
	
}
