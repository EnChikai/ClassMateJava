package payment.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import payment.service.face.PaymentService;

@Controller
public class PaymentController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private PaymentService paymentService;
	
	@GetMapping("/payment/basket")
	public void basketGet(

			Model model
			, HttpSession session
			, Map map
			
			) {
		logger.info("/payment/basket [GET]");
		
		//로그인 구현 이후 사용
//		int userNo = session.getAttribute("userNo");
		int userNo = 1;
		
//		Map<String, Object> map = paymentService.selectBasket(userNo);
		
		
		
	}
	
}
