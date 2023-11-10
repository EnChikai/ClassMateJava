package user.service.face;

import user.dto.UserInfo;

public interface UserService {

	public void join(UserInfo userInfo);
	
	public UserInfo loginPost(UserInfo userInfo);


}
