package com.mycompany.project.controller;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.project.model.Amember;
import com.mycompany.project.model.Fnb;
import com.mycompany.project.model.OrderReceipt;
import com.mycompany.project.model.RloginForm;
import com.mycompany.project.model.Rmember;
import com.mycompany.project.service.RestaurantService;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
   private static final Logger LOGGER = LoggerFactory.getLogger(RestaurantController.class); 
   
   @Autowired
   private RestaurantService restaurantService;
   
   @RequestMapping("/restaurant_main.do") 
   public String main(int rno, Model model) {
      model.addAttribute("rno", rno);
      
      return "restaurant/restaurant_main";
   }
   
   @GetMapping("/restaurant_login.do")
   public String loginForm(RloginForm rloginForm) {
      return "restaurant/restaurant_login";
   }
   
   @PostMapping("/restaurant_login.do")
   public String login(RloginForm rloginForm) {
      String rid = rloginForm.getRid();
      int rno = restaurantService.getRnoByRid(rid);
      return "redirect:/restaurant/restaurant_main.do?rno=" + rno;
   }
   
   @GetMapping("/restaurant_join.do")
   public String rjoinForm(Amember amember) {
      return "restaurant/restaurant_join";
   }
   
   @PostMapping("/restaurant_join.do")
   public String join(Amember amember) {
      restaurantService.join(amember);
      return "redirect:/restaurant/restaurant_login.do";
   }
   
   @GetMapping("/restaurant_order_queue.do")
   public String orderQueue(int rno, Model model) {
	  List<OrderReceipt> orderList = restaurantService.getOrderList(rno);
	  model.addAttribute("orderList", orderList);
      return "restaurant/restaurant_order_queue";
   }
   
   @GetMapping("/restaurant_order_takeover.do")
   public String takeOver(int ono, Model model) {
	   restaurantService.takeoverOrder(ono);
	   return "restaurant/restaurant_order_queue";
   }
   
   @GetMapping("/restaurant_order_processing.do")
   public String orderProcessing(int rno, Model model) {
	   	List<OrderReceipt> processingList = restaurantService.getProcessingList(rno);
		 model.addAttribute("processingList", processingList);
      return "restaurant/restaurant_order_processing";
   }
   
   @GetMapping("/restaurant_order_delivery_complete.do")
   public String deliveryComplete(int rno, int ono) {
	   restaurantService.completeOrder(ono);
	   
	   return "redirect:/restaurant/restaurant_order_processing.do?rno="+rno;
   }
   
   @GetMapping("/restaurant_order_complete.do")
   public String orderComplete() {
      return "restaurant/restaurant_order_complete";
   }
   
   @GetMapping("/restaurant_order_inquiry.do")
   public String orderInquiry() {
      return "restaurant/restaurant_order_inquiry";
   }
   
   @GetMapping("/restaurant_manage_menu.do")
   public String manageMenu(int rno, Model model) {
      int frno = rno;
      List<Fnb> foodList = restaurantService.getFoodListByFrno(frno);
      List<Fnb> beverageList = restaurantService.getBeverageListByFrno(frno);
      model.addAttribute("foodList", foodList);
      model.addAttribute("beverageList", beverageList);
      return "restaurant/restaurant_manage_menu";
   }
   
   @PostMapping("/restaurant_manage_menu.do")
   public String registerMenu(int frno, String fname, String fcategory, int fprice, MultipartFile fimage) throws Exception{
      
      Fnb fnb = new Fnb();
      fnb.setFrno(frno);
      fnb.setFcategory(fcategory);
      fnb.setFname(fname);
      fnb.setFprice(fprice);
      String saveDir = "C:/Temp/Images/Restaurant/menu/";
      String saveFileName = fimage.getOriginalFilename();
      String imageUrl = saveDir + fimage.getOriginalFilename();
      fnb.setFimage(imageUrl);
      File filePath = new File(saveDir + saveFileName);
      fimage.transferTo(filePath);
      LOGGER.info("실행");
      restaurantService.registerNewMenu(fnb);
      
      return "redirect:/restaurant/restaurant_manage_menu.do?rno="+frno;
   }
   
   @GetMapping("/restaurant_car_control.do")
   public String carControl() {
      return "restaurant/restaurant_car_control";
   }
}