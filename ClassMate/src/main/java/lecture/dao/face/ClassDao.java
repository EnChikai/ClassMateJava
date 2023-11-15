package lecture.dao.face;

import java.util.List;

import user.dto.UserInfo;
import lecture.dto.Address;
import lecture.dto.Class;


public interface ClassDao {

	/**
	 * user_id로 user_no 알아내기
	 * 
	 * @param userInfo - userId
	 * @return userNo
	 */
	public int getUserNoByUserId(UserInfo userInfo);

	/**
	 * 해당 유저가 수강중인 강의들 정보 알아내기
	 * 
	 * @param userInfo - userNo
	 * @return 강의정보 List
	 */
	public List<Class> selectClassListByUser(UserInfo userInfo);

	/**
	 * 특정 강의의 정보 알아내기
	 * 
	 * @param lecture - classNo
	 * @return 해당 강의의 강의정보
	 */
	public Class selectClassByClassNo(Class lecture);
	
	/**
	 * 특정 강의의 주소 정보 알아내기
	 * 
	 * @param lecture - classNo
	 * @return 해당 강의의 주소정보
	 */
	public Address selectAddressByClass(Class lecture);

}
