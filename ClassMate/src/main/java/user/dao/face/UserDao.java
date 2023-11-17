package user.dao.face;

import teacher.dto.Teacher;
import user.dto.UserInfo;

public interface UserDao {

	public UserInfo selectUser(UserInfo userInfo);

	public Teacher getTeachNo(Teacher teacher); //강사 번호

	public int checkDuplicateId(String userId);

	public UserInfo selectUserByNo(UserInfo userInfo);

//	public int deleteUserData(UserInfo userInfo);

	public void insertUser(UserInfo userInfo);

	public UserInfo findUserByEmail(String email);

	public int updateUserDataout(UserInfo userInfo);


}
