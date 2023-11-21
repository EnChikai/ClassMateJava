package user.service.face;

import teacher.dto.Teacher;
import user.dto.UserInfo;

public interface UserService {

	public void join(UserInfo userInfo);
	
	public UserInfo loginPost(UserInfo userInfo);

	public Teacher getTeacherNo(Teacher teacher);

	public boolean checkDuplicateId(String userId);

	/**
	 * 기존 회원정보 뽑아오기
	 * 
	 * @param userInfo (userNo만 포함)
	 * @return userInfo (모든 데이터 포함)
	 */
	public UserInfo updateInfo(UserInfo userInfo);

	public int updateOutUser(UserInfo userInfo);

	public int updateUserData(UserInfo userInfo);




}
