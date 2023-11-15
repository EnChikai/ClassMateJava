package payment.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import payment.service.face.PaymentService;

@Controller
public class PaymentController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private PaymentService paymentService;
	
	@GetMapping("/payment/basket")
	public void basketGet(

			Model model
			, HttpSession session
			, Map<String, Object> map
			
			) {
		logger.info("/payment/basket [GET]");
		
		//로그인 구현 이후 사용
//		logger.info("{}",session.getAttribute("userNo"));
//		int userNo = (int) session.getAttribute("userNo");
		
		//test용
		int userNo = 4;
		
		map = paymentService.selectBasket(userNo);
		logger.info("user:{}",map.get("userInfo"));
		logger.info("classList:{}",map.get("classList"));
		logger.info("classListSize:{}",map.get("classListSize"));
		
		model.addAttribute("userInfo",map.get("userInfo"));
		model.addAttribute("classList",map.get("classList"));
		model.addAttribute("paymentSum",map.get("paymentSum"));
		model.addAttribute("classListSize",map.get("classListSize"));
		
	}
	
	@PostMapping("/payment/basket")
	public void basketPost(
			
			
			) {
		logger.info("/payment/basket [Post]");
		
	}
	
	@GetMapping("/payment/insertInfo")
	public String insetInfoGet(
			
			) {
		logger.info("/payment/insetInfo [Get]");
		
		
		return "redirect:/payment/success";
	}
	
	@PostMapping("/payment/insertInfo")
	@ResponseBody
	public void insetInfoPost(
			
			long merchantUid
			, String provider
			, String payMethod
			, String cardName
			, @RequestParam(value="classNo")int[] classNo
			, HttpSession session
			, Model model
			
			) {
		logger.info("/payment/insetInfo [Post]");
		logger.info("merchantUid: {}",merchantUid);
		logger.info("card: {}",payMethod);
		logger.info("provider: {}",provider);
		logger.info("cardName: {}",cardName);
		logger.info("classNo[]: {}",classNo);
		
		
		int result = paymentService.insertOrderPayment(session.getAttribute("userNo"), merchantUid, payMethod, provider, cardName, classNo);
		logger.info("result: {}",result);
		
	}
	
	@GetMapping("/payment/success")
	public void paymentSuccessGet(
		
		HttpSession session
			
			) {
		logger.info("/payment/success [GET]");
		
		//로그인 구현 이후 사용
//		logger.info("{}",session.getAttribute("userNo"));
//		int userNo = (int) session.getAttribute("userNo");
		
		//test용
		int userNo = 4;
		
//		Map<String, Object> map = paymentService.selectSuccecInfo(userNo);
//		logger.info("map {}",map);
		

	}
	
}