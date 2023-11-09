package payment.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import payment.dao.face.PaymentDao;
import payment.dto.Basket;
import payment.service.face.PaymentService;
import lecture.dto.Class;

@Service
public class PaymentServiceImpl implements PaymentService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private PaymentDao paymentDao;
	
	@Override
	public Map<String, Object> selectBasket(int userNo) {
		logger.info("selectBasket(){}",userNo);
		
		List<Basket> basketList = paymentDao.getBasketUserNo(userNo);
		logger.info("basketList:{}",basketList);
		logger.info("basketList.get(0):{}",basketList.get(0));
		logger.info("basketList.get(1):{}",basketList.get(1));
		
		List<Class> classList = new ArrayList<Class>();
		
		for(int i = 0; i<basketList.size(); i++) {
			classList.addAll(paymentDao.selectClassListByUser(basketList.get(i))); 
		}
		logger.info("classList:{}",classList);
		
		return null;
	}

}

