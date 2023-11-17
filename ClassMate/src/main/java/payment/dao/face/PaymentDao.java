package payment.dao.face;

import java.util.List;
import java.util.Map;

import lecture.dto.Class;
import payment.dto.Basket;
import payment.dto.OrderTb;
import payment.dto.Payment;
import user.dto.UserInfo;

public interface PaymentDao {

	/**
	 * userNo에 해당하는 유저 정보를 가져온다
	 * 
	 * @param userNo - 특정 유저의 번호
	 * @return 특정 유저 정보
	 */
	public UserInfo selectUser(int userNo);
	
	/**
	 * userNo에 해당하는 유저의 Basket 정보를 가져온다
	 * 
	 * @param userNo - 특정 유저의 번호
	 * @return 특정 유저의 장바구니 정보
	 */
	public List<Basket> getBasketUserNo(int userNo);

	/**
	 * basket에 담겨있는 classNo정보를 토대로 해당 클래스 리스트를
	 * 조회하여 가져온다
	 * 
	 * @param basket - 특정 유저의 장바구니
	 * @return 장바구니의 classNo 정보를 토대로 가져온 class값 리스트
	 */
	public List<Class> selectClassListByBasket(Basket basket);

	
	/**
	 * 받아온 OrderTb정보를 DB에 저장한다
	 * 
	 * @param OrderTb - 결제되어 가저온 orderTb의 정보값(merchantUid-판매자uid, userNo-결제한 유저번호, classNo-결제된 클래스 번호)
	 * @return DB에 데이터 저장 유뮤 (0-실패, 1-성공)
	 */
	public int insertOrderList(OrderTb orderTb);

	public int insertPaymentList(Map<String, Object> map);

	public int deleteBasket(Basket basket);

	public List<OrderTb> selectOrderList(String merchantUid);

	public List<Payment> selectPaymentList(int orderNo);

	public List<Class> selectClassNoByMerchantUid(String merchantUid);

	public List<Class> selectClassNameListByOrder(int classNo);


}