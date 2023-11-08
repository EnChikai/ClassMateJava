package user.service.face;

import org.apache.catalina.User;

import user.dto.UserInfo;

public interface UserService {

	public void join(UserInfo userInfo);
	
	public UserInfo loginPost(UserInfo userInfo);

	public User findUserByUsername(String username);


}
