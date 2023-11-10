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
			classList.addAll(paymentDao.selectClassListByUser(basketList.get(i))); 
		}
		logger.info("classList:{}",classList);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userInfo", userInfo);
		map.put("classList", classList);
		map.put("classListSize", classList.size());
		
		return map;
	}

}