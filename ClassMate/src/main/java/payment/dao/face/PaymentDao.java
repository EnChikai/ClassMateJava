package payment.dao.face;

import java.util.List;

import lecture.dto.Class;
import payment.dto.Basket;

public interface PaymentDao {

	public List<Basket> getBasketUserNo(int userNo);

	public List<Class> selectClassListByUser(Basket basket);

}
