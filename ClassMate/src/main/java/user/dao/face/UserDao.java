package user.dao.face;

import java.util.List;
import java.util.Map;

import lecture.dto.Class;
import payment.dto.OrderTb;
import payment.dto.Payment;
import teacher.dto.Teacher;
import user.dto.UserInfo;

public interface UserDao {

	public UserInfo selectUser(UserInfo userInfo);

	public Teacher getTeachNo(Teacher teacher); //강사 번호

	public int checkDuplicateId(String userId);

	public UserInfo selectUserByNo(UserInfo userInfo);

//	public int deleteUserData(UserInfo userInfo);

	public void insertUser(UserInfo userInfo);

	public int updateUserDataout(UserInfo userInfo);

	public int updateUserData(UserInfo userInfo);

	public String searchInfo(UserInfo userInfo);

	public int checkUserInfo(UserInfo userInfo);

	public int updatePw(int userNo, String userPw);

//	public int updatePassword(String userPw);
	
    /**
     * 비밀번호 업데이트
     * @param userInfo - 비밀번호 업데이트에 필요한 정보를 가진 객체
     * @return 업데이트된 행의 수
     */
	public int updatePassword(UserInfo userInfo);

	public String selectByUserId(UserInfo userInfo);

	public UserInfo getUserById(String userId);

	public int selectOrderCnt(OrderTb orderTb);

	public List<OrderTb> selectUserOrder(Map<String, Object> map);

	public List<Payment> selectUserPayment(Map<String, Object> map);

	public Class selectClassNameByClassNo(int classNo);

	public UserInfo whoAmI(UserInfo userInfo);
	
    // 사용자가 탈퇴한 경우를 확인하는 메소드
    public int isUserWithdrawn(String userId);


}
