package payment.dao.face;

import java.util.List;

import lecture.dto.Class;
import payment.dto.Basket;
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
	public List<Class> selectClassListByUser(Basket basket);

	

}