package payment.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import payment.dao.face.PaymentDao;
import payment.dto.Basket;
import payment.dto.OrderTb;
import payment.dto.Payment;
import payment.service.face.PaymentService;
import user.dto.UserInfo;
import lecture.dto.Class;

@Service
public class PaymentServiceImpl implements PaymentService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private PaymentDao paymentDao;
	
	@Override
	public Map<String, Object> selectBasket(int userNo) {
		logger.info("selectBasket(){}",userNo);
		
		UserInfo userInfo = paymentDao.selectUser(userNo);
		logger.info("user:{}",userInfo);
		
		List<Basket> basketList = paymentDao.getBasketUserNo(userNo);
		logger.info("basketList:{}",basketList);
		
		for(int i = 1; i<basketList.size(); i++) {
			logger.info("basketList.get("+i+"):{}",basketList.get(i));
		}
		
		List<Class> classList = new ArrayList<Class>();
		
		for(int i = 0; i<basketList.size(); i++) {
			classList.addAll(paymentDao.selectClassListByBasket(basketList.get(i))); 
		}
		logger.info("classList:{}",classList);
		
		int paymentSum = 0;
		for(int i = 0; i<classList.size(); i++) {
			paymentSum += classList.get(i).getExpense();
			logger.info("paymentSum:{}",paymentSum);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userInfo", userInfo);
		map.put("classList", classList);
		map.put("paymentSum", paymentSum);
		map.put("classListSize", classList.size());
		
		return map;
	}

	@Override
	public int insertOrderPayment(Object userNo, String merchantUid, String payMethod, String provider, String cardName,
			int[] classNo) {
		logger.info("insertOrderPayment()");
		Map<String, Object> map = new HashMap<String, Object>();
		OrderTb orderTb = new OrderTb();
		Payment payment = new Payment();
		Basket basket = new Basket();
		int result = 0;
		
//		테스트용 userNo
//		userNo = 4;
		
		logger.info("classNo.length:{}",classNo.length);

		for(int i = 0; i<classNo.length; i++) {
			orderTb.setUserNo((int) userNo);
			orderTb.setClassNo(classNo[i]);
			orderTb.setMerchantUid(merchantUid);
			logger.info("orderTb:{}",orderTb);
			
			result = paymentDao.insertOrderList(orderTb);
			logger.info("insertOrderList:{}",result);
			
			payment.setOrderNo(orderTb.getOrderNo());
			payment.setPayMethod(payMethod);
			payment.setProvider(provider);
			
			if(cardName.equals("") || cardName == null) {
				payment.setCardName("none");
			}else {
				payment.setCardName(cardName);
			}
			logger.info("payment:{}",payment);
			
			map.put("orderTb", orderTb);
			map.put("payment", payment);
			
			result = paymentDao.insertPaymentList(map);
			logger.info("PaymentList:{}",result);
			
			basket.setUserNo((int) userNo);
			basket.setClassNo(classNo[i]);
			
			result = paymentDao.deleteBasket(basket);
			logger.info("deleteBasket:{}",result);
		}
		
		return result;
	}

	@Override
	public Map<String, Object> selectSuccecInfo(String merchantUid) {
		logger.info("selectSuccecInfo:{}",merchantUid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<OrderTb> orderTbList = paymentDao.selectOrderList(merchantUid);
		List<Payment> paymentList = new ArrayList<Payment>();
		List<Class> nameList = new ArrayList<Class>();
		
		logger.info("selectOrder:{}",orderTbList);
		
		nameList = paymentDao.selectClassNoByMerchantUid(merchantUid);
		
		String checkUid = null;
		int paymentSum = 0;
		for (int i = 0; i < orderTbList.size(); i++) {
	        int orderIndex = i; // 새로운 변수를 사용
	        if (merchantUid.equals(orderTbList.get(orderIndex).getMerchantUid())) {
	            checkUid = merchantUid;
	        }
	        logger.info("checkUid:{}", checkUid);

	        paymentList = paymentDao.selectPaymentList(orderTbList.get(orderIndex).getOrderNo());
	        
	        if (!paymentList.isEmpty()) {
	            paymentSum += paymentList.get(0).getPayment();
	            logger.info("sum: {}", paymentSum);
	        }
	        
	    }
		
		for (int i = 0; i < nameList.size(); i++) {
		    List<Class> selectedClassList = paymentDao.selectClassNameListByOrder(nameList.get(i).getClassNo());
		    nameList.addAll(selectedClassList);
		    
		    for (Class selectedClass : selectedClassList) {
		        logger.info("nameList: {}", selectedClass.getClassName());
		    }
		}
		
		map.put("checkUid", checkUid);
		map.put("paymentSum", paymentSum);
		map.put("paymentVat", paymentSum/10);
		map.put("nameList",nameList);
		
		return map;
	}

	@Override
	public int deleteBasket(int classNo, int userNo) {
		
		Basket basket = new Basket();
		
		basket.setUserNo((int) userNo);
		basket.setClassNo(classNo);
		
		int result = paymentDao.deleteBasket(basket);
		logger.info("deleteBasket:{}",result);
		
		return result;
	}

}