package login.service.face;

import user.dto.UserInfo;

public interface LoginService {

	public boolean isOurClient(UserInfo userInfo);

	public void socialJoin(UserInfo userInfo);

	public UserInfo getUserData(UserInfo userInfo);

}
