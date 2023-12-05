package login.dao.face;

import user.dto.UserInfo;

public interface LoginDao {

	public UserInfo selectUserByEmail(UserInfo userInfo);
	
	public void insertUser(UserInfo userInfo);

	public UserInfo selectUser(UserInfo userInfo);

}
