package user.service.face;

import teacher.dto.Teacher;
import user.dto.UserInfo;

public interface UserService {

	public void join(UserInfo userInfo);
	
	public UserInfo loginPost(UserInfo userInfo);

	public Teacher getTeacherNo(Teacher teacher);

	public boolean checkDuplicateId(String userId);


}
