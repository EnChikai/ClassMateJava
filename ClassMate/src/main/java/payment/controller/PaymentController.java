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
//		int userNo = session.getAttribute("userNo");
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
			
			String email
			, String name
			, String phone
			, long orderNo
			, String card
			, String provider
			, String cardName
			
			) {
		logger.info("/payment/basket [Post]");
		logger.info("email: {}",email);
		logger.info("phone: {}",phone);
		logger.info("orderNo: {}",orderNo);
		logger.info("card: {}",card);
		logger.info("provider: {}",provider);
		logger.info("cardName: {}",cardName);
//		logger.info("classNo: {}",classNo);
//		logger.info("classNo[0]: {}",classNo[0]);
		
	}
	
	@GetMapping("/payment/success")
	public void paymentSuccessGet(
			
			) {
		logger.info("/payment/success [GET]");

		
	}
	
	
}