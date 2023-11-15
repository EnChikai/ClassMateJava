package payment.service.face;

import java.util.Map;

public interface PaymentService {

	/**
	 * userNo를 통해 장바구니 페이지에 들어갈 정보를 조회해 온다
	 * 
	 * @param userNo - 불러오는데 사용할 유저 번호
	 * @return userNo - 기준으로 리턴되는 정보(유저정보, userNo의 장바구니의 클래스정보, 장바구니에 담겨진 클래스의 총 수강료, 장바구니에 담겨진 클래스의 수)
	 */
	public Map<String, Object> selectBasket(int userNo);

	
	/**
	 * 특정 유저가 결제한 정보를 DB에 저장한다
	 * @param object 
	 * 
	 * @param merchantUid - 판매자uid
	 * @param payMethod - 결제방법
	 * @param provider - 공급자
	 * @param cardName - 카드이름
	 * @param classNo - 결제된 클래스 번호
	 * @return 결제 완료화면에 표시될 정보값
	 */
	public int insertOrderPayment(Object userNo, long merchantUid, String payMethod, String provider, String cardName,
			int[] classNo);


	public Map<String, Object> selectSuccecInfo(int userNo);

}