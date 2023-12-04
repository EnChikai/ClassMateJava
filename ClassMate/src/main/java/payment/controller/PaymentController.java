package payment.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import payment.service.face.PaymentService;

@Controller
@PropertySource("classpath:/config.properties")
public class PaymentController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private PaymentService paymentService;
	
	@GetMapping("/payment/basket")
	public void basketGet(

			Model model
			, HttpSession session
			, Map<String, Object> map
			, @Value("${spring.datasource.init}") String init
			
			) {
		logger.info("/payment/basket [GET]");
		
//		로그인 구현 이후 사용
		if(session.getAttribute("userNo") != null) {
			logger.info("{}",session.getAttribute("userNo"));
			int userNo = (int) session.getAttribute("userNo");
			
			map = paymentService.selectBasket(userNo);
			logger.info("user:{}",map.get("userInfo"));
			logger.info("classList:{}",map.get("classList"));
			logger.info("classListSize:{}",map.get("classListSize"));
			
			model.addAttribute("userInfo",map.get("userInfo"));
			model.addAttribute("classList",map.get("classList"));
			model.addAttribute("paymentSum",map.get("paymentSum"));
			model.addAttribute("classListSize",map.get("classListSize"));
			model.addAttribute("init", init);
		}
		
	}
	
	@PostMapping("/payment/basket")
	public String basketPost(
		
			int classNo	
			, HttpSession session
			
			) {
		logger.info("/payment/basket [Post] : {}", classNo);
		
		logger.info("{}",session.getAttribute("userNo"));
		int userNo = (int) session.getAttribute("userNo");
		
		//test용
//		int userNo = 4;
				
		int result = paymentService.deleteBasket(classNo, userNo);
		logger.info("result : {}", result);
		
		return "redirect:/payment/basket";
		
	}
	
	@GetMapping("/payment/insertInfo")
	public String insertInfoGet(
			
			String merchantUid
			
			) {
		logger.info("/payment/insertInfo [Get]");
		
		
	return "redirect:/payment/success?merchantUid="+merchantUid;
	}
	
	@PostMapping("/payment/insertInfo")
	@ResponseBody
	public int insertInfoPost(
			
			String merchantUid
			, String provider
			, String payMethod
			, String cardName
			, @RequestParam(value="classNo")int[] classNo
			, HttpSession session
			, Model model
			
			) {
		logger.info("/payment/insertInfo [Post]");
		logger.info("merchantUid: {}",merchantUid);
		logger.info("card: {}",payMethod);
		logger.info("provider: {}",provider);
		logger.info("cardName: {}",cardName);
		logger.info("classNo[]: {}",classNo);
		
		
		int result = paymentService.insertOrderPayment(session.getAttribute("userNo"), merchantUid, payMethod, provider, cardName, classNo);
		logger.info("result: {}",result);
		
		return result;
		
	}
	
	@GetMapping("/payment/success")
	public void paymentSuccessGet(
		
			String merchantUid
			, Model model
			
			) {
		logger.info("/payment/success [GET] : {}",merchantUid);
		
		Map<String, Object> map = paymentService.selectSuccecInfo(merchantUid);
		logger.info("map {}",map);
		
		model.addAttribute("checkUid",map.get("checkUid"));
		model.addAttribute("paymentSum",map.get("paymentSum"));
		model.addAttribute("paymentVat",map.get("paymentVat"));
		model.addAttribute("nameList",map.get("nameList"));
		
	}
	
	@GetMapping("/payment/fail")
	public void paymentFailGet() {
		logger.info("/payment/fail [GET] : ");
		
		
		
	}
	
}