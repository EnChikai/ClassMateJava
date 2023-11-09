package user.dao.face;

import org.apache.catalina.User;

import user.dto.UserInfo;

public interface UserDao {

	public UserInfo selectUser(UserInfo userInfo);

	public User searchId(String username);

}
